--========================================================
-- 力量传奇脚本 v1.0
-- 框架：WindUI
--========================================================

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local Window = WindUI:CreateWindow({
    Title = "力量传奇",
    Icon = "dumbbell",
    Author = "力量传奇脚本",
    Folder = "StrengthLegends",
    Size = UDim2.fromOffset(500, 520),
    Theme = "Dark",
    HideSearchBar = false,
})

-- 时间标签
local TimeTag = Window:Tag({
    Title = "00:00",
    Color = Color3.fromRGB(255, 100, 100)
})

local hue = 0
task.spawn(function()
    while true do
        local now = os.date("*t")
        hue = (hue + 0.01) % 1
        TimeTag:SetTitle(string.format("%02d:%02d", now.hour, now.min))
        TimeTag:SetColor(Color3.fromHSV(hue, 1, 1))
        task.wait(0.06)
    end
end)

Window:Tag({ Title = "力量", Color = Color3.fromHex("#FF6464") })

Window:EditOpenButton({
    Title = "力量传奇",
    Icon = "dumbbell",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF6464")),
    Draggable = true,
})

--=========== 状态 ===========
local State = {
    AutoTrain = false,
    AutoRebirth = false,
    AutoPunch = false,
    AutoQuest = false,
    AutoCollectCoins = false,
    AutoCollectGems = false,
    AutoBuyWeights = false,
    AutoBuyPets = false,
    AutoHatch = false,
    FastPunch = false,
    WalkSpeed = 16,
    JumpPower = 50,
    InfJump = false,
    Noclip = false,
    GodMode = false,
    NoFallDamage = false,
    ESPEnabled = false,
    ESPNames = true,
    ESPDistance = true,
    ESPItems = false,
    Fullbright = false,
    AntiAFK = false,
    FPSBoost = false,
}

local Connections = {}
local ESPObjects = {}

--=========== 辅助函数 ===========
local function GetChar()
    return LocalPlayer.Character
end

local function GetRoot()
    local c = GetChar()
    return c and c:FindFirstChild("HumanoidRootPart") or nil
end

local function GetHum()
    local c = GetChar()
    return c and c:FindFirstChildOfClass("Humanoid") or nil
end

local function Notify(title, content, duration)
    WindUI:Notify({ Title = title, Content = content or "", Duration = duration or 3 })
end

-- 获取 leaderstats
local function GetStat(statName)
    local ls = LocalPlayer:FindFirstChild("leaderstats")
    if ls then
        local stat = ls:FindFirstChild(statName)
        if stat then return stat.Value end
    end
    return nil
end

--========================================================
-- Tab1: 自动
--========================================================
local AutoTab = Window:Tab({
    Title = "自动",
    Icon = "play",
})

AutoTab:Section({ Title = "训练", TextXAlignment = "Left", TextSize = 17 })

-- 自动训练 (举重)
AutoTab:Toggle({
    Title = "自动训练力量",
    Default = false,
    Callback = function(val)
        State.AutoTrain = val
        if val then
            Notify("自动", "自动训练已开启", 3)
            local lastTrain = 0
            Connections.AutoTrain = RunService.Heartbeat:Connect(function()
                if not State.AutoTrain then return end
                local now = tick()
                if now - lastTrain < math.random(0.3, 0.6) then return end
                lastTrain = now

                -- 方法1: 触发训练 Remote
                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "train") or string.find(ln, "lift") or string.find(ln, "weight")
                                or string.find(ln, "strength") or string.find(ln, "power") or string.find(ln, "exercise") then
                                obj:FireServer()
                            end
                        end
                        if obj:IsA("RemoteFunction") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "train") or string.find(ln, "lift") or string.find(ln, "strength") then
                                pcall(function() obj:InvokeServer() end)
                            end
                        end
                    end
                end)

                -- 方法2: 模拟点击训练区域
                pcall(function()
                    local root = GetRoot()
                    if root then
                        for _, obj in ipairs(Workspace:GetDescendants()) do
                            if obj:IsA("BasePart") or obj:IsA("Model") then
                                local ln = string.lower(obj.Name)
                                if string.find(ln, "weight") or string.find(ln, "gym") or string.find(ln, "dumbbell")
                                    or string.find(ln, "barbell") or string.find(ln, "train") or string.find(ln, "lift") then
                                    local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                                    if part then
                                        local dist = (root.Position - part.Position).Magnitude
                                        if dist < 50 then
                                            VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
                                            task.wait(0.02)
                                            VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)

                -- 方法3: 触碰训练点
                pcall(function()
                    local root = GetRoot()
                    if root then
                        for _, obj in ipairs(Workspace:GetDescendants()) do
                            if obj:IsA("BasePart") then
                                local ln = string.lower(obj.Name)
                                if string.find(ln, "weight") or string.find(ln, "gym") or string.find(ln, "dumbbell")
                                    or string.find(ln, "barbell") or string.find(ln, "train") then
                                    local dist = (root.Position - obj.Position).Magnitude
                                    if dist < 30 then
                                        obj.CFrame = root.CFrame
                                    end
                                end
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoTrain then Connections.AutoTrain:Disconnect() Connections.AutoTrain = nil end
            Notify("自动", "自动训练已关闭", 3)
        end
    end,
})

-- 自动转生
AutoTab:Toggle({
    Title = "自动转生",
    Default = false,
    Callback = function(val)
        State.AutoRebirth = val
        if val then
            Notify("自动", "自动转生已开启", 3)
            local lastRebirth = 0
            Connections.AutoRebirth = RunService.Heartbeat:Connect(function()
                if not State.AutoRebirth then return end
                local now = tick()
                if now - lastRebirth < math.random(3, 6) then return end
                lastRebirth = now

                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "rebirth") or string.find(ln, "prestige") or string.find(ln, "ascend") then
                                obj:FireServer()
                            end
                        end
                        if obj:IsA("RemoteFunction") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "rebirth") or string.find(ln, "prestige") then
                                pcall(function() obj:InvokeServer() end)
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoRebirth then Connections.AutoRebirth:Disconnect() Connections.AutoRebirth = nil end
            Notify("自动", "自动转生已关闭", 3)
        end
    end,
})

AutoTab:Divider()
AutoTab:Section({ Title = "战斗", TextXAlignment = "Left", TextSize = 17 })

-- 自动打拳 (攻击力提升)
AutoTab:Toggle({
    Title = "自动打拳",
    Default = false,
    Callback = function(val)
        State.AutoPunch = val
        if val then
            Notify("自动", "自动打拳已开启", 3)
            local lastPunch = 0
            Connections.AutoPunch = RunService.Heartbeat:Connect(function()
                if not State.AutoPunch then return end
                local now = tick()
                if now - lastPunch < math.random(0.4, 0.8) then return end
                lastPunch = now

                -- 模拟点击攻击
                pcall(function()
                    local char = GetChar()
                    if char then
                        local tool = char:FindFirstChildOfClass("Tool")
                        if tool then
                            tool:Activate()
                        else
                            VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
                            task.wait(0.02)
                            VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
                        end
                    end
                end)

                -- 触发攻击 Remote
                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "punch") or string.find(ln, "hit") or string.find(ln, "attack")
                                or string.find(ln, "fight") or string.find(ln, "power") then
                                obj:FireServer()
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoPunch then Connections.AutoPunch:Disconnect() Connections.AutoPunch = nil end
            Notify("自动", "自动打拳已关闭", 3)
        end
    end,
})

-- 快速出拳
AutoTab:Toggle({
    Title = "快速出拳",
    Default = false,
    Callback = function(val)
        State.FastPunch = val
        if val then
            Notify("自动", "快速出拳已开启", 3)
            Connections.FastPunch = RunService.Heartbeat:Connect(function()
                if not State.FastPunch then return end
                if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
                    or UserInputService:IsMouseButtonPressed(Enum.UserInputType.Touch) then
                    local char = GetChar()
                    if char then
                        local tool = char:FindFirstChildOfClass("Tool")
                        if tool then
                            pcall(function() tool:Activate() end)
                        end
                    end
                end
            end)
        else
            if Connections.FastPunch then Connections.FastPunch:Disconnect() Connections.FastPunch = nil end
            Notify("自动", "快速出拳已关闭", 3)
        end
    end,
})

-- 自动做任务
AutoTab:Toggle({
    Title = "自动做任务",
    Default = false,
    Callback = function(val)
        State.AutoQuest = val
        if val then
            Notify("自动", "自动做任务已开启", 3)
            local lastQuest = 0
            Connections.AutoQuest = RunService.Heartbeat:Connect(function()
                if not State.AutoQuest then return end
                local now = tick()
                if now - lastQuest < math.random(2, 4) then return end
                lastQuest = now

                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "quest") or string.find(ln, "mission") or string.find(ln, "task") then
                                obj:FireServer()
                            end
                        end
                        if obj:IsA("RemoteFunction") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "quest") or string.find(ln, "mission") then
                                pcall(function() obj:InvokeServer() end)
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoQuest then Connections.AutoQuest:Disconnect() Connections.AutoQuest = nil end
            Notify("自动", "自动做任务已关闭", 3)
        end
    end,
})

AutoTab:Divider()
AutoTab:Section({ Title = "收集", TextXAlignment = "Left", TextSize = 17 })

-- 自动收集金币
AutoTab:Toggle({
    Title = "自动收集金币",
    Default = false,
    Callback = function(val)
        State.AutoCollectCoins = val
        if val then
            Notify("自动", "自动收集金币已开启", 3)
            Connections.AutoCoins = RunService.Heartbeat:Connect(function()
                if not State.AutoCollectCoins then return end
                local root = GetRoot()
                if not root then return end
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local ln = string.lower(obj.Name)
                        if string.find(ln, "coin") or string.find(ln, "cash") or string.find(ln, "money")
                            or string.find(ln, "pickup") or string.find(ln, "reward") then
                            pcall(function() obj.CFrame = root.CFrame end)
                        end
                    end
                end
                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "collect") or string.find(ln, "coin") or string.find(ln, "reward") then
                                obj:FireServer()
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoCoins then Connections.AutoCoins:Disconnect() Connections.AutoCoins = nil end
            Notify("自动", "自动收集金币已关闭", 3)
        end
    end,
})

-- 自动收集宝石
AutoTab:Toggle({
    Title = "自动收集宝石",
    Default = false,
    Callback = function(val)
        State.AutoCollectGems = val
        if val then
            Notify("自动", "自动收集宝石已开启", 3)
            Connections.AutoGems = RunService.Heartbeat:Connect(function()
                if not State.AutoCollectGems then return end
                local root = GetRoot()
                if not root then return end
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local ln = string.lower(obj.Name)
                        if string.find(ln, "gem") or string.find(ln, "crystal") or string.find(ln, "diamond") or string.find(ln, "jewel") then
                            pcall(function() obj.CFrame = root.CFrame end)
                        end
                    end
                end
                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "gem") or string.find(ln, "crystal") then
                                obj:FireServer()
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoGems then Connections.AutoGems:Disconnect() Connections.AutoGems = nil end
            Notify("自动", "自动收集宝石已关闭", 3)
        end
    end,
})

AutoTab:Divider()
AutoTab:Section({ Title = "商店与孵化", TextXAlignment = "Left", TextSize = 17 })

-- 自动买哑铃
AutoTab:Toggle({
    Title = "自动买哑铃",
    Default = false,
    Callback = function(val)
        State.AutoBuyWeights = val
        if val then
            Notify("自动", "自动买哑铃已开启", 3)
            local lastBuy = 0
            Connections.AutoBuyW = RunService.Heartbeat:Connect(function()
                if not State.AutoBuyWeights then return end
                local now = tick()
                if now - lastBuy < math.random(1, 3) then return end
                lastBuy = now

                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "buy") and (string.find(ln, "weight") or string.find(ln, "dumbbell") or string.find(ln, "barbell")) then
                                obj:FireServer()
                            end
                        end
                        if obj:IsA("RemoteFunction") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "buy") and (string.find(ln, "weight") or string.find(ln, "dumbbell")) then
                                pcall(function() obj:InvokeServer() end)
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoBuyW then Connections.AutoBuyW:Disconnect() Connections.AutoBuyW = nil end
            Notify("自动", "自动买哑铃已关闭", 3)
        end
    end,
})

-- 自动买宠物
AutoTab:Toggle({
    Title = "自动买宠物",
    Default = false,
    Callback = function(val)
        State.AutoBuyPets = val
        if val then
            Notify("自动", "自动买宠物已开启", 3)
            local lastBuyP = 0
            Connections.AutoBuyP = RunService.Heartbeat:Connect(function()
                if not State.AutoBuyPets then return end
                local now = tick()
                if now - lastBuyP < math.random(2, 5) then return end
                lastBuyP = now

                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "buy") and (string.find(ln, "pet") or string.find(ln, "egg")) then
                                obj:FireServer()
                            end
                        end
                        if obj:IsA("RemoteFunction") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "buy") and string.find(ln, "pet") then
                                pcall(function() obj:InvokeServer() end)
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoBuyP then Connections.AutoBuyP:Disconnect() Connections.AutoBuyP = nil end
            Notify("自动", "自动买宠物已关闭", 3)
        end
    end,
})

-- 自动孵化宠物蛋
AutoTab:Toggle({
    Title = "自动孵化宠物蛋",
    Default = false,
    Callback = function(val)
        State.AutoHatch = val
        if val then
            Notify("自动", "自动孵化已开启", 3)
            local lastHatch = 0
            Connections.AutoHatch = RunService.Heartbeat:Connect(function()
                if not State.AutoHatch then return end
                local now = tick()
                if now - lastHatch < math.random(1, 3) then return end
                lastHatch = now

                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "hatch") or string.find(ln, "open") or string.find(ln, "egg") then
                                obj:FireServer()
                            end
                        end
                        if obj:IsA("RemoteFunction") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "hatch") or string.find(ln, "egg") then
                                pcall(function() obj:InvokeServer() end)
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoHatch then Connections.AutoHatch:Disconnect() Connections.AutoHatch = nil end
            Notify("自动", "自动孵化已关闭", 3)
        end
    end,
})

AutoTab:Button({
    Title = "扫描游戏接口",
    Callback = function()
        local results = {}
        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
            if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                table.insert(results, obj:GetFullName())
            end
        end
        local msg = #results > 0 and table.concat(results, "\n") or "未找到接口"
        Notify("扫描结果", msg, 10)
    end,
})

--========================================================
-- Tab2: 玩家
--========================================================
local PlayerTab = Window:Tab({
    Title = "玩家",
    Icon = "user",
})

PlayerTab:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })

PlayerTab:Slider({
    Title = "行走速度",
    Value = { Min = 16, Max = 500, Default = 16 },
    Increment = 1,
    Callback = function(val)
        State.WalkSpeed = val
        local h = GetHum()
        if h then h.WalkSpeed = val end
    end,
})

PlayerTab:Slider({
    Title = "跳跃力",
    Value = { Min = 50, Max = 500, Default = 50 },
    Increment = 1,
    Callback = function(val)
        State.JumpPower = val
        local h = GetHum()
        if h then
            if h.UseJumpPower then h.JumpPower = val
            else h.JumpHeight = val / 10 end
        end
    end,
})

PlayerTab:Divider()

PlayerTab:Toggle({
    Title = "无限跳跃",
    Default = false,
    Callback = function(val)
        State.InfJump = val
        if val then
            Connections.InfJump = UserInputService.JumpRequest:Connect(function()
                local h = GetHum()
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        else
            if Connections.InfJump then Connections.InfJump:Disconnect() Connections.InfJump = nil end
        end
    end,
})

PlayerTab:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(val)
        State.Noclip = val
        if val then
            Connections.NoClip = RunService.Stepped:Connect(function()
                if not State.Noclip then return end
                local c = GetChar()
                if c then
                    for _, p in ipairs(c:GetDescendants()) do
                        if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
                    end
                end
            end)
        else
            if Connections.NoClip then Connections.NoClip:Disconnect() Connections.NoClip = nil end
        end
    end,
})

PlayerTab:Toggle({
    Title = "无敌",
    Default = false,
    Callback = function(val)
        State.GodMode = val
        if val then
            Notify("玩家", "无敌已开启", 3)
            Connections.GodMode = RunService.Heartbeat:Connect(function()
                local h = GetHum()
                if h and h.Health < h.MaxHealth then h.Health = h.MaxHealth end
            end)
        else
            if Connections.GodMode then Connections.GodMode:Disconnect() Connections.GodMode = nil end
            Notify("玩家", "无敌已关闭", 3)
        end
    end,
})

PlayerTab:Toggle({
    Title = "摔落无伤害",
    Default = false,
    Callback = function(val)
        State.NoFallDamage = val
        if val then
            Notify("玩家", "摔落无伤害已开启", 3)
            local function setupFall(h)
                if not h then return end
                local saved = h.Health
                h.StateChanged:Connect(function(old, new)
                    if not State.NoFallDamage then return end
                    if new == Enum.HumanoidStateType.Freefall then
                        saved = h.Health
                    elseif old == Enum.HumanoidStateType.Freefall then
                        if h.Health < saved then h.Health = saved end
                    end
                end)
            end
            local c = GetChar()
            if c then setupFall(c:FindFirstChildOfClass("Humanoid")) end
            Connections.NoFall = LocalPlayer.CharacterAdded:Connect(function(char)
                task.wait(0.3)
                if State.NoFallDamage then setupFall(char:FindFirstChildOfClass("Humanoid")) end
            end)
        else
            if Connections.NoFall then Connections.NoFall:Disconnect() Connections.NoFall = nil end
            Notify("玩家", "摔落无伤害已关闭", 3)
        end
    end,
})

PlayerTab:Divider()

local flyLoaded = false
PlayerTab:Button({
    Title = "飞行 (手机版)",
    Callback = function()
        if flyLoaded then
            Notify("飞行", "飞行面板已打开", 3)
            return
        end
        flyLoaded = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/飞行脚本V3(全游戏通用).txt"))()
    end,
})

--========================================================
-- Tab3: 视觉
--========================================================
local VisualTab = Window:Tab({
    Title = "视觉",
    Icon = "eye",
})

VisualTab:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })

local function createESP(player)
    if player == LocalPlayer then return end
    if ESPObjects[player] then return end
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "PowerESP_" .. player.Name
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0, 20)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.TextStrokeTransparency = 0.5
    nameLabel.Text = player.Name
    nameLabel.Parent = billboard
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0, 18)
    distLabel.Position = UDim2.new(0, 0, 0, 22)
    distLabel.BackgroundTransparency = 1
    distLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    distLabel.TextSize = 12
    distLabel.Text = ""
    distLabel.Parent = billboard
    ESPObjects[player] = { billboard = billboard, nameLabel = nameLabel, distLabel = distLabel }
end

local function removeESP(player)
    if ESPObjects[player] then
        if ESPObjects[player].billboard then ESPObjects[player].billboard:Destroy() end
        ESPObjects[player] = nil
    end
end

VisualTab:Toggle({
    Title = "人物透视",
    Default = false,
    Callback = function(val)
        State.ESPEnabled = val
        if val then
            Notify("视觉", "透视已开启", 3)
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer then createESP(plr) end
            end
            Connections.ESP = RunService.Heartbeat:Connect(function()
                for plr, data in pairs(ESPObjects) do
                    local char = plr.Character
                    if char then
                        local head = char:FindFirstChild("Head")
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if head or hrp then
                            data.billboard.Adornee = head or hrp
                            data.nameLabel.Visible = State.ESPNames
                            data.distLabel.Visible = State.ESPDistance
                            if State.ESPDistance then
                                local root = GetRoot()
                                local targetHrp = hrp or head
                                if root and targetHrp then
                                    data.distLabel.Text = math.floor((root.Position - targetHrp.Position).Magnitude) .. " 米"
                                end
                            end
                        end
                    end
                end
            end)
            Connections.PAdd = Players.PlayerAdded:Connect(function(p) createESP(p) end)
            Connections.PRem = Players.PlayerRemoving:Connect(function(p) removeESP(p) end)
        else
            if Connections.ESP then Connections.ESP:Disconnect() Connections.ESP = nil end
            if Connections.PAdd then Connections.PAdd:Disconnect() Connections.PAdd = nil end
            if Connections.PRem then Connections.PRem:Disconnect() Connections.PRem = nil end
            for p, _ in pairs(ESPObjects) do removeESP(p) end
            ESPObjects = {}
            Notify("视觉", "透视已关闭", 3)
        end
    end,
})

VisualTab:Toggle({
    Title = "显示名字",
    Default = true,
    Callback = function(val) State.ESPNames = val end,
})

VisualTab:Toggle({
    Title = "显示距离",
    Default = true,
    Callback = function(val) State.ESPDistance = val end,
})

-- 物品透视
VisualTab:Toggle({
    Title = "物品透视 (金币/宝石)",
    Default = false,
    Callback = function(val)
        State.ESPItems = val
        if val then
            Notify("视觉", "物品透视已开启", 3)
            Connections.Items = RunService.Heartbeat:Connect(function()
                if not State.ESPItems then return end
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local ln = string.lower(obj.Name)
                        if string.find(ln, "coin") or string.find(ln, "gem") or string.find(ln, "crystal")
                            or string.find(ln, "diamond") or string.find(ln, "pickup") or string.find(ln, "reward") then
                            if not obj:FindFirstChild("PowerItemESP") then
                                local hl = Instance.new("Highlight")
                                hl.Name = "PowerItemESP"
                                hl.FillColor = Color3.fromRGB(255, 200, 0)
                                hl.FillTransparency = 0.3
                                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                                hl.Parent = obj
                            end
                        end
                    end
                end
            end)
        else
            if Connections.Items then Connections.Items:Disconnect() Connections.Items = nil end
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:FindFirstChild("PowerItemESP") then obj.PowerItemESP:Destroy() end
            end
            Notify("视觉", "物品透视已关闭", 3)
        end
    end,
})

VisualTab:Toggle({
    Title = "全图高亮",
    Default = false,
    Callback = function(val)
        State.Fullbright = val
        if val then
            Lighting.Brightness = 3
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            Connections.FB = RunService.Heartbeat:Connect(function()
                Lighting.Brightness = 3
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
            end)
        else
            if Connections.FB then Connections.FB:Disconnect() Connections.FB = nil end
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            Lighting.GlobalShadows = true
            Notify("视觉", "全图高亮已关闭", 3)
        end
    end,
})

--========================================================
-- Tab4: 传送
--========================================================
local TeleportTab = Window:Tab({
    Title = "传送",
    Icon = "map-pin",
})

TeleportTab:Section({ Title = "地点", TextXAlignment = "Left", TextSize = 17 })

local locations = {
    { name = "健身房", keywords = {"gym", "weight", "train", "lift"} },
    { name = "训练区", keywords = {"training", "area", "zone", "practice"} },
    { name = "商店", keywords = {"shop", "store", "market"} },
    { name = "宠物店", keywords = {"pet", "egg", "hatch"} },
    { name = "哑铃店", keywords = {"dumbbell", "barbell", "weight"} },
    { name = "转生区", keywords = {"rebirth", "prestige", "ascend"} },
    { name = "任务NPC", keywords = {"quest", "mission", "npc"} },
    { name = "竞技场", keywords = {"arena", "pvp", "fight"} },
    { name = "出生点", keywords = {"spawn", "lobby", "start"} },
    { name = "金币区", keywords = {"coin", "money", "cash"} },
    { name = "宝石区", keywords = {"gem", "crystal", "diamond"} },
    { name = "Boss区", keywords = {"boss", "raid"} },
}

for _, loc in ipairs(locations) do
    TeleportTab:Button({
        Title = "传送到" .. loc.name,
        Callback = function()
            local found = false
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") or obj:IsA("Model") then
                    local ln = string.lower(obj.Name)
                    for _, kw in ipairs(loc.keywords) do
                        if string.find(ln, kw) then
                            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                            if part then
                                local root = GetRoot()
                                if root then
                                    root.CFrame = part.CFrame * CFrame.new(0, 5, 0)
                                    Notify("传送", "已传送到" .. loc.name, 3)
                                    found = true
                                end
                                break
                            end
                        end
                    end
                    if found then break end
                end
            end
            if not found then Notify("传送", "未找到" .. loc.name, 3) end
        end,
    })
end

TeleportTab:Divider()

-- 长按传送
local tpHoldStart = nil
TeleportTab:Toggle({
    Title = "长按传送",
    Default = false,
    Callback = function(val)
        if val then
            Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
            Connections.TpBegin = UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                    tpHoldStart = tick()
                end
            end)
            Connections.TpHold = RunService.Heartbeat:Connect(function()
                if not tpHoldStart then return end
                if tick() - tpHoldStart >= 0.5 then
                    local root = GetRoot()
                    if root then root.CFrame = Mouse.Hit end
                    tpHoldStart = nil
                end
            end)
            Connections.TpEnd = UserInputService.InputEnded:Connect(function() tpHoldStart = nil end)
        else
            if Connections.TpBegin then Connections.TpBegin:Disconnect() Connections.TpBegin = nil end
            if Connections.TpHold then Connections.TpHold:Disconnect() Connections.TpHold = nil end
            if Connections.TpEnd then Connections.TpEnd:Disconnect() Connections.TpEnd = nil end
            Notify("传送", "长按传送已关闭", 3)
        end
    end,
})

--========================================================
-- Tab5: 实用
--========================================================
local MiscTab = Window:Tab({
    Title = "实用",
    Icon = "settings",
})

MiscTab:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })

MiscTab:Toggle({
    Title = "防挂机",
    Default = false,
    Callback = function(val)
        State.AntiAFK = val
        if val then
            Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
            end)
            Notify("实用", "防挂机已开启", 3)
        else
            if Connections.AntiAFK then Connections.AntiAFK:Disconnect() Connections.AntiAFK = nil end
            Notify("实用", "防挂机已关闭", 3)
        end
    end,
})

MiscTab:Toggle({
    Title = "画质提速",
    Default = false,
    Callback = function(val)
        State.FPSBoost = val
        if val then
            settings().Rendering.QualityLevel = 1
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            Connections.FPS = RunService.Heartbeat:Connect(function()
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                        pcall(function() obj.Enabled = false end)
                    end
                end
            end)
            Notify("实用", "画质提速已开启", 3)
        else
            if Connections.FPS then Connections.FPS:Disconnect() Connections.FPS = nil end
            settings().Rendering.QualityLevel = Enum.RenderingQuality.Automatic
            Lighting.FogEnd = 100000
            Notify("实用", "画质提速已关闭", 3)
        end
    end,
})

MiscTab:Divider()

MiscTab:Button({
    Title = "换服",
    Callback = function()
        Notify("实用", "正在跳转服务器...", 3)
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})

MiscTab:Button({
    Title = "复制服务器号",
    Callback = function()
        local jobId = game.JobId
        if setclipboard then
            setclipboard(jobId)
            Notify("实用", "已复制: " .. jobId, 3)
        else
            Notify("实用", "JobId: " .. jobId, 5)
        end
    end,
})

MiscTab:Button({
    Title = "输出角色信息",
    Callback = function()
        local char = GetChar()
        if not char then Notify("实用", "无角色", 3) return end
        local info = {}
        local h = GetHum()
        if h then
            table.insert(info, "血量: " .. math.floor(h.Health) .. "/" .. math.floor(h.MaxHealth))
            table.insert(info, "速度: " .. h.WalkSpeed)
        end
        local root = GetRoot()
        if root then table.insert(info, "位置: " .. tostring(root.Position)) end
        -- 显示属性
        local ls = LocalPlayer:FindFirstChild("leaderstats")
        if ls then
            for _, v in ipairs(ls:GetChildren()) do
                table.insert(info, v.Name .. ": " .. tostring(v.Value))
            end
        end
        Notify("角色信息", table.concat(info, "\n"), 10)
    end,
})

MiscTab:Divider()

MiscTab:Button({
    Title = "清理特效",
    Callback = function()
        local count = 0
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                pcall(function() obj.Enabled = false; count = count + 1 end)
            end
        end
        Notify("实用", "已清理 " .. count .. " 个特效", 3)
    end,
})

MiscTab:Button({
    Title = "卸载脚本",
    Callback = function()
        for _, conn in pairs(Connections) do
            if conn then pcall(function() conn:Disconnect() end) end
        end
        Connections = {}
        for p, _ in pairs(ESPObjects) do removeESP(p) end
        ESPObjects = {}
        Notify("实用", "脚本已卸载", 3)
    end,
})

--========================================================
-- 初始化
--========================================================
Notify("力量传奇", "脚本已加载!", 5)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    local h = char:FindFirstChildOfClass("Humanoid")
    if h then
        if State.WalkSpeed ~= 16 then h.WalkSpeed = State.WalkSpeed end
        if State.JumpPower ~= 50 then
            if h.UseJumpPower then h.JumpPower = State.JumpPower
            else h.JumpHeight = State.JumpPower / 10 end
        end
    end
end)
