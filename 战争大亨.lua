--========================================================
-- 战争大亨脚本 v1.0
-- 使用 WindUI 框架
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
    NoFallDamage = false,
    AimbotEnabled = false,
    BulletTracer = false,
    OneHitKill = false,
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

--=========== 秒互动 ===========
local function SetPromptHoldDuration(parent, duration)
    for _, desc in ipairs(parent:GetDescendants()) do
        if desc:IsA("ProximityPrompt") then
            desc.HoldDuration = duration
        end
    end
end

local F = {
    Active = false,
    Connection = nil,
    Bind = nil,
    Enable = function()
        F.Active = true
        local promptService = game:GetService("ProximityPromptService")
        F.Bind = promptService.PromptButtonHoldBegan:Connect(function(prompt)
            prompt.HoldDuration = 0.01
        end)
        SetPromptHoldDuration(Workspace, 0.01)
        F.Connection = Workspace.DescendantAdded:Connect(function(desc)
            if desc:IsA("ProximityPrompt") and F.Active then
                desc.HoldDuration = 0.01
            end
        end)
    end,
    Disable = function()
        F.Active = false
        if F.Bind then F.Bind:Disconnect(); F.Bind = nil end
        if F.Connection then F.Connection:Disconnect(); F.Connection = nil end
        SetPromptHoldDuration(Workspace, 0.5)
    end
}

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

CombatTab:Section({ Title = "武器功能", TextXAlignment = "Left", TextSize = 17 })

-- 扫描武器信息
CombatTab:Button({
    Title = "扫描武器信息 (输出到通知)",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local info = {}

        -- 1. 搜索角色里的 Tool
        local char = GetChar()
        if char then
            for _, tool in ipairs(char:GetChildren()) do
                if tool:IsA("Tool") then
                    table.insert(info, "Tool: " .. tool.Name)
                    for _, d in ipairs(tool:GetDescendants()) do
                        if d:IsA("RemoteEvent") or d:IsA("RemoteFunction") then
                            table.insert(info, "  Remote: " .. d:GetFullName())
                        elseif d:IsA("ValueBase") then
                            table.insert(info, "  Value: " .. d.Name .. " = " .. tostring(d.Value))
                        end
                    end
                end
            end
        end

        -- 2. 搜索 Backpack
        local bp = LocalPlayer:FindFirstChild("Backpack")
        if bp then
            for _, tool in ipairs(bp:GetChildren()) do
                if tool:IsA("Tool") then
                    table.insert(info, "Backpack Tool: " .. tool.Name)
                end
            end
        end

        -- 3. 搜索 ReplicatedStorage 里的 Remote
        for _, d in ipairs(ReplicatedStorage:GetDescendants()) do
            if d:IsA("RemoteEvent") or d:IsA("RemoteFunction") then
                local ln = string.lower(d.Name)
                if string.find(ln, "fire") or string.find(ln, "shoot") or string.find(ln, "weapon") or string.find(ln, "gun") or string.find(ln, "ammo") then
                    table.insert(info, "RS Remote: " .. d:GetFullName())
                end
            end
        end

        -- 4. 搜索 leaderstats
        local ls = LocalPlayer:FindFirstChild("leaderstats")
        if ls then
            for _, v in ipairs(ls:GetChildren()) do
                table.insert(info, "Stat: " .. v.Name .. " = " .. tostring(v.Value))
            end
        end

        local msg = table.concat(info, "\n")
        if msg == "" then msg = "未找到任何武器相关信息" end
        Notify("扫描结果", msg, 10)
    end,
})

CombatTab:Divider()

-- 通用武器射击 (模拟点击+激活+Remote搜索)
local weaponFire = nil
CombatTab:Toggle({
    Title = "自动射击 (全兼容)",
    Default = false,
    Callback = function(val)
        State.AutoFire = val
        if val then
            Notify("战斗", "自动射击已开启", 3)
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local fireKeywords = {"fire", "shoot", "attack", "click", "gun", "weapon"}
            local lastFire = 0

            weaponFire = RunService.Heartbeat:Connect(function()
                local now = tick()
                if now - lastFire < 0.1 then return end
                lastFire = now

                local char = GetChar()
                if not char then return end

                -- 方法1: 模拟鼠标点击 (weapon activate)
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    pcall(function() tool:Activate() end)
                end

                -- 方法2: 模拟鼠标左键点击
                pcall(function()
                    local mouse = LocalPlayer:GetMouse()
                    if tool and mouse then
                        VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 0, true, game, 1)
                        VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 0, false, game, 1)
                    end
                end)

                -- 方法3: 搜索角色内 Tool 的所有 Remote
                if tool then
                    for _, desc in ipairs(tool:GetDescendants()) do
                        pcall(function()
                            if desc:IsA("RemoteEvent") then
                                local ln = string.lower(desc.Name)
                                for _, kw in ipairs(fireKeywords) do
                                    if string.find(ln, kw) then
                                        desc:FireServer()
                                        break
                                    end
                                end
                            elseif desc:IsA("RemoteFunction") then
                                local ln = string.lower(desc.Name)
                                for _, kw in ipairs(fireKeywords) do
                                    if string.find(ln, kw) then
                                        desc:InvokeServer()
                                        break
                                    end
                                end
                            end
                        end)
                    end
                end

                -- 方法4: 搜索 ReplicatedStorage 里的射击 Remote
                pcall(function()
                    for _, desc in ipairs(ReplicatedStorage:GetDescendants()) do
                        if desc:IsA("RemoteEvent") then
                            local ln = string.lower(desc.Name)
                            for _, kw in ipairs(fireKeywords) do
                                if string.find(ln, kw) then
                                    desc:FireServer()
                                    break
                                end
                            end
                        end
                    end
                end)
            end)
        else
            if weaponFire then weaponFire:Disconnect() weaponFire = nil end
            Notify("战斗", "自动射击已关闭", 3)
        end
    end,
})

-- 通用无限弹药 (ACS框架精准适配)
local ammoLoop = nil
CombatTab:Toggle({
    Title = "无限弹药",
    Default = false,
    Callback = function(val)
        State.InfiniteAmmo = val
        if val then
            Notify("战斗", "无限弹药已开启", 3)
            local ReplicatedStorage = game:GetService("ReplicatedStorage")

            -- 方法1: 破坏 Reload Remote (让换弹系统失效)
            pcall(function()
                local gunReload = ReplicatedStorage:FindFirstChild("BulletFireSystem")
                    and ReplicatedStorage.BulletFireSystem:FindFirstChild("GunReload")
                if gunReload then
                    gunReload:Destroy()
                    local fake = Instance.new("Part")
                    fake.Name = "GunReload"
                    fake.Parent = ReplicatedStorage.BulletFireSystem
                end
            end)

            -- 方法2: 持续设置弹药值
            ammoLoop = RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if not char then return end

                for _, tool in ipairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        pcall(function()
                            -- ACS框架: tool.ACS_Modulo.Variaveis.Ammo
                            local acsMod = tool:FindFirstChild("ACS_Modulo")
                            if acsMod then
                                local vars = acsMod:FindFirstChild("Variaveis")
                                if vars then
                                    local ammo = vars:FindFirstChild("Ammo")
                                    if ammo then ammo.Value = 9999 end
                                    local maxAmmo = vars:FindFirstChild("MaxAmmo")
                                    if maxAmmo then maxAmmo.Value = 9999 end
                                    local reserve = vars:FindFirstChild("ReserveAmmo")
                                    if reserve then reserve.Value = 9999 end
                                end
                            end

                            -- 通用搜索: 找所有弹药相关值
                            for _, desc in ipairs(tool:GetDescendants()) do
                                if desc:IsA("ValueBase") then
                                    local ln = string.lower(desc.Name)
                                    if string.find(ln, "ammo") or string.find(ln, "mag") or string.find(ln, "clip") or string.find(ln, "bullet") then
                                        desc.Value = 9999
                                    end
                                end
                            end

                            -- Attributes
                            local attrs = tool:GetAttributes()
                            for k, v in pairs(attrs) do
                                local lk = string.lower(k)
                                if string.find(lk, "ammo") or string.find(lk, "mag") or string.find(lk, "clip") then
                                    tool:SetAttribute(k, 9999)
                                end
                            end
                        end)
                    end
                end

                -- 也搜索 Backpack
                local bp = LocalPlayer:FindFirstChild("Backpack")
                if bp then
                    for _, tool in ipairs(bp:GetChildren()) do
                        if tool:IsA("Tool") then
                            pcall(function()
                                local acsMod = tool:FindFirstChild("ACS_Modulo")
                                if acsMod then
                                    local vars = acsMod:FindFirstChild("Variaveis")
                                    if vars then
                                        local ammo = vars:FindFirstChild("Ammo")
                                        if ammo then ammo.Value = 9999 end
                                    end
                                end
                            end)
                        end
                    end
                end
            end)
        else
            if ammoLoop then ammoLoop:Disconnect() ammoLoop = nil end
            Notify("战斗", "无限弹药已关闭", 3)
        end
    end,
})

-- 通用无后坐力 (ACS框架精准适配)
local noRecoilLoop = nil
CombatTab:Toggle({
    Title = "无后坐力",
    Default = false,
    Callback = function(val)
        State.NoRecoil = val
        if val then
            Notify("战斗", "无后坐力已开启", 3)
            noRecoilLoop = RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if not char then return end

                for _, tool in ipairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        pcall(function()
                            -- ACS框架: tool.ACS_Modulo.Variaveis 里的后坐力值
                            local acsMod = tool:FindFirstChild("ACS_Modulo")
                            if acsMod then
                                local vars = acsMod:FindFirstChild("Variaveis")
                                if vars then
                                    -- 设置后坐力相关值
                                    local recoil = vars:FindFirstChild("Recoil")
                                    if recoil then recoil.Value = 0 end
                                    local kick = vars:FindFirstChild("Kick")
                                    if kick then kick.Value = 0 end
                                    local spread = vars:FindFirstChild("Spread")
                                    if spread then spread.Value = 0 end
                                    local hipSpread = vars:FindFirstChild("HipFireSpread")
                                    if hipSpread then hipSpread.Value = 0 end
                                    local bloom = vars:FindFirstChild("Bloom")
                                    if bloom then bloom.Value = 0 end
                                    local camShake = vars:FindFirstChild("CameraShake")
                                    if camShake then camShake.Value = 0 end
                                    local deviation = vars:FindFirstChild("Deviation")
                                    if deviation then deviation.Value = 0 end
                                    local sway = vars:FindFirstChild("Sway")
                                    if sway then sway.Value = 0 end
                                    -- 提高准确度
                                    local accuracy = vars:FindFirstChild("Accuracy")
                                    if accuracy then accuracy.Value = 100 end
                                    -- 提高射程
                                    local range = vars:FindFirstChild("Range")
                                    if range then range.Value = 9999 end
                                    -- 提高射速
                                    local firerate = vars:FindFirstChild("FireRate")
                                    if firerate then firerate.Value = 9999 end
                                    local cooldown = vars:FindFirstChild("Cooldown")
                                    if cooldown then cooldown.Value = 0 end
                                end
                            end

                            -- 通用搜索: 找所有后坐力相关值
                            for _, desc in ipairs(tool:GetDescendants()) do
                                if desc:IsA("ValueBase") then
                                    local ln = string.lower(desc.Name)
                                    if string.find(ln, "recoil") or string.find(ln, "kick")
                                        or string.find(ln, "spread") or string.find(ln, "bloom")
                                        or string.find(ln, "shake") or string.find(ln, "deviation")
                                        or string.find(ln, "sway") then
                                        desc.Value = 0
                                    end
                                end
                            end

                            -- Attributes
                            local attrs = tool:GetAttributes()
                            for k, v in pairs(attrs) do
                                local lk = string.lower(k)
                                if string.find(lk, "recoil") or string.find(lk, "kick")
                                    or string.find(lk, "spread") or string.find(lk, "bloom")
                                    or string.find(lk, "shake") or string.find(lk, "deviation") then
                                    tool:SetAttribute(k, 0)
                                end
                            end
                        end)
                    end
                end
            end)
        else
            if noRecoilLoop then noRecoilLoop:Disconnect() noRecoilLoop = nil end
            Notify("战斗", "无后坐力已关闭", 3)
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
                        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.Size = Vector3.new(8, 8, 8)
                            hrp.Transparency = 0.5
                            hrp.CanCollide = false
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
        end
    end,
})

-- 自瞄 (Aimbot)
local aimbotConn = nil
local aimbotTarget = nil

local function getClosestPlayerToFov()
    local closestPlr = nil
    local shortestDist = math.huge
    local mousePos = UserInputService:GetMouseLocation()
    local viewport = Camera.ViewportSize
    local center = Vector2.new(viewport.X / 2, viewport.Y / 2)

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if (head or hrp) and hum and hum.Health > 0 then
                local targetPart = head or hrp
                local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                    if dist < shortestDist and dist <= 150 then
                        shortestDist = dist
                        closestPlr = plr
                    end
                end
            end
        end
    end
    return closestPlr
end

CombatTab:Toggle({
    Title = "自瞄 (Aimbot)",
    Default = false,
    Callback = function(val)
        State.AimbotEnabled = val
        if val then
            Notify("战斗", "自瞄已开启 (按住右键激活)", 3)
            aimbotConn = RunService.RenderStepped:Connect(function()
                if not State.AimbotEnabled then return end
                -- 仅在按住右键时自瞄
                if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end

                local target = getClosestPlayerToFov()
                if target and target.Character then
                    local head = target.Character:FindFirstChild("Head")
                    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
                    local hum = target.Character:FindFirstChildOfClass("Humanoid")
                    if (head or hrp) and hum and hum.Health > 0 then
                        local targetPart = head or hrp
                        local root = GetRoot()
                        if root then
                            -- 平滑锁定相机到目标
                            local targetPos = targetPart.Position
                            local camPos = Camera.CFrame.Position
                            local lookCFrame = CFrame.new(camPos, targetPos)
                            -- 使用平滑插值，避免瞬移
                            Camera.CFrame = Camera.CFrame:Lerp(lookCFrame, 0.4)
                        end
                    end
                end
            end)
        else
            if aimbotConn then aimbotConn:Disconnect() aimbotConn = nil end
            aimbotTarget = nil
            Notify("战斗", "自瞄已关闭", 3)
        end
    end,
})

-- 子弹追踪 (Bullet Tracer)
local tracerConn = nil
local tracersFolder = nil

local function createTracer(startPos, endPos, color)
    local beam = Instance.new("Part")
    beam.Name = "BulletTracer"
    beam.Anchored = true
    beam.CanCollide = false
    beam.CanQuery = false
    beam.Material = Enum.Material.Neon
    beam.Color = color or Color3.fromRGB(255, 200, 50)
    beam.Transparency = 0.2
    beam.Shape = Enum.PartType.Cylinder
    beam.Parent = tracersFolder

    local distance = (startPos - endPos).Magnitude
    local midPoint = (startPos + endPos) / 2

    beam.Size = Vector3.new(distance, 0.15, 0.15)
    beam.CFrame = CFrame.new(midPoint, endPos) * CFrame.Angles(0, math.rad(90), 0)

    -- 淡出效果
    task.spawn(function()
        local transparency = 0.2
        for i = 1, 20 do
            transparency = transparency + 0.04
            beam.Transparency = transparency
            beam.Size = Vector3.new(distance, 0.15 * (1 - i / 20), 0.15 * (1 - i / 20))
            task.wait(0.03)
        end
        beam:Destroy()
    end)
end

CombatTab:Toggle({
    Title = "子弹追踪 (Tracer)",
    Default = false,
    Callback = function(val)
        State.BulletTracer = val
        if val then
            Notify("战斗", "子弹追踪已开启", 3)

            -- 创建存放 Tracer 的文件夹
            tracersFolder = Workspace:FindFirstChild("BulletTracers")
            if not tracersFolder then
                tracersFolder = Instance.new("Folder")
                tracersFolder.Name = "BulletTracers"
                tracersFolder.Parent = Workspace
            end

            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local lastTracerTime = 0

            -- 方法1: 监听 ACS 框架的 BulletFire Remote
            tracerConn = RunService.Heartbeat:Connect(function()
                if not State.BulletTracer then return end

                local char = GetChar()
                if not char then return end

                local now = tick()
                if now - lastTracerTime < 0.05 then return end

                -- 检测射击: 检查是否有 Tool 被激活
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    local handle = tool:FindFirstChild("Handle")
                    local muzzle = tool:FindFirstChild("Muzzle") or handle
                    local root = char:FindFirstChild("HumanoidRootPart")

                    if muzzle and root then
                        -- 检测鼠标点击射击
                        local mouse = LocalPlayer:GetMouse()
                        local mouseHit = mouse.Hit.Position

                        -- 从枪口到鼠标指向位置画线
                        if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                            lastTracerTime = now
                            local startPos = muzzle.Position
                            createTracer(startPos, mouseHit)
                        end
                    end
                end

                -- 方法2: 监听其他玩家的射击 (通过检测 BulletFire Remote)
                -- 搜索 ACS 框架的 BulletFire 事件
                pcall(function()
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character then
                            local tool = plr.Character:FindFirstChildOfClass("Tool")
                            if tool then
                                local handle = tool:FindFirstChild("Handle")
                                local muzzle = tool:FindFirstChild("Muzzle") or handle
                                local head = plr.Character:FindFirstChild("Head")
                                if muzzle and head then
                                    -- 检测该玩家是否在射击 (通过 ACS 模块检测)
                                    local acsMod = tool:FindFirstChild("ACS_Modulo")
                                    if acsMod then
                                        local vars = acsMod:FindFirstChild("Variaveis")
                                        if vars then
                                            local ammo = vars:FindFirstChild("Ammo")
                                            -- 如果弹药在减少，说明在射击
                                            if ammo then
                                                local key = plr.Name .. "_ammo"
                                                local prevAmmo = _G[key] or ammo.Value
                                                if ammo.Value < prevAmmo then
                                                    lastTracerTime = now
                                                    -- 计算射击方向 (朝向最近的敌人或鼠标方向)
                                                    local startPos = muzzle.Position
                                                    local dir = head.CFrame.LookVector
                                                    local endPos = startPos + dir * 300
                                                    createTracer(startPos, endPos, Color3.fromRGB(255, 100, 100))
                                                end
                                                _G[key] = ammo.Value
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end)
        else
            if tracerConn then tracerConn:Disconnect() tracerConn = nil end
            if tracersFolder then
                tracersFolder:ClearAllChildren()
            end
            Notify("战斗", "子弹追踪已关闭", 3)
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

-- 秒互动
PlayerTab:Toggle({
    Title = "秒互动",
    Default = false,
    Callback = function(val)
        if val then
            F.Enable()
            Notify("玩家", "秒互动已开启", 3)
        else
            F.Disable()
            Notify("玩家", "秒互动已关闭", 3)
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

-- 摔落无伤害
PlayerTab:Toggle({
    Title = "摔落无伤害",
    Default = false,
    Callback = function(val)
        State.NoFallDamage = val
        if val then
            Notify("玩家", "已开启摔落无伤害", 3)

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

            Connections.NoFallDamage = LocalPlayer.CharacterAdded:Connect(function(char)
                task.wait(0.3)
                if State.NoFallDamage then
                    setupFall(char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid"))
                end
            end)
        else
            if Connections.NoFallDamage then Connections.NoFallDamage:Disconnect() Connections.NoFallDamage = nil end
            Notify("玩家", "已关闭摔落无伤害", 3)
        end
    end,
})

PlayerTab:Divider()

-- 飞行脚本 V3（全游戏通用）
local flyV3Loaded = false
PlayerTab:Button({
    Title = "飞行脚本 V3 (弹出独立面板)",
    Callback = function()
        if flyV3Loaded then
            Notify("飞行", "飞行面板已打开，请用面板上的按钮控制", 3)
            return
        end
        flyV3Loaded = true

        local main = Instance.new("ScreenGui")
        main.Name = "FlyV3GUI"
        main.Parent = LocalPlayer:WaitForChild("PlayerGui")
        main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        main.ResetOnSpawn = false

        local Frame = Instance.new("Frame")
        Frame.Parent = main
        Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
        Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
        Frame.Position = UDim2.new(0.100, 0, 0.380, 0)
        Frame.Size = UDim2.new(0, 190, 0, 57)
        Frame.Active = true
        Frame.Draggable = true

        local up = Instance.new("TextButton")
        up.Name = "up"
        up.Parent = Frame
        up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
        up.Size = UDim2.new(0, 44, 0, 28)
        up.Font = Enum.Font.SourceSans
        up.Text = "up"
        up.TextColor3 = Color3.fromRGB(0, 0, 0)
        up.TextSize = 14

        local down = Instance.new("TextButton")
        down.Name = "down"
        down.Parent = Frame
        down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
        down.Position = UDim2.new(0, 0, 0.491, 0)
        down.Size = UDim2.new(0, 44, 0, 28)
        down.Font = Enum.Font.SourceSans
        down.Text = "down"
        down.TextColor3 = Color3.fromRGB(0, 0, 0)
        down.TextSize = 14

        local onof = Instance.new("TextButton")
        onof.Name = "onof"
        onof.Parent = Frame
        onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
        onof.Position = UDim2.new(0.703, 0, 0.491, 0)
        onof.Size = UDim2.new(0, 56, 0, 28)
        onof.Font = Enum.Font.SourceSans
        onof.Text = "fly"
        onof.TextColor3 = Color3.fromRGB(0, 0, 0)
        onof.TextSize = 14

        local TextLabel = Instance.new("TextLabel")
        TextLabel.Parent = Frame
        TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
        TextLabel.Position = UDim2.new(0.469, 0, 0, 0)
        TextLabel.Size = UDim2.new(0, 100, 0, 28)
        TextLabel.Font = Enum.Font.SourceSans
        TextLabel.Text = "Fly GUI V3"
        TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.TextScaled = true
        TextLabel.TextWrapped = true

        local plus = Instance.new("TextButton")
        plus.Name = "plus"
        plus.Parent = Frame
        plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
        plus.Position = UDim2.new(0.232, 0, 0, 0)
        plus.Size = UDim2.new(0, 45, 0, 28)
        plus.Font = Enum.Font.SourceSans
        plus.Text = "+"
        plus.TextColor3 = Color3.fromRGB(0, 0, 0)
        plus.TextScaled = true
        plus.TextWrapped = true

        local speed = Instance.new("TextLabel")
        speed.Name = "speed"
        speed.Parent = Frame
        speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
        speed.Position = UDim2.new(0.468, 0, 0.491, 0)
        speed.Size = UDim2.new(0, 44, 0, 28)
        speed.Font = Enum.Font.SourceSans
        speed.Text = "1"
        speed.TextColor3 = Color3.fromRGB(0, 0, 0)
        speed.TextScaled = true
        speed.TextWrapped = true

        local mine = Instance.new("TextButton")
        mine.Name = "mine"
        mine.Parent = Frame
        mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
        mine.Position = UDim2.new(0.232, 0, 0.491, 0)
        mine.Size = UDim2.new(0, 45, 0, 29)
        mine.Font = Enum.Font.SourceSans
        mine.Text = "-"
        mine.TextColor3 = Color3.fromRGB(0, 0, 0)
        mine.TextScaled = true
        mine.TextWrapped = true

        local closebutton = Instance.new("TextButton")
        closebutton.Name = "Close"
        closebutton.Parent = Frame
        closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
        closebutton.Font = Enum.Font.SourceSans
        closebutton.Size = UDim2.new(0, 45, 0, 28)
        closebutton.Text = "X"
        closebutton.TextSize = 30
        closebutton.Position = UDim2.new(0, 0, -1, 27)

        local mini = Instance.new("TextButton")
        mini.Name = "minimize"
        mini.Parent = Frame
        mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
        mini.Font = Enum.Font.SourceSans
        mini.Size = UDim2.new(0, 45, 0, 28)
        mini.Text = "T"
        mini.TextSize = 30
        mini.Position = UDim2.new(0, 44, -1, 27)

        local mini2 = Instance.new("TextButton")
        mini2.Name = "minimize2"
        mini2.Parent = Frame
        mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
        mini2.Font = Enum.Font.SourceSans
        mini2.Size = UDim2.new(0, 45, 0, 28)
        mini2.Text = "T"
        mini2.TextSize = 30
        mini2.Position = UDim2.new(0, 44, -1, 57)
        mini2.Visible = false

        local speeds = 1
        local speaker = LocalPlayer
        local nowe = false
        local tpwalking = false

        Notify("飞行", "Fly GUI V3 已加载", 3)

        -- fly toggle
        onof.MouseButton1Down:Connect(function()
            if nowe == true then
                nowe = false
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
            else
                nowe = true
                for i = 1, speeds do
                    task.spawn(function()
                        local hb = RunService.Heartbeat
                        tpwalking = true
                        local chr = speaker.Character
                        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                        while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                            if hum.MoveDirection.Magnitude > 0 then
                                chr:TranslateBy(hum.MoveDirection)
                            end
                        end
                    end)
                end
                speaker.Character.Animate.Disabled = true
                local Char = speaker.Character
                local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
                for _, v in next, Hum:GetPlayingAnimationTracks() do
                    v:AdjustSpeed(0)
                end
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
            end

            -- R6 / R15 飞行
            local rigType = speaker.Character:FindFirstChildOfClass("Humanoid").RigType
            local isR6 = rigType == Enum.HumanoidRigType.R6
            local torso = isR6 and speaker.Character.Torso or speaker.Character.UpperTorso

            local flying = true
            local ctrl = {f = 0, b = 0, l = 0, r = 0}
            local lastctrl = {f = 0, b = 0, l = 0, r = 0}
            local maxspeed = 50
            local fspeed = 0

            local bg = Instance.new("BodyGyro", torso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = torso.CFrame
            local bv = Instance.new("BodyVelocity", torso)
            bv.velocity = Vector3.new(0, 0.1, 0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            if nowe == true then
                speaker.Character.Humanoid.PlatformStand = true
            end
            task.spawn(function()
                while nowe == true and speaker.Character and speaker.Character:FindFirstChildOfClass("Humanoid") and speaker.Character:FindFirstChildOfClass("Humanoid").Health > 0 do
                    RunService.RenderStepped:Wait()
                    if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                        fspeed = fspeed + 0.5 + (fspeed / maxspeed)
                        if fspeed > maxspeed then fspeed = maxspeed end
                    elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and fspeed ~= 0 then
                        fspeed = fspeed - 1
                        if fspeed < 0 then fspeed = 0 end
                    end
                    if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                        bv.velocity = ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p) - Workspace.CurrentCamera.CoordinateFrame.p)) * fspeed
                        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                    elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and fspeed ~= 0 then
                        bv.velocity = ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + ((Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * 0.2, 0).p) - Workspace.CurrentCamera.CoordinateFrame.p)) * fspeed
                    else
                        bv.velocity = Vector3.new(0, 0, 0)
                    end
                    bg.cframe = Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * fspeed / maxspeed), 0, 0)
                end
                ctrl = {f = 0, b = 0, l = 0, r = 0}
                lastctrl = {f = 0, b = 0, l = 0, r = 0}
                fspeed = 0
                if bg then bg:Destroy() end
                if bv then bv:Destroy() end
                if speaker.Character and speaker.Character:FindFirstChildOfClass("Humanoid") then
                    speaker.Character.Humanoid.PlatformStand = false
                end
                if speaker.Character and speaker.Character:FindFirstChild("Animate") then
                    speaker.Character.Animate.Disabled = false
                end
                tpwalking = false
            end)
        end)

        -- up button
        local tis
        up.MouseButton1Down:Connect(function()
            tis = up.MouseEnter:Connect(function()
                while tis do
                    task.wait()
                    if speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
                        speaker.Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
                    end
                end
            end)
        end)
        up.MouseLeave:Connect(function()
            if tis then tis:Disconnect() tis = nil end
        end)

        -- down button
        local dis
        down.MouseButton1Down:Connect(function()
            dis = down.MouseEnter:Connect(function()
                while dis do
                    task.wait()
                    if speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
                        speaker.Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
                    end
                end
            end)
        end)
        down.MouseLeave:Connect(function()
            if dis then dis:Disconnect() dis = nil end
        end)

        -- speed +
        plus.MouseButton1Down:Connect(function()
            speeds = speeds + 1
            speed.Text = speeds
            if nowe == true then
                tpwalking = false
                for i = 1, speeds do
                    task.spawn(function()
                        local hb = RunService.Heartbeat
                        tpwalking = true
                        local chr = speaker.Character
                        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                        while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                            if hum.MoveDirection.Magnitude > 0 then
                                chr:TranslateBy(hum.MoveDirection)
                            end
                        end
                    end)
                end
            end
        end)

        -- speed -
        mine.MouseButton1Down:Connect(function()
            if speeds == 1 then
                speed.Text = 'flyno1'
                task.wait(1)
                speed.Text = speeds
            else
                speeds = speeds - 1
                speed.Text = speeds
                if nowe == true then
                    tpwalking = false
                    for i = 1, speeds do
                        task.spawn(function()
                            local hb = RunService.Heartbeat
                            tpwalking = true
                            local chr = speaker.Character
                            local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                            while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                                if hum.MoveDirection.Magnitude > 0 then
                                    chr:TranslateBy(hum.MoveDirection)
                                end
                            end
                        end)
                    end
                end
            end
        end)

        -- close
        closebutton.MouseButton1Click:Connect(function()
            nowe = false
            tpwalking = false
            main:Destroy()
            flyV3Loaded = false
        end)

        -- minimize
        mini.MouseButton1Click:Connect(function()
            up.Visible = false
            down.Visible = false
            onof.Visible = false
            plus.Visible = false
            speed.Visible = false
            mine.Visible = false
            mini.Visible = false
            mini2.Visible = true
            Frame.BackgroundTransparency = 1
            closebutton.Position = UDim2.new(0, 0, -1, 57)
        end)

        mini2.MouseButton1Click:Connect(function()
            up.Visible = true
            down.Visible = true
            onof.Visible = true
            plus.Visible = true
            speed.Visible = true
            mine.Visible = true
            mini.Visible = true
            mini2.Visible = false
            Frame.BackgroundTransparency = 0
            closebutton.Position = UDim2.new(0, 0, -1, 27)
        end)

        -- CharacterAdded reset
        speaker.CharacterAdded:Connect(function(char)
            task.wait(0.7)
            if char:FindFirstChildOfClass("Humanoid") then
                char.Humanoid.PlatformStand = false
            end
            if char:FindFirstChild("Animate") then
                char.Animate.Disabled = false
            end
        end)
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
        -- 飞行 V3 清理
        local flyGui = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("FlyV3GUI")
        if flyGui then flyGui:Destroy() end
        flyV3Loaded = false
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
