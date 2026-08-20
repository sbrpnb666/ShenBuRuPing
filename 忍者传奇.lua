--==================================================
-- 忍者传奇 Ninja Legend Script
-- Powered by WindUI Framework
--==================================================

--===========================
-- WindUI 加载
--===========================
local WindUI
local uiOk, uiErr = pcall(function()
    WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
end)
if not uiOk or not WindUI then
    warn("WindUI 加载失败: " .. tostring(uiErr))
    return
end

--===========================
-- 服务引用
--===========================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")

--===========================
-- LocalPlayer / Camera / Mouse
--===========================
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

--===========================
-- 状态表 / 连接表 / ESP对象表
--===========================
local State = {
    -- 自动功能
    AutoSwing = false,
    AutoRebirth = false,
    AutoBuySword = false,
    AutoBuyBelt = false,
    AutoSell = false,
    AutoBuyPet = false,
    AutoHatch = false,
    AutoCollectCoins = false,
    AutoCollectSouls = false,
    -- 玩家功能
    WalkSpeed = 16,
    JumpPower = 50,
    InfiniteJump = false,
    NoCollision = false,
    GodMode = false,
    NoFallDamage = false,
    -- 视觉功能
    PlayerESP = false,
    ShowName = true,
    ShowDistance = true,
    ItemESP = false,
    FullHighlight = false,
    -- 传送功能
    LongPressTP = false,
    TPHoldStart = 0,
    -- 实用功能
    AntiAFK = false,
    QualityBoost = false,
    -- 内部状态
    IsFalling = false,
    OriginalQualityLevel = nil,
    OriginalLighting = nil,
}

local Connections = {}
local ESPObjects = {}

--===========================
-- 辅助函数
--===========================

-- 断开连接 (支持线程和RBXScriptConnection)
local function StopConnection(name)
    if Connections[name] then
        local conn = Connections[name]
        if type(conn) == "thread" then
            pcall(function()
                task.cancel(conn)
            end)
        elseif typeof(conn) == "RBXScriptConnection" then
            conn:Disconnect()
        end
        Connections[name] = nil
    end
end

-- 启动循环 (task.spawn)
local function StartLoop(name, func)
    StopConnection(name)
    Connections[name] = task.spawn(func)
end

-- 获取角色
local function GetChar()
    return LocalPlayer.Character
end

-- 获取 HumanoidRootPart
local function GetRoot()
    local char = GetChar()
    if char then
        return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    end
    return nil
end

-- 获取 Humanoid
local function GetHum()
    local char = GetChar()
    if char then
        return char:FindFirstChildOfClass("Humanoid")
    end
    return nil
end

-- 通知
local function Notify(title, content, duration)
    WindUI:Notify({
        Title = title,
        Content = content,
        Duration = duration or 3
    })
end

-- 搜索 Remote (支持 RemoteEvent 和 RemoteFunction)
local function FindRemote(keywords)
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local name = string.lower(obj.Name)
            for _, kw in ipairs(keywords) do
                if string.find(name, kw) then
                    return obj
                end
            end
        end
    end
    return nil
end

-- 搜索含 buy + item 关键词的 Remote
local function FindBuyRemote(itemKeywords)
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local name = string.lower(obj.Name)
            if string.find(name, "buy") then
                for _, kw in ipairs(itemKeywords) do
                    if string.find(name, kw) then
                        return obj
                    end
                end
            end
        end
    end
    return nil
end

-- 调用 Remote
local function CallRemote(remote, ...)
    if not remote then return end
    local args = {...}
    pcall(function()
        if remote:IsA("RemoteEvent") then
            remote:FireServer(unpack(args))
        elseif remote:IsA("RemoteFunction") then
            remote:InvokeServer(unpack(args))
        end
    end)
end

-- 搜索 Workspace 中的 Part
local function FindPartsInWorkspace(keywords)
    local results = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local name = string.lower(obj.Name)
            for _, kw in ipairs(keywords) do
                if string.find(name, kw) then
                    table.insert(results, obj)
                    break
                end
            end
        end
    end
    return results
end

-- 获取 ESP 父级 (兼容 gethui)
local ESPParent
local function GetESPParent()
    if ESPParent then return ESPParent end
    local ok, hui = pcall(function()
        if gethui then return gethui() end
    end)
    if ok and hui then ESPParent = hui return hui end
    local ok2, cg = pcall(function()
        return game:GetService("CoreGui")
    end)
    if ok2 and cg then ESPParent = cg return cg end
    ESPParent = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    return ESPParent
end

-- 复制到剪贴板 (兼容多种函数名)
local function CopyToClipboard(text)
    if setclipboard then
        pcall(setclipboard, text)
        return true
    elseif toclipboard then
        pcall(toclipboard, text)
        return true
    elseif writeclipboard then
        pcall(writeclipboard, text)
        return true
    end
    return false
end

-- 传送到地点
local function TeleportToLocation(keywords, locationName)
    local root = GetRoot()
    if not root then
        Notify("忍者传奇", "未找到角色!", 3)
        return
    end
    for _, obj in ipairs(Workspace:GetDescendants()) do
        local name = string.lower(obj.Name)
        for _, kw in ipairs(keywords) do
            if string.find(name, kw) then
                local part = obj
                if obj:IsA("Model") then
                    part = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                end
                if part and part:IsA("BasePart") then
                    root.CFrame = part.CFrame * CFrame.new(0, 5, 0)
                    Notify("忍者传奇", "已传送到 " .. (locationName or obj.Name), 3)
                    return
                end
            end
        end
    end
    Notify("忍者传奇", "未找到 " .. (locationName or "传送地点") .. "!", 3)
end

-- 更新人物 ESP
local function UpdatePlayerESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local char = plr.Character
            if char then
                local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
                local myRoot = GetRoot()

                if root and myRoot then
                    local dist = math.floor((root.Position - myRoot.Position).Magnitude)

                    if not ESPObjects[plr] then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ESP_" .. plr.Name
                        billboard.AlwaysOnTop = true
                        billboard.Size = UDim2.new(0, 200, 0, 50)
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        billboard.Parent = GetESPParent()

                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextColor3 = Color3.new(1, 1, 1)
                        nameLabel.TextScaled = true
                        nameLabel.Font = Enum.Font.SourceSansBold
                        nameLabel.TextStrokeTransparency = 0
                        nameLabel.Parent = billboard

                        local distLabel = Instance.new("TextLabel")
                        distLabel.Size = UDim2.new(1, 0, 0.5, 0)
                        distLabel.Position = UDim2.new(0, 0, 0.5, 0)
                        distLabel.BackgroundTransparency = 1
                        distLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                        distLabel.TextScaled = true
                        distLabel.Font = Enum.Font.SourceSansBold
                        distLabel.TextStrokeTransparency = 0
                        distLabel.Parent = billboard

                        ESPObjects[plr] = {
                            Billboard = billboard,
                            NameLabel = nameLabel,
                            DistLabel = distLabel
                        }
                    end

                    local esp = ESPObjects[plr]
                    if esp then
                        esp.Billboard.Adornee = root
                        esp.NameLabel.Visible = State.ShowName
                        esp.NameLabel.Text = plr.Name
                        esp.DistLabel.Visible = State.ShowDistance
                        esp.DistLabel.Text = dist .. "m"
                    end
                else
                    if ESPObjects[plr] then
                        ESPObjects[plr].Billboard.Adornee = nil
                    end
                end
            else
                if ESPObjects[plr] then
                    ESPObjects[plr].Billboard.Adornee = nil
                end
            end
        end
    end

    -- 清理离线玩家 ESP
    for plr, esp in pairs(ESPObjects) do
        if typeof(plr) == "Instance" and plr:IsA("Player") and not plr.Parent then
            pcall(function()
                esp.Billboard:Destroy()
            end)
            ESPObjects[plr] = nil
        end
    end
end

-- 更新物品 ESP (Highlight)
local function UpdateItemESP()
    -- 清理失效高亮
    for key, hl in pairs(ESPObjects) do
        if type(key) == "string" and string.sub(key, 1, 5) == "item_" then
            if not hl.Parent or (hl.Adornee and not hl.Adornee.Parent) then
                pcall(function() hl:Destroy() end)
                ESPObjects[key] = nil
            end
        end
    end

    -- 添加新高亮
    local keywords = {"coin", "soul", "sword", "belt"}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local name = string.lower(obj.Name)
            local matched = false
            for _, kw in ipairs(keywords) do
                if string.find(name, kw) then
                    matched = true
                    break
                end
            end
            if matched then
                local key = "item_" .. obj:GetDebugId()
                if not ESPObjects[key] then
                    local hl = Instance.new("Highlight")
                    hl.Adornee = obj
                    hl.FillColor = Color3.fromRGB(255, 255, 0)
                    hl.FillTransparency = 0.5
                    hl.OutlineColor = Color3.fromRGB(255, 0, 0)
                    hl.Parent = GetESPParent()
                    ESPObjects[key] = hl
                end
            end
        end
    end
end

-- 设置摔落无伤害 (用于 CharacterAdded 重新绑定)
local function SetupNoFallDamage()
    if not State.NoFallDamage then return end
    local hum = GetHum()
    if not hum then return end

    StopConnection("NoFallDamage")
    Connections["NoFallDamage"] = hum.StateChanged:Connect(function(old, new)
        if new == Enum.HumanoidStateType.Freefall then
            State.IsFalling = true
        elseif new == Enum.HumanoidStateType.Landed then
            if State.IsFalling then
                hum.Health = hum.MaxHealth
                State.IsFalling = false
            end
        end
    end)
end

--===========================
-- 创建窗口
--===========================
local Window = WindUI:CreateWindow({
    Title = "忍者传奇",
    Icon = "sword",
    Author = "忍者传奇脚本",
    Folder = "NinjaLegend",
    Size = UDim2.fromOffset(500, 520),
    Theme = "Dark"
})

--===========================
-- 标签
--===========================

-- 时间标签 (彩虹色循环)
local timeTag = Window:Tag({
    Title = "00:00",
    Color = Color3.fromRGB(255, 255, 255)
})

-- 彩虹色循环 task.spawn
task.spawn(function()
    local hue = 0
    while true do
        hue = hue + 0.01
        if hue > 1 then hue = 0 end
        local color = Color3.fromHSV(hue, 1, 1)
        local timeStr = os.date("%H:%M")
        if timeTag then
            pcall(function()
                timeTag.Color = color
                timeTag.Title = timeStr
            end)
        end
        task.wait(0.06)
    end
end)

-- 紫色主题标签
Window:Tag({
    Title = "忍者传奇",
    Color = Color3.fromHex("#9B30FF")
})

--===========================
-- EditOpenButton
--===========================
Window:EditOpenButton({
    Title = "忍者传奇",
    Icon = "sword",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("9B30FF")),
    Draggable = true
})

--==================================================
-- 标签页 1: 自动
--==================================================
local Tab1 = Window:Tab({
    Title = "自动",
    Icon = "play"
})

------ Section: 训练 ----
local Section1 = Tab1:Section({ Title = "训练" })

-- 自动挥刀训练
Tab1:Toggle({
    Title = "自动挥刀训练",
    Default = false,
    Callback = function(state)
        State.AutoSwing = state
        if state then
            Notify("忍者传奇", "自动挥刀训练已开启!", 3)
            StartLoop("AutoSwing", function()
                while State.AutoSwing do
                    local remote = FindRemote({"train", "swing", "slash", "ninja", "sword"})
                    CallRemote(remote)
                    task.wait(0.1 + math.random() * 0.3)
                end
            end)
        else
            StopConnection("AutoSwing")
            Notify("忍者传奇", "自动挥刀训练已关闭!", 3)
        end
    end
})

-- 自动转生
Tab1:Toggle({
    Title = "自动转生",
    Default = false,
    Callback = function(state)
        State.AutoRebirth = state
        if state then
            Notify("忍者传奇", "自动转生已开启!", 3)
            StartLoop("AutoRebirth", function()
                while State.AutoRebirth do
                    local remote = FindRemote({"rebirth", "prestige", "ascend"})
                    CallRemote(remote)
                    task.wait(1 + math.random() * 2)
                end
            end)
        else
            StopConnection("AutoRebirth")
            Notify("忍者传奇", "自动转生已关闭!", 3)
        end
    end
})

------ Section: 商店 ----
Tab1:Section({ Title = "商店" })

-- 自动买剑
Tab1:Toggle({
    Title = "自动买剑",
    Default = false,
    Callback = function(state)
        State.AutoBuySword = state
        if state then
            Notify("忍者传奇", "自动买剑已开启!", 3)
            StartLoop("AutoBuySword", function()
                while State.AutoBuySword do
                    local remote = FindBuyRemote({"sword", "blade"})
                    CallRemote(remote)
                    task.wait(0.5 + math.random() * 1)
                end
            end)
        else
            StopConnection("AutoBuySword")
            Notify("忍者传奇", "自动买剑已关闭!", 3)
        end
    end
})

-- 自动买腰带
Tab1:Toggle({
    Title = "自动买腰带",
    Default = false,
    Callback = function(state)
        State.AutoBuyBelt = state
        if state then
            Notify("忍者传奇", "自动买腰带已开启!", 3)
            StartLoop("AutoBuyBelt", function()
                while State.AutoBuyBelt do
                    local remote = FindBuyRemote({"belt"})
                    CallRemote(remote)
                    task.wait(0.5 + math.random() * 1)
                end
            end)
        else
            StopConnection("AutoBuyBelt")
            Notify("忍者传奇", "自动买腰带已关闭!", 3)
        end
    end
})

-- 自动卖
Tab1:Toggle({
    Title = "自动卖",
    Default = false,
    Callback = function(state)
        State.AutoSell = state
        if state then
            Notify("忍者传奇", "自动卖已开启!", 3)
            StartLoop("AutoSell", function()
                while State.AutoSell do
                    local remote = FindRemote({"sell"})
                    CallRemote(remote)
                    task.wait(0.5 + math.random() * 1)
                end
            end)
        else
            StopConnection("AutoSell")
            Notify("忍者传奇", "自动卖已关闭!", 3)
        end
    end
})

-- 自动买宠物
Tab1:Toggle({
    Title = "自动买宠物",
    Default = false,
    Callback = function(state)
        State.AutoBuyPet = state
        if state then
            Notify("忍者传奇", "自动买宠物已开启!", 3)
            StartLoop("AutoBuyPet", function()
                while State.AutoBuyPet do
                    local remote = FindBuyRemote({"pet", "egg"})
                    CallRemote(remote)
                    task.wait(0.5 + math.random() * 1.5)
                end
            end)
        else
            StopConnection("AutoBuyPet")
            Notify("忍者传奇", "自动买宠物已关闭!", 3)
        end
    end
})

-- 自动孵化
Tab1:Toggle({
    Title = "自动孵化",
    Default = false,
    Callback = function(state)
        State.AutoHatch = state
        if state then
            Notify("忍者传奇", "自动孵化已开启!", 3)
            StartLoop("AutoHatch", function()
                while State.AutoHatch do
                    local remote = FindRemote({"hatch", "egg", "open"})
                    CallRemote(remote)
                    task.wait(0.5 + math.random() * 1)
                end
            end)
        else
            StopConnection("AutoHatch")
            Notify("忍者传奇", "自动孵化已关闭!", 3)
        end
    end
})

------ Section: 收集 ----
Tab1:Section({ Title = "收集" })

-- 自动收集金币
Tab1:Toggle({
    Title = "自动收集金币",
    Default = false,
    Callback = function(state)
        State.AutoCollectCoins = state
        if state then
            Notify("忍者传奇", "自动收集金币已开启!", 3)
            StartLoop("AutoCollectCoins", function()
                while State.AutoCollectCoins do
                    local root = GetRoot()
                    if root then
                        local parts = FindPartsInWorkspace({"coin", "cash", "money"})
                        for _, part in ipairs(parts) do
                            pcall(function()
                                part.CFrame = root.CFrame
                            end)
                        end
                    end
                    task.wait(0.1 + math.random() * 0.2)
                end
            end)
        else
            StopConnection("AutoCollectCoins")
            Notify("忍者传奇", "自动收集金币已关闭!", 3)
        end
    end
})

-- 自动收集灵魂
Tab1:Toggle({
    Title = "自动收集灵魂",
    Default = false,
    Callback = function(state)
        State.AutoCollectSouls = state
        if state then
            Notify("忍者传奇", "自动收集灵魂已开启!", 3)
            StartLoop("AutoCollectSouls", function()
                while State.AutoCollectSouls do
                    local root = GetRoot()
                    if root then
                        local parts = FindPartsInWorkspace({"soul", "spirit", "essence"})
                        for _, part in ipairs(parts) do
                            pcall(function()
                                part.CFrame = root.CFrame
                            end)
                        end
                    end
                    task.wait(0.1 + math.random() * 0.2)
                end
            end)
        else
            StopConnection("AutoCollectSouls")
            Notify("忍者传奇", "自动收集灵魂已关闭!", 3)
        end
    end
})

--==================================================
-- 标签页 2: 玩家
--==================================================
local Tab2 = Window:Tab({
    Title = "玩家",
    Icon = "user"
})

------ Section: 移动 ----
Tab2:Section({ Title = "移动" })

-- 行走速度
Tab2:Slider({
    Title = "行走速度",
    Value = { Min = 16, Max = 500, Default = 16 },
    Increment = 1,
    Callback = function(value)
        State.WalkSpeed = value
        local hum = GetHum()
        if hum then
            hum.WalkSpeed = value
        end
    end
})

-- 跳跃力
Tab2:Slider({
    Title = "跳跃力",
    Value = { Min = 50, Max = 500, Default = 50 },
    Increment = 1,
    Callback = function(value)
        State.JumpPower = value
        local hum = GetHum()
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = value
        end
    end
})

-- Divider
Tab2:Divider()

-- 无限跳跃
Tab2:Toggle({
    Title = "无限跳跃",
    Default = false,
    Callback = function(state)
        State.InfiniteJump = state
        if state then
            Notify("忍者传奇", "无限跳跃已开启!", 3)
            Connections["InfiniteJump"] = UserInputService.JumpRequest:Connect(function()
                local hum = GetHum()
                if hum then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            StopConnection("InfiniteJump")
            Notify("忍者传奇", "无限跳跃已关闭!", 3)
        end
    end
})

-- 穿墙
Tab2:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(state)
        State.NoCollision = state
        if state then
            Notify("忍者传奇", "穿墙已开启!", 3)
            Connections["NoCollision"] = RunService.Stepped:Connect(function()
                local char = GetChar()
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            StopConnection("NoCollision")
            Notify("忍者传奇", "穿墙已关闭!", 3)
        end
    end
})

-- 无敌
Tab2:Toggle({
    Title = "无敌",
    Default = false,
    Callback = function(state)
        State.GodMode = state
        if state then
            Notify("忍者传奇", "无敌已开启!", 3)
            Connections["GodMode"] = RunService.Heartbeat:Connect(function()
                local hum = GetHum()
                if hum then
                    hum.Health = hum.MaxHealth
                end
            end)
        else
            StopConnection("GodMode")
            Notify("忍者传奇", "无敌已关闭!", 3)
        end
    end
})

-- 摔落无伤害
Tab2:Toggle({
    Title = "摔落无伤害",
    Default = false,
    Callback = function(state)
        State.NoFallDamage = state
        if state then
            Notify("忍者传奇", "摔落无伤害已开启!", 3)
            SetupNoFallDamage()
        else
            StopConnection("NoFallDamage")
            Notify("忍者传奇", "摔落无伤害已关闭!", 3)
        end
    end
})

-- Divider
Tab2:Divider()

-- 飞行手机版
Tab2:Button({
    Title = "飞行手机版",
    Callback = function()
        Notify("忍者传奇", "正在加载飞行脚本...", 3)
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
        end)
    end
})

--==================================================
-- 标签页 3: 视觉
--==================================================
local Tab3 = Window:Tab({
    Title = "视觉",
    Icon = "eye"
})

------ Section: 透视 ----
Tab3:Section({ Title = "透视" })

-- 人物透视
Tab3:Toggle({
    Title = "人物透视",
    Default = false,
    Callback = function(state)
        State.PlayerESP = state
        if state then
            Notify("忍者传奇", "人物透视已开启!", 3)
            State.ShowName = true
            State.ShowDistance = true
            StartLoop("PlayerESP", function()
                while State.PlayerESP do
                    UpdatePlayerESP()
                    task.wait(0.1)
                end
            end)
        else
            StopConnection("PlayerESP")
            for key, obj in pairs(ESPObjects) do
                if typeof(key) == "Instance" and key:IsA("Player") then
                    pcall(function()
                        obj.Billboard:Destroy()
                    end)
                    ESPObjects[key] = nil
                end
            end
            Notify("忍者传奇", "人物透视已关闭!", 3)
        end
    end
})

-- 显示名字
Tab3:Toggle({
    Title = "显示名字",
    Default = true,
    Callback = function(state)
        State.ShowName = state
        if state then
            Notify("忍者传奇", "显示名字已开启!", 3)
        else
            Notify("忍者传奇", "显示名字已关闭!", 3)
        end
    end
})

-- 显示距离
Tab3:Toggle({
    Title = "显示距离",
    Default = true,
    Callback = function(state)
        State.ShowDistance = state
        if state then
            Notify("忍者传奇", "显示距离已开启!", 3)
        else
            Notify("忍者传奇", "显示距离已关闭!", 3)
        end
    end
})

-- 物品透视
Tab3:Toggle({
    Title = "物品透视",
    Default = false,
    Callback = function(state)
        State.ItemESP = state
        if state then
            Notify("忍者传奇", "物品透视已开启!", 3)
            StartLoop("ItemESP", function()
                while State.ItemESP do
                    UpdateItemESP()
                    task.wait(1)
                end
            end)
        else
            StopConnection("ItemESP")
            for key, obj in pairs(ESPObjects) do
                if type(key) == "string" and string.sub(key, 1, 5) == "item_" then
                    pcall(function()
                        obj:Destroy()
                    end)
                    ESPObjects[key] = nil
                end
            end
            Notify("忍者传奇", "物品透视已关闭!", 3)
        end
    end
})

-- 全图高亮
Tab3:Toggle({
    Title = "全图高亮",
    Default = false,
    Callback = function(state)
        State.FullHighlight = state
        if state then
            Notify("忍者传奇", "全图高亮已开启!", 3)
            State.OriginalLighting = {
                Brightness = Lighting.Brightness,
                Ambient = Lighting.Ambient,
                OutdoorAmbient = Lighting.OutdoorAmbient,
                GlobalShadows = Lighting.GlobalShadows,
                ClockTime = Lighting.ClockTime,
            }
            Lighting.Brightness = 5
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            Lighting.GlobalShadows = false
            Lighting.ClockTime = 14
        else
            Notify("忍者传奇", "全图高亮已关闭!", 3)
            if State.OriginalLighting then
                Lighting.Brightness = State.OriginalLighting.Brightness
                Lighting.Ambient = State.OriginalLighting.Ambient
                Lighting.OutdoorAmbient = State.OriginalLighting.OutdoorAmbient
                Lighting.GlobalShadows = State.OriginalLighting.GlobalShadows
                Lighting.ClockTime = State.OriginalLighting.ClockTime
            end
        end
    end
})

--==================================================
-- 标签页 4: 传送
--==================================================
local Tab4 = Window:Tab({
    Title = "传送",
    Icon = "map-pin"
})

------ Section: 地点 ----
Tab4:Section({ Title = "地点" })

-- 训练区
Tab4:Button({
    Title = "训练区",
    Callback = function()
        TeleportToLocation({"train", "training", "practice"}, "训练区")
    end
})

-- 商店
Tab4:Button({
    Title = "商店",
    Callback = function()
        TeleportToLocation({"shop", "store", "buy"}, "商店")
    end
})

-- 武器店
Tab4:Button({
    Title = "武器店",
    Callback = function()
        TeleportToLocation({"weapon", "sword", "blade"}, "武器店")
    end
})

-- 腰带店
Tab4:Button({
    Title = "腰带店",
    Callback = function()
        TeleportToLocation({"belt"}, "腰带店")
    end
})

-- 宠物店
Tab4:Button({
    Title = "宠物店",
    Callback = function()
        TeleportToLocation({"pet", "egg"}, "宠物店")
    end
})

-- 转生区
Tab4:Button({
    Title = "转生区",
    Callback = function()
        TeleportToLocation({"rebirth", "prestige", "ascend"}, "转生区")
    end
})

-- 出生点
Tab4:Button({
    Title = "出生点",
    Callback = function()
        TeleportToLocation({"spawn", "lobby", "start"}, "出生点")
    end
})

-- 岛屿
Tab4:Button({
    Title = "岛屿",
    Callback = function()
        TeleportToLocation({"island", "zone", "area"}, "岛屿")
    end
})

-- Divider
Tab4:Divider()

-- 长按传送
Tab4:Toggle({
    Title = "长按传送",
    Default = false,
    Callback = function(state)
        State.LongPressTP = state
        State.TPHoldStart = 0
        if state then
            Notify("忍者传奇", "长按传送已开启! (长按0.5秒传送到鼠标位置)", 3)
            Connections["LongPressTP_Input"] = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                    State.TPHoldStart = tick()
                end
            end)
            Connections["LongPressTP_InputEnd"] = UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                    State.TPHoldStart = 0
                end
            end)
            Connections["LongPressTP_Heartbeat"] = RunService.Heartbeat:Connect(function()
                if State.TPHoldStart > 0 and tick() - State.TPHoldStart >= 0.5 then
                    local root = GetRoot()
                    if root and Mouse.Hit then
                        root.CFrame = CFrame.new(Mouse.Hit.Position)
                        State.TPHoldStart = 0
                    end
                end
            end)
        else
            StopConnection("LongPressTP_Input")
            StopConnection("LongPressTP_InputEnd")
            StopConnection("LongPressTP_Heartbeat")
            Notify("忍者传奇", "长按传送已关闭!", 3)
        end
    end
})

--==================================================
-- 标签页 5: 实用
--==================================================
local Tab5 = Window:Tab({
    Title = "实用",
    Icon = "settings"
})

------ Section: 工具 ----
Tab5:Section({ Title = "工具" })

-- 防挂机
Tab5:Toggle({
    Title = "防挂机",
    Default = false,
    Callback = function(state)
        State.AntiAFK = state
        if state then
            Notify("忍者传奇", "防挂机已开启!", 3)
            Connections["AntiAFK"] = LocalPlayer.Idled:Connect(function()
                pcall(function()
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                    task.wait(0.05)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                end)
            end)
        else
            StopConnection("AntiAFK")
            Notify("忍者传奇", "防挂机已关闭!", 3)
        end
    end
})

-- 画质提速
Tab5:Toggle({
    Title = "画质提速",
    Default = false,
    Callback = function(state)
        State.QualityBoost = state
        if state then
            Notify("忍者传奇", "画质提速已开启!", 3)
            State.OriginalQualityLevel = settings().Rendering.QualityLevel
            pcall(function()
                settings().Rendering.QualityLevel = 1
            end)
            Lighting.GlobalShadows = false
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                    obj.Enabled = false
                end
            end
        else
            Notify("忍者传奇", "画质提速已关闭!", 3)
            if State.OriginalQualityLevel then
                pcall(function()
                    settings().Rendering.QualityLevel = State.OriginalQualityLevel
                end)
            end
            Lighting.GlobalShadows = true
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                    obj.Enabled = true
                end
            end
        end
    end
})

-- Divider
Tab5:Divider()

-- 换服
Tab5:Button({
    Title = "换服",
    Callback = function()
        Notify("忍者传奇", "正在换服...", 3)
        pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
    end
})

-- 复制服务器号
Tab5:Button({
    Title = "复制服务器号",
    Callback = function()
        local jobId = game.JobId
        if CopyToClipboard(jobId) then
            Notify("忍者传奇", "服务器号已复制: " .. jobId, 5)
        else
            Notify("忍者传奇", "服务器号: " .. jobId, 7)
        end
    end
})

-- 角色信息
Tab5:Button({
    Title = "角色信息",
    Callback = function()
        local hum = GetHum()
        local root = GetRoot()
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        local info = "血量: " .. (hum and math.floor(hum.Health) or 0) .. "/" .. (hum and math.floor(hum.MaxHealth) or 0)
        info = info .. "\n速度: " .. (hum and math.floor(hum.WalkSpeed) or 0)
        info = info .. "\n位置: " .. (root and tostring(root.Position) or "未知")
        if leaderstats then
            for _, stat in ipairs(leaderstats:GetChildren()) do
                info = info .. "\n" .. stat.Name .. ": " .. tostring(stat.Value)
            end
        end
        Notify("忍者传奇", info, 7)
    end
})

-- 清理特效
Tab5:Button({
    Title = "清理特效",
    Callback = function()
        local count = 0
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Explosion") then
                obj:Destroy()
                count = count + 1
            end
        end
        Notify("忍者传奇", "已清理 " .. count .. " 个特效!", 3)
    end
})

-- 卸载脚本
Tab5:Button({
    Title = "卸载脚本",
    Callback = function()
        Notify("忍者传奇", "正在卸载脚本...", 3)
        task.wait(0.5)

        -- 断开所有连接
        for name, conn in pairs(Connections) do
            if type(conn) == "thread" then
                pcall(task.cancel, conn)
            elseif typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end
        table.clear(Connections)

        -- 清除 ESP
        for key, obj in pairs(ESPObjects) do
            pcall(function()
                if obj.Billboard then obj.Billboard:Destroy() end
                if obj.Highlight then obj.Highlight:Destroy() end
                if typeof(obj) == "Instance" then obj:Destroy() end
            end)
        end
        table.clear(ESPObjects)

        -- 恢复设置
        pcall(function()
            if State.OriginalQualityLevel then
                settings().Rendering.QualityLevel = State.OriginalQualityLevel
            end
        end)
        if State.OriginalLighting then
            pcall(function()
                Lighting.Brightness = State.OriginalLighting.Brightness
                Lighting.Ambient = State.OriginalLighting.Ambient
                Lighting.OutdoorAmbient = State.OriginalLighting.OutdoorAmbient
                Lighting.GlobalShadows = State.OriginalLighting.GlobalShadows
                Lighting.ClockTime = State.OriginalLighting.ClockTime
            end)
        end

        -- 销毁 UI
        pcall(function()
            if Window and Window.ScreenGui then
                Window.ScreenGui:Destroy()
            end
        end)
        pcall(function()
            if Window and Window.Destroy then
                Window:Destroy()
            end
        end)
    end
})

--==================================================
-- 玩家离开时清理 ESP
--==================================================
Players.PlayerRemoving:Connect(function(plr)
    if ESPObjects[plr] then
        pcall(function()
            ESPObjects[plr].Billboard:Destroy()
        end)
        ESPObjects[plr] = nil
    end
end)

--==================================================
-- CharacterAdded 重置
--==================================================
LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    task.wait(0.3)

    -- 重新设置行走速度
    if State.WalkSpeed and State.WalkSpeed ~= 16 then
        local hum = GetHum()
        if hum then
            hum.WalkSpeed = State.WalkSpeed
        end
    end

    -- 重新设置跳跃力
    if State.JumpPower and State.JumpPower ~= 50 then
        local hum = GetHum()
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = State.JumpPower
        end
    end

    -- 重新绑定摔落无伤害
    if State.NoFallDamage then
        SetupNoFallDamage()
    end

    -- 清理失效的物品 ESP
    for key, obj in pairs(ESPObjects) do
        if type(key) == "string" and string.sub(key, 1, 5) == "item_" then
            pcall(function()
                if not obj.Parent or (obj.Adornee and not obj.Adornee.Parent) then
                    obj:Destroy()
                    ESPObjects[key] = nil
                end
            end)
        end
    end
end)

--==================================================
-- 脚本加载完成
--==================================================
Notify("忍者传奇", "脚本已加载!", 5)
