--[[
    速度传奇 Speed Legend
    使用 WindUI 框架
    手机端兼容
]]

-- ============================================================
-- 加载 WindUI
-- ============================================================
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()

-- ============================================================
-- 服务引用
-- ============================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- ============================================================
-- 本地变量
-- ============================================================
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- ============================================================
-- 状态表
-- ============================================================
local State = {
    -- 自动
    AutoTrain = false,
    AutoRebirth = false,
    AutoBuyShoe = false,
    AutoBuyPet = false,
    AutoHatch = false,
    AutoCollectCoin = false,
    AutoQuest = false,
    -- 玩家
    WalkSpeed = 16,
    JumpPower = 50,
    InfiniteJump = false,
    Noclip = false,
    GodMode = false,
    NoFallDamage = false,
    Fly = false,
    -- 视觉
    PlayerESP = false,
    ItemESP = false,
    FullHighlight = false,
    -- 传送
    HoldTeleport = false,
    -- 实用
    AntiAFK = false,
    GraphicsBoost = false,
}

local Connections = {}
local ESPObjects = {}

-- 前置声明 (这些对象在后面才创建, 但卸载函数需要引用)
local Window
local TimeLabelGui

-- ============================================================
-- 辅助函数
-- ============================================================
local function GetChar()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function GetRoot()
    local char = GetChar()
    if char then
        return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
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

-- ============================================================
-- Remote / Part 搜索
-- ============================================================
local function FindRemoteAny(keywords)
    local lowers = {}
    for _, k in ipairs(keywords) do table.insert(lowers, string.lower(k)) end
    local function search(parent)
        for _, v in ipairs(parent:GetDescendants()) do
            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                local name = string.lower(v.Name)
                for _, kw in ipairs(lowers) do
                    if string.find(name, kw) then
                        return v
                    end
                end
            end
        end
        return nil
    end
    return search(ReplicatedStorage) or search(Workspace)
end

local function FindRemoteAll(keys)
    local lowers = {}
    for _, k in ipairs(keys) do table.insert(lowers, string.lower(k)) end
    local function search(parent)
        for _, v in ipairs(parent:GetDescendants()) do
            if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                local name = string.lower(v.Name)
                local ok = true
                for _, kw in ipairs(lowers) do
                    if not string.find(name, kw) then ok = false break end
                end
                if ok then return v end
            end
        end
        return nil
    end
    return search(ReplicatedStorage) or search(Workspace)
end

local function FireRemote(rem, ...)
    if not rem then return end
    pcall(function(...)
        if rem:IsA("RemoteEvent") then
            rem:FireServer(...)
        elseif rem:IsA("RemoteFunction") then
            pcall(rem.InvokeServer, rem, ...)
        end
    end, ...)
end

local function FindParts(keywords)
    local results = {}
    local lowers = {}
    for _, k in ipairs(keywords) do table.insert(lowers, string.lower(k)) end
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            local name = string.lower(v.Name)
            for _, kw in ipairs(lowers) do
                if string.find(name, kw) then
                    table.insert(results, v)
                    break
                end
            end
        end
    end
    return results
end

local function FindFirstPart(keywords)
    local lowers = {}
    for _, k in ipairs(keywords) do table.insert(lowers, string.lower(k)) end
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            local name = string.lower(v.Name)
            for _, kw in ipairs(lowers) do
                if string.find(name, kw) then return v end
            end
        end
    end
    return nil
end

local function FindFirstModel(keywords)
    local lowers = {}
    for _, k in ipairs(keywords) do table.insert(lowers, string.lower(k)) end
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("Model") then
            local name = string.lower(v.Name)
            for _, kw in ipairs(lowers) do
                if string.find(name, kw) then return v end
            end
        end
    end
    return nil
end

-- ============================================================
-- 自动功能
-- ============================================================
local function AutoTrain()
    local rem = FindRemoteAny({"train", "run", "speed", "velocity", "treadmill"})
    FireRemote(rem)
end

local function AutoRebirth()
    local rem = FindRemoteAny({"rebirth", "prestige", "reset"})
    FireRemote(rem)
end

local function AutoBuyShoe()
    local rem = FindRemoteAll({"buy", "shoe"}) or FindRemoteAll({"buy", "speed"}) or FindRemoteAny({"shoe", "shoes"})
    FireRemote(rem)
end

local function AutoBuyPet()
    local rem = FindRemoteAll({"buy", "pet"}) or FindRemoteAll({"buy", "egg"}) or FindRemoteAny({"pet", "egg"})
    FireRemote(rem)
end

local function AutoHatch()
    local rem = FindRemoteAny({"hatch", "egg"})
    FireRemote(rem)
end

local function AutoCollectCoin()
    local root = GetRoot()
    if not root then return end
    local parts = FindParts({"coin", "cash", "money", "gold"})
    for _, part in ipairs(parts) do
        pcall(function()
            if firetouchinterest then
                firetouchinterest(part, root, 0)
                firetouchinterest(part, root, 1)
            else
                part.CFrame = root.CFrame
            end
        end)
    end
end

local function AutoQuest()
    local rem = FindRemoteAny({"quest", "mission", "claim"})
    FireRemote(rem)
end

local function StartAutoLoop(key, func)
    Connections[key] = task.spawn(function()
        while State[key] do
            pcall(func)
            task.wait(math.random(30, 80) / 100)
        end
    end)
end

local function StopAutoLoop(key)
    State[key] = false
end

-- ============================================================
-- 玩家功能
-- ============================================================
local function SetWalkSpeed(value)
    State.WalkSpeed = value
    local hum = GetHum()
    if hum then hum.WalkSpeed = value end
    if not Connections.WalkSpeedMaintain then
        Connections.WalkSpeedMaintain = RunService.Heartbeat:Connect(function()
            local h = GetHum()
            if h and h.WalkSpeed ~= State.WalkSpeed then
                pcall(function() h.WalkSpeed = State.WalkSpeed end)
            end
        end)
    end
end

local function SetJumpPower(value)
    State.JumpPower = value
    local hum = GetHum()
    if hum then
        pcall(function()
            hum.UseJumpPower = true
            hum.JumpPower = value
        end)
    end
    if not Connections.JumpPowerMaintain then
        Connections.JumpPowerMaintain = RunService.Heartbeat:Connect(function()
            local h = GetHum()
            if h then
                pcall(function()
                    h.UseJumpPower = true
                    if h.JumpPower ~= State.JumpPower then h.JumpPower = State.JumpPower end
                end)
            end
        end)
    end
end

local function ToggleInfiniteJump(enabled)
    if enabled then
        Connections.InfiniteJump = UserInputService.JumpRequest:Connect(function()
            local hum = GetHum()
            if hum then
                pcall(function() hum:ChangeState(Enum.HumanoidStateType.Jumping) end)
            end
        end)
    else
        if Connections.InfiniteJump then Connections.InfiniteJump:Disconnect() Connections.InfiniteJump = nil end
    end
end

local function ToggleNoclip(enabled)
    if enabled then
        Connections.Noclip = RunService.Stepped:Connect(function()
            local char = GetChar()
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if Connections.Noclip then Connections.Noclip:Disconnect() Connections.Noclip = nil end
        local char = GetChar()
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    pcall(function() part.CanCollide = true end)
                end
            end
        end
    end
end

local function ToggleGodMode(enabled)
    if enabled then
        Connections.GodMode = RunService.Heartbeat:Connect(function()
            local hum = GetHum()
            if hum then
                pcall(function()
                    if hum.MaxHealth < 1e9 then hum.MaxHealth = 1e9 end
                    hum.Health = hum.MaxHealth
                end)
            end
        end)
    else
        if Connections.GodMode then Connections.GodMode:Disconnect() Connections.GodMode = nil end
        local hum = GetHum()
        if hum then
            pcall(function()
                hum.MaxHealth = 100
                hum.Health = 100
            end)
        end
    end
end

local function ToggleNoFallDamage(enabled)
    if enabled then
        Connections.NoFallDamage = RunService.Heartbeat:Connect(function()
            local hum = GetHum()
            if hum then
                pcall(function()
                    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                end)
            end
        end)
    else
        if Connections.NoFallDamage then Connections.NoFallDamage:Disconnect() Connections.NoFallDamage = nil end
    end
end

local flyLoaded = false
local FLY_URL = "https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"
local function ToggleFly(enabled)
    State.Fly = enabled
    if enabled then
        if not flyLoaded then
            flyLoaded = true
            pcall(function()
                loadstring(game:HttpGet(FLY_URL))()
            end)
        end
    end
end

-- ============================================================
-- 视觉功能 ESP
-- ============================================================
local function CreateESPBillboard(parent, color, sizeY)
    local gui = Instance.new("BillboardGui")
    gui.Name = "SpeedLegendESP"
    gui.AlwaysOnTop = true
    gui.Size = UDim2.new(0, 200, 0, sizeY or 30)
    gui.StudsOffset = Vector3.new(0, 2.5, 0)
    gui.MaxDistance = 2000
    gui.ResetOnSpawn = false
    gui.LightInfluence = 0
    local label = Instance.new("TextLabel")
    label.Name = "Text"
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.TextColor3 = color or Color3.fromHex("#00BFFF")
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = ""
    label.Parent = gui
    gui.Parent = parent
    return gui, label
end

local function TogglePlayerESP(enabled)
    if enabled then
        Connections.PlayerESP = task.spawn(function()
            while State.PlayerESP do
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local head = plr.Character:FindFirstChild("Head")
                        if head then
                            local key = "p_" .. plr.UserId
                            local gui = ESPObjects[key]
                            if not gui or not gui.Parent or not gui.Parent:IsDescendantOf(game) then
                                gui = CreateESPBillboard(head, Color3.fromHex("#00BFFF"))
                                ESPObjects[key] = gui
                            end
                            local root = GetRoot()
                            local theirRoot = plr.Character:FindFirstChild("HumanoidRootPart")
                            local dist = ""
                            if root and theirRoot then
                                dist = string.format("  [%.0fm]", (root.Position - theirRoot.Position).Magnitude)
                            end
                            gui.Text.Text = plr.DisplayName .. dist
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    else
        if Connections.PlayerESP then Connections.PlayerESP = nil end
        for key in pairs(ESPObjects) do
            if string.sub(key, 1, 2) == "p_" then
                pcall(function() ESPObjects[key]:Destroy() end)
                ESPObjects[key] = nil
            end
        end
    end
end

local function ToggleItemESP(enabled)
    if enabled then
        Connections.ItemESP = task.spawn(function()
            while State.ItemESP do
                local parts = FindParts({"coin", "cash", "money", "gem", "diamond", "chest", "orb", "crystal"})
                for idx, part in ipairs(parts) do
                    if idx > 250 then break end
                    local key = "i_" .. part:GetDebugId()
                    local hl = ESPObjects[key]
                    if not hl or not hl.Parent then
                        hl = Instance.new("Highlight")
                        hl.Name = "SpeedLegendItemESP"
                        hl.FillColor = Color3.fromHex("#FFD700")
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        hl.FillTransparency = 0.5
                        hl.OutlineTransparency = 0
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Adornee = part
                        hl.Parent = part
                        ESPObjects[key] = hl
                    end
                end
                task.wait(0.5)
            end
        end)
    else
        if Connections.ItemESP then Connections.ItemESP = nil end
        for key in pairs(ESPObjects) do
            if string.sub(key, 1, 2) == "i_" then
                pcall(function() ESPObjects[key]:Destroy() end)
                ESPObjects[key] = nil
            end
        end
    end
end

local function ToggleFullHighlight(enabled)
    if enabled then
        Connections.FullHighlight = task.spawn(function()
            while State.FullHighlight do
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if v:IsA("Model") and #v:GetChildren() > 0 then
                        local key = "f_" .. v:GetDebugId()
                        if not ESPObjects[key] then
                            local hl = Instance.new("Highlight")
                            hl.Name = "SpeedLegendFullHL"
                            hl.FillColor = Color3.fromHex("#00BFFF")
                            hl.FillTransparency = 0.75
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                            hl.OutlineTransparency = 0.4
                            hl.Adornee = v
                            hl.Parent = v
                            ESPObjects[key] = hl
                        end
                    end
                    task.wait()
                end
                task.wait(2)
            end
        end)
    else
        if Connections.FullHighlight then Connections.FullHighlight = nil end
        for key in pairs(ESPObjects) do
            if string.sub(key, 1, 2) == "f_" then
                pcall(function() ESPObjects[key]:Destroy() end)
                ESPObjects[key] = nil
            end
        end
    end
end

-- ============================================================
-- 传送功能
-- ============================================================
local function TeleportTo(obj)
    local root = GetRoot()
    if not root or not obj then return false end
    pcall(function()
        local cf
        if obj:IsA("BasePart") then
            cf = obj.CFrame + Vector3.new(0, 3, 0)
        elseif obj:IsA("Model") then
            cf = obj:GetPivot() + Vector3.new(0, 3, 0)
        end
        if cf then root.CFrame = cf end
    end)
    return true
end

local function TeleportByName(keywords, label)
    local part = FindFirstPart(keywords) or FindFirstModel(keywords)
    if part then
        TeleportTo(part)
        Notify("速度传奇", "已传送到: " .. label, 3)
    else
        Notify("速度传奇", "未找到: " .. label, 3)
    end
end

local holdingTP = false
local function ToggleHoldTeleport(enabled)
    if enabled then
        Connections.HoldTPBegin = UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                holdingTP = true
            end
        end)
        Connections.HoldTPEnd = UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                holdingTP = false
            end
        end)
        Connections.HoldTP = RunService.RenderStepped:Connect(function()
            if holdingTP then
                local root = GetRoot()
                if root then
                    local target = Mouse.Hit.Position
                    root.CFrame = root.CFrame:Lerp(CFrame.new(target), 0.25)
                end
            end
        end)
    else
        holdingTP = false
        for _, k in ipairs({"HoldTPBegin", "HoldTPEnd", "HoldTP"}) do
            if Connections[k] then Connections[k]:Disconnect() Connections[k] = nil end
        end
    end
end

-- ============================================================
-- 实用功能
-- ============================================================
local function ToggleAntiAFK(enabled)
    if enabled then
        Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
            end)
        end)
    else
        if Connections.AntiAFK then Connections.AntiAFK:Disconnect() Connections.AntiAFK = nil end
    end
end

local function ToggleGraphicsBoost(enabled)
    if enabled then
        Lighting.GlobalShadows = true
        Lighting.FogEnd = 1e9
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.ExposureCompensation = 0.3
        Lighting.Ambient = Color3.fromRGB(150, 150, 150)
        Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
        pcall(function() Lighting.Technology = Enum.Technology.Future end)
    else
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 100000
        Lighting.Brightness = 1
        Lighting.ExposureCompensation = 0
        Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
    end
end

local function ServerHop()
    Notify("速度传奇", "正在换服...", 3)
    pcall(function()
        local HttpService = game:GetService("HttpService")
        local placeId = game.PlaceId
        local req = (request or http_request or (syn and syn.request))
        local function fetchServers(cursor)
            local url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", placeId)
            if cursor and cursor ~= "" then
                url = url .. "&cursor=" .. cursor
            end
            local resp = req({ Url = url, Method = "GET" })
            return HttpService:JSONDecode(resp.Body)
        end
        local data = fetchServers("")
        local picked
        if data and data.data then
            for _, server in ipairs(data.data) do
                if server.playing and server.maxPlayers and server.playing < server.maxPlayers and server.id ~= game.JobId then
                    picked = server
                    break
                end
            end
        end
        if picked then
            TeleportService:TeleportToPlaceInstance(placeId, picked.id, LocalPlayer)
        else
            Notify("速度传奇", "未找到可用服务器", 4)
        end
    end)
end

local function CopyServerID()
    local jobId = game.JobId
    if jobId == "" then jobId = "未知" end
    pcall(function()
        if setclipboard then setclipboard(jobId) end
    end)
    Notify("速度传奇", "服务器号已复制: " .. jobId, 6)
end

local function CharacterInfo()
    local hum = GetHum()
    local root = GetRoot()
    local info = "未找到角色"
    if hum and root then
        info = string.format(
            "血量: %.0f / %.0f\n速度: %.0f\n跳跃力: %.0f\n位置: %.1f, %.1f, %.1f",
            hum.Health, hum.MaxHealth, hum.WalkSpeed, hum.JumpPower,
            root.Position.X, root.Position.Y, root.Position.Z
        )
    end
    Notify("角色信息", info, 8)
end

local function ClearEffects()
    local count = 0
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("Explosion") then
            pcall(function() v.Enabled = false v:Destroy() end)
            count = count + 1
        end
    end
    Notify("速度传奇", "已清理 " .. count .. " 个特效", 4)
end

local function UnloadScript()
    -- 关闭所有状态
    for k, v in pairs(State) do
        if type(v) == "boolean" then State[k] = false end
    end
    -- 断开所有连接
    for k, conn in pairs(Connections) do
        pcall(function()
            if typeof(conn) == "RBXScriptConnection" then
                conn:Disconnect()
            end
        end)
        Connections[k] = nil
    end
    -- 清理 ESP
    for k, obj in pairs(ESPObjects) do
        pcall(function() obj:Destroy() end)
        ESPObjects[k] = nil
    end
    -- 恢复角色
    pcall(function()
        local hum = GetHum()
        if hum then
            hum.WalkSpeed = 16
            pcall(function() hum.JumpPower = 50 end)
        end
        local char = GetChar()
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then pcall(function() part.CanCollide = true end) end
            end
        end
    end)
    -- 恢复画质
    ToggleGraphicsBoost(false)
    -- 销毁窗口与时间标签
    pcall(function() Window:Destroy() end)
    pcall(function() TimeLabelGui:Destroy() end)
    Notify("速度传奇", "脚本已卸载", 4)
end

-- ============================================================
-- 创建窗口
-- ============================================================
Window = WindUI:CreateWindow({
    Title = "速度传奇",
    Icon = "zap",
    Author = "速度传奇脚本",
    Folder = "SpeedLegend",
    Size = UDim2.fromOffset(500, 520),
    Theme = "Dark",
})

-- ============================================================
-- 时间标签 (彩虹色循环, 0.06秒更新)
-- ============================================================
TimeLabelGui = Instance.new("ScreenGui")
TimeLabelGui.Name = "SpeedLegendTimeLabel"
TimeLabelGui.ResetOnSpawn = false
TimeLabelGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TimeLabelGui.IgnoreGuiInset = true
pcall(function()
    local parent = (gethui and gethui()) or game:GetService("CoreGui")
    TimeLabelGui.Parent = parent
end)
if not TimeLabelGui.Parent then
    TimeLabelGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local TimeLabel = Instance.new("TextLabel")
TimeLabel.Name = "Time"
TimeLabel.Size = UDim2.new(0, 180, 0, 32)
TimeLabel.Position = UDim2.new(1, -190, 0, 12)
TimeLabel.AnchorPoint = Vector2.new(0, 0)
TimeLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
TimeLabel.BackgroundTransparency = 0.35
TimeLabel.BorderSizePixel = 0
TimeLabel.TextColor3 = Color3.fromHSV(0, 1, 1)
TimeLabel.TextScaled = true
TimeLabel.Font = Enum.Font.GothamBold
TimeLabel.Text = os.date("%H:%M:%S")
local tlCorner = Instance.new("UICorner")
tlCorner.CornerRadius = UDim.new(0, 10)
tlCorner.Parent = TimeLabel
TimeLabel.Parent = TimeLabelGui

task.spawn(function()
    local hue = 0
    while TimeLabelGui and TimeLabelGui.Parent do
        hue = (hue + 0.02) % 1
        TimeLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
        TimeLabel.Text = os.date("%H:%M:%S")
        task.wait(0.06)
    end
end)

-- ============================================================
-- 标签 / 打开按钮
-- ============================================================
Window:Tag({
    Title = "速度传奇",
    Color = Color3.fromHex("#00BFFF"),
})

-- ColorSequence.fromHex 辅助函数
local function CSFromHex(hex)
    local c = Color3.fromHex(string.find(hex, "^#") and hex or ("#" .. hex))
    return ColorSequence.new(c, c)
end

Window:EditOpenButton({
    Title = "速度传奇",
    Icon = "zap",
    CornerRadius = 16,
    StrokeThickness = 2,
    Color = CSFromHex("00BFFF"),
    Draggable = true,
})

-- ============================================================
-- 通用 Toggle 回调 (开启/关闭都 Notify)
-- ============================================================
local function ToggleCb(name, key, onEnable, onDisable)
    return function(value)
        State[key] = value
        if value then
            Notify("速度传奇", name .. " 已开启", 3)
            if onEnable then pcall(onEnable) end
        else
            Notify("速度传奇", name .. " 已关闭", 3)
            if onDisable then pcall(onDisable) end
        end
    end
end

-- ============================================================
-- 标签页 1: 自动
-- ============================================================
local AutoTab = Window:Tab({
    Title = "自动",
    Icon = "zap",
})

AutoTab:Toggle({
    Title = "自动跑步训练",
    Desc = "自动触发训练/速度提升",
    Value = false,
    Callback = ToggleCb("自动跑步训练", "AutoTrain", function()
        StartAutoLoop("AutoTrain", AutoTrain)
    end, function()
        StopAutoLoop("AutoTrain")
    end),
})

AutoTab:Toggle({
    Title = "自动转生",
    Desc = "自动触发 rebirth/prestige",
    Value = false,
    Callback = ToggleCb("自动转生", "AutoRebirth", function()
        StartAutoLoop("AutoRebirth", AutoRebirth)
    end, function()
        StopAutoLoop("AutoRebirth")
    end),
})

AutoTab:Toggle({
    Title = "自动买鞋子",
    Desc = "自动购买最佳鞋子/速度装备",
    Value = false,
    Callback = ToggleCb("自动买鞋子", "AutoBuyShoe", function()
        StartAutoLoop("AutoBuyShoe", AutoBuyShoe)
    end, function()
        StopAutoLoop("AutoBuyShoe")
    end),
})

AutoTab:Toggle({
    Title = "自动买宠物",
    Desc = "自动购买宠物/蛋",
    Value = false,
    Callback = ToggleCb("自动买宠物", "AutoBuyPet", function()
        StartAutoLoop("AutoBuyPet", AutoBuyPet)
    end, function()
        StopAutoLoop("AutoBuyPet")
    end),
})

AutoTab:Toggle({
    Title = "自动孵化",
    Desc = "自动孵化宠物蛋",
    Value = false,
    Callback = ToggleCb("自动孵化", "AutoHatch", function()
        StartAutoLoop("AutoHatch", AutoHatch)
    end, function()
        StopAutoLoop("AutoHatch")
    end),
})

AutoTab:Toggle({
    Title = "自动收集金币",
    Desc = "自动收集附近金币/现金",
    Value = false,
    Callback = ToggleCb("自动收集金币", "AutoCollectCoin", function()
        StartAutoLoop("AutoCollectCoin", AutoCollectCoin)
    end, function()
        StopAutoLoop("AutoCollectCoin")
    end),
})

AutoTab:Toggle({
    Title = "自动做任务",
    Desc = "自动领取/完成任务",
    Value = false,
    Callback = ToggleCb("自动做任务", "AutoQuest", function()
        StartAutoLoop("AutoQuest", AutoQuest)
    end, function()
        StopAutoLoop("AutoQuest")
    end),
})

-- ============================================================
-- 标签页 2: 玩家
-- ============================================================
local PlayerTab = Window:Tab({
    Title = "玩家",
    Icon = "user",
})

PlayerTab:Slider({
    Title = "行走速度",
    Desc = "调整角色移动速度 (16-500)",
    Value = { Min = 16, Max = 500, Default = 16 },
    Increment = 1,
    Callback = function(value)
        SetWalkSpeed(value)
        Notify("速度传奇", "行走速度: " .. tostring(value), 2)
    end,
})

PlayerTab:Slider({
    Title = "跳跃力",
    Desc = "调整角色跳跃力 (50-500)",
    Value = { Min = 50, Max = 500, Default = 50 },
    Increment = 1,
    Callback = function(value)
        SetJumpPower(value)
        Notify("速度传奇", "跳跃力: " .. tostring(value), 2)
    end,
})

PlayerTab:Toggle({
    Title = "无限跳跃",
    Desc = "可在空中持续跳跃",
    Value = false,
    Callback = ToggleCb("无限跳跃", "InfiniteJump", function()
        ToggleInfiniteJump(true)
    end, function()
        ToggleInfiniteJump(false)
    end),
})

PlayerTab:Toggle({
    Title = "穿墙",
    Desc = "角色可穿过障碍物",
    Value = false,
    Callback = ToggleCb("穿墙", "Noclip", function()
        ToggleNoclip(true)
    end, function()
        ToggleNoclip(false)
    end),
})

PlayerTab:Toggle({
    Title = "无敌",
    Desc = "保持满血不死",
    Value = false,
    Callback = ToggleCb("无敌", "GodMode", function()
        ToggleGodMode(true)
    end, function()
        ToggleGodMode(false)
    end),
})

PlayerTab:Toggle({
    Title = "摔落无伤害",
    Desc = "免疫坠落伤害",
    Value = false,
    Callback = ToggleCb("摔落无伤害", "NoFallDamage", function()
        ToggleNoFallDamage(true)
    end, function()
        ToggleNoFallDamage(false)
    end),
})

PlayerTab:Toggle({
    Title = "飞行 (手机版)",
    Desc = "加载全游戏通用飞行脚本",
    Value = false,
    Callback = ToggleCb("飞行", "Fly", function()
        ToggleFly(true)
    end, function()
        ToggleFly(false)
    end),
})

-- ============================================================
-- 标签页 3: 视觉
-- ============================================================
local VisualTab = Window:Tab({
    Title = "视觉",
    Icon = "eye",
})

VisualTab:Toggle({
    Title = "人物透视",
    Desc = "显示其他玩家名字 + 距离",
    Value = false,
    Callback = ToggleCb("人物透视", "PlayerESP", function()
        TogglePlayerESP(true)
    end, function()
        TogglePlayerESP(false)
    end),
})

VisualTab:Toggle({
    Title = "物品透视",
    Desc = "高亮金币/宝石等物品",
    Value = false,
    Callback = ToggleCb("物品透视", "ItemESP", function()
        ToggleItemESP(true)
    end, function()
        ToggleItemESP(false)
    end),
})

VisualTab:Toggle({
    Title = "全图高亮",
    Desc = "高亮全图所有物体",
    Value = false,
    Callback = ToggleCb("全图高亮", "FullHighlight", function()
        ToggleFullHighlight(true)
    end, function()
        ToggleFullHighlight(false)
    end),
})

-- ============================================================
-- 标签页 4: 传送
-- ============================================================
local TeleportTab = Window:Tab({
    Title = "传送",
    Icon = "navigation",
})

TeleportTab:Button({
    Title = "传送到训练区",
    Desc = "前往训练区域",
    Icon = "zap",
    Callback = function()
        TeleportByName({"train", "training"}, "训练区")
    end,
})

TeleportTab:Button({
    Title = "传送到商店",
    Desc = "前往商店",
    Icon = "shopping-cart",
    Callback = function()
        TeleportByName({"shop", "store"}, "商店")
    end,
})

TeleportTab:Button({
    Title = "传送到鞋店",
    Desc = "前往鞋店",
    Icon = "footprints",
    Callback = function()
        TeleportByName({"shoe", "shoes"}, "鞋店")
    end,
})

TeleportTab:Button({
    Title = "传送到宠物店",
    Desc = "前往宠物店",
    Icon = "paw-print",
    Callback = function()
        TeleportByName({"pet", "petshop"}, "宠物店")
    end,
})

TeleportTab:Button({
    Title = "传送到转生区",
    Desc = "前往转生区域",
    Icon = "refresh-cw",
    Callback = function()
        TeleportByName({"rebirth", "prestige"}, "转生区")
    end,
})

TeleportTab:Button({
    Title = "传送到赛道",
    Desc = "前往赛道",
    Icon = "flag",
    Callback = function()
        TeleportByName({"race", "track", "speedway"}, "赛道")
    end,
})

TeleportTab:Button({
    Title = "传送到出生点",
    Desc = "前往出生点/大厅",
    Icon = "home",
    Callback = function()
        TeleportByName({"spawn", "lobby", "start"}, "出生点")
    end,
})

TeleportTab:Toggle({
    Title = "长按传送",
    Desc = "按住屏幕/鼠标滑行到指针位置 (手机可用)",
    Value = false,
    Callback = ToggleCb("长按传送", "HoldTeleport", function()
        ToggleHoldTeleport(true)
    end, function()
        ToggleHoldTeleport(false)
    end),
})

-- ============================================================
-- 标签页 5: 实用
-- ============================================================
local UtilityTab = Window:Tab({
    Title = "实用",
    Icon = "wrench",
})

UtilityTab:Toggle({
    Title = "防挂机",
    Desc = "防止被系统踢出",
    Value = false,
    Callback = ToggleCb("防挂机", "AntiAFK", function()
        ToggleAntiAFK(true)
    end, function()
        ToggleAntiAFK(false)
    end),
})

UtilityTab:Toggle({
    Title = "画质提速",
    Desc = "优化光照提升画面表现",
    Value = false,
    Callback = ToggleCb("画质提速", "GraphicsBoost", function()
        ToggleGraphicsBoost(true)
    end, function()
        ToggleGraphicsBoost(false)
    end),
})

UtilityTab:Button({
    Title = "换服",
    Desc = "随机传送到另一个服务器",
    Icon = "shuffle",
    Callback = function()
        ServerHop()
    end,
})

UtilityTab:Button({
    Title = "复制服务器号",
    Desc = "复制当前服务器 JobId",
    Icon = "copy",
    Callback = function()
        CopyServerID()
    end,
})

UtilityTab:Button({
    Title = "角色信息",
    Desc = "查看当前角色状态",
    Icon = "info",
    Callback = function()
        CharacterInfo()
    end,
})

UtilityTab:Button({
    Title = "清理特效",
    Desc = "移除场景内粒子/拖尾等特效",
    Icon = "sparkles",
    Callback = function()
        ClearEffects()
    end,
})

UtilityTab:Button({
    Title = "卸载脚本",
    Desc = "清理所有功能并卸载",
    Icon = "x",
    Callback = function()
        UnloadScript()
    end,
})

-- ============================================================
-- CharacterAdded 重置逻辑
-- ============================================================
LocalPlayer.CharacterAdded:Connect(function(char)
    -- 等待角色加载
    local hum = char:WaitForChild("Humanoid", 10)
    task.wait(0.4)

    -- 恢复已设置的行走速度 / 跳跃力
    if hum then
        if State.WalkSpeed and State.WalkSpeed ~= 16 then
            pcall(function() hum.WalkSpeed = State.WalkSpeed end)
        end
        if State.JumpPower and State.JumpPower ~= 50 then
            pcall(function()
                hum.UseJumpPower = true
                hum.JumpPower = State.JumpPower
            end)
        end
    end

    -- 无敌若已开启则维持
    -- (Heartbeat 连接会自动重新应用到新角色)

    -- 穿墙若已开启则重新生效
    if State.Noclip and Connections.Noclip then
        -- 连接仍然有效，无需额外处理
    end

    -- 更新相机引用
    Camera = Workspace.CurrentCamera
end)

-- ============================================================
-- 脚本加载完成
-- ============================================================
Notify("速度传奇", "脚本已加载!", 5)
