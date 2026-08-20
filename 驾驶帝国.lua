--========================================================
-- 驾驶帝国脚本 v1.0
-- 框架：WindUI
--========================================================

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
    Title = "驾驶帝国",
    Icon = "car",
    Author = "驾驶帝国脚本",
    Folder = "DrivingEmpire",
    Size = UDim2.fromOffset(500, 520),
    Theme = "Dark",
    HideSearchBar = false,
})

-- 时间标签
local TimeTag = Window:Tag({
    Title = "00:00",
    Color = Color3.fromRGB(0, 200, 255)
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

Window:Tag({ Title = "驾驶", Color = Color3.fromHex("#00C8FF") })

Window:EditOpenButton({
    Title = "驾驶帝国",
    Icon = "car",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("00C8FF")),
    Draggable = true,
})

--=========== 状态 ===========
local State = {
    AutoRace = false,
    AutoCoins = false,
    SpeedBoost = false,
    SpeedMultiplier = 3,
    InfiniteNitro = false,
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

-- 获取玩家当前车辆
local function GetVehicle()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") then
            local driver = obj:FindFirstChild("Driver") or obj:FindFirstChild("Seat") or obj:FindFirstChild("VehicleSeat")
            if driver and driver:IsA("VehicleSeat") and driver.Occupant then
                local hum = driver.Occupant
                local char = GetChar()
                if hum and hum.Parent and hum.Parent.Parent == char then
                    return obj
                end
            end
            -- 也检查 Driver 属性
            local seat = obj:FindFirstChildWhichIsA("VehicleSeat")
            if seat and seat.Occupant then
                local char = GetChar()
                if seat.Occupant.Parent and seat.Occupant.Parent.Parent == char then
                    return obj, seat
                end
            end
        end
    end
    return nil
end

-- 获取所有检查点
local function GetCheckpoints()
    local points = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local ln = string.lower(obj.Name)
            if string.find(ln, "checkpoint") or string.find(ln, "check") or string.find(ln, "ring") or string.find(ln, "cp") then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part then table.insert(points, part) end
            end
        end
    end
    table.sort(points, function(a, b)
        local an = tonumber(string.match(a.Name, "%d+")) or 0
        local bn = tonumber(string.match(b.Name, "%d+")) or 0
        return an < bn
    end)
    return points
end

--========================================================
-- Tab1: 赛车
--========================================================
local RaceTab = Window:Tab({
    Title = "赛车",
    Icon = "flag",
})

RaceTab:Section({ Title = "自动比赛", TextXAlignment = "Left", TextSize = 17 })

-- 自动跑赛
RaceTab:Toggle({
    Title = "自动跑赛",
    Default = false,
    Callback = function(val)
        State.AutoRace = val
        if val then
            Notify("赛车", "自动跑赛已开启", 3)
            local currentCheckpoint = 1
            Connections.AutoRace = RunService.Heartbeat:Connect(function()
                if not State.AutoRace then return end
                local root = GetRoot()
                if not root then return end

                local checkpoints = GetCheckpoints()
                if #checkpoints == 0 then return end

                -- 传送到当前检查点
                if currentCheckpoint > #checkpoints then currentCheckpoint = 1 end
                local target = checkpoints[currentCheckpoint]
                if target then
                    root.CFrame = target.CFrame * CFrame.new(0, 3, 0)
                    -- 延迟后传送到下一个
                    task.wait(0.3)
                    currentCheckpoint = currentCheckpoint + 1
                end
            end)
        else
            if Connections.AutoRace then Connections.AutoRace:Disconnect() Connections.AutoRace = nil end
            Notify("赛车", "自动跑赛已关闭", 3)
        end
    end,
})

-- 传送到起点
RaceTab:Button({
    Title = "传送到起跑线",
    Callback = function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("Model") then
                local ln = string.lower(obj.Name)
                if string.find(ln, "start") or string.find(ln, "finish") or string.find(ln, "line") then
                    local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                    if part then
                        local root = GetRoot()
                        if root then
                            root.CFrame = part.CFrame * CFrame.new(0, 5, 0)
                            Notify("赛车", "已传送到起跑线", 3)
                            return
                        end
                    end
                end
            end
        end
        Notify("赛车", "未找到起跑线", 3)
    end,
})

RaceTab:Divider()
RaceTab:Section({ Title = "车辆加速", TextXAlignment = "Left", TextSize = 17 })

-- 车速提升
RaceTab:Toggle({
    Title = "车辆加速",
    Default = false,
    Callback = function(val)
        State.SpeedBoost = val
        if val then
            Notify("赛车", "车辆加速已开启", 3)
            Connections.SpeedBoost = RunService.Heartbeat:Connect(function()
                if not State.SpeedBoost then return end
                local vehicle, seat = GetVehicle()
                if vehicle then
                    pcall(function()
                        -- 搜索车辆速度相关属性
                        for _, desc in ipairs(vehicle:GetDescendants()) do
                            if desc:IsA("ValueBase") then
                                local ln = string.lower(desc.Name)
                                if string.find(ln, "speed") or string.find(ln, "maxspeed") or string.find(ln, "velocity") or string.find(ln, "power") then
                                    if desc:IsA("NumberValue") or desc:IsA("IntValue") then
                                        desc.Value = desc.Value * State.SpeedMultiplier
                                    end
                                end
                            end
                        end
                        -- 修改 VehicleSeat 属性
                        local vs = vehicle:FindFirstChildWhichIsA("VehicleSeat")
                        if vs then
                            vs.MaxSpeed = vs.MaxSpeed * State.SpeedMultiplier
                        end
                        -- 修改引擎属性
                        local engine = vehicle:FindFirstChild("Engine") or vehicle:FindFirstChild("Motor")
                        if engine then
                            for _, desc in ipairs(engine:GetDescendants()) do
                                if desc:IsA("ValueBase") then
                                    local ln = string.lower(desc.Name)
                                    if string.find(ln, "speed") or string.find(ln, "power") or string.find(ln, "torque") then
                                        if desc:IsA("NumberValue") or desc:IsA("IntValue") then
                                            desc.Value = desc.Value * State.SpeedMultiplier
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        else
            if Connections.SpeedBoost then Connections.SpeedBoost:Disconnect() Connections.SpeedBoost = nil end
            Notify("赛车", "车辆加速已关闭", 3)
        end
    end,
})

RaceTab:Slider({
    Title = "加速倍数",
    Value = { Min = 2, Max = 50, Default = 3 },
    Increment = 1,
    Callback = function(val)
        State.SpeedMultiplier = val
    end,
})

-- 无限氮气
RaceTab:Toggle({
    Title = "无限氮气",
    Default = false,
    Callback = function(val)
        State.InfiniteNitro = val
        if val then
            Notify("赛车", "无限氮气已开启", 3)
            Connections.Nitro = RunService.Heartbeat:Connect(function()
                if not State.InfiniteNitro then return end
                local vehicle = GetVehicle()
                if vehicle then
                    pcall(function()
                        for _, desc in ipairs(vehicle:GetDescendants()) do
                            if desc:IsA("ValueBase") then
                                local ln = string.lower(desc.Name)
                                if string.find(ln, "nitro") or string.find(ln, "boost") or string.find(ln, "turbo") or string.find(ln, "nitrous") then
                                    if desc:IsA("NumberValue") or desc:IsA("IntValue") then
                                        desc.Value = 100
                                    end
                                end
                            end
                        end
                    end)
                end
                -- 也给玩家持续 boost
                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "nitro") or string.find(ln, "boost") or string.find(ln, "turbo") then
                                obj:FireServer()
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.Nitro then Connections.Nitro:Disconnect() Connections.Nitro = nil end
            Notify("赛车", "无限氮气已关闭", 3)
        end
    end,
})

RaceTab:Divider()
RaceTab:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })

-- 传送到最近检查点
RaceTab:Button({
    Title = "传送到最近检查点",
    Callback = function()
        local root = GetRoot()
        if not root then return end
        local checkpoints = GetCheckpoints()
        if #checkpoints == 0 then
            Notify("赛车", "未找到检查点", 3)
            return
        end
        local closest = nil
        local closestDist = math.huge
        for _, cp in ipairs(checkpoints) do
            local dist = (root.Position - cp.Position).Magnitude
            if dist < closestDist then
                closestDist = dist
                closest = cp
            end
        end
        if closest then
            root.CFrame = closest.CFrame * CFrame.new(0, 3, 0)
            Notify("赛车", "已传送到最近检查点", 3)
        end
    end,
})

-- 扫描车辆信息
RaceTab:Button({
    Title = "扫描车辆信息",
    Callback = function()
        local results = {}
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("Model") then
                local seat = obj:FindFirstChildWhichIsA("VehicleSeat")
                if seat then
                    table.insert(results, "车辆: " .. obj.Name)
                    for _, desc in ipairs(obj:GetDescendants()) do
                        if desc:IsA("ValueBase") then
                            table.insert(results, "  " .. desc.Name .. " = " .. tostring(desc.Value))
                        end
                    end
                end
            end
        end
        local msg = #results > 0 and table.concat(results, "\n") or "未找到车辆"
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
    billboard.Name = "DriveESP_" .. player.Name
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0, 20)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
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

-- 金币透视
VisualTab:Toggle({
    Title = "金币透视",
    Default = false,
    Callback = function(val)
        State.ESPItems = val
        if val then
            Notify("视觉", "金币透视已开启", 3)
            Connections.Items = RunService.Heartbeat:Connect(function()
                if not State.ESPItems then return end
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local ln = string.lower(obj.Name)
                        if string.find(ln, "coin") or string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "pickup") then
                            if not obj:FindFirstChild("DriveItemESP") then
                                local hl = Instance.new("Highlight")
                                hl.Name = "DriveItemESP"
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
                if obj:FindFirstChild("DriveItemESP") then obj.DriveItemESP:Destroy() end
            end
            Notify("视觉", "金币透视已关闭", 3)
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
-- Tab4: 经济
--========================================================
local EconomyTab = Window:Tab({
    Title = "经济",
    Icon = "dollar-sign",
})

EconomyTab:Section({ Title = "收集", TextXAlignment = "Left", TextSize = 17 })

-- 自动收集金币
EconomyTab:Toggle({
    Title = "自动收集金币",
    Default = false,
    Callback = function(val)
        State.AutoCoins = val
        if val then
            Notify("经济", "自动收集金币已开启", 3)
            Connections.AutoCoins = RunService.Heartbeat:Connect(function()
                if not State.AutoCoins then return end
                local root = GetRoot()
                if not root then return end
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local ln = string.lower(obj.Name)
                        if string.find(ln, "coin") or string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "pickup") or string.find(ln, "reward") then
                            pcall(function() obj.CFrame = root.CFrame end)
                        end
                    end
                end
                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "coin") or string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "collect") or string.find(ln, "reward") then
                                obj:FireServer()
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoCoins then Connections.AutoCoins:Disconnect() Connections.AutoCoins = nil end
            Notify("经济", "自动收集金币已关闭", 3)
        end
    end,
})

EconomyTab:Divider()
EconomyTab:Section({ Title = "刷钱", TextXAlignment = "Left", TextSize = 17 })

EconomyTab:Button({
    Title = "扫描给钱接口",
    Callback = function()
        local results = {}
        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
            if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                local ln = string.lower(obj.Name)
                if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "buy")
                    or string.find(ln, "reward") or string.find(ln, "give") or string.find(ln, "collect") then
                    table.insert(results, obj:GetFullName())
                end
            end
        end
        local msg = #results > 0 and table.concat(results, "\n") or "未找到给钱接口"
        Notify("扫描结果", msg, 10)
    end,
})

EconomyTab:Button({
    Title = "尝试刷钱",
    Callback = function()
        local count = 0
        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
            pcall(function()
                if obj:IsA("RemoteEvent") then
                    local ln = string.lower(obj.Name)
                    if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "give")
                        or string.find(ln, "reward") or string.find(ln, "collect") then
                        obj:FireServer()
                        count = count + 1
                    end
                elseif obj:IsA("RemoteFunction") then
                    local ln = string.lower(obj.Name)
                    if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "give") then
                        obj:InvokeServer()
                        count = count + 1
                    end
                end
            end)
        end
        Notify("经济", "尝试触发了 " .. count .. " 个接口", 5)
    end,
})

--========================================================
-- Tab5: 传送
--========================================================
local TeleportTab = Window:Tab({
    Title = "传送",
    Icon = "map-pin",
})

TeleportTab:Section({ Title = "地点", TextXAlignment = "Left", TextSize = 17 })

local locations = {
    { name = "车行", keywords = {"dealership", "carshop", "showroom"} },
    { name = "加油站", keywords = {"gas", "fuel", "station"} },
    { name = "赛车起点", keywords = {"race", "start", "finish"} },
    { name = "商店", keywords = {"shop", "store", "market"} },
    { name = "银行", keywords = {"bank"} },
    { name = "停车场", keywords = {"parking", "garage", "lot"} },
    { name = "改车店", keywords = {"upgrade", "custom", "tune", "mod"} },
    { name = "出生点", keywords = {"spawn", "lobby"} },
}

for _, loc in ipairs(locations) do
    TeleportTab:Button({
        Title = "传送到" .. loc.name,
        Callback = function()
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
                                    return
                                end
                            end
                        end
                    end
                end
            end
            Notify("传送", "未找到" .. loc.name, 3)
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
-- Tab6: 实用
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
Notify("驾驶帝国", "脚本已加载!", 5)

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
