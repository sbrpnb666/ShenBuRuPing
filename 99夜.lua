--[[
    ================================================================
    ||  脚本作者: 霉国总统 / 神不如平                           ||
    ||  QQ群: 神不如平                                          ||
    ||  GitHub: github.com/sbrpnb666/ShenBuRuPing              ||
    ||                                                          ||
    ||  本脚本仅供学习交流使用，请勿用于商业用途                ||
    ||  转载请注明出处，禁止倒卖/改名为己用                     ||
    ================================================================
]]

--[[
    ================================================================
    ||  99夜 (99 Nights) Script                                    ||
    ||  Framework: WindUI                                          ||
    ||  Version: 1.0                                               ||
    ================================================================
]]

print("[99夜] 脚本开始加载 v1.0")

-- ========== WindUI 加载 ==========
local WindUI
local uiOk, uiErr = pcall(function()
    WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
end)
if not uiOk or not WindUI then
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "99夜 - WindUI加载失败",
            Text = tostring(uiErr),
            Duration = 10,
        })
    end)
    return
end

-- ========== ColorSequence.fromHex 辅助函数 ==========
local function CSFromHex(hex)
    return ColorSequence.new(Color3.fromHex("#" .. tostring(hex)))
end

-- ========== 服务引用 ==========
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- ========== 变量 ==========
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- ========== 状态表 ==========
local State = {
    AutoCollect   = false,
    AutoChop      = false,
    AutoCampfire  = false,
    AutoHeal      = false,
    AutoFood      = false,
    WalkSpeed     = 16,
    JumpPower     = 50,
    InfiniteJump  = false,
    NoClip        = false,
    GodMode       = false,
    NoFallDamage  = false,
    Flying        = false,
    FlySpeed      = 50,
    PlayerESP     = false,
    ItemESP       = false,
    EnemyESP      = false,
    FullHighlight = false,
    Fullbright    = false,
    LongPressTP   = false,
    AntiAfk       = false,
}

local Connections = {}
local ESPObjects = {}

-- ========== 辅助函数 ==========
local function GetChar()
    return LocalPlayer.Character
end

local function GetRoot()
    local char = GetChar()
    if char then
        return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
    end
    return nil
end

local function GetHum()
    local char = GetChar()
    if char then
        return char:FindFirstChildOfClass("Humanoid")
    end
    return nil
end

local function Notify(title, content, duration)
    WindUI:Notify({
        Title = title,
        Content = content,
        Duration = duration or 3,
    })
end

local function AddConnection(name, conn)
    if Connections[name] then
        Connections[name]:Disconnect()
    end
    Connections[name] = conn
end

local function RemoveConnection(name)
    if Connections[name] then
        Connections[name]:Disconnect()
        Connections[name] = nil
    end
end

local function CreateESP(parent, text, color, studOffset)
    if not parent or not parent:IsA("Instance") then return nil end
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "Night99ESP"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = studOffset or Vector3.new(0, 3, 0)
    billboard.Adornee = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold
    label.TextStrokeColor3 = Color3.new(0, 0, 0)
    label.TextStrokeTransparency = 0
    label.Parent = billboard

    billboard.Parent = parent
    return billboard
end

local function CreateHighlight(parent, color)
    if not parent or not parent:IsA("Instance") then return nil end
    local highlight = Instance.new("Highlight")
    highlight.Name = "Night99Highlight"
    highlight.Adornee = parent
    highlight.FillColor3 = color or Color3.new(1, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineColor3 = Color3.new(1, 1, 1)
    highlight.Parent = parent
    return highlight
end

local function TeleportTo(cframe)
    local root = GetRoot()
    if root then
        pcall(function()
            root.CFrame = cframe
        end)
    end
end

local function FindByKeywords(keywords, searchIn)
    searchIn = searchIn or Workspace
    for _, obj in pairs(searchIn:GetDescendants()) do
        local name = string.lower(obj.Name)
        for _, kw in pairs(keywords) do
            if string.find(name, string.lower(kw)) then
                return obj
            end
        end
    end
    return nil
end

local function FindAllByKeywords(keywords, searchIn)
    searchIn = searchIn or Workspace
    local results = {}
    for _, obj in pairs(searchIn:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local name = string.lower(obj.Name)
            for _, kw in pairs(keywords) do
                if string.find(name, string.lower(kw)) then
                    table.insert(results, obj)
                    break
                end
            end
        end
    end
    return results
end

-- ========== 创建窗口 ==========
print("[99夜] 正在创建窗口...")
local Window = WindUI:CreateWindow({
    Title   = "99夜",
    Icon    = "moon",
    Author  = "99夜脚本",
    Folder  = "99Nights",
    Size    = UDim2.fromOffset(500, 520),
    Theme   = "Dark",
})

Window:Tag({
    Title  = "99夜",
    Color  = Color3.fromHex("#4169E1"),
})

Window:EditOpenButton({
    Title          = "99夜",
    Icon           = "moon",
    CornerRadius   = UDim.new(0, 16),
    StrokeThickness = 2,
    Color          = CSFromHex("4169E1"),
    Draggable      = true,
})

local AutoTab = Window:Tab({ Title = "自动", Icon = "bot" })
local PlayerTab = Window:Tab({ Title = "玩家", Icon = "user" })
local VisualTab = Window:Tab({ Title = "视觉", Icon = "eye" })
local TeleportTab = Window:Tab({ Title = "传送", Icon = "map-pin" })
local UtilityTab = Window:Tab({ Title = "实用", Icon = "wrench" })

--========================================================
-- 自动标签页
--========================================================

AutoTab:Toggle({
    Title = "自动收集物资",
    Desc  = "自动吸附附近的物资到身边",
    Value = false,
    Callback = function(state)
        State.AutoCollect = state
        if state then
            Notify("99夜", "自动收集物资 已开启!", 3)
            task.spawn(function()
                while State.AutoCollect do
                    local root = GetRoot()
                    if root then
                        local keywords = {
                            "wood", "log", "stick", "tree",
                            "meat", "food", "apple", "berry", "mushroom",
                            "water", "bottle", "canteen",
                            "bandage", "medkit", "med", "heal",
                            "stone", "rock", "iron", "ore",
                            "cloth", "rope", "string",
                            "coin", "gold", "gem", "diamond",
                            "can", "soda", "soup",
                        }
                        for _, obj in pairs(Workspace:GetDescendants()) do
                            if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
                                local nameLower = string.lower(obj.Name)
                                local matched = false
                                for _, kw in pairs(keywords) do
                                    if string.find(nameLower, kw) then
                                        matched = true
                                        break
                                    end
                                end
                                if matched then
                                    local dist = (obj.Position - root.Position).Magnitude
                                    if dist < 200 and dist > 2 then
                                        pcall(function()
                                            obj.CFrame = root.CFrame * CFrame.new(0, 0, -3)
                                        end)
                                    end
                                end
                            end
                        end
                    end
                    task.wait(math.random(15, 50) / 100)
                end
            end)
        else
            Notify("99夜", "自动收集物资 已关闭!", 3)
        end
    end,
})

AutoTab:Toggle({
    Title = "自动砍树",
    Desc  = "自动攻击附近的树木获取木材",
    Value = false,
    Callback = function(state)
        State.AutoChop = state
        if state then
            Notify("99夜", "自动砍树 已开启!", 3)
            task.spawn(function()
                while State.AutoChop do
                    local root = GetRoot()
                    local hum = GetHum()
                    if root and hum then
                        local nearestTree = nil
                        local nearestDist = math.huge
                        for _, obj in pairs(Workspace:GetDescendants()) do
                            if obj:IsA("Model") or obj:IsA("BasePart") then
                                local nameLower = string.lower(obj.Name)
                                if string.find(nameLower, "tree") or string.find(nameLower, "wood") then
                                    local pos = obj:IsA("BasePart") and obj.Position or obj:GetPivot().Position
                                    local dist = (pos - root.Position).Magnitude
                                    if dist < nearestDist and dist < 100 then
                                        nearestDist = dist
                                        nearestTree = obj
                                    end
                                end
                            end
                        end
                        if nearestTree then
                            local treePos = nearestTree:IsA("BasePart") and nearestTree.Position or nearestTree:GetPivot().Position
                            TeleportTo(CFrame.new(treePos + Vector3.new(3, 0, 3)))
                            task.wait(math.random(20, 40) / 100)
                            pcall(function()
                                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                task.wait(0.1)
                                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                            end)
                        end
                    end
                    task.wait(math.random(30, 60) / 100)
                end
            end)
        else
            Notify("99夜", "自动砍树 已关闭!", 3)
        end
    end,
})

AutoTab:Toggle({
    Title = "自动维持篝火",
    Desc  = "自动给附近篝火添加燃料",
    Value = false,
    Callback = function(state)
        State.AutoCampfire = state
        if state then
            Notify("99夜", "自动维持篝火 已开启!", 3)
            task.spawn(function()
                while State.AutoCampfire do
                    local campfires = FindAllByKeywords({"campfire", "fire", "篝火"})
                    if #campfires > 0 then
                        for _, cf in pairs(campfires) do
                            pcall(function()
                                local fire = cf:FindFirstChildWhichIsA("Fire")
                                if not fire then
                                    local pos = cf:IsA("BasePart") and cf.Position or cf:GetPivot().Position
                                    TeleportTo(CFrame.new(pos + Vector3.new(2, 0, 2)))
                                    task.wait(0.3)
                                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                                    task.wait(0.1)
                                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                                end
                            end)
                        end
                    end
                    task.wait(3)
                end
            end)
        else
            Notify("99夜", "自动维持篝火 已关闭!", 3)
        end
    end,
})

AutoTab:Toggle({
    Title = "自动治疗",
    Desc  = "血量低时自动使用绷带/医疗包",
    Value = false,
    Callback = function(state)
        State.AutoHeal = state
        if state then
            Notify("99夜", "自动治疗 已开启!", 3)
            task.spawn(function()
                while State.AutoHeal do
                    local hum = GetHum()
                    if hum and hum.Health < hum.MaxHealth * 0.5 then
                        pcall(function()
                            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.H, false, game)
                            task.wait(0.1)
                            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.H, false, game)
                        end)
                        task.wait(2)
                    end
                    task.wait(1)
                end
            end)
        else
            Notify("99夜", "自动治疗 已关闭!", 3)
        end
    end,
})

AutoTab:Toggle({
    Title = "自动进食",
    Desc  = "自动吃食物补充饥饿值",
    Value = false,
    Callback = function(state)
        State.AutoFood = state
        if state then
            Notify("99夜", "自动进食 已开启!", 3)
            task.spawn(function()
                while State.AutoFood do
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                        task.wait(0.1)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
                    end)
                    task.wait(math.random(5, 10))
                end
            end)
        else
            Notify("99夜", "自动进食 已关闭!", 3)
        end
    end,
})

--========================================================
-- 玩家标签页
--========================================================

PlayerTab:Slider({
    Title = "移动速度",
    Min = 16,
    Max = 200,
    Default = 16,
    Callback = function(val)
        State.WalkSpeed = val
        local hum = GetHum()
        if hum then
            hum.WalkSpeed = val
        end
    end,
})

PlayerTab:Slider({
    Title = "跳跃力",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(val)
        State.JumpPower = val
        local hum = GetHum()
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = val
        end
    end,
})

PlayerTab:Slider({
    Title = "飞行速度",
    Min = 10,
    Max = 200,
    Default = 50,
    Callback = function(val)
        State.FlySpeed = val
    end,
})

PlayerTab:Toggle({
    Title = "无限跳跃",
    Desc  = "在空中也可以跳跃",
    Value = false,
    Callback = function(state)
        State.InfiniteJump = state
        if state then
            Notify("99夜", "无限跳跃 已开启!", 3)
        else
            Notify("99夜", "无限跳跃 已关闭!", 3)
        end
    end,
})

UserInputService.JumpRequest:Connect(function()
    if State.InfiniteJump then
        local hum = GetHum()
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

PlayerTab:Toggle({
    Title = "飞行",
    Desc  = "WASD控制方向 空格上升 Shift下降",
    Value = false,
    Callback = function(state)
        State.Flying = state
        if state then
            Notify("99夜", "飞行 已开启!", 3)
            task.spawn(function()
                local hum = GetHum()
                local root = GetRoot()
                if not hum or not root then return end

                local bv = Instance.new("BodyVelocity")
                bv.Name = "FlyVelocity"
                bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                bv.Velocity = Vector3.new(0, 0, 0)
                bv.Parent = root

                local bg = Instance.new("BodyGyro")
                bg.Name = "FlyGyro"
                bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.CFrame = root.CFrame
                bg.Parent = root

                hum.PlatformStand = true

                AddConnection("FlyLoop", RunService.RenderStepped:Connect(function()
                    if not State.Flying then return end
                    local r = GetRoot()
                    local c = GetChar()
                    if not r or not c then return end

                    local cam = Workspace.CurrentCamera
                    local moveDir = Vector3.new(0, 0, 0)

                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDir = moveDir + cam.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDir = moveDir - cam.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDir = moveDir - cam.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDir = moveDir + cam.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDir = moveDir + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                        moveDir = moveDir - Vector3.new(0, 1, 0)
                    end

                    if moveDir.Magnitude > 0 then
                        moveDir = moveDir.Unit
                    end

                    bv.Velocity = moveDir * State.FlySpeed
                    bg.CFrame = cam.CFrame
                end))

                while State.Flying do
                    task.wait(0.1)
                end

                RemoveConnection("FlyLoop")
                local r = GetRoot()
                local h = GetHum()
                if r then
                    local bv2 = r:FindFirstChild("FlyVelocity")
                    if bv2 then bv2:Destroy() end
                    local bg2 = r:FindFirstChild("FlyGyro")
                    if bg2 then bg2:Destroy() end
                end
                if h then
                    h.PlatformStand = false
                end
            end)
        else
            Notify("99夜", "飞行 已关闭!", 3)
            RemoveConnection("FlyLoop")
            local r = GetRoot()
            local h = GetHum()
            if r then
                local bv2 = r:FindFirstChild("FlyVelocity")
                if bv2 then bv2:Destroy() end
                local bg2 = r:FindFirstChild("FlyGyro")
                if bg2 then bg2:Destroy() end
            end
            if h then
                h.PlatformStand = false
            end
        end
    end,
})

PlayerTab:Toggle({
    Title = "穿墙",
    Desc  = "穿过所有障碍物",
    Value = false,
    Callback = function(state)
        State.NoClip = state
        if state then
            Notify("99夜", "穿墙 已开启!", 3)
            AddConnection("NoClip", RunService.Stepped:Connect(function()
                local char = GetChar()
                if char then
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then
                            part.CanCollide = false
                        end
                    end
                end
            end))
        else
            Notify("99夜", "穿墙 已关闭!", 3)
            RemoveConnection("NoClip")
        end
    end,
})

PlayerTab:Toggle({
    Title = "摔落无伤害",
    Desc  = "从高处掉下来不会扣血",
    Value = false,
    Callback = function(state)
        State.NoFallDamage = state
        if state then
            Notify("99夜", "摔落无伤害 已开启!", 3)
            AddConnection("NoFall", LocalPlayer.CharacterAdded:Connect(function(char)
                task.wait(1)
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.Freefalling:Connect(function()
                        if State.NoFallDamage then
                            pcall(function()
                                hum.Health = hum.MaxHealth
                            end)
                        end
                    end)
                end
            end))
            local hum = GetHum()
            if hum then
                hum.Freefalling:Connect(function()
                    if State.NoFallDamage then
                        pcall(function()
                            hum.Health = hum.MaxHealth
                        end)
                    end
                end)
            end
        else
            Notify("99夜", "摔落无伤害 已关闭!", 3)
            RemoveConnection("NoFall")
        end
    end,
})

PlayerTab:Toggle({
    Title = "无敌模式",
    Desc  = "血量一直保持满血",
    Value = false,
    Callback = function(state)
        State.GodMode = state
        if state then
            Notify("99夜", "无敌模式 已开启!", 3)
            AddConnection("GodMode", RunService.RenderStepped:Connect(function()
                local hum = GetHum()
                if hum and hum.Health < hum.MaxHealth then
                    hum.Health = hum.MaxHealth
                end
            end))
        else
            Notify("99夜", "无敌模式 已关闭!", 3)
            RemoveConnection("GodMode")
        end
    end,
})

--========================================================
-- 视觉标签页
--========================================================

VisualTab:Toggle({
    Title = "玩家ESP",
    Desc  = "透视显示所有玩家位置",
    Value = false,
    Callback = function(state)
        State.PlayerESP = state
        if state then
            Notify("99夜", "玩家ESP 已开启!", 3)
            task.spawn(function()
                while State.PlayerESP do
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local char = player.Character
                            if not ESPObjects["player_" .. player.Name] then
                                local hl = CreateHighlight(char, Color3.new(0, 1, 0))
                                local bb = CreateESP(char:FindFirstChild("Head") or char, player.Name, Color3.new(0, 1, 0), Vector3.new(0, 3, 0))
                                ESPObjects["player_" .. player.Name] = { Highlight = hl, Billboard = bb }
                            end
                        else
                            if ESPObjects["player_" .. player.Name] then
                                local obj = ESPObjects["player_" .. player.Name]
                                if obj.Highlight then obj.Highlight:Destroy() end
                                if obj.Billboard then obj.Billboard:Destroy() end
                                ESPObjects["player_" .. player.Name] = nil
                            end
                        end
                    end
                    task.wait(0.5)
                end
                for name, obj in pairs(ESPObjects) do
                    if string.find(name, "player_") then
                        if obj.Highlight then obj.Highlight:Destroy() end
                        if obj.Billboard then obj.Billboard:Destroy() end
                        ESPObjects[name] = nil
                    end
                end
            end)
        else
            Notify("99夜", "玩家ESP 已关闭!", 3)
        end
    end,
})

VisualTab:Toggle({
    Title = "敌人ESP",
    Desc  = "透视显示所有敌人/怪物位置",
    Value = false,
    Callback = function(state)
        State.EnemyESP = state
        if state then
            Notify("99夜", "敌人ESP 已开启!", 3)
            task.spawn(function()
                while State.EnemyESP do
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj:IsA("Model") then
                            local hum = obj:FindFirstChildOfClass("Humanoid")
                            local hrp = obj:FindFirstChild("HumanoidRootPart")
                            if hum and hrp and hum.Health > 0 then
                                local isPlayer = false
                                for _, player in pairs(Players:GetPlayers()) do
                                    if player.Character == obj then
                                        isPlayer = true
                                        break
                                    end
                                end
                                if not isPlayer and not ESPObjects["enemy_" .. obj:GetFullName()] then
                                    local nameLower = string.lower(obj.Name)
                                    local color = Color3.new(1, 0, 0)
                                    if string.find(nameLower, "boss") then
                                        color = Color3.new(1, 0, 1)
                                    elseif string.find(nameLower, "cult") or string.find(nameLower, "ram") or string.find(nameLower, "owl") then
                                        color = Color3.new(1, 0.5, 0)
                                    end
                                    local hl = CreateHighlight(obj, color)
                                    local bb = CreateESP(hrp, obj.Name, color, Vector3.new(0, 3, 0))
                                    ESPObjects["enemy_" .. obj:GetFullName()] = { Highlight = hl, Billboard = bb }
                                end
                            end
                        end
                    end
                    task.wait(1)
                end
                for name, obj in pairs(ESPObjects) do
                    if string.find(name, "enemy_") then
                        if obj.Highlight then obj.Highlight:Destroy() end
                        if obj.Billboard then obj.Billboard:Destroy() end
                        ESPObjects[name] = nil
                    end
                end
            end)
        else
            Notify("99夜", "敌人ESP 已关闭!", 3)
        end
    end,
})

VisualTab:Toggle({
    Title = "物品ESP",
    Desc  = "透视显示所有可拾取物品",
    Value = false,
    Callback = function(state)
        State.ItemESP = state
        if state then
            Notify("99夜", "物品ESP 已开启!", 3)
            task.spawn(function()
                while State.ItemESP do
                    local keywords = {
                        "wood", "log", "stick",
                        "meat", "food", "apple", "berry",
                        "water", "bottle",
                        "bandage", "medkit",
                        "stone", "rock", "iron", "ore",
                        "coin", "gold", "gem",
                        "can", "soda",
                    }
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
                            local nameLower = string.lower(obj.Name)
                            for _, kw in pairs(keywords) do
                                if string.find(nameLower, kw) and not ESPObjects["item_" .. obj:GetFullName()] then
                                    local color = Color3.new(1, 1, 0)
                                    if string.find(nameLower, "gold") or string.find(nameLower, "gem") or string.find(nameLower, "diamond") then
                                        color = Color3.new(1, 0.84, 0)
                                    elseif string.find(nameLower, "med") or string.find(nameLower, "bandage") then
                                        color = Color3.new(1, 0.2, 0.2)
                                    elseif string.find(nameLower, "food") or string.find(nameLower, "meat") or string.find(nameLower, "apple") then
                                        color = Color3.new(0.5, 1, 0)
                                    end
                                    local bb = CreateESP(obj, obj.Name, color, Vector3.new(0, 2, 0))
                                    ESPObjects["item_" .. obj:GetFullName()] = { Billboard = bb }
                                    break
                                end
                            end
                        end
                    end
                    task.wait(2)
                end
                for name, obj in pairs(ESPObjects) do
                    if string.find(name, "item_") then
                        if obj.Billboard then obj.Billboard:Destroy() end
                        ESPObjects[name] = nil
                    end
                end
            end)
        else
            Notify("99夜", "物品ESP 已关闭!", 3)
        end
    end,
})

VisualTab:Toggle({
    Title = "全屏高亮",
    Desc  = "所有物体高亮显示",
    Value = false,
    Callback = function(state)
        State.FullHighlight = state
        if state then
            Notify("99夜", "全屏高亮 已开启!", 3)
            local hl = Instance.new("Highlight")
            hl.Name = "FullHighlight99"
            hl.Adornee = Workspace
            hl.FillColor3 = Color3.new(1, 1, 1)
            hl.FillTransparency = 0.9
            hl.OutlineColor3 = Color3.new(1, 1, 1)
            hl.OutlineTransparency = 0
            hl.Parent = game:GetService("CoreGui")
            ESPObjects["fullhighlight"] = hl
        else
            Notify("99夜", "全屏高亮 已关闭!", 3)
            if ESPObjects["fullhighlight"] then
                ESPObjects["fullhighlight"]:Destroy()
                ESPObjects["fullhighlight"] = nil
            end
        end
    end,
})

VisualTab:Toggle({
    Title = "全屏提亮",
    Desc  = "夜晚也能看清楚",
    Value = false,
    Callback = function(state)
        State.Fullbright = state
        if state then
            Notify("99夜", "全屏提亮 已开启!", 3)
            Lighting.Brightness = 3
            Lighting.ClockTime = 12
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        else
            Notify("99夜", "全屏提亮 已关闭!", 3)
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            Lighting.GlobalShadows = true
            Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
            Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
        end
    end,
})

--========================================================
-- 传送标签页
--========================================================

TeleportTab:Button({
    Title = "传送到最近玩家",
    Callback = function()
        local root = GetRoot()
        if not root then
            Notify("99夜", "找不到角色!", 3)
            return
        end
        local nearestPlayer = nil
        local nearestDist = math.huge
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local pRoot = player.Character:FindFirstChild("HumanoidRootPart")
                if pRoot then
                    local dist = (pRoot.Position - root.Position).Magnitude
                    if dist < nearestDist then
                        nearestDist = dist
                        nearestPlayer = player
                    end
                end
            end
        end
        if nearestPlayer then
            local pRoot = nearestPlayer.Character:FindFirstChild("HumanoidRootPart")
            if pRoot then
                TeleportTo(pRoot.CFrame * CFrame.new(0, 0, 3))
                Notify("99夜", "已传送到 " .. nearestPlayer.Name, 3)
            end
        else
            Notify("99夜", "附近没有其他玩家!", 3)
        end
    end,
})

TeleportTab:Button({
    Title = "传送到营地",
    Callback = function()
        local camp = FindByKeywords({"camp", "base", "tent", "campfire", "spawn"})
        if camp then
            local pos = camp:IsA("BasePart") and camp.Position or camp:GetPivot().Position
            TeleportTo(CFrame.new(pos + Vector3.new(0, 3, 0)))
            Notify("99夜", "已传送到营地!", 3)
        else
            Notify("99夜", "找不到营地!", 3)
        end
    end,
})

TeleportTab:Button({
    Title = "传送到最近树木",
    Callback = function()
        local root = GetRoot()
        if not root then return end
        local nearestTree = nil
        local nearestDist = math.huge
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("Model") or obj:IsA("BasePart") then
                local nameLower = string.lower(obj.Name)
                if string.find(nameLower, "tree") or string.find(nameLower, "log") then
                    local pos = obj:IsA("BasePart") and obj.Position or obj:GetPivot().Position
                    local dist = (pos - root.Position).Magnitude
                    if dist < nearestDist and dist > 5 then
                        nearestDist = dist
                        nearestTree = obj
                    end
                end
            end
        end
        if nearestTree then
            local pos = nearestTree:IsA("BasePart") and nearestTree.Position or nearestTree:GetPivot().Position
            TeleportTo(CFrame.new(pos + Vector3.new(2, 0, 2)))
            Notify("99夜", "已传送到树木!", 3)
        else
            Notify("99夜", "附近没有树!", 3)
        end
    end,
})

TeleportTab:Button({
    Title = "传送到高处(升天)",
    Callback = function()
        local root = GetRoot()
        if root then
            TeleportTo(root.CFrame * CFrame.new(0, 500, 0))
            Notify("99夜", "已传送到高空!", 3)
        end
    end,
})

TeleportTab:Toggle({
    Title = "长按鼠标传送",
    Desc  = "长按鼠标左键传送到准星位置",
    Value = false,
    Callback = function(state)
        State.LongPressTP = state
        if state then
            Notify("99夜", "长按传送 已开启!", 3)
            local pressTime = 0
            local isPressing = false

            AddConnection("LongPressDown", UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    isPressing = true
                    pressTime = tick()
                    task.spawn(function()
                        while isPressing and State.LongPressTP do
                            if tick() - pressTime >= 0.5 then
                                local root = GetRoot()
                                if root then
                                    local mouseTarget = Mouse.Hit
                                    if mouseTarget then
                                        TeleportTo(mouseTarget + Vector3.new(0, 3, 0))
                                    end
                                end
                                break
                            end
                            task.wait(0.1)
                        end
                    end)
                end
            end))

            AddConnection("LongPressUp", UserInputService.InputEnded:Connect(function(input, gpe)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    isPressing = false
                end
            end))
        else
            Notify("99夜", "长按传送 已关闭!", 3)
            RemoveConnection("LongPressDown")
            RemoveConnection("LongPressUp")
        end
    end,
})

--========================================================
-- 实用标签页
--========================================================

UtilityTab:Toggle({
    Title = "防挂机",
    Desc  = "防止因挂机被踢出游戏",
    Value = false,
    Callback = function(state)
        State.AntiAfk = state
        if state then
            Notify("99夜", "防挂机 已开启!", 3)
            local vu = game:GetService("VirtualUser")
            AddConnection("AntiAfk", LocalPlayer.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end))
        else
            Notify("99夜", "防挂机 已关闭!", 3)
            RemoveConnection("AntiAfk")
        end
    end,
})

UtilityTab:Button({
    Title = "重新加入",
    Callback = function()
        Notify("99夜", "正在重新加入...", 3)
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})

UtilityTab:Button({
    Title = "复制服务器ID",
    Callback = function()
        if setclipboard then
            setclipboard(game.JobId)
            Notify("99夜", "JobId已复制到剪贴板!", 3)
        else
            Notify("99夜", "当前执行器不支持剪贴板!", 3)
        end
    end,
})

UtilityTab:Button({
    Title = "查看角色信息",
    Callback = function()
        local hum = GetHum()
        local root = GetRoot()
        if hum and root then
            Notify("角色信息",
                "血量: " .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth) ..
                "\n速度: " .. math.floor(hum.WalkSpeed) ..
                "\n位置: " .. tostring(root.Position),
                8
            )
        else
            Notify("99夜", "找不到角色!", 3)
        end
    end,
})

UtilityTab:Button({
    Title = "复制当前坐标",
    Callback = function()
        local root = GetRoot()
        if root and setclipboard then
            local pos = root.Position
            local coord = string.format("%.1f, %.1f, %.1f", pos.X, pos.Y, pos.Z)
            setclipboard(coord)
            Notify("99夜", "坐标已复制: " .. coord, 5)
        end
    end,
})

--========================================================
-- 角色重生时恢复属性
--========================================================
LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        if State.WalkSpeed ~= 16 then
            hum.WalkSpeed = State.WalkSpeed
        end
        if State.JumpPower ~= 50 then
            hum.UseJumpPower = true
            hum.JumpPower = State.JumpPower
        end
    end
end)

print("[99夜] 脚本加载完成 v1.0")
Notify("99夜", "脚本加载成功! 祝您游戏愉快~", 5)
