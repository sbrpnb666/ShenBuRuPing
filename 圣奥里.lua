--========================================================
-- 圣奥里脚本 | WindUI Framework
-- 游戏: 圣奥里 (Roblox 战斗/PvP 格斗游戏)
--========================================================

-- 加载 WindUI
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()

--========================================================
-- 服务引用
--========================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- LocalPlayer, Camera, Mouse
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

--========================================================
-- 创建窗口
--========================================================
local Window = WindUI:CreateWindow({
    Title = "圣奥里",
    Icon = "shield",
    Author = "圣奥里脚本",
    Folder = "SaintOly",
    Size = UDim2.fromOffset(500, 520),
    Theme = "Dark",
})

--========================================================
-- 时间标签 (彩虹色循环)
--========================================================
local TimeTag = Window:Tag({
    Title = "00:00",
    Color = Color3.fromRGB(255, 255, 255),
})

task.spawn(function()
    local hue = 0
    while task.wait(0.06) do
        hue = hue + 0.01
        if hue > 1 then hue = 0 end
        local now = os.date("*t")
        local hours = string.format("%02d", now.hour)
        local minutes = string.format("%02d", now.min)
        TimeTag:SetTitle(hours .. ":" .. minutes)
        TimeTag:SetColor(Color3.fromHSV(hue, 1, 1))
    end
end)

-- 金色主题标签
Window:Tag({
    Title = "圣奥里",
    Color = Color3.fromHex("#FFD700"),
})

--========================================================
-- 编辑打开按钮
--========================================================
Window:EditOpenButton({
    Title = "圣奥里",
    Icon = "shield",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FFD700")),
    Draggable = true,
})

--========================================================
-- State 表
--========================================================
local State = {
    -- 战斗
    AutoBlock = false,
    AutoDodge = false,
    AttackRangeExpand = false,
    AttackRangeSize = 20,
    AutoCombo = false,
    FastPunch = false,
    AutoAttack = false,
    InfStamina = false,
    AntiStun = false,
    NoCooldown = false,
    -- 玩家
    WalkSpeed = 16,
    JumpPower = 50,
    InfJump = false,
    NoClip = false,
    GodMode = false,
    NoFallDamage = false,
    -- 视觉
    ESP = false,
    ShowName = true,
    ShowDistance = true,
    ShowHealth = true,
    TracerLine = false,
    ESPHighlight = false,
    FullMapHighlight = false,
    -- 传送
    LongPressTeleport = false,
    -- 实用
    AntiAFK = false,
}

local Connections = {}
local ESPObjects = {}
local TracerLines = {}

--========================================================
-- 辅助函数
--========================================================

-- 获取角色
local function GetChar()
    return LocalPlayer.Character
end

-- 获取 HumanoidRootPart
local function GetRoot()
    local char = GetChar()
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
end

-- 获取 Humanoid
local function GetHum()
    local char = GetChar()
    if not char then return nil end
    return char:FindFirstChildOfClass("Humanoid")
end

-- 通知
local function Notify(title, content, duration)
    WindUI:Notify({
        Title = title,
        Content = content,
        Duration = duration or 5,
    })
end

-- 添加连接
local function AddConnection(name, conn)
    if Connections[name] then
        Connections[name]:Disconnect()
    end
    Connections[name] = conn
end

-- 移除连接
local function RemoveConnection(name)
    if Connections[name] then
        Connections[name]:Disconnect()
        Connections[name] = nil
    end
end

-- 获取最近存活敌人
local function GetClosestPlayer(maxDist)
    maxDist = maxDist or math.huge
    local closest = nil
    local closestDist = maxDist
    local root = GetRoot()
    if not root then return nil end
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hum and hrp and hum.Health > 0 then
                local dist = (root.Position - hrp.Position).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    closest = player
                end
            end
        end
    end
    return closest
end

-- 获取屏幕中心
local function GetScreenCenter()
    local viewport = Camera.ViewportSize
    return Vector2.new(viewport.X / 2, viewport.Y / 2)
end

-- 世界坐标转屏幕坐标
local function WorldToScreen(pos)
    local screenPos, onScreen = Camera:WorldToViewportPoint(pos)
    return Vector2.new(screenPos.X, screenPos.Y), onScreen
end

-- 检测敌人是否在攻击
local function IsAttacking(character)
    if not character then return false end
    local hum = character:FindFirstChildOfClass("Humanoid")
    if not hum then return false end
    local anim = character:FindFirstChildOfClass("Animator")
    if not anim and hum then
        anim = hum:FindFirstChildOfClass("Animator")
    end
    if anim then
        for _, track in pairs(anim:GetPlayingAnimationTracks()) do
            local name = (track.Name or ""):lower()
            if name:match("attack") or name:match("punch") or name:match("hit")
               or name:match("swing") or name:match("combo") or name:match("slash")
               or name:match("strike") or name:match("kick") then
                return true
            end
        end
    end
    return false
end

-- 获取 UI 父级
local function GetUIParent()
    return gethui and gethui() or game:GetService("CoreGui")
end

--========================================================
-- ESP 辅助函数
--========================================================

local function CreateESPForPlayer(player)
    if player == LocalPlayer then return end
    if ESPObjects[player] then return end

    local esp = {}

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "SaintOlyESP"
    billboard.Size = UDim2.fromOffset(200, 80)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = true
    billboard.Parent = GetUIParent()

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0.33, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.Parent = billboard

    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.33, 0)
    distLabel.Position = UDim2.new(0, 0, 0.33, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0m"
    distLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    distLabel.TextStrokeTransparency = 0
    distLabel.TextScaled = true
    distLabel.Font = Enum.Font.SourceSansBold
    distLabel.Parent = billboard

    local healthLabel = Instance.new("TextLabel")
    healthLabel.Size = UDim2.new(1, 0, 0.34, 0)
    healthLabel.Position = UDim2.new(0, 0, 0.66, 0)
    healthLabel.BackgroundTransparency = 1
    healthLabel.Text = "100/100"
    healthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    healthLabel.TextStrokeTransparency = 0
    healthLabel.TextScaled = true
    healthLabel.Font = Enum.Font.SourceSansBold
    healthLabel.Parent = billboard

    esp.Billboard = billboard
    esp.NameLabel = nameLabel
    esp.DistLabel = distLabel
    esp.HealthLabel = healthLabel
    ESPObjects[player] = esp
end

local function RemoveESPForPlayer(player)
    if ESPObjects[player] then
        if ESPObjects[player].Billboard then
            ESPObjects[player].Billboard:Destroy()
        end
        ESPObjects[player] = nil
    end
end

local function UpdateESP()
    local root = GetRoot()
    for player, esp in pairs(ESPObjects) do
        if not player.Parent or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            esp.Billboard.Enabled = false
        else
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if targetRoot and hum then
                esp.Billboard.Adornee = targetRoot
                esp.Billboard.Enabled = true

                -- 名字
                esp.NameLabel.Visible = State.ShowName
                esp.NameLabel.Text = player.DisplayName or player.Name

                -- 距离
                if root then
                    local dist = (root.Position - targetRoot.Position).Magnitude
                    esp.DistLabel.Visible = State.ShowDistance
                    esp.DistLabel.Text = string.format("%.0fm", dist)
                end

                -- 血量
                local health = hum.Health
                local maxHealth = hum.MaxHealth
                esp.HealthLabel.Visible = State.ShowHealth
                esp.HealthLabel.Text = string.format("%.0f/%.0f", health, maxHealth)

                -- 血量颜色 (低血变红)
                local ratio = maxHealth > 0 and (health / maxHealth) or 0
                if ratio < 0.3 then
                    esp.HealthLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                elseif ratio < 0.6 then
                    esp.HealthLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                else
                    esp.HealthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                end
            end
        end
    end
end

-- 追踪线辅助函数
local function GetTracerLine(index)
    if not TracerLines[index] then
        local ok, line = pcall(function() return Drawing.new("Line") end)
        if ok and line then
            line.Thickness = 1
            line.Transparency = 1
            line.Color = Color3.fromRGB(255, 215, 0)
            TracerLines[index] = line
            return line
        end
        return nil
    end
    return TracerLines[index]
end

local function HideAllTracerLines()
    for _, line in pairs(TracerLines) do
        pcall(function() line.Visible = false end)
    end
end

--========================================================
-- 标签页 1: 战斗
--========================================================
local CombatTab = Window:Tab({
    Title = "战斗",
    Icon = "swords",
})

-- ---- Section: 格斗辅助 ----
local CombatSection = CombatTab:Section({ Title = "格斗辅助" })

-- 自动格挡
CombatSection:Toggle({
    Title = "自动格挡",
    Callback = function(state)
        State.AutoBlock = state
        if state then
            Notify("圣奥里", "自动格挡已开启", 3)
            local blockActive = false
            AddConnection("AutoBlock", RunService.Heartbeat:Connect(function()
                local root = GetRoot()
                if not root then return end
                local shouldBlock = false
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                        if hum and hrp and hum.Health > 0 then
                            local dist = (root.Position - hrp.Position).Magnitude
                            if dist <= 15 and IsAttacking(player.Character) then
                                shouldBlock = true
                                break
                            end
                        end
                    end
                end
                if shouldBlock and not blockActive then
                    blockActive = true
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
                    end)
                elseif not shouldBlock and blockActive then
                    blockActive = false
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
                    end)
                end
            end))
        else
            Notify("圣奥里", "自动格挡已关闭", 3)
            RemoveConnection("AutoBlock")
            pcall(function()
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
            end)
        end
    end,
})

-- 自动闪避
CombatSection:Toggle({
    Title = "自动闪避",
    Callback = function(state)
        State.AutoDodge = state
        if state then
            Notify("圣奥里", "自动闪避已开启", 3)
            local lastDodge = 0
            AddConnection("AutoDodge", RunService.Heartbeat:Connect(function()
                local root = GetRoot()
                if not root then return end
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                        if hum and hrp and hum.Health > 0 then
                            local dist = (root.Position - hrp.Position).Magnitude
                            if dist <= 15 and IsAttacking(player.Character) then
                                if tick() - lastDodge > 1 then
                                    lastDodge = tick()
                                    local key = math.random(1, 2) == 1 and Enum.KeyCode.Q or Enum.KeyCode.E
                                    task.spawn(function()
                                        pcall(function()
                                            VirtualInputManager:SendKeyEvent(true, key, false, game)
                                        end)
                                        task.wait(0.1)
                                        pcall(function()
                                            VirtualInputManager:SendKeyEvent(false, key, false, game)
                                        end)
                                    end)
                                end
                                break
                            end
                        end
                    end
                end
            end))
        else
            Notify("圣奥里", "自动闪避已关闭", 3)
            RemoveConnection("AutoDodge")
        end
    end,
})

-- ---- Section: 攻击 ----
local AttackSection = CombatTab:Section({ Title = "攻击" })

-- 攻击范围扩大
AttackSection:Toggle({
    Title = "攻击范围扩大",
    Callback = function(state)
        State.AttackRangeExpand = state
        if state then
            Notify("圣奥里", "攻击范围扩大已开启", 3)
            AddConnection("AttackRangeExpand", RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if not char then return end
                for _, tool in pairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        local handle = tool:FindFirstChild("Handle")
                        if handle and handle:IsA("BasePart") then
                            pcall(function()
                                handle.Size = Vector3.new(State.AttackRangeSize, State.AttackRangeSize, State.AttackRangeSize)
                            end)
                        end
                        local hitbox = tool:FindFirstChild("Hitbox") or tool:FindFirstChild("hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            pcall(function()
                                hitbox.Size = Vector3.new(State.AttackRangeSize, State.AttackRangeSize, State.AttackRangeSize)
                            end)
                        end
                    end
                end
            end))
        else
            Notify("圣奥里", "攻击范围扩大已关闭", 3)
            RemoveConnection("AttackRangeExpand")
        end
    end,
})

-- 攻击范围大小
AttackSection:Slider({
    Title = "攻击范围大小",
    Value = { Min = 2, Max = 50, Default = 20 },
    Callback = function(value)
        State.AttackRangeSize = value
    end,
})

-- 自动连招
AttackSection:Toggle({
    Title = "自动连招",
    Callback = function(state)
        State.AutoCombo = state
        if state then
            Notify("圣奥里", "自动连招已开启", 3)
            task.spawn(function()
                while State.AutoCombo do
                    for i = 1, 4 do
                        if not State.AutoCombo then break end
                        pcall(function()
                            VirtualInputManager:SendMouseButtonEvent(true, 0, 0, 0, game, 0)
                        end)
                        task.wait(0.05)
                        pcall(function()
                            VirtualInputManager:SendMouseButtonEvent(false, 0, 0, 0, game, 0)
                        end)
                        task.wait(0.3)
                    end
                    task.wait(0.35)
                end
            end)
        else
            Notify("圣奥里", "自动连招已关闭", 3)
        end
    end,
})

-- 快速出拳
AttackSection:Toggle({
    Title = "快速出拳",
    Callback = function(state)
        State.FastPunch = state
        if state then
            Notify("圣奥里", "快速出拳已开启", 3)
            AddConnection("FastPunch", UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    task.spawn(function()
                        while State.FastPunch and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            local char = GetChar()
                            if char then
                                for _, tool in pairs(char:GetChildren()) do
                                    if tool:IsA("Tool") then
                                        pcall(function() tool:Activate() end)
                                    end
                                end
                            end
                            task.wait(0.02)
                        end
                    end)
                end
            end))
        else
            Notify("圣奥里", "快速出拳已关闭", 3)
            RemoveConnection("FastPunch")
        end
    end,
})

-- 自动攻击
AttackSection:Toggle({
    Title = "自动攻击",
    Callback = function(state)
        State.AutoAttack = state
        if state then
            Notify("圣奥里", "自动攻击已开启", 3)
            local lastAttack = 0
            AddConnection("AutoAttack", RunService.Heartbeat:Connect(function()
                if tick() - lastAttack < 0.5 then return end
                local target = GetClosestPlayer(100)
                local root = GetRoot()
                if not target or not target.Character or not root then return end
                local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
                if not targetRoot then return end
                lastAttack = tick()
                -- 转向敌人
                pcall(function()
                    root.CFrame = CFrame.lookAt(root.Position, Vector3.new(targetRoot.Position.X, root.Position.Y, targetRoot.Position.Z))
                end)
                -- 点击攻击
                pcall(function()
                    VirtualInputManager:SendMouseButtonEvent(true, 0, 0, 0, game, 0)
                end)
                task.wait(0.05)
                pcall(function()
                    VirtualInputManager:SendMouseButtonEvent(false, 0, 0, 0, game, 0)
                end)
                -- 触发 Tool Activate
                local char = GetChar()
                if char then
                    for _, tool in pairs(char:GetChildren()) do
                        if tool:IsA("Tool") then
                            pcall(function() tool:Activate() end)
                        end
                    end
                end
                -- 触发 Remote
                for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
                    if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                        local name = (obj.Name or ""):lower()
                        if name:match("attack") or name:match("hit") or name:match("damage") then
                            pcall(function()
                                obj:FireServer(target)
                            end)
                        end
                    end
                end
            end))
        else
            Notify("圣奥里", "自动攻击已关闭", 3)
            RemoveConnection("AutoAttack")
        end
    end,
})

-- ---- Section: 属性 ----
local StatsSection = CombatTab:Section({ Title = "属性" })

-- 无限体力
StatsSection:Toggle({
    Title = "无限体力",
    Callback = function(state)
        State.InfStamina = state
        if state then
            Notify("圣奥里", "无限体力已开启", 3)
            AddConnection("InfStamina", RunService.Heartbeat:Connect(function()
                local function setStamina(parent)
                    if not parent then return end
                    for _, obj in pairs(parent:GetDescendants()) do
                        if obj:IsA("Value") or obj:IsA("IntValue") or obj:IsA("NumberValue") then
                            local name = (obj.Name or ""):lower()
                            if name:match("stamina") or name:match("energy") then
                                pcall(function() obj.Value = math.huge end)
                            end
                        end
                    end
                end
                setStamina(GetChar())
                setStamina(LocalPlayer)
            end))
        else
            Notify("圣奥里", "无限体力已关闭", 3)
            RemoveConnection("InfStamina")
        end
    end,
})

-- 免疫眩晕
StatsSection:Toggle({
    Title = "免疫眩晕",
    Callback = function(state)
        State.AntiStun = state
        if state then
            Notify("圣奥里", "免疫眩晕已开启", 3)
            AddConnection("AntiStun", RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if not char then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    pcall(function() hum.PlatformStand = false end)
                    for _, obj in pairs(char:GetChildren()) do
                        local name = (obj.Name or ""):lower()
                        if name:match("stun") or name:match("dizzy") or name:match("knock") then
                            if obj:IsA("BoolValue") then
                                pcall(function() obj.Value = false end)
                            elseif obj:IsA("NumberValue") or obj:IsA("IntValue") then
                                pcall(function() obj.Value = 0 end)
                            end
                        end
                    end
                end
                -- 停止眩晕动画
                local anim = char:FindFirstChildOfClass("Animator")
                if not anim and hum then
                    anim = hum:FindFirstChildOfClass("Animator")
                end
                if anim then
                    for _, track in pairs(anim:GetPlayingAnimationTracks()) do
                        local name = (track.Name or ""):lower()
                        if name:match("stun") or name:match("dizzy") or name:match("knock") then
                            pcall(function() track:Stop() end)
                        end
                    end
                end
                -- 移除眩晕 BodyVelocity
                for _, obj in pairs(char:GetDescendants()) do
                    if obj:IsA("BodyVelocity") or obj:IsA("BodyGyro") or obj:IsA("BodyAngularVelocity") then
                        local name = (obj.Name or ""):lower()
                        if name:match("stun") or name:match("knock") or name:match("push") then
                            pcall(function() obj:Destroy() end)
                        end
                    end
                end
            end))
        else
            Notify("圣奥里", "免疫眩晕已关闭", 3)
            RemoveConnection("AntiStun")
        end
    end,
})

-- 技能无冷却
StatsSection:Toggle({
    Title = "技能无冷却",
    Callback = function(state)
        State.NoCooldown = state
        if state then
            Notify("圣奥里", "技能无冷却已开启", 3)
            AddConnection("NoCooldown", RunService.Heartbeat:Connect(function()
                local function clearCooldowns(parent)
                    if not parent then return end
                    for _, obj in pairs(parent:GetDescendants()) do
                        if obj:IsA("Value") or obj:IsA("IntValue") or obj:IsA("NumberValue") then
                            local name = (obj.Name or ""):lower()
                            if name:match("cooldown") or name:match("cd") or name:match("timer") then
                                pcall(function() obj.Value = 0 end)
                            end
                        end
                    end
                end
                clearCooldowns(GetChar())
                clearCooldowns(LocalPlayer)
            end))
        else
            Notify("圣奥里", "技能无冷却已关闭", 3)
            RemoveConnection("NoCooldown")
        end
    end,
})

--========================================================
-- 标签页 2: 玩家
--========================================================
local PlayerTab = Window:Tab({
    Title = "玩家",
    Icon = "user",
})

local PlayerSection = PlayerTab:Section({ Title = "玩家属性" })

-- 行走速度
PlayerSection:Slider({
    Title = "行走速度",
    Value = { Min = 16, Max = 500, Default = 16 },
    Callback = function(value)
        State.WalkSpeed = value
        local hum = GetHum()
        if hum then
            pcall(function() hum.WalkSpeed = value end)
        end
    end,
})

-- 跳跃力
PlayerSection:Slider({
    Title = "跳跃力",
    Value = { Min = 50, Max = 500, Default = 50 },
    Callback = function(value)
        State.JumpPower = value
        local hum = GetHum()
        if hum then
            pcall(function() hum.JumpPower = value end)
        end
    end,
})

-- 无限跳跃
PlayerSection:Toggle({
    Title = "无限跳跃",
    Callback = function(state)
        State.InfJump = state
        if state then
            Notify("圣奥里", "无限跳跃已开启", 3)
            AddConnection("InfJump", UserInputService.JumpRequest:Connect(function()
                local hum = GetHum()
                if hum then
                    pcall(function()
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    end)
                end
            end))
        else
            Notify("圣奥里", "无限跳跃已关闭", 3)
            RemoveConnection("InfJump")
        end
    end,
})

-- 穿墙
PlayerSection:Toggle({
    Title = "穿墙",
    Callback = function(state)
        State.NoClip = state
        if state then
            Notify("圣奥里", "穿墙已开启", 3)
            AddConnection("NoClip", RunService.Stepped:Connect(function()
                local char = GetChar()
                if not char then return end
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end))
        else
            Notify("圣奥里", "穿墙已关闭", 3)
            RemoveConnection("NoClip")
            local char = GetChar()
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end,
})

-- 无敌
PlayerSection:Toggle({
    Title = "无敌",
    Callback = function(state)
        State.GodMode = state
        if state then
            Notify("圣奥里", "无敌已开启", 3)
            AddConnection("GodMode", RunService.Heartbeat:Connect(function()
                local hum = GetHum()
                if hum then
                    pcall(function()
                        if hum.Health < hum.MaxHealth then
                            hum.Health = hum.MaxHealth
                        end
                    end)
                end
            end))
        else
            Notify("圣奥里", "无敌已关闭", 3)
            RemoveConnection("GodMode")
        end
    end,
})

-- 摔落无伤害
PlayerSection:Toggle({
    Title = "摔落无伤害",
    Callback = function(state)
        State.NoFallDamage = state
        if state then
            Notify("圣奥里", "摔落无伤害已开启", 3)
            AddConnection("NoFallDamage", RunService.Heartbeat:Connect(function()
                local hum = GetHum()
                if hum then
                    pcall(function()
                        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                        hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                    end)
                end
                local char = GetChar()
                if char then
                    for _, obj in pairs(char:GetDescendants()) do
                        if obj:IsA("BodyVelocity") then
                            local name = (obj.Name or ""):lower()
                            if name:match("fall") or name:match("knock") then
                                pcall(function() obj:Destroy() end)
                            end
                        end
                    end
                end
            end))
        else
            Notify("圣奥里", "摔落无伤害已关闭", 3)
            RemoveConnection("NoFallDamage")
        end
    end,
})

-- 飞行手机版
PlayerSection:Button({
    Title = "飞行手机版",
    Callback = function()
        Notify("圣奥里", "正在加载飞行脚本...", 3)
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
        end)
        if not success then
            Notify("圣奥里", "飞行脚本加载失败: " .. tostring(err), 5)
        end
    end,
})

--========================================================
-- 标签页 3: 视觉
--========================================================
local VisualTab = Window:Tab({
    Title = "视觉",
    Icon = "eye",
})

local VisualSection = VisualTab:Section({ Title = "透视设置" })

-- 人物透视
VisualSection:Toggle({
    Title = "人物透视",
    Callback = function(state)
        State.ESP = state
        if state then
            Notify("圣奥里", "人物透视已开启", 3)
            for _, player in pairs(Players:GetPlayers()) do
                CreateESPForPlayer(player)
            end
            AddConnection("ESP", RunService.RenderStepped:Connect(UpdateESP))
            AddConnection("ESPPlayerAdded", Players.PlayerAdded:Connect(function(player)
                CreateESPForPlayer(player)
            end))
            AddConnection("ESPPlayerRemoving", Players.PlayerRemoving:Connect(function(player)
                RemoveESPForPlayer(player)
            end))
        else
            Notify("圣奥里", "人物透视已关闭", 3)
            RemoveConnection("ESP")
            RemoveConnection("ESPPlayerAdded")
            RemoveConnection("ESPPlayerRemoving")
            for player, _ in pairs(ESPObjects) do
                RemoveESPForPlayer(player)
            end
        end
    end,
})

-- 显示名字
VisualSection:Toggle({
    Title = "显示名字",
    Value = true,
    Callback = function(state)
        State.ShowName = state
        if state then
            Notify("圣奥里", "显示名字已开启", 3)
        else
            Notify("圣奥里", "显示名字已关闭", 3)
        end
    end,
})

-- 显示距离
VisualSection:Toggle({
    Title = "显示距离",
    Value = true,
    Callback = function(state)
        State.ShowDistance = state
        if state then
            Notify("圣奥里", "显示距离已开启", 3)
        else
            Notify("圣奥里", "显示距离已关闭", 3)
        end
    end,
})

-- 显示血量
VisualSection:Toggle({
    Title = "显示血量",
    Value = true,
    Callback = function(state)
        State.ShowHealth = state
        if state then
            Notify("圣奥里", "显示血量已开启", 3)
        else
            Notify("圣奥里", "显示血量已关闭", 3)
        end
    end,
})

-- 追踪线
VisualSection:Toggle({
    Title = "追踪线",
    Callback = function(state)
        State.TracerLine = state
        if state then
            local hasDrawing = pcall(function() return Drawing.new("Line") end)
            if not hasDrawing then
                State.TracerLine = false
                Notify("圣奥里", "当前执行器不支持Drawing API,追踪线不可用", 5)
                return
            end
            Notify("圣奥里", "追踪线已开启", 3)
            AddConnection("TracerLine", RunService.RenderStepped:Connect(function()
                local root = GetRoot()
                if not root then
                    HideAllTracerLines()
                    return
                end
                local center = GetScreenCenter()
                local lineIndex = 1
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        if targetRoot and hum and hum.Health > 0 then
                            local screenPos, onScreen = WorldToScreen(targetRoot.Position)
                            if onScreen then
                                local line = GetTracerLine(lineIndex)
                                if line then
                                    line.From = center
                                    line.To = screenPos
                                    line.Visible = true
                                end
                                lineIndex = lineIndex + 1
                            end
                        end
                    end
                end
                for i = lineIndex, #TracerLines do
                    if TracerLines[i] then
                        pcall(function() TracerLines[i].Visible = false end)
                    end
                end
            end))
        else
            Notify("圣奥里", "追踪线已关闭", 3)
            RemoveConnection("TracerLine")
            HideAllTracerLines()
        end
    end,
})

-- 透视高亮
VisualSection:Toggle({
    Title = "透视高亮",
    Callback = function(state)
        State.ESPHighlight = state
        if state then
            Notify("圣奥里", "透视高亮已开启", 3)
            AddConnection("ESPHighlight", RunService.RenderStepped:Connect(function()
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Health > 0 then
                            local hl = player.Character:FindFirstChild("SaintOlyHL")
                            if not hl then
                                hl = Instance.new("Highlight")
                                hl.Name = "SaintOlyHL"
                                hl.FillColor = Color3.fromRGB(255, 215, 0)
                                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                                hl.FillTransparency = 0.5
                                hl.OutlineTransparency = 0
                                hl.Parent = player.Character
                            end
                        end
                    end
                end
            end))
        else
            Notify("圣奥里", "透视高亮已关闭", 3)
            RemoveConnection("ESPHighlight")
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local hl = player.Character:FindFirstChild("SaintOlyHL")
                    if hl then hl:Destroy() end
                end
            end
        end
    end,
})

-- 全图高亮
VisualSection:Toggle({
    Title = "全图高亮",
    Callback = function(state)
        State.FullMapHighlight = state
        if state then
            Notify("圣奥里", "全图高亮已开启", 3)
            AddConnection("FullMapHighlight", RunService.Heartbeat:Connect(function()
                -- 光照增强
                local cc = Lighting:FindFirstChild("SaintOlyCC")
                if not cc then
                    cc = Instance.new("ColorCorrectionEffect")
                    cc.Name = "SaintOlyCC"
                    cc.Brightness = 0.1
                    cc.Contrast = 0.2
                    cc.Saturation = 0.3
                    cc.Parent = Lighting
                end
                -- 全图玩家高亮
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local hl = player.Character:FindFirstChild("SaintOlyFullHL")
                        if not hl then
                            hl = Instance.new("Highlight")
                            hl.Name = "SaintOlyFullHL"
                            hl.FillColor = Color3.fromRGB(255, 215, 0)
                            hl.FillTransparency = 0.7
                            hl.OutlineTransparency = 0.5
                            hl.Parent = player.Character
                        end
                    end
                end
            end))
        else
            Notify("圣奥里", "全图高亮已关闭", 3)
            RemoveConnection("FullMapHighlight")
            local cc = Lighting:FindFirstChild("SaintOlyCC")
            if cc then cc:Destroy() end
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local hl = player.Character:FindFirstChild("SaintOlyFullHL")
                    if hl then hl:Destroy() end
                end
            end
        end
    end,
})

--========================================================
-- 标签页 4: 传送
--========================================================
local TeleportTab = Window:Tab({
    Title = "传送",
    Icon = "map-pin",
})

local TeleportSection = TeleportTab:Section({ Title = "传送位置" })

-- 传送辅助函数
local function TeleportToPosition(pos)
    local root = GetRoot()
    if not root then return false end
    pcall(function()
        root.CFrame = CFrame.new(pos)
    end)
    return true
end

local function FindAndTeleport(...)
    local root = GetRoot()
    if not root then return false end
    local names = {...}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local objName = string.lower(obj.Name)
            for _, searchName in pairs(names) do
                if objName:match(string.lower(searchName)) then
                    return TeleportToPosition(obj.Position + Vector3.new(0, 3, 0))
                end
            end
        end
    end
    return false
end

-- 传送到主战场
TeleportSection:Button({
    Title = "传送到主战场",
    Callback = function()
        if FindAndTeleport("战场", "battle", "arena", "main") then
            Notify("圣奥里", "已传送到主战场", 3)
        else
            Notify("圣奥里", "未找到主战场位置", 3)
        end
    end,
})

-- 传送到训练区
TeleportSection:Button({
    Title = "传送到训练区",
    Callback = function()
        if FindAndTeleport("训练", "train", "practice") then
            Notify("圣奥里", "已传送到训练区", 3)
        else
            Notify("圣奥里", "未找到训练区位置", 3)
        end
    end,
})

-- 传送到商店
TeleportSection:Button({
    Title = "传送到商店",
    Callback = function()
        if FindAndTeleport("商店", "shop", "store") then
            Notify("圣奥里", "已传送到商店", 3)
        else
            Notify("圣奥里", "未找到商店位置", 3)
        end
    end,
})

-- 传送到武器店
TeleportSection:Button({
    Title = "传送到武器店",
    Callback = function()
        if FindAndTeleport("武器", "weapon") then
            Notify("圣奥里", "已传送到武器店", 3)
        else
            Notify("圣奥里", "未找到武器店位置", 3)
        end
    end,
})

-- 传送到技能店
TeleportSection:Button({
    Title = "传送到技能店",
    Callback = function()
        if FindAndTeleport("技能", "skill") then
            Notify("圣奥里", "已传送到技能店", 3)
        else
            Notify("圣奥里", "未找到技能店位置", 3)
        end
    end,
})

-- 传送到重生区
TeleportSection:Button({
    Title = "传送到重生区",
    Callback = function()
        if FindAndTeleport("重生", "spawn", "respawn") then
            Notify("圣奥里", "已传送到重生区", 3)
        else
            Notify("圣奥里", "未找到重生区位置", 3)
        end
    end,
})

-- 传送到竞技场入口
TeleportSection:Button({
    Title = "传送到竞技场入口",
    Callback = function()
        if FindAndTeleport("竞技", "arena", "entrance") then
            Notify("圣奥里", "已传送到竞技场入口", 3)
        else
            Notify("圣奥里", "未找到竞技场入口位置", 3)
        end
    end,
})

-- 传送到Boss区
TeleportSection:Button({
    Title = "传送到Boss区",
    Callback = function()
        if FindAndTeleport("boss", "魔王", "Boss") then
            Notify("圣奥里", "已传送到Boss区", 3)
        else
            Notify("圣奥里", "未找到Boss区位置", 3)
        end
    end,
})

-- 传送到最近玩家
TeleportSection:Button({
    Title = "传送到最近玩家",
    Callback = function()
        local target = GetClosestPlayer(math.huge)
        if target and target.Character then
            local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                TeleportToPosition(targetRoot.Position + Vector3.new(0, 3, 0))
                Notify("圣奥里", "已传送到: " .. target.Name, 3)
            end
        else
            Notify("圣奥里", "未找到玩家", 3)
        end
    end,
})

-- 长按传送
TeleportSection:Toggle({
    Title = "长按传送",
    Callback = function(state)
        State.LongPressTeleport = state
        if state then
            Notify("圣奥里", "长按传送已开启 - 点击地面传送", 3)
            AddConnection("LongPressTeleport", UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1
                   or input.UserInputType == Enum.UserInputType.Touch then
                    local root = GetRoot()
                    if not root then return end
                    local mousePos = Mouse.Hit.Position
                    TeleportToPosition(mousePos + Vector3.new(0, 3, 0))
                end
            end))
        else
            Notify("圣奥里", "长按传送已关闭", 3)
            RemoveConnection("LongPressTeleport")
        end
    end,
})

--========================================================
-- 标签页 5: 实用
--========================================================
local UtilityTab = Window:Tab({
    Title = "实用",
    Icon = "settings",
})

local UtilitySection = UtilityTab:Section({ Title = "实用工具" })

-- 防挂机
UtilitySection:Toggle({
    Title = "防挂机",
    Callback = function(state)
        State.AntiAFK = state
        if state then
            Notify("圣奥里", "防挂机已开启", 3)
            local VirtualUser = game:GetService("VirtualUser")
            AddConnection("AntiAFK", LocalPlayer.Idled:Connect(function()
                pcall(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton1(Vector2.new())
                end)
            end))
        else
            Notify("圣奥里", "防挂机已关闭", 3)
            RemoveConnection("AntiAFK")
        end
    end,
})

-- 画质提速
UtilitySection:Button({
    Title = "画质提速",
    Callback = function()
        pcall(function()
            Lighting.GlobalShadows = true
            Lighting.FogEnd = 1000000
            for _, obj in pairs(Lighting:GetChildren()) do
                if obj:IsA("BlurEffect") then
                    obj:Destroy()
                end
            end
            Camera.FieldOfView = 70
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                    obj.Enabled = false
                end
            end
        end)
        Notify("圣奥里", "画质提速完成", 3)
    end,
})

-- 换服
UtilitySection:Button({
    Title = "换服",
    Callback = function()
        Notify("圣奥里", "正在换服...", 3)
        pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
    end,
})

-- 复制服务器号
UtilitySection:Button({
    Title = "复制服务器号",
    Callback = function()
        local jobId = game.JobId
        if setclipboard then
            setclipboard(jobId)
            Notify("圣奥里", "服务器号已复制: " .. jobId, 5)
        else
            Notify("圣奥里", "服务器号: " .. jobId, 10)
        end
    end,
})

-- 角色信息
UtilitySection:Button({
    Title = "角色信息",
    Callback = function()
        local char = GetChar()
        local hum = GetHum()
        local root = GetRoot()
        local info = {}
        table.insert(info, "名字: " .. LocalPlayer.Name)
        table.insert(info, "UserId: " .. LocalPlayer.UserId)
        if hum then
            table.insert(info, "血量: " .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth))
            table.insert(info, "速度: " .. hum.WalkSpeed)
            table.insert(info, "跳跃力: " .. hum.JumpPower)
        end
        if root then
            table.insert(info, "位置: " .. tostring(root.Position))
        end
        table.insert(info, "JobId: " .. game.JobId)
        Notify("圣奥里", table.concat(info, "\n"), 10)
    end,
})

-- 清理特效
UtilitySection:Button({
    Title = "清理特效",
    Callback = function()
        local count = 0
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Explosion") then
                pcall(function() obj.Enabled = false end)
                count = count + 1
            end
        end
        for _, obj in pairs(Lighting:GetChildren()) do
            if obj:IsA("PostEffect") then
                pcall(function() obj:Destroy() end)
                count = count + 1
            end
        end
        Notify("圣奥里", "已清理 " .. count .. " 个特效", 3)
    end,
})

-- 卸载脚本
UtilitySection:Button({
    Title = "卸载脚本",
    Callback = function()
        Notify("圣奥里", "正在卸载脚本...", 3)
        -- 重置所有 State
        for k, v in pairs(State) do
            if type(v) == "boolean" then
                State[k] = false
            end
        end
        -- 断开所有连接
        for name, conn in pairs(Connections) do
            pcall(function() conn:Disconnect() end)
            Connections[name] = nil
        end
        -- 清除 ESP
        for player, _ in pairs(ESPObjects) do
            RemoveESPForPlayer(player)
        end
        -- 移除高亮
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                for _, obj in pairs(player.Character:GetChildren()) do
                    if obj:IsA("Highlight") then
                        pcall(function() obj:Destroy() end)
                    end
                end
            end
        end
        -- 移除光照效果
        local cc = Lighting:FindFirstChild("SaintOlyCC")
        if cc then pcall(function() cc:Destroy() end) end
        -- 移除追踪线
        for _, line in pairs(TracerLines) do
            pcall(function() line:Remove() end)
        end
        TracerLines = {}
        -- 释放按键
        pcall(function()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        end)
        -- 销毁窗口
        task.wait(0.5)
        pcall(function() Window:Destroy() end)
    end,
})

--========================================================
-- CharacterAdded 重置
--========================================================
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    -- 恢复行走速度和跳跃力
    local hum = GetHum()
    if hum then
        pcall(function() hum.WalkSpeed = State.WalkSpeed end)
        pcall(function() hum.JumpPower = State.JumpPower end)
    end
    -- 重新应用穿墙
    if State.NoClip then
        RemoveConnection("NoClip")
        AddConnection("NoClip", RunService.Stepped:Connect(function()
            local char = GetChar()
            if not char then return end
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end))
    end
    -- 重新创建 ESP
    if State.ESP then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                RemoveESPForPlayer(player)
                CreateESPForPlayer(player)
            end
        end
    end
end)

--========================================================
-- 加载完成通知
--========================================================
task.wait(0.5)
Notify("圣奥里", "脚本已加载!", 5)
