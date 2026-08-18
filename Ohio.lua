--========================================================
-- Ohio 超级脚本 v2.0
-- 功能：自瞄/静默瞄准/触发器/ESP/飞行/穿墙/传送/经济等
-- 框架：WindUI
--========================================================

--=========== 加载 WindUI ===========
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()

--=========== 服务引用 ===========
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

--=========== 创建主窗口 ===========
local Window = WindUI:CreateWindow({
    Title = "Ohio 超级脚本",
    Icon = "skull",
    Author = "Ohio Script v2.0",
    Folder = "OhioScript",
    Size = UDim2.fromOffset(500, 520),
    Theme = "Dark",
    HideSearchBar = false,
})

--=========== 时间标签 ===========
local TimeTag = Window:Tag({
    Title = "00:00",
    Color = Color3.fromRGB(255, 255, 255)
})

local hue = 0
task.spawn(function()
    while true do
        local now = os.date("*t")
        local hours = string.format("%02d", now.hour)
        local minutes = string.format("%02d", now.min)
        hue = (hue + 0.01) % 1
        local rainbowColor = Color3.fromHSV(hue, 1, 1)
        TimeTag:SetTitle(hours .. ":" .. minutes)
        TimeTag:SetColor(rainbowColor)
        task.wait(0.06)
    end
end)

Window:Tag({
    Title = "Ohio",
    Color = Color3.fromHex("#FF4444")
})

Window:EditOpenButton({
    Title = "Ohio 脚本",
    Icon = "skull",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF4444")),
    Draggable = true,
})

--=========== 全局状态 ===========
local State = {
    -- 战斗
    AimbotEnabled = false,
    AimbotFOV = 120,
    AimbotSmooth = 0.4,
    SilentAim = false,
    TriggerBot = false,
    TriggerDelay = 0.05,
    HitboxExpand = false,
    HitboxSize = 10,
    InfiniteAmmo = false,
    NoRecoil = false,
    RapidFire = false,
    -- 玩家
    WalkSpeed = 16,
    JumpPower = 50,
    InfJump = false,
    Noclip = false,
    GodMode = false,
    NoFallDamage = false,
    -- 视觉
    ESPEnabled = false,
    ESPBoxes = false,
    ESPNames = false,
    ESPDistance = false,
    ESPHealth = false,
    Tracers = false,
    ShowFOV = false,
    Chams = false,
    Fullbright = false,
    -- 经济
    AutoCash = false,
    -- 实用
    AntiAFK = false,
    FPSBoost = false,
}

local Connections = {}
local ESPObjects = {}
local FOVCircle = nil
local ChamsObjects = {}

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

local function GetPlayers()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(list, p.Name)
        end
    end
    return list
end

-- 获取屏幕中心
local function GetScreenCenter()
    local vp = Camera.ViewportSize
    return Vector2.new(vp.X / 2, vp.Y / 2)
end

-- 世界坐标转屏幕坐标
local function WorldToScreen(pos)
    local screenPos, onScreen = Camera:WorldToViewportPoint(pos)
    return Vector2.new(screenPos.X, screenPos.Y), onScreen
end

-- 获取最近的敌人 (FOV内)
local function GetClosestPlayerToFov()
    local closest = nil
    local shortest = math.huge
    local center = GetScreenCenter()
    local fovRadius = State.AimbotFOV

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if (head or hrp) and hum and hum.Health > 0 then
                local targetPart = head or hrp
                local screenPos, onScreen = WorldToScreen(targetPart.Position)
                if onScreen then
                    local dist = (screenPos - center).Magnitude
                    if dist < shortest and dist <= fovRadius then
                        shortest = dist
                        closest = plr
                    end
                end
            end
        end
    end
    return closest
end

-- 获取瞄准的目标部位
local function GetAimTargetPart(plr)
    if not plr or not plr.Character then return nil end
    local head = plr.Character:FindFirstChild("Head")
    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return nil end
    return head or plr.Character:FindFirstChild("HumanoidRootPart")
end

-- 预测子弹落点 (子弹追踪/静默瞄准用)
local function GetTargetPosition(plr)
    local part = GetAimTargetPart(plr)
    if not part then return nil end
    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
    -- 加入移动预测
    local rootVel = plr.Character:FindFirstChild("HumanoidRootPart")
    if rootVel and rootVel:FindFirstChild("BodyVelocity") then
        local vel = rootVel.BodyVelocity.Velocity
        return part.Position + vel * 0.1
    end
    return part.Position
end

--========================================================
-- Tab1: 战斗
--========================================================
local CombatTab = Window:Tab({
    Title = "战斗",
    Icon = "swords",
})

CombatTab:Section({ Title = "瞄准系统", TextXAlignment = "Left", TextSize = 17 })

-- 自瞄 (Aimbot)
local aimbotConn = nil
CombatTab:Toggle({
    Title = "自瞄 (Aimbot)",
    Default = false,
    Callback = function(val)
        State.AimbotEnabled = val
        if val then
            Notify("战斗", "自瞄已开启 (自动锁定最近敌人)", 3)
            aimbotConn = RunService.RenderStepped:Connect(function()
                if not State.AimbotEnabled then return end
                -- 手机端: 开启即自动锁定, 无需按键
                local target = GetClosestPlayerToFov()
                if target then
                    local part = GetAimTargetPart(target)
                    if part then
                        local camPos = Camera.CFrame.Position
                        local lookCF = CFrame.new(camPos, part.Position)
                        Camera.CFrame = Camera.CFrame:Lerp(lookCF, State.AimbotSmooth)
                    end
                end
            end)
        else
            if aimbotConn then aimbotConn:Disconnect() aimbotConn = nil end
            Notify("战斗", "自瞄已关闭", 3)
        end
    end,
})

-- 自瞄 FOV
CombatTab:Slider({
    Title = "自瞄 FOV 范围",
    Value = { Min = 30, Max = 500, Default = 120 },
    Increment = 5,
    Callback = function(val)
        State.AimbotFOV = val
        if FOVCircle then
            FOVCircle.Radius = val
        end
    end,
})

-- 自瞄平滑度
CombatTab:Slider({
    Title = "自瞄平滑度",
    Value = { Min = 5, Max = 100, Default = 40 },
    Increment = 1,
    Callback = function(val)
        State.AimbotSmooth = val / 100
    end,
})

-- 静默瞄准 (Silent Aim)
local silentAimConn = nil
CombatTab:Toggle({
    Title = "静默瞄准 (Silent Aim)",
    Default = false,
    Callback = function(val)
        State.SilentAim = val
        if val then
            Notify("战斗", "静默瞄准已开启", 3)
            -- 通过 mt 修改 mouse.Hit
            local mt = getrawmetatable(game)
            local oldNamecall = getrawmetatable(game).__namecall
            local oldIndex = getrawmetatable(game).__index

            setreadonly(mt, false)

            local oldIndex2 = mt.__index
            mt.__index = newcclosure(function(self, key)
                if key == "Hit" or key == "Target" or key == "TargetPoint" then
                    if State.SilentAim then
                        -- 手机端: 开启即生效, 无需按右键
                        local target = GetClosestPlayerToFov()
                        if target then
                            local part = GetAimTargetPart(target)
                            if part then
                                return part.Position
                            end
                        end
                    end
                end
                return oldIndex2(self, key)
            end)

            setreadonly(mt, true)
        else
            Notify("战斗", "静默瞄准已关闭", 3)
        end
    end,
})

CombatTab:Divider()

-- 触发器 (Trigger Bot)
local triggerConn = nil
CombatTab:Toggle({
    Title = "触发器 (Trigger Bot)",
    Default = false,
    Callback = function(val)
        State.TriggerBot = val
        if val then
            Notify("战斗", "触发器已开启", 3)
            triggerConn = RunService.Heartbeat:Connect(function()
                if not State.TriggerBot then return end
                local target = GetClosestPlayerToFov()
                if target then
                    local part = GetAimTargetPart(target)
                    if part then
                        local screenPos, onScreen = WorldToScreen(part.Position)
                        local center = GetScreenCenter()
                        local dist = (screenPos - center).Magnitude
                        -- 如果目标在屏幕中心附近，自动开火
                        if dist < 30 then
                            local tool = GetChar() and GetChar():FindFirstChildOfClass("Tool")
                            if tool then
                                pcall(function() tool:Activate() end)
                                pcall(function()
                                    VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
                                    task.wait(State.TriggerDelay)
                                    VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
                                end)
                            end
                        end
                    end
                end
            end)
        else
            if triggerConn then triggerConn:Disconnect() triggerConn = nil end
            Notify("战斗", "触发器已关闭", 3)
        end
    end,
})

CombatTab:Slider({
    Title = "触发器延迟",
    Value = { Min = 1, Max = 100, Default = 5 },
    Increment = 1,
    Callback = function(val)
        State.TriggerDelay = val / 100
    end,
})

CombatTab:Divider()

-- Hitbox 扩大
CombatTab:Toggle({
    Title = "Hitbox 扩大",
    Default = false,
    Callback = function(val)
        State.HitboxExpand = val
        if val then
            Notify("战斗", "Hitbox 扩大已开启", 3)
            Connections.Hitbox = RunService.Heartbeat:Connect(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                        local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                        if hrp and hum and hum.Health > 0 then
                            hrp.Size = Vector3.new(State.HitboxSize, State.HitboxSize, State.HitboxSize)
                            hrp.Transparency = 0.5
                            hrp.CanCollide = false
                            hrp.CanQuery = true
                        end
                    end
                end
            end)
        else
            if Connections.Hitbox then Connections.Hitbox:Disconnect() Connections.Hitbox = nil end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.Size = Vector3.new(2, 2, 1)
                        hrp.Transparency = 0
                        hrp.CanCollide = true
                    end
                end
            end
            Notify("战斗", "Hitbox 扩大已关闭", 3)
        end
    end,
})

CombatTab:Slider({
    Title = "Hitbox 大小",
    Value = { Min = 2, Max = 50, Default = 10 },
    Increment = 1,
    Callback = function(val)
        State.HitboxSize = val
    end,
})

CombatTab:Divider()
CombatTab:Section({ Title = "武器增强", TextXAlignment = "Left", TextSize = 17 })

-- 无限弹药
CombatTab:Toggle({
    Title = "无限弹药",
    Default = false,
    Callback = function(val)
        State.InfiniteAmmo = val
        if val then
            Notify("战斗", "无限弹药已开启", 3)
            Connections.Ammo = RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if not char then return end
                for _, tool in ipairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        pcall(function()
                            -- ACS 框架
                            local acs = tool:FindFirstChild("ACS_Modulo")
                            if acs then
                                local vars = acs:FindFirstChild("Variaveis")
                                if vars then
                                    for _, v in ipairs(vars:GetChildren()) do
                                        local ln = string.lower(v.Name)
                                        if string.find(ln, "ammo") or string.find(ln, "mag") or string.find(ln, "clip") or string.find(ln, "bullet") then
                                            v.Value = 9999
                                        end
                                    end
                                end
                            end
                            -- 通用搜索
                            for _, desc in ipairs(tool:GetDescendants()) do
                                if desc:IsA("ValueBase") then
                                    local ln = string.lower(desc.Name)
                                    if string.find(ln, "ammo") or string.find(ln, "mag") or string.find(ln, "clip") then
                                        desc.Value = 9999
                                    end
                                end
                            end
                            -- Attributes
                            for k, _ in pairs(tool:GetAttributes()) do
                                local lk = string.lower(k)
                                if string.find(lk, "ammo") or string.find(lk, "mag") then
                                    tool:SetAttribute(k, 9999)
                                end
                            end
                        end)
                    end
                end
            end)
        else
            if Connections.Ammo then Connections.Ammo:Disconnect() Connections.Ammo = nil end
            Notify("战斗", "无限弹药已关闭", 3)
        end
    end,
})

-- 无后坐力
CombatTab:Toggle({
    Title = "无后坐力",
    Default = false,
    Callback = function(val)
        State.NoRecoil = val
        if val then
            Notify("战斗", "无后坐力已开启", 3)
            Connections.Recoil = RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if not char then return end
                for _, tool in ipairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        pcall(function()
                            local acs = tool:FindFirstChild("ACS_Modulo")
                            if acs then
                                local vars = acs:FindFirstChild("Variaveis")
                                if vars then
                                    for _, v in ipairs(vars:GetChildren()) do
                                        local ln = string.lower(v.Name)
                                        if string.find(ln, "recoil") or string.find(ln, "kick") or string.find(ln, "spread")
                                            or string.find(ln, "bloom") or string.find(ln, "shake") or string.find(ln, "deviation")
                                            or string.find(ln, "sway") then
                                            v.Value = 0
                                        end
                                        if string.find(ln, "accuracy") then v.Value = 100 end
                                        if string.find(ln, "range") then v.Value = 9999 end
                                        if string.find(ln, "firerate") then v.Value = 9999 end
                                    end
                                end
                            end
                            for _, desc in ipairs(tool:GetDescendants()) do
                                if desc:IsA("ValueBase") then
                                    local ln = string.lower(desc.Name)
                                    if string.find(ln, "recoil") or string.find(ln, "kick") or string.find(ln, "spread")
                                        or string.find(ln, "bloom") or string.find(ln, "shake") or string.find(ln, "deviation") then
                                        desc.Value = 0
                                    end
                                end
                            end
                        end)
                    end
                end
            end)
        else
            if Connections.Recoil then Connections.Recoil:Disconnect() Connections.Recoil = nil end
            Notify("战斗", "无后坐力已关闭", 3)
        end
    end,
})

-- 快速射击
CombatTab:Toggle({
    Title = "快速射击 (Rapid Fire)",
    Default = false,
    Callback = function(val)
        State.RapidFire = val
        if val then
            Notify("战斗", "快速射击已开启", 3)
            Connections.RapidFire = RunService.Heartbeat:Connect(function()
                if not State.RapidFire then return end
                if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                    local char = GetChar()
                    if not char then return end
                    local tool = char:FindFirstChildOfClass("Tool")
                    if tool then
                        pcall(function() tool:Activate() end)
                    end
                end
            end)
        else
            if Connections.RapidFire then Connections.RapidFire:Disconnect() Connections.RapidFire = nil end
            Notify("战斗", "快速射击已关闭", 3)
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

-- 无限跳跃
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

-- 穿墙
PlayerTab:Toggle({
    Title = "穿墙 (NoClip)",
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

-- 无敌
PlayerTab:Toggle({
    Title = "无敌 (God Mode)",
    Default = false,
    Callback = function(val)
        State.GodMode = val
        if val then
            Notify("玩家", "无敌已开启", 3)
            Connections.GodMode = RunService.Heartbeat:Connect(function()
                local h = GetHum()
                if h and h.Health < h.MaxHealth then
                    h.Health = h.MaxHealth
                end
            end)
        else
            if Connections.GodMode then Connections.GodMode:Disconnect() Connections.GodMode = nil end
            Notify("玩家", "无敌已关闭", 3)
        end
    end,
})

-- 摔落无伤害
PlayerTab:Toggle({
    Title = "摔落无伤害",
    Default = false,
    Callback = function(val)
        State.NoFallDamage = val
        if val then
            Notify("玩家", "摔落无伤害已开启", 3)
            local function setupFall(h)
                if not h then return end
                local savedHealth = h.Health
                h.StateChanged:Connect(function(old, new)
                    if not State.NoFallDamage then return end
                    if new == Enum.HumanoidStateType.Freefall then
                        savedHealth = h.Health
                    elseif old == Enum.HumanoidStateType.Freefall then
                        if h.Health < savedHealth then
                            h.Health = savedHealth
                        end
                    end
                end)
            end
            local c = GetChar()
            if c then setupFall(c:FindFirstChildOfClass("Humanoid")) end
            Connections.NoFall = LocalPlayer.CharacterAdded:Connect(function(char)
                task.wait(0.3)
                if State.NoFallDamage then
                    setupFall(char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid"))
                end
            end)
        else
            if Connections.NoFall then Connections.NoFall:Disconnect() Connections.NoFall = nil end
            Notify("玩家", "摔落无伤害已关闭", 3)
        end
    end,
})

PlayerTab:Divider()

-- 飞行脚本 V3 (手机端兼容, 独立面板)
local flyV3Loaded = false
PlayerTab:Button({
    Title = "飞行脚本 V3 (手机兼容)",
    Callback = function()
        if flyV3Loaded then
            Notify("飞行", "飞行面板已打开, 请用面板上的按钮控制", 3)
            return
        end
        flyV3Loaded = true
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

VisualTab:Section({ Title = "ESP 系统", TextXAlignment = "Left", TextSize = 17 })

-- ESP 核心函数
local function createESP(player)
    if player == LocalPlayer then return end
    if ESPObjects[player] then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_" .. player.Name
    billboard.Size = UDim2.new(0, 200, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.LightInfluence = 0

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = billboard

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0, 20)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.TextStrokeTransparency = 0.5
    nameLabel.Text = player.Name
    nameLabel.Parent = frame

    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0, 18)
    distLabel.Position = UDim2.new(0, 0, 0, 20)
    distLabel.BackgroundTransparency = 1
    distLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    distLabel.TextSize = 12
    distLabel.Font = Enum.Font.SourceSans
    distLabel.Text = ""
    distLabel.Parent = frame

    local healthLabel = Instance.new("TextLabel")
    healthLabel.Size = UDim2.new(1, 0, 0, 18)
    healthLabel.Position = UDim2.new(0, 0, 0, 40)
    healthLabel.BackgroundTransparency = 1
    healthLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    healthLabel.TextSize = 12
    healthLabel.Font = Enum.Font.SourceSans
    healthLabel.Text = ""
    healthLabel.Parent = frame

    -- ESP Box
    local boxHandle = Instance.new("BillboardGui")
    boxHandle.Name = "ESPBox_" .. player.Name
    boxHandle.Size = UDim2.new(0, 100, 0, 150)
    boxHandle.AlwaysOnTop = true
    boxHandle.LightInfluence = 0

    local topLeft = Instance.new("Frame")
    topLeft.Size = UDim2.new(0, 15, 0, 2)
    topLeft.Position = UDim2.new(0, 0, 0, 0)
    topLeft.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    topLeft.BorderSizePixel = 0
    topLeft.Parent = boxHandle

    local topRight = Instance.new("Frame")
    topRight.Size = UDim2.new(0, 15, 0, 2)
    topRight.Position = UDim2.new(1, -15, 0, 0)
    topRight.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    topRight.BorderSizePixel = 0
    topRight.Parent = boxHandle

    local bottomLeft = Instance.new("Frame")
    bottomLeft.Size = UDim2.new(0, 15, 0, 2)
    bottomLeft.Position = UDim2.new(0, 0, 1, -2)
    bottomLeft.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    bottomLeft.BorderSizePixel = 0
    bottomLeft.Parent = boxHandle

    local bottomRight = Instance.new("Frame")
    bottomRight.Size = UDim2.new(0, 15, 0, 2)
    bottomRight.Position = UDim2.new(1, -15, 1, -2)
    bottomRight.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    bottomRight.BorderSizePixel = 0
    bottomRight.Parent = boxHandle

    ESPObjects[player] = {
        billboard = billboard,
        nameLabel = nameLabel,
        distLabel = distLabel,
        healthLabel = healthLabel,
        boxHandle = boxHandle,
    }
end

local function removeESP(player)
    if ESPObjects[player] then
        if ESPObjects[player].billboard then ESPObjects[player].billboard:Destroy() end
        if ESPObjects[player].boxHandle then ESPObjects[player].boxHandle:Destroy() end
        ESPObjects[player] = nil
    end
end

local function attachESP(player)
    if not ESPObjects[player] then return end
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    if hrp then
        ESPObjects[player].billboard.Adornee = head or hrp
        ESPObjects[player].boxHandle.Adornee = hrp
    end
end

-- ESP 开关
VisualTab:Toggle({
    Title = "玩家 ESP",
    Default = false,
    Callback = function(val)
        State.ESPEnabled = val
        if val then
            Notify("视觉", "ESP 已开启", 3)
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer then createESP(plr) end
            end
            Connections.ESPUpdate = RunService.Heartbeat:Connect(function()
                for plr, data in pairs(ESPObjects) do
                    local char = plr.Character
                    if char then
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        local head = char:FindFirstChild("Head")
                        local root = GetRoot()

                        -- 附加到角色
                        attachESP(plr)

                        -- 名字
                        if data.nameLabel then
                            data.nameLabel.Visible = State.ESPNames
                            data.nameLabel.Text = plr.Name
                            if hum and hum.Health > 0 then
                                data.nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            else
                                data.nameLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
                            end
                        end

                        -- 距离
                        if data.distLabel then
                            data.distLabel.Visible = State.ESPDistance
                            if root and hrp then
                                local dist = math.floor((root.Position - hrp.Position).Magnitude)
                                data.distLabel.Text = dist .. " studs"
                            end
                        end

                        -- 血量
                        if data.healthLabel then
                            data.healthLabel.Visible = State.ESPHealth
                            if hum then
                                local hp = math.floor(hum.Health)
                                local maxHp = math.floor(hum.MaxHealth)
                                data.healthLabel.Text = hp .. " / " .. maxHp
                                local pct = hum.Health / hum.MaxHealth
                                if pct > 0.5 then
                                    data.healthLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
                                elseif pct > 0.25 then
                                    data.healthLabel.TextColor3 = Color3.fromRGB(255, 255, 100)
                                else
                                    data.healthLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
                                end
                            end
                        end

                        -- Box
                        if data.boxHandle then
                            data.boxHandle.Enabled = State.ESPBoxes
                        end
                    end
                end
            end)
            Connections.PlayerAdded = Players.PlayerAdded:Connect(function(plr) createESP(plr) end)
            Connections.PlayerRemoving = Players.PlayerRemoving:Connect(function(plr) removeESP(plr) end)
        else
            if Connections.ESPUpdate then Connections.ESPUpdate:Disconnect() Connections.ESPUpdate = nil end
            if Connections.PlayerAdded then Connections.PlayerAdded:Disconnect() Connections.PlayerAdded = nil end
            if Connections.PlayerRemoving then Connections.PlayerRemoving:Disconnect() Connections.PlayerRemoving = nil end
            for plr, _ in pairs(ESPObjects) do removeESP(plr) end
            ESPObjects = {}
            Notify("视觉", "ESP 已关闭", 3)
        end
    end,
})

VisualTab:Toggle({
    Title = "ESP 名字",
    Default = true,
    Callback = function(val) State.ESPNames = val end,
})

VisualTab:Toggle({
    Title = "ESP 距离",
    Default = true,
    Callback = function(val) State.ESPDistance = val end,
})

VisualTab:Toggle({
    Title = "ESP 血量",
    Default = true,
    Callback = function(val) State.ESPHealth = val end,
})

VisualTab:Toggle({
    Title = "ESP 方框",
    Default = false,
    Callback = function(val) State.ESPBoxes = val end,
})

VisualTab:Divider()

-- 追踪线 (Tracers)
VisualTab:Toggle({
    Title = "追踪线 (Tracers)",
    Default = false,
    Callback = function(val)
        State.Tracers = val
        if val then
            Notify("视觉", "追踪线已开启", 3)
            local tracerFolder = Instance.new("Folder")
            tracerFolder.Name = "OhioTracers"
            tracerFolder.Parent = Workspace

            Connections.Tracers = RunService.RenderStepped:Connect(function()
                tracerFolder:ClearAllChildren()
                if not State.Tracers then return end
                local root = GetRoot()
                if not root then return end
                local center = GetScreenCenter()

                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                        local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                        if hrp and hum and hum.Health > 0 then
                            local screenPos, onScreen = WorldToScreen(hrp.Position)
                            if onScreen then
                                local tracer = Instance.new("Frame")
                                tracer.AnchorPoint = Vector2.new(0, 0.5)
                                tracer.Size = UDim2.new(0, (screenPos - center).Magnitude, 0, 2)
                                tracer.Position = UDim2.new(0, center.X, 0, center.Y)
                                tracer.Rotation = math.deg(math.atan2(screenPos.Y - center.Y, screenPos.X - center.X))
                                tracer.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                                tracer.BorderSizePixel = 0
                                tracer.Parent = tracerFolder
                            end
                        end
                    end
                end
            end)
        else
            if Connections.Tracers then Connections.Tracers:Disconnect() Connections.Tracers = nil end
            local tf = Workspace:FindFirstChild("OhioTracers")
            if tf then tf:Destroy() end
            Notify("视觉", "追踪线已关闭", 3)
        end
    end,
})

-- FOV 圈
VisualTab:Toggle({
    Title = "显示 FOV 圈",
    Default = false,
    Callback = function(val)
        State.ShowFOV = val
        if val then
            FOVCircle = Instance.new("Frame")
            FOVCircle.Name = "OhioFOV"
            FOVCircle.Size = UDim2.new(0, State.AimbotFOV * 2, 0, State.AimbotFOV * 2)
            FOVCircle.AnchorPoint = Vector2.new(0.5, 0.5)
            FOVCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
            FOVCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FOVCircle.BackgroundTransparency = 1
            FOVCircle.BorderSizePixel = 2

            local cornerRadius = Instance.new("UICorner")
            cornerRadius.CornerRadius = UDim.new(1, 0)
            cornerRadius.Parent = FOVCircle

            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(255, 255, 255)
            stroke.Thickness = 1.5
            stroke.Transparency = 0.3
            stroke.Parent = FOVCircle

            FOVCircle.Parent = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("CoreGui") or
                (function()
                    local gui = Instance.new("ScreenGui")
                    gui.Name = "OhioGUI"
                    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
                    return gui
                end)()

            FOVCircle.Radius = State.AimbotFOV
        else
            if FOVCircle then FOVCircle:Destroy() FOVCircle = nil end
        end
    end,
})

VisualTab:Divider()
VisualTab:Section({ Title = "渲染", TextXAlignment = "Left", TextSize = 17 })

-- Chams
VisualTab:Toggle({
    Title = "Chams (透视高亮)",
    Default = false,
    Callback = function(val)
        State.Chams = val
        if val then
            Notify("视觉", "Chams 已开启", 3)
            Connections.Chams = RunService.Heartbeat:Connect(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Health > 0 then
                            for _, part in ipairs(plr.Character:GetChildren()) do
                                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                                    if not part:FindFirstChild("OhioChams") then
                                        local hl = Instance.new("Highlight")
                                        hl.Name = "OhioChams"
                                        hl.FillColor = Color3.fromRGB(255, 50, 50)
                                        hl.FillTransparency = 0.5
                                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                                        hl.OutlineTransparency = 0
                                        hl.Parent = part
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            if Connections.Chams then Connections.Chams:Disconnect() Connections.Chams = nil end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    for _, part in ipairs(plr.Character:GetDescendants()) do
                        if part:IsA("Highlight") and part.Name == "OhioChams" then
                            part:Destroy()
                        end
                    end
                end
            end
            Notify("视觉", "Chams 已关闭", 3)
        end
    end,
})

-- 全亮
VisualTab:Toggle({
    Title = "全亮 (Fullbright)",
    Default = false,
    Callback = function(val)
        State.Fullbright = val
        if val then
            Notify("视觉", "全亮已开启", 3)
            Lighting.Brightness = 3
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.FogStart = 0
            Lighting.GlobalShadows = false
            Lighting.EnvironmentDiffuseScale = 1
            Lighting.EnvironmentSpecularScale = 1
            Connections.Fullbright = RunService.Heartbeat:Connect(function()
                Lighting.Brightness = 3
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
            end)
        else
            if Connections.Fullbright then Connections.Fullbright:Disconnect() Connections.Fullbright = nil end
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = true
            Notify("视觉", "全亮已关闭", 3)
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

TeleportTab:Section({ Title = "传送", TextXAlignment = "Left", TextSize = 17 })

-- 传送到玩家
local selectedPlayer = nil
TeleportTab:Dropdown({
    Title = "选择玩家",
    Value = { Default = "" },
    Items = function()
        return GetPlayers()
    end,
    Callback = function(val)
        selectedPlayer = val
    end,
})

TeleportTab:Button({
    Title = "传送到选中玩家",
    Callback = function()
        if not selectedPlayer or selectedPlayer == "" then
            Notify("传送", "请先选择玩家", 3)
            return
        end
        local plr = Players:FindFirstChild(selectedPlayer)
        if plr and plr.Character then
            local targetRoot = plr.Character:FindFirstChild("HumanoidRootPart")
            local myRoot = GetRoot()
            if targetRoot and myRoot then
                myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 5)
                Notify("传送", "已传送到 " .. selectedPlayer, 3)
            end
        else
            Notify("传送", "玩家不存在或无角色", 3)
        end
    end,
})

-- 传送到鼠标位置
TeleportTab:Button({
    Title = "传送到鼠标位置",
    Callback = function()
        local root = GetRoot()
        if root then
            root.CFrame = Mouse.Hit
            Notify("传送", "已传送到鼠标位置", 3)
        end
    end,
})

-- 传送到出生点
TeleportTab:Button({
    Title = "传送到出生点",
    Callback = function()
        local spawn = Workspace:FindFirstChildOfClass("SpawnLocation")
        local root = GetRoot()
        if spawn and root then
            root.CFrame = spawn.CFrame * CFrame.new(0, 5, 0)
            Notify("传送", "已传送到出生点", 3)
        else
            Notify("传送", "未找到出生点", 3)
        end
    end,
})

TeleportTab:Divider()
TeleportTab:Section({ Title = "快速地点", TextXAlignment = "Left", TextSize = 17 })

-- 快速传送点
local quickLocations = {
    { name = "商店", keywords = {"shop", "store", "market"} },
    { name = "银行", keywords = {"bank"} },
    { name = "警察局", keywords = {"police", "station"} },
    { name = "医院", keywords = {"hospital", "clinic"} },
    { name = "车库", keywords = {"garage", "car"} },
    { name = "机场", keywords = {"airport", "plane"} },
}

for _, loc in ipairs(quickLocations) do
    TeleportTab:Button({
        Title = "传送到" .. loc.name,
        Callback = function()
            local found = false
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") or obj:IsA("Model") then
                    local ln = string.lower(obj.Name)
                    for _, kw in ipairs(loc.keywords) do
                        if string.find(ln, kw) then
                            local root = GetRoot()
                            if root then
                                local cf = obj:IsA("BasePart") and obj.CFrame or (obj:GetPivot())
                                root.CFrame = cf * CFrame.new(0, 5, 0)
                                Notify("传送", "已传送到" .. loc.name, 3)
                                found = true
                            end
                            break
                        end
                    end
                    if found then break end
                end
            end
            if not found then
                Notify("传送", "未找到" .. loc.name, 3)
            end
        end,
    })
end

TeleportTab:Divider()

-- 点击传送 (手机端: 长按屏幕0.5秒传送)
local clickTpConn = nil
local tpHoldStart = nil
TeleportTab:Toggle({
    Title = "长按传送 (长按屏幕0.5秒)",
    Default = false,
    Callback = function(val)
        if val then
            Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
            clickTpConn = UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                -- 手机端: 任何触摸/点击开始计时
                if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                    tpHoldStart = tick()
                end
            end)
            -- 检测长按完成
            Connections.TpHold = RunService.Heartbeat:Connect(function()
                if not tpHoldStart then return end
                local heldTime = tick() - tpHoldStart
                if heldTime >= 0.5 then
                    local root = GetRoot()
                    if root then
                        root.CFrame = Mouse.Hit
                    end
                    tpHoldStart = nil
                end
            end)
            -- 松开手重置
            Connections.TpEnd = UserInputService.InputEnded:Connect(function(input, gpe)
                tpHoldStart = nil
            end)
        else
            if clickTpConn then clickTpConn:Disconnect() clickTpConn = nil end
            if Connections.TpHold then Connections.TpHold:Disconnect() Connections.TpHold = nil end
            if Connections.TpEnd then Connections.TpEnd:Disconnect() Connections.TpEnd = nil end
            tpHoldStart = nil
            Notify("传送", "长按传送已关闭", 3)
        end
    end,
})

--========================================================
-- Tab5: 经济
--========================================================
local EconomyTab = Window:Tab({
    Title = "经济",
    Icon = "dollar-sign",
})

EconomyTab:Section({ Title = "自动收集", TextXAlignment = "Left", TextSize = 17 })

-- 自动收集现金
EconomyTab:Toggle({
    Title = "自动收集现金",
    Default = false,
    Callback = function(val)
        State.AutoCash = val
        if val then
            Notify("经济", "自动收集现金已开启", 3)
            Connections.AutoCash = RunService.Heartbeat:Connect(function()
                if not State.AutoCash then return end

                -- 方法1: 触碰现金 Part
                local root = GetRoot()
                if root then
                    for _, obj in ipairs(Workspace:GetDescendants()) do
                        if obj:IsA("BasePart") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "coin") or string.find(ln, "pickup") then
                                pcall(function()
                                    obj.CFrame = root.CFrame
                                end)
                            end
                        end
                    end
                end

                -- 方法2: 触发 Remote
                pcall(function()
                    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
                        if obj:IsA("RemoteEvent") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "collect") or string.find(ln, "reward") then
                                obj:FireServer()
                            end
                        elseif obj:IsA("RemoteFunction") then
                            local ln = string.lower(obj.Name)
                            if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "collect") then
                                obj:InvokeServer()
                            end
                        end
                    end
                end)
            end)
        else
            if Connections.AutoCash then Connections.AutoCash:Disconnect() Connections.AutoCash = nil end
            Notify("经济", "自动收集现金已关闭", 3)
        end
    end,
})

EconomyTab:Divider()
EconomyTab:Section({ Title = "刷钱", TextXAlignment = "Left", TextSize = 17 })

-- 刷钱 (搜索 Remote)
EconomyTab:Button({
    Title = "扫描所有经济 Remote",
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
        local msg = #results > 0 and table.concat(results, "\n") or "未找到经济相关 Remote"
        Notify("扫描结果", msg, 10)
    end,
})

EconomyTab:Button({
    Title = "尝试触发所有给钱 Remote",
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
        Notify("经济", "尝试触发了 " .. count .. " 个 Remote", 5)
    end,
})

--========================================================
-- Tab6: 实用工具
--========================================================
local MiscTab = Window:Tab({
    Title = "实用",
    Icon = "settings",
})

MiscTab:Section({ Title = "实用工具", TextXAlignment = "Left", TextSize = 17 })

-- 防挂机
MiscTab:Toggle({
    Title = "防挂机 (Anti AFK)",
    Default = false,
    Callback = function(val)
        State.AntiAFK = val
        if val then
            Notify("实用", "防挂机已开启", 3)
            Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
            end)
        else
            if Connections.AntiAFK then Connections.AntiAFK:Disconnect() Connections.AntiAFK = nil end
            Notify("实用", "防挂机已关闭", 3)
        end
    end,
})

-- FPS 加速
MiscTab:Toggle({
    Title = "FPS 加速",
    Default = false,
    Callback = function(val)
        State.FPSBoost = val
        if val then
            Notify("实用", "FPS 加速已开启", 3)
            -- 降低渲染距离
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    pcall(function()
                        if obj.Material == Enum.Material.Neon or obj.Material == Enum.Material.Glass then
                            obj.Material = Enum.Material.Plastic
                        end
                    end)
                end
            end
            -- 移除阴影
            Lighting.GlobalShadows = false
            -- 降低贴图质量
            settings().Rendering.QualityLevel = 1
            -- 移除雾
            Lighting.FogEnd = 9e9

            Connections.FPSBoost = RunService.Heartbeat:Connect(function()
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                        pcall(function() obj.Enabled = false end)
                    end
                end
            end)
        else
            if Connections.FPSBoost then Connections.FPSBoost:Disconnect() Connections.FPSBoost = nil end
            settings().Rendering.QualityLevel = Enum.RenderingQuality.Automatic
            Lighting.FogEnd = 100000
            Notify("实用", "FPS 加速已关闭", 3)
        end
    end,
})

MiscTab:Divider()

-- 服务器跳转
MiscTab:Button({
    Title = "跳转到新服务器",
    Callback = function()
        Notify("实用", "正在跳转服务器...", 3)
        local placeId = game.PlaceId
        TeleportService:Teleport(placeId, LocalPlayer)
    end,
})

-- 复制服务器ID
MiscTab:Button({
    Title = "复制服务器 ID",
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

MiscTab:Divider()
MiscTab:Section({ Title = "角色信息", TextXAlignment = "Left", TextSize = 17 })

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
            table.insert(info, "跳跃: " .. (h.UseJumpPower and h.JumpPower or h.JumpHeight))
        end
        local root = GetRoot()
        if root then
            table.insert(info, "位置: " .. tostring(root.Position))
        end
        local tool = char:FindFirstChildOfClass("Tool")
        if tool then
            table.insert(info, "手持: " .. tool.Name)
        end
        Notify("角色信息", table.concat(info, "\n"), 10)
    end,
})

MiscTab:Button({
    Title = "重置角色",
    Callback = function()
        local h = GetHum()
        if h then
            h.Health = 0
            Notify("实用", "已重置角色", 3)
        end
    end,
})

MiscTab:Divider()
MiscTab:Section({ Title = "清理", TextXAlignment = "Left", TextSize = 17 })

MiscTab:Button({
    Title = "清理所有特效",
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
        for plr, _ in pairs(ESPObjects) do removeESP(plr) end
        ESPObjects = {}
        local tf = Workspace:FindFirstChild("OhioTracers")
        if tf then tf:Destroy() end
        if FOVCircle then FOVCircle:Destroy() FOVCircle = nil end
        Notify("实用", "脚本已卸载", 3)
    end,
})

--========================================================
-- 初始化
--========================================================
Notify("Ohio 脚本", "Ohio 超级脚本已加载!", 5)

-- 角色重生时重新应用设置
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
