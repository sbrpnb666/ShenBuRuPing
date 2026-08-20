--========================================================
-- 自然灾害脚本 v1.0
-- 框架：WindUI
--========================================================

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local Window = WindUI:CreateWindow({
    Title = "自然灾害",
    Icon = "cloud-lightning",
    Author = "自然灾害脚本",
    Folder = "NaturalDisaster",
    Size = UDim2.fromOffset(500, 520),
    Theme = "Dark",
    HideSearchBar = false,
})

-- 时间标签
local TimeTag = Window:Tag({
    Title = "00:00",
    Color = Color3.fromRGB(255, 255, 255)
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

Window:Tag({ Title = "自然灾害", Color = Color3.fromHex("#FF6347") })

Window:EditOpenButton({
    Title = "自然灾害",
    Icon = "cloud-lightning",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF6347")),
    Draggable = true,
})

--=========== 状态 ===========
local State = {
    AutoSurvive = false,
    AutoCollect = false,
    AutoHeal = false,
    AutoTeleportSafe = false,
    AutoBoard = false,
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

-- 获取屏幕中心
local function GetScreenCenter()
    local vp = Camera.ViewportSize
    return Vector2.new(vp.X / 2, vp.Y / 2)
end

local function WorldToScreen(pos)
    local sp, onScreen = Camera:WorldToViewportPoint(pos)
    return Vector2.new(sp.X, sp.Y), onScreen
end

-- 获取最近的玩家
local function GetClosestPlayer(maxDist)
    local closest = nil
    local shortest = maxDist or math.huge
    local root = GetRoot()
    if not root then return nil end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            if hum and hrp and hum.Health > 0 then
                local dist = (root.Position - hrp.Position).Magnitude
                if dist < shortest then
                    shortest = dist
                    closest = plr
                end
            end
        end
    end
    return closest
end

-- 检测当前灾害类型
local function GetCurrentDisaster()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local ln = string.lower(obj.Name)
            if string.find(ln, "tornado") or string.find(ln, "twister") then return "龙卷风" end
            if string.find(ln, "tsunami") or string.find(ln, "flood") then return "海啸" end
            if string.find(ln, "earthquake") or string.find(ln, "seismic") then return "地震" end
            if string.find(ln, "meteor") or string.find(ln, "asteroid") then return "陨石" end
            if string.find(ln, "volcano") or string.find(ln, "lava") then return "火山" end
            if string.find(ln, "lightning") or string.find(ln, "thunder") then return "雷电" end
            if string.find(ln, "blizzard") or string.find(ln, "snowstorm") then return "暴风雪" end
            if string.find(ln, "fire") or string.find(ln, "wildfire") then return "火灾" end
        end
    end
    return nil
end

-- 寻找安全区域 (高处/建筑内)
local function FindSafeZone()
    local safeParts = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local ln = string.lower(obj.Name)
            if string.find(ln, "safe") or string.find(ln, "shelter") or string.find(ln, "bunker")
                or string.find(ln, "roof") or string.find(ln, "platform") or string.find(ln, "tower") then
                table.insert(safeParts, obj)
            end
        end
    end
    -- 如果没有明确的安全区，找高处的 Part
    if #safeParts == 0 then
        local highestPart = nil
        local highestY = -math.huge
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name ~= "Baseplate" then
                if obj.Position.Y > highestY then
                    highestY = obj.Position.Y
                    highestPart = obj
                end
            end
        end
        if highestPart then table.insert(safeParts, highestPart) end
    end
    return safeParts
end

-- 寻找载具
local function FindVehicle()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("BasePart") then
            local ln = string.lower(obj.Name)
            if string.find(ln, "vehicle") or string.find(ln, "car") or string.find(ln, "truck")
                or string.find(ln, "helicopter") or string.find(ln, "heli") or string.find(ln, "boat")
                or string.find(ln, "bus") or string.find(ln, "plane") then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part then return part end
            end
        end
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

AutoTab:Section({ Title = "生存辅助", TextXAlignment = "Left", TextSize = 17 })

-- 自动存活 (检测灾害并传送至安全区)
AutoTab:Toggle({
    Title = "自动存活",
    Default = false,
    Callback = function(val)
        State.AutoSurvive = val
        if val then
            Notify("自动", "自动存活已开启", 3)
            local lastTp = 0
            Connections.AutoSurvive = RunService.Heartbeat:Connect(function()
                if not State.AutoSurvive then return end
                local now = tick()
                if now - lastTp < math.random(2, 4) then return end
                lastTp = now

                local disaster = GetCurrentDisaster()
                local root = GetRoot()
                if not root then return end

                if disaster then
                    -- 检测到灾害，寻找安全区
                    local safeZones = FindSafeZone()
                    if #safeZones > 0 then
                        local closest = nil
                        local shortest = math.huge
                        for _, zone in ipairs(safeZones) do
                            local dist = (root.Position - zone.Position).Magnitude
                            if dist < shortest then
                                shortest = dist
                                closest = zone
                            end
                        end
                        if closest then
                            root.CFrame = closest.CFrame * CFrame.new(0, 5, 0)
                            Notify("自动", "检测到" .. disaster .. "，已传送到安全区", 3)
                        end
                    end
                end
            end)
        else
            if Connections.AutoSurvive then Connections.AutoSurvive:Disconnect() Connections.AutoSurvive = nil end
            Notify("自动", "自动存活已关闭", 3)
        end
    end,
})

-- 自动传送到安全区
AutoTab:Toggle({
    Title = "自动避险",
    Default = false,
    Callback = function(val)
        State.AutoTeleportSafe = val
        if val then
            Notify("自动", "自动避险已开启", 3)
            local lastSafe = 0
            Connections.AutoSafe = RunService.Heartbeat:Connect(function()
                if not State.AutoTeleportSafe then return end
                local now = tick()
                if now - lastSafe < math.random(3, 6) then return end
                lastSafe = now

                local root = GetRoot()
                if not root then return end

                -- 检测危险物 (岩浆/洪水/火球等)
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local ln = string.lower(obj.Name)
                        if string.find(ln, "lava") or string.find(ln, "fire") or string.find(ln, "magma")
                            or string.find(ln, "flood") or string.find(ln, "water") and obj.Position.Y < root.Position.Y then
                            local dist = (root.Position - obj.Position).Magnitude
                            if dist < 30 then
                                -- 传送到高处
                                local safeZones = FindSafeZone()
                                if #safeZones > 0 then
                                    root.CFrame = safeZones[1].CFrame * CFrame.new(0, 10, 0)
                                    Notify("自动", "检测到危险，已避险", 3)
                                    break
                                end
                            end
                        end
                    end
                end
            end)
        else
            if Connections.AutoSafe then Connections.AutoSafe:Disconnect() Connections.AutoSafe = nil end
            Notify("自动", "自动避险已关闭", 3)
        end
    end,
})

AutoTab:Divider()
AutoTab:Section({ Title = "收集与恢复", TextXAlignment = "Left", TextSize = 17 })

-- 自动收集物品
AutoTab:Toggle({
    Title = "自动收集物资",
    Default = false,
    Callback = function(val)
        State.AutoCollect = val
        if val then
            Notify("自动", "自动收集物资已开启", 3)
            Connections.AutoCollect = RunService.Heartbeat:Connect(function()
                if not State.AutoCollect then return end
                local root = GetRoot()
                if not root then return end
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local ln = string.lower(obj.Name)
                        if string.find(ln, "coin") or string.find(ln, "cash") or string.find(ln, "money")
                            or string.find(ln, "supply") or string.find(ln, "food") or string.find(ln, "water")
                            or string.find(ln, "medkit") or string.find(ln, "health") or string.find(ln, "pickup")
                            or string.find(ln, "reward") or string.find(ln, "token") then
                            local dist = (root.Position - obj.Position).Magnitude
                            if dist < 200 then
                                pcall(function() obj.CFrame = root.CFrame end)
                            end
                        end
                    end
                end
            end)
        else
            if Connections.AutoCollect then Connections.AutoCollect:Disconnect() Connections.AutoCollect = nil end
            Notify("自动", "自动收集物资已关闭", 3)
        end
    end,
})

-- 自动回血
AutoTab:Toggle({
    Title = "自动回血",
    Default = false,
    Callback = function(val)
        State.AutoHeal = val
        if val then
            Notify("自动", "自动回血已开启", 3)
            Connections.AutoHeal = RunService.Heartbeat:Connect(function()
                if not State.AutoHeal then return end
                local h = GetHum()
                if not h then return end
                if h.Health < h.MaxHealth * 0.5 then
                    -- 搜索背包中的医疗物品
                    local char = GetChar()
                    if char then
                        local backpack = LocalPlayer:FindFirstChild("Backpack")
                        if backpack then
                            for _, item in ipairs(backpack:GetChildren()) do
                                local ln = string.lower(item.Name)
                                if string.find(ln, "med") or string.find(ln, "heal") or string.find(ln, "bandage")
                                    or string.find(ln, "potion") or string.find(ln, "health") then
                                    if item:IsA("Tool") then
                                        pcall(function()
                                            char.Humanoid:EquipTool(item)
                                            task.wait(0.1)
                                            item:Activate()
                                        end)
                                    end
                                end
                            end
                        end
                    end
                    -- 同时触发回血 Remote
                    pcall(function()
                        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                            if obj:IsA("RemoteEvent") then
                                local ln = string.lower(obj.Name)
                                if string.find(ln, "heal") or string.find(ln, "med") or string.find(ln, "health") then
                                    obj:FireServer()
                                end
                            end
                        end
                    end)
                end
            end)
        else
            if Connections.AutoHeal then Connections.AutoHeal:Disconnect() Connections.AutoHeal = nil end
            Notify("自动", "自动回血已关闭", 3)
        end
    end,
})

-- 自动上车
AutoTab:Toggle({
    Title = "自动上车",
    Default = false,
    Callback = function(val)
        State.AutoBoard = val
        if val then
            Notify("自动", "自动上车已开启", 3)
            local lastBoard = 0
            Connections.AutoBoard = RunService.Heartbeat:Connect(function()
                if not State.AutoBoard then return end
                local now = tick()
                if now - lastBoard < math.random(1, 3) then return end
                lastBoard = now

                local vehicle = FindVehicle()
                local root = GetRoot()
                if vehicle and root then
                    local dist = (root.Position - vehicle.Position).Magnitude
                    if dist < 50 then
                        -- 触碰上车
                        pcall(function()
                            for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                                if obj:IsA("RemoteEvent") then
                                    local ln = string.lower(obj.Name)
                                    if string.find(ln, "enter") or string.find(ln, "board")
                                        or string.find(ln, "vehicle") or string.find(ln, "sit") then
                                        obj:FireServer(vehicle)
                                    end
                                end
                            end
                        end)
                    end
                end
            end)
        else
            if Connections.AutoBoard then Connections.AutoBoard:Disconnect() Connections.AutoBoard = nil end
            Notify("自动", "自动上车已关闭", 3)
        end
    end,
})

AutoTab:Divider()

AutoTab:Button({
    Title = "检测当前灾害",
    Callback = function()
        local disaster = GetCurrentDisaster()
        if disaster then
            Notify("灾害检测", "当前灾害: " .. disaster, 5)
        else
            Notify("灾害检测", "未检测到灾害", 3)
        end
    end,
})

AutoTab:Button({
    Title = "扫描安全区域",
    Callback = function()
        local zones = FindSafeZone()
        if #zones > 0 then
            Notify("安全区域", "找到 " .. #zones .. " 个安全区域", 3)
        else
            Notify("安全区域", "未找到安全区域", 3)
        end
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
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
    billboard.Name = "ND_ESP_" .. player.Name
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0, 20)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 100, 70)
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
                                if root and hrp then
                                    data.distLabel.Text = math.floor((root.Position - hrp.Position).Magnitude) .. " 米"
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
    Title = "物品透视 (物资/金币)",
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
                        if string.find(ln, "coin") or string.find(ln, "cash") or string.find(ln, "supply")
                            or string.find(ln, "food") or string.find(ln, "water") or string.find(ln, "medkit")
                            or string.find(ln, "pickup") or string.find(ln, "reward") or string.find(ln, "token") then
                            if not obj:FindFirstChild("ND_ItemESP") then
                                local hl = Instance.new("Highlight")
                                hl.Name = "ND_ItemESP"
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
                if obj:FindFirstChild("ND_ItemESP") then obj.ND_ItemESP:Destroy() end
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
    { name = "安全区", keywords = {"safe", "shelter", "bunker"} },
    { name = "高处平台", keywords = {"roof", "platform", "tower", "high"} },
    { name = "商店", keywords = {"shop", "store", "market"} },
    { name = "医疗站", keywords = {"med", "hospital", "clinic"} },
    { name = "载具", keywords = {"vehicle", "car", "truck", "heli"} },
    { name = "出生点", keywords = {"spawn", "lobby", "start"} },
    { name = "避难所", keywords = {"shelter", "refuge", "bunker"} },
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

-- 传送到高处 (躲避海啸/洪水)
TeleportTab:Button({
    Title = "传送到最高点",
    Callback = function()
        local highestPart = nil
        local highestY = -math.huge
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name ~= "Baseplate" then
                if obj.Position.Y > highestY then
                    highestY = obj.Position.Y
                    highestPart = obj
                end
            end
        end
        if highestPart then
            local root = GetRoot()
            if root then
                root.CFrame = highestPart.CFrame * CFrame.new(0, 10, 0)
                Notify("传送", "已传送到最高点 (Y:" .. math.floor(highestY) .. ")", 3)
            end
        else
            Notify("传送", "未找到高点", 3)
        end
    end,
})

-- 传送到最近玩家
TeleportTab:Button({
    Title = "传送到最近玩家",
    Callback = function()
        local closest = GetClosestPlayer(9999)
        if closest and closest.Character then
            local root = GetRoot()
            local targetRoot = closest.Character:FindFirstChild("HumanoidRootPart")
            if root and targetRoot then
                root.CFrame = targetRoot.CFrame * CFrame.new(0, 0, -3)
                Notify("传送", "已传送到 " .. closest.Name, 3)
            end
        else
            Notify("传送", "未找到玩家", 3)
        end
    end,
})

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
Notify("自然灾害", "脚本已加载!", 5)

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
