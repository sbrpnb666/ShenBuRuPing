--========================================================
-- 战争大亨脚本 v1.0
-- 使用 WindUI 框架
--========================================================

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local Window = WindUI:CreateWindow({
    Title = "战争大亨",
    Icon = "swords",
    Author = "战争大亨脚本",
    Folder = "WarTycoon",
    Size = UDim2.fromOffset(450, 450),
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
    Title = "战争大亨",
    Color = Color3.fromHex("#FF6B6B")
})

Window:EditOpenButton({
    Title = "战争大亨",
    Icon = "swords",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
    Draggable = true,
})

--=========== 状态 ===========
local State = {
    AutoCash = false,
    ESPEnabled = false,
    InfiniteAmmo = false,
    NoRecoil = false,
    AutoFire = false,
    WalkSpeed = 16,
    JumpPower = 50,
    NoClip = false,
    FlyEnabled = false,
    GodMode = false,
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

--=========== 自动收集现金 ===========
local function findCashRemotes()
    local remotes = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local name = string.lower(obj.Name)
            if string.find(name, "cash") or string.find(name, "money") or string.find(name, "collect") or string.find(name, "reward") then
                table.insert(remotes, obj)
            end
        end
    end
    return remotes
end

local function findCashParts()
    local parts = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local name = string.lower(obj.Name)
            if string.find(name, "cash") or string.find(name, "money") or string.find(name, "collect") then
                table.insert(parts, obj)
            end
        end
    end
    return parts
end

--========================================================
-- Tab1: 大亨（自动收集）
--========================================================
local TycoonTab = Window:Tab({
    Title = "大亨",
    Icon = "factory",
})

TycoonTab:Section({ Title = "自动收集", TextXAlignment = "Left", TextSize = 17 })

-- 自动收集现金
TycoonTab:Toggle({
    Title = "自动收集现金",
    Default = false,
    Callback = function(val)
        State.AutoCash = val
        if val then
            Notify("自动收集", "已开启自动收集现金", 3)
            Connections.AutoCash = RunService.Heartbeat:Connect(function()
                local root = GetRoot()
                if not root then return end
                -- 查找附近的现金部件并触碰
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local name = string.lower(obj.Name)
                        if (string.find(name, "cash") or string.find(name, "money") or string.find(name, "collect")) and obj:IsA("BasePart") then
                            local dist = (obj.Position - root.Position).Magnitude
                            if dist < 200 then
                                obj.Position = root.Position + Vector3.new(0, 5, 0)
                            end
                        end
                    end
                end
            end)
        else
            if Connections.AutoCash then Connections.AutoCash:Disconnect() Connections.AutoCash = nil end
            Notify("自动收集", "已关闭自动收集现金", 3)
        end
    end,
})

TycoonTab:Divider()

-- 扫描 RemoteEvent
local scannedRemotes = {}
TycoonTab:Button({
    Title = "扫描金钱 RemoteEvent",
    Callback = function()
        scannedRemotes = findCashRemotes()
        Notify("扫描完成", "找到 " .. #scannedRemotes .. " 个相关 RemoteEvent", 5)
    end,
})

-- 发送金钱请求
TycoonTab:Button({
    Title = "尝试 +$100000",
    Callback = function()
        local found = false
        for _, remote in ipairs(scannedRemotes) do
            pcall(function()
                if remote:IsA("RemoteEvent") then
                    remote:FireServer(100000)
                elseif remote:IsA("RemoteFunction") then
                    remote:InvokeServer(100000)
                end
                found = true
            end)
        end
        if found then
            Notify("发送请求", "已尝试发送金钱请求", 3)
        else
            Notify("提示", "请先扫描 RemoteEvent", 3)
        end
    end,
})

TycoonTab:Divider()

-- 自动触碰收集板
TycoonTab:Toggle({
    Title = "自动触碰收集板",
    Default = false,
    Callback = function(val)
        if val then
            Connections.TouchCollect = RunService.Heartbeat:Connect(function()
                local root = GetRoot()
                if not root then return end
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local name = string.lower(obj.Name)
                        if string.find(name, "collect") or string.find(name, "pad") or string.find(name, "button") then
                            local dist = (obj.Position - root.Position).Magnitude
                            if dist < 50 then
                                firetouchinterest(root, obj, 0)
                            end
                        end
                    end
                end
            end)
        else
            if Connections.TouchCollect then Connections.TouchCollect:Disconnect() Connections.TouchCollect = nil end
        end
    end,
})

--========================================================
-- Tab2: 战斗
--========================================================
local CombatTab = Window:Tab({
    Title = "战斗",
    Icon = "swords",
})

CombatTab:Section({ Title = "武器修改", TextXAlignment = "Left", TextSize = 17 })

-- 无限弹药
CombatTab:Toggle({
    Title = "无限弹药",
    Default = false,
    Callback = function(val)
        State.InfiniteAmmo = val
        if val then
            Notify("武器", "已开启无限弹药", 3)
            Connections.InfiniteAmmo = RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if not char then return end
                for _, tool in ipairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        local ammo = tool:FindFirstChild("Ammo") or tool:FindFirstChild("MaxAmmo") or tool:FindFirstChild("ClipAmmo")
                        if ammo then ammo.Value = 999 end
                        local mag = tool:FindFirstChild("Magazine") or tool:FindFirstChild("Mag")
                        if mag and mag:IsA("IntValue") then mag.Value = 999 end
                    end
                end
            end)
        else
            if Connections.InfiniteAmmo then Connections.InfiniteAmmo:Disconnect() Connections.InfiniteAmmo = nil end
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
            Notify("武器", "已开启无后坐力", 3)
            Connections.NoRecoil = RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if not char then return end
                for _, tool in ipairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        local recoil = tool:FindFirstChild("Recoil") or tool:FindFirstChild("RecoilAmount")
                        if recoil then recoil.Value = 0 end
                        local spread = tool:FindFirstChild("Spread") or tool:FindFirstChild("HipFireSpread")
                        if spread then spread.Value = 0 end
                    end
                end
            end)
        else
            if Connections.NoRecoil then Connections.NoRecoil:Disconnect() Connections.NoRecoil = nil end
        end
    end,
})

-- 自动开火
CombatTab:Toggle({
    Title = "自动开火",
    Default = false,
    Callback = function(val)
        State.AutoFire = val
        if val then
            Notify("武器", "已开启自动开火", 3)
            Connections.AutoFire = RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if not char then return end
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    pcall(function()
                        if tool:FindFirstChild("Handle") then
                            tool.Handle:FireServer()
                        end
                        local fireRemote = tool:FindFirstChild("Fire") or tool:FindFirstChild("Shoot")
                        if fireRemote and fireRemote:IsA("RemoteEvent") then
                            fireRemote:FireServer()
                        end
                    end)
                end
            end)
        else
            if Connections.AutoFire then Connections.AutoFire:Disconnect() Connections.AutoFire = nil end
        end
    end,
})

CombatTab:Divider()

-- Hitbox 扩大
CombatTab:Toggle({
    Title = "Hitbox 扩大",
    Default = false,
    Callback = function(val)
        if val then
            Notify("战斗", "已开启 Hitbox 扩大", 3)
            Connections.Hitbox = RunService.Heartbeat:Connect(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local hum = plr.Character:FindFirstChild("HumanoidRootPart")
                        if hum then
                            hum.Size = Vector3.new(8, 8, 8)
                            hum.Transparency = 0.5
                            hum.CanCollide = false
                        end
                    end
                end
            end)
        else
            if Connections.Hitbox then Connections.Hitbox:Disconnect() Connections.Hitbox = nil end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local hum = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hum then
                        hum.Size = Vector3.new(2, 2, 1)
                        hum.Transparency = 0
                        hum.CanCollide = true
                    end
                end
            end
        end
    end,
})

--========================================================
-- Tab3: 玩家
--========================================================
local PlayerTab = Window:Tab({
    Title = "玩家",
    Icon = "user",
})

PlayerTab:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })

-- 行走速度
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

-- 跳跃力
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
        State.NoClip = val
        if val then
            Connections.NoClip = RunService.Stepped:Connect(function()
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
    Title = "无敌",
    Default = false,
    Callback = function(val)
        State.GodMode = val
        if val then
            Notify("玩家", "已开启无敌", 3)
            Connections.GodMode = RunService.Heartbeat:Connect(function()
                local h = GetHum()
                if h and h.Health < h.MaxHealth then
                    h.Health = h.MaxHealth
                end
            end)
        else
            if Connections.GodMode then Connections.GodMode:Disconnect() Connections.GodMode = nil end
            Notify("玩家", "已关闭无敌", 3)
        end
    end,
})

PlayerTab:Divider()

-- 飞行
local flyConn = nil
local flySpeed = 50
PlayerTab:Slider({
    Title = "飞行速度",
    Value = { Min = 10, Max = 300, Default = 50 },
    Increment = 1,
    Callback = function(val) flySpeed = val end,
})

PlayerTab:Toggle({
    Title = "飞行",
    Default = false,
    Callback = function(val)
        State.FlyEnabled = val
        if val then
            Notify("玩家", "飞行已开启 (WASD 控制)", 3)
            local root = GetRoot()
            local hum = GetHum()
            if root and hum then
                hum.PlatformStand = true
                local bv = Instance.new("BodyVelocity")
                bv.Name = "FlyVelocity"
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bv.Velocity = Vector3.zero
                bv.Parent = root

                flyConn = RunService.RenderStepped:Connect(function()
                    local cam = Workspace.CurrentCamera
                    local dir = Vector3.zero
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0, 1, 0) end
                    bv.Velocity = dir * flySpeed
                end)
            end
        else
            if flyConn then flyConn:Disconnect() flyConn = nil end
            local root = GetRoot()
            local hum = GetHum()
            if root then
                local bv = root:FindFirstChild("FlyVelocity")
                if bv then bv:Destroy() end
            end
            if hum then hum.PlatformStand = false end
            Notify("玩家", "飞行已关闭", 3)
        end
    end,
})

--========================================================
-- Tab4: 视觉
--========================================================
local VisualTab = Window:Tab({
    Title = "视觉",
    Icon = "eye",
})

VisualTab:Section({ Title = "ESP", TextXAlignment = "Left", TextSize = 17 })

local function createESP(player)
    if player == LocalPlayer then return end
    if ESPObjects[player] then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_" .. player.Name
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 5000

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0, 20)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    nameLabel.TextSize = 14
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Parent = billboard

    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0, 15)
    distLabel.Position = UDim2.new(0, 0, 0, 25)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = ""
    distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    distLabel.TextSize = 12
    distLabel.Font = Enum.Font.Gotham
    distLabel.Parent = billboard

    ESPObjects[player] = { billboard = billboard, nameLabel = nameLabel, distLabel = distLabel }

    local function attach()
        local char = player.Character
        if not char then return end
        local head = char:FindFirstChild("Head")
        if head then
            billboard.Adornee = head
            billboard.Parent = head
        end
    end

    player.CharacterAdded:Connect(attach)
    if player.Character then attach() end
end

local function removeESP(player)
    if ESPObjects[player] then
        if ESPObjects[player].billboard then
            ESPObjects[player].billboard:Destroy()
        end
        ESPObjects[player] = nil
    end
end

VisualTab:Toggle({
    Title = "玩家 ESP (名字+距离)",
    Default = false,
    Callback = function(val)
        State.ESPEnabled = val
        if val then
            Notify("视觉", "ESP 已开启", 3)
            for _, plr in ipairs(Players:GetPlayers()) do
                createESP(plr)
            end
            Connections.ESPUpdate = RunService.Heartbeat:Connect(function()
                local root = GetRoot()
                for plr, data in pairs(ESPObjects) do
                    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and root then
                        local dist = (plr.Character.HumanoidRootPart.Position - root.Position).Magnitude
                        data.distLabel.Text = math.floor(dist) .. " studs"
                    end
                end
            end)
            Connections.PlayerAdded = Players.PlayerAdded:Connect(function(plr) createESP(plr) end)
            Connections.PlayerRemoving = Players.PlayerRemoving:Connect(function(plr) removeESP(plr) end)
        else
            if Connections.ESPUpdate then Connections.ESPUpdate:Disconnect() Connections.ESPUpdate = nil end
            if Connections.PlayerAdded then Connections.PlayerAdded:Disconnect() Connections.PlayerAdded = nil end
            if Connections.PlayerRemoving then Connections.PlayerRemoving:Disconnect() Connections.PlayerRemoving = nil end
            for plr, _ in pairs(ESPObjects) do
                removeESP(plr)
            end
            ESPObjects = {}
            Notify("视觉", "ESP 已关闭", 3)
        end
    end,
})

VisualTab:Divider()

-- 全亮
VisualTab:Toggle({
    Title = "全亮 (FullBright)",
    Default = false,
    Callback = function(val)
        if val then
            Lighting.GlobalShadows = false
            Lighting.Brightness = 2
            Lighting.ClockTime = 12
            Lighting.FogEnd = 1e9
            Notify("视觉", "全亮已开启", 3)
        else
            Lighting.GlobalShadows = true
            Lighting.Brightness = 1
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Notify("视觉", "全亮已关闭", 3)
        end
    end,
})

-- FPS 优化
VisualTab:Button({
    Title = "FPS 优化",
    Callback = function()
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 1e9
        pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
        Notify("视觉", "FPS 已优化", 3)
    end,
})

--========================================================
-- Tab5: 传送
--========================================================
local TeleTab = Window:Tab({
    Title = "传送",
    Icon = "map-pin",
})

TeleTab:Section({ Title = "玩家传送", TextXAlignment = "Left", TextSize = 17 })

local teleportTarget = nil
local function getPlayerNames()
    local names = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(names, plr.Name)
        end
    end
    return names
end

TeleTab:Dropdown({
    Title = "选择目标",
    Values = getPlayerNames(),
    Callback = function(val) teleportTarget = val end,
})

TeleTab:Button({
    Title = "传送到玩家",
    Callback = function()
        if teleportTarget then
            local target = Players:FindFirstChild(teleportTarget)
            if target and target.Character then
                local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
                local myRoot = GetRoot()
                if targetRoot and myRoot then
                    myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 5)
                    Notify("传送", "已传送到 " .. teleportTarget, 3)
                end
            else
                Notify("传送", "目标不存在", 3)
            end
        else
            Notify("传送", "请先选择目标", 3)
        end
    end,
})

TeleTab:Button({
    Title = "刷新玩家列表",
    Callback = function()
        Notify("传送", "请重新打开下拉框", 3)
    end,
})

TeleTab:Divider()

-- 坐标传送
local tpX, tpY, tpZ = 0, 0, 0
TeleTab:Input({
    Title = "X 坐标",
    Placeholder = "输入 X",
    Callback = function(val) tpX = tonumber(val) or 0 end,
})

TeleTab:Input({
    Title = "Y 坐标",
    Placeholder = "输入 Y",
    Callback = function(val) tpY = tonumber(val) or 0 end,
})

TeleTab:Input({
    Title = "Z 坐标",
    Placeholder = "输入 Z",
    Callback = function(val) tpZ = tonumber(val) or 0 end,
})

TeleTab:Button({
    Title = "传送到坐标",
    Callback = function()
        local root = GetRoot()
        if root then
            root.CFrame = CFrame.new(tpX, tpY, tpZ)
            Notify("传送", "已传送到 " .. tpX .. ", " .. tpY .. ", " .. tpZ, 3)
        end
    end,
})

--========================================================
-- Tab6: 设置
--========================================================
local SetTab = Window:Tab({
    Title = "设置",
    Icon = "settings",
})

SetTab:Dropdown({
    Title = "主题",
    Values = { "Dark", "Light", "Pink", "Violet", "Ocean" },
    Callback = function(val)
        pcall(function() WindUI:SetTheme(val) end)
    end,
})

SetTab:Divider()

SetTab:Button({
    Title = "销毁脚本",
    Callback = function()
        -- 断开所有连接
        for name, conn in pairs(Connections) do
            if conn then pcall(function() conn:Disconnect() end) end
        end
        Connections = {}
        -- 清理 ESP
        for plr, _ in pairs(ESPObjects) do
            removeESP(plr)
        end
        ESPObjects = {}
        -- 飞行清理
        local root = GetRoot()
        if root then
            local bv = root:FindFirstChild("FlyVelocity")
            if bv then bv:Destroy() end
        end
        -- 重置属性
        local h = GetHum()
        if h then
            h.WalkSpeed = 16
            h.JumpPower = 50
            h.PlatformStand = false
        end
        Workspace.Gravity = 196.2
        Camera.FieldOfView = 70
        -- 销毁 UI
        local ui = game:GetService("CoreGui"):FindFirstChild("WindUI")
        if ui then ui:Destroy() end
    end,
})

--========================================================
-- 启动
--========================================================
Notify("欢迎使用", "战争大亨脚本已加载", 5)
task.wait(1)
Notify("战争大亨", "v1.0 加载完成", 3)
