--========================================================
-- NexusHub v1.0 (独立脚本 + 内置卡密系统)
-- 与其他脚本完全独立，互不关联
--========================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local TeleportService = game:GetService("TeleportService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

--========================================================
-- 内置通知
--========================================================
local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title, Text = text or "", Duration = duration or 3,
        })
    end)
end

--========================================================
-- 卡密验证系统 (算法验证，无限生成)
--========================================================

-- 私钥 (修改此数字即可让所有旧卡密失效)
local SECRET_SEED = 48217

local function hashStr(str)
    local h = SECRET_SEED
    for i = 1, #str do
        h = ((h * 37) + string.byte(str, i)) % 9999999
    end
    return h
end

local function numToCode(num, length)
    local chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
    local result = ""
    num = num % (chars:len() ^ length)
    for i = 1, length do
        local idx = (num % chars:len()) + 1
        result = string.sub(chars, idx, idx) .. result
        num = math.floor(num / chars:len())
    end
    return result
end

-- 验证卡密
local function verifyKey(key)
    if not key or key == "" then return false end
    local body = key:gsub("^NEX%-", "")
    local parts = {}
    for part in body:gmatch("[^-]+") do
        table.insert(parts, part)
    end
    if #parts ~= 5 then return false end

    local mainBody = parts[1] .. parts[2] .. parts[3] .. parts[4]
    local checkCode = parts[5]
    local expectedCheck = numToCode(hashStr(mainBody), 4)

    return checkCode == expectedCheck
end

--========================================================
-- 卡密输入界面
--========================================================
local function showKeyUI(onSuccess)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NexusHub_" .. HttpService:GenerateGUID(false)
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end

    -- 主框架
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 280)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -140)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 14)
    corner.Parent = MainFrame

    -- 彩虹边框
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2.5
    stroke.Transparency = 0.15
    stroke.Parent = MainFrame

    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 170, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 0, 255)),
    })
    grad.Parent = stroke

    local rainbowConn
    local rot = 0
    rainbowConn = RunService.RenderStepped:Connect(function(dt)
        rot = (rot + 50 * dt) % 360
        grad.Rotation = rot
    end)

    -- Logo 图标
    local Logo = Instance.new("TextLabel")
    Logo.Size = UDim2.new(1, 0, 0, 50)
    Logo.Position = UDim2.new(0, 0, 0, 15)
    Logo.BackgroundTransparency = 1
    Logo.Text = "NexusHub"
    Logo.TextColor3 = Color3.fromRGB(0, 255, 170)
    Logo.Font = Enum.Font.GothamBold
    Logo.TextSize = 28
    Logo.Parent = MainFrame

    -- 副标题
    local Sub = Instance.new("TextLabel")
    Sub.Size = UDim2.new(1, 0, 0, 18)
    Sub.Position = UDim2.new(0, 0, 0, 60)
    Sub.BackgroundTransparency = 1
    Sub.Text = "v1.0 | 请输入卡密激活"
    Sub.TextColor3 = Color3.fromRGB(130, 130, 145)
    Sub.Font = Enum.Font.Gotham
    Sub.TextSize = 13
    Sub.Parent = MainFrame

    -- 输入框
    local InputBg = Instance.new("Frame")
    InputBg.Size = UDim2.new(0, 340, 0, 44)
    InputBg.Position = UDim2.new(0.5, -170, 0, 95)
    InputBg.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    InputBg.BorderSizePixel = 0
    InputBg.Parent = MainFrame

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 10)
    inputCorner.Parent = InputBg

    local KeyInput = Instance.new("TextBox")
    KeyInput.Size = UDim2.new(1, -20, 1, 0)
    KeyInput.Position = UDim2.new(0, 10, 0, 0)
    KeyInput.BackgroundTransparency = 1
    KeyInput.PlaceholderText = "输入卡密 (NEX-XXXX-XXXX-XXXX-XXXX-XXXX)"
    KeyInput.PlaceholderColor3 = Color3.fromRGB(90, 90, 100)
    KeyInput.Text = ""
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.Font = Enum.Font.Code
    KeyInput.TextSize = 15
    KeyInput.ClearTextOnFocus = false
    KeyInput.Parent = InputBg

    -- 验证按钮
    local VerifyBtn = Instance.new("TextButton")
    VerifyBtn.Size = UDim2.new(0, 340, 0, 44)
    VerifyBtn.Position = UDim2.new(0.5, -170, 0, 155)
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 120)
    VerifyBtn.BorderSizePixel = 0
    VerifyBtn.Text = "激活"
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.TextSize = 17
    VerifyBtn.Parent = MainFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = VerifyBtn

    -- 状态文字
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, 0, 0, 20)
    StatusLabel.Position = UDim2.new(0, 0, 0, 210)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "请联系作者获取卡密"
    StatusLabel.TextColor3 = Color3.fromRGB(110, 110, 125)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextSize = 12
    StatusLabel.Parent = MainFrame

    -- 关闭按钮
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 32, 0, 32)
    CloseBtn.Position = UDim2.new(1, -36, 0, 6)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(200, 70, 70)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 16
    CloseBtn.Parent = MainFrame

    -- 验证逻辑
    local verifying = false

    local function doVerify()
        if verifying then return end
        local key = KeyInput.Text
        if key == "" then
            StatusLabel.Text = "请输入卡密"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 50)
            return
        end

        verifying = true
        VerifyBtn.Text = "验证中..."
        StatusLabel.Text = "正在验证..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 170, 255)

        task.spawn(function()
            task.wait(0.6) -- 模拟网络延迟

            if verifyKey(key) then
                StatusLabel.Text = "激活成功！"
                StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 130)
                VerifyBtn.Text = "成功!"
                task.wait(0.8)

                if rainbowConn then rainbowConn:Disconnect() end
                ScreenGui:Destroy()
                onSuccess()
            else
                StatusLabel.Text = "卡密无效，请检查输入"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
                VerifyBtn.Text = "激活"
                verifying = false
            end
        end)
    end

    VerifyBtn.MouseButton1Click:Connect(doVerify)
    KeyInput.FocusLost:Connect(function(enter)
        if enter then doVerify() end
    end)
    CloseBtn.MouseButton1Click:Connect(function()
        if rainbowConn then rainbowConn:Disconnect() end
        ScreenGui:Destroy()
    end)

    notify("NexusHub", "请输入卡密以激活脚本", 3)
end

--========================================================
-- 工具函数
--========================================================
local function GetChar() return LocalPlayer.Character end
local function GetRoot()
    local c = GetChar()
    return c and c:FindFirstChild("HumanoidRootPart") or nil
end
local function GetHum()
    local c = GetChar()
    return c and c:FindFirstChildOfClass("Humanoid") or nil
end

local function getPlayerList()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then table.insert(list, p.Name) end
    end
    return list
end

--========================================================
-- 功能实现
--========================================================
local State = {
    WalkSpeed = 16,
    JumpPower = 50,
    NoFallDamage = false,
}

-- 速度/跳跃
local function applyWalkSpeed()
    local h = GetHum() if h then h.WalkSpeed = State.WalkSpeed end
end
local function applyJumpPower()
    local h = GetHum()
    if h then
        if h.UseJumpPower then h.JumpPower = State.JumpPower
        else h.JumpHeight = State.JumpPower / 10 end
    end
end

-- 无掉落伤害
local function setupNoFallDamage(hum)
    if not hum then return end
    hum.StateChanged:Connect(function(_, new)
        if new == Enum.HumanoidStateType.FallingDown then
            task.wait()
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end)
end

local function onCharacterAdded(char)
    local hum = char:WaitForChild("Humanoid", 10)
    if not hum then return end
    task.wait(0.3)
    applyWalkSpeed()
    applyJumpPower()
    if State.NoFallDamage then setupNoFallDamage(hum) end
end

if LocalPlayer.Character then task.spawn(onCharacterAdded, LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

-- 甩飞
local function flingPlayer(targetName)
    local target = Players:FindFirstChild(targetName)
    if not target or not target.Character then return end
    local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
    local myRoot = GetRoot()
    if not targetRoot or not myRoot then return end

    local original = myRoot.CFrame
    myRoot.CFrame = targetRoot.CFrame
    local bv = Instance.new("BodyAngularVelocity")
    bv.AngularVelocity = Vector3.new(math.huge, math.huge, math.huge)
    bv.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bv.Parent = myRoot
    task.wait(0.3)
    bv:Destroy()
    myRoot.CFrame = original
end

-- 无限跳跃
local infJumpConn = nil
local function startInfJump()
    infJumpConn = UserInputService.JumpRequest:Connect(function()
        local hum = GetHum()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end)
end
local function stopInfJump()
    if infJumpConn then infJumpConn:Disconnect() infJumpConn = nil end
end

-- 穿墙
local noclipConn = nil
local function startNoclip()
    noclipConn = RunService.Stepped:Connect(function()
        local char = GetChar()
        if char then
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
            end
        end
    end)
end
local function stopNoclip()
    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    local char = GetChar()
    if char then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = true end
        end
    end
end

-- 防挂机
local antiAFKConn = nil
local function startAntiAFK()
    local VirtualUser = game:GetService("VirtualUser")
    antiAFKConn = LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end
local function stopAntiAFK()
    if antiAFKConn then antiAFKConn:Disconnect() antiAFKConn = nil end
end

--========================================================
-- 主功能 (验证通过后执行)
--========================================================
local function loadMain()

-- 加载 WindUI
local WindUI
pcall(function()
    WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
end)
if not WindUI then
    notify("加载失败", "UI 框架加载失败")
    return
end

local Window = WindUI:CreateWindow({
    Title = "NexusHub",
    Icon = "zap",
    Folder = "NexusHub",
    HideSearchBar = true,
})

-- Tab1: 角色
local CharTab = Window:Tab({Title = "角色", Icon = "user"})

CharTab:Slider({
    Title = "行走速度",
    Value = {Min = 16, Max = 500, Default = 16},
    Step = 1,
    Callback = function(val) State.WalkSpeed = val applyWalkSpeed() end,
})

CharTab:Slider({
    Title = "跳跃力度",
    Value = {Min = 50, Max = 500, Default = 50},
    Step = 1,
    Callback = function(val) State.JumpPower = val applyJumpPower() end,
})

CharTab:Button({
    Title = "重置移动",
    Callback = function()
        State.WalkSpeed = 16 State.JumpPower = 50
        applyWalkSpeed() applyJumpPower()
    end,
})

CharTab:Button({
    Title = "立即重生",
    Callback = function()
        local h = GetHum() if h then h.Health = 0 end
    end,
})

CharTab:Divider()

CharTab:Toggle({
    Title = "无掉落伤害",
    Default = false,
    Callback = function(val)
        State.NoFallDamage = val
        if val then
            local h = GetHum()
            if h then setupNoFallDamage(h) end
        end
    end,
})

CharTab:Toggle({
    Title = "无限跳跃",
    Default = false,
    Callback = function(val)
        if val then startInfJump() else stopInfJump() end
    end,
})

CharTab:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(val)
        if val then startNoclip() else stopNoclip() end
    end,
})

-- Tab2: 传送
local TeleTab = Window:Tab({Title = "传送", Icon = "map-pin"})

local tpTarget = nil
local tpDropdown = TeleTab:Dropdown({
    Title = "选择玩家",
    Values = getPlayerList(),
    Callback = function(val) tpTarget = val end,
})

TeleTab:Button({
    Title = "传送到该玩家",
    Callback = function()
        if not tpTarget then return end
        local t = Players:FindFirstChild(tpTarget)
        if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
            local r = GetRoot()
            if r then r.CFrame = t.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) end
        end
    end,
})

TeleTab:Button({
    Title = "刷新列表",
    Callback = function()
        if tpDropdown then pcall(function() tpDropdown:Refresh(getPlayerList()) end) end
    end,
})

TeleTab:Divider()

local cx, cy, cz = 0, 0, 0
TeleTab:Input({Title = "X", Callback = function(v) cx = tonumber(v) or 0 end})
TeleTab:Input({Title = "Y", Callback = function(v) cy = tonumber(v) or 0 end})
TeleTab:Input({Title = "Z", Callback = function(v) cz = tonumber(v) or 0 end})

TeleTab:Button({
    Title = "传送到坐标",
    Callback = function()
        local r = GetRoot()
        if r then r.CFrame = CFrame.new(cx, cy, cz) end
    end,
})

-- Tab3: 工具
local ToolTab = Window:Tab({Title = "工具", Icon = "wrench"})

local flingTarget = nil
ToolTab:Dropdown({
    Title = "甩飞目标",
    Values = getPlayerList(),
    Callback = function(val) flingTarget = val end,
})

ToolTab:Button({
    Title = "甩飞!",
    Callback = function()
        if flingTarget then flingPlayer(flingTarget)
        else notify("提示", "请先选择目标", 3) end
    end,
})

ToolTab:Button({
    Title = "甩飞所有人!",
    Callback = function()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                task.spawn(function() pcall(flingPlayer, p.Name) end)
                task.wait(0.2)
            end
        end
    end,
})

ToolTab:Divider()

ToolTab:Toggle({
    Title = "防挂机",
    Default = false,
    Callback = function(val)
        if val then startAntiAFK() else stopAntiAFK() end
    end,
})

ToolTab:Button({
    Title = "服务器跳转",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})

ToolTab:Button({
    Title = "重新加入",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})

notify("NexusHub", "激活成功，欢迎使用!", 5)

end

--========================================================
-- 启动
--========================================================
showKeyUI(loadMain)
