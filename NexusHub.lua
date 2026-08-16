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

--========================================================
-- 以下为神不如平脚本完整内容 (验证通过后加载)
--========================================================

local StarterGui = game:GetService("StarterGui")
local function sysMsg(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = title, Text = text or "", Duration = 5})
    end)
end

local WindUI
pcall(function()
    WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
end)
if not WindUI then
    sysMsg("加载失败", "WindUI 无法加载")
    return
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local function Notify(title, content, duration)
    pcall(function()
        WindUI:Notify({Title = title, Content = content or "", Duration = duration or 3})
    end)
end

local function GetChar() return LocalPlayer.Character end
local function GetRoot()
    local c = GetChar()
    return c and c:FindFirstChild("HumanoidRootPart") or nil
end
local function GetHum()
    local c = GetChar()
    return c and c:FindFirstChildOfClass("Humanoid") or nil
end

--=========== 状态 ===========
local State = {
    WalkSpeed = 16,
    JumpPower = 50,
    NoFallDamage = false,
    ESPEnabled = false,
    Aimbot = false,
    AimbotFOV = 150,
    AimbotKey = false,
    ShowFOV = false,
}

--=========== 连接引用 ===========
local sprintConn = nil
local infJumpConn = nil
local noclipConn = nil
local antiKnockbackConn = nil
local godModeConn = nil
local lockHealthConn = nil

--=========== 速度/跳跃 ===========
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

--=========== 掉落伤害 ===========
local fallDamageConn
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

--========================================================
-- 飞行系统 (直接执行原始 Fly GUI V3 脚本)
--========================================================
local flyScriptCode = [=[
local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "up"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "down"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fly GUI V3"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "T"
mini.TextSize = 30
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "T"
mini2.TextSize = 30
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "Fly GUI V3";
	Text = "lnjection succeeded";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
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
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = 'flyno1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
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

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 1
	closebutton.Position =  UDim2.new(0, 0, -1, 57)
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
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)
]=]

local function runFlyScript()
    -- 清理旧的飞行 GUI
    local oldGui = LocalPlayer.PlayerGui:FindFirstChild("main")
    if oldGui then oldGui:Destroy() end
    -- 直接执行原始脚本
    loadstring(flyScriptCode)()
end

local function stopFlyScript()
    -- 停止飞行循环
    _G.nowe = false
    _G.tpwalking = false
    -- 销毁飞行 GUI
    local gui = LocalPlayer.PlayerGui:FindFirstChild("main")
    if gui then gui:Destroy() end
    -- 恢复角色状态
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.PlatformStand = false
        local animate = char:FindFirstChild("Animate")
        if animate then animate.Disabled = false end
    end
end

--========================================================
-- 甩飞别人 (Spin Fling)
--========================================================
local function flingPlayer(targetName)
    local target = Players:FindFirstChild(targetName)
    if not target or not target.Character then
        Notify("失败", "目标玩家不可用", 3) return
    end
    local tRoot = target.Character:FindFirstChild("HumanoidRootPart")
    local myRoot = GetRoot()
    if not tRoot or not myRoot then return end

    local savedCF = myRoot.CFrame
    local bav = Instance.new("BodyAngularVelocity")
    bav.AngularVelocity = Vector3.new(0, 99999, 0)
    bav.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
    bav.Parent = myRoot

    local bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.zero
    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    bv.Parent = myRoot

    -- 靠近目标并旋转
    myRoot.CFrame = tRoot.CFrame + Vector3.new(0, 0, 0)
    task.wait(0.5)

    bav:Destroy()
    bv:Destroy()
    myRoot.CFrame = savedCF
    Notify("甩飞", "已甩飞 " .. targetName, 3)
end

local flingingAll = false
local function flingAllPlayers()
    if flingingAll then return end
    flingingAll = true
    local count = 0
    Notify("甩飞所有人", "开始甩飞服务器内所有玩家...", 3)
    local myRoot = GetRoot()
    if not myRoot then flingingAll = false return end
    local savedCF = myRoot.CFrame

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local tRoot = p.Character:FindFirstChild("HumanoidRootPart")
            local tHum = p.Character:FindFirstChildOfClass("Humanoid")
            if tRoot and tHum and tHum.Health > 0 then
                local bav = Instance.new("BodyAngularVelocity")
                bav.AngularVelocity = Vector3.new(0, 99999, 0)
                bav.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
                bav.Parent = myRoot

                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.zero
                bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                bv.Parent = myRoot

                myRoot.CFrame = tRoot.CFrame
                task.wait(0.3)

                bav:Destroy()
                bv:Destroy()
                myRoot.CFrame = savedCF
                count = count + 1
                task.wait(0.1)
            end
        end
    end

    flingingAll = false
    Notify("甩飞完成", "共甩飞 " .. count .. " 名玩家", 5)
end

--========================================================
-- ESP (精简版)
--========================================================
local espObjects = {}

local function createESP(player)
    if player == LocalPlayer then return end
    local function onChar(char)
        if not char then return end
        local head = char:FindFirstChild("Head") or char:WaitForChild("Head", 5)
        local root = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 5)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not head then return end

        if espObjects[player] then
            for _, v in pairs(espObjects[player]) do
                if v and v.Destroy then pcall(function() v:Destroy() end) end
            end
        end

        local bb = Instance.new("BillboardGui")
        bb.Name = "ESP"
        bb.Adornee = head
        bb.Size = UDim2.new(0, 200, 0, 50)
        bb.StudsOffset = Vector3.new(0, 2.5, 0)
        bb.AlwaysOnTop = true
        bb.Enabled = State.ESPEnabled

        local name = Instance.new("TextLabel")
        name.BackgroundTransparency = 1
        name.Size = UDim2.new(1, 0, 0, 20)
        name.Font = Enum.Font.GothamBold
        name.TextSize = 14
        name.TextColor3 = Color3.fromRGB(255, 80, 80)
        name.TextStrokeTransparency = 0
        name.Text = player.Name
        name.Parent = bb

        local info = Instance.new("TextLabel")
        info.BackgroundTransparency = 1
        info.Size = UDim2.new(1, 0, 0, 16)
        info.Position = UDim2.new(0, 0, 0, 20)
        info.Font = Enum.Font.Gotham
        info.TextSize = 12
        info.TextColor3 = Color3.fromRGB(200, 200, 200)
        info.TextStrokeTransparency = 0.5
        info.Text = ""
        info.Parent = bb
        bb.Parent = head

        local hl = Instance.new("Highlight")
        hl.Adornee = char
        hl.FillColor = Color3.fromRGB(255, 80, 80)
        hl.FillTransparency = 0.8
        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
        hl.Enabled = State.ESPEnabled
        hl.Parent = char

        espObjects[player] = {bb = bb, hl = hl, info = info, root = root, hum = hum}

        task.spawn(function()
            while espObjects[player] and char and char.Parent do
                local obj = espObjects[player]
                if not obj then break end
                local myRoot = GetRoot()
                if obj.root and myRoot then
                    local d = math.floor((obj.root.Position - myRoot.Position).Magnitude)
                    local hp = obj.hum and math.floor(obj.hum.Health) or "?"
                    obj.info.Text = d .. "m  HP:" .. hp
                end
                task.wait(0.15)
            end
        end)
    end
    if player.Character then onChar(player.Character) end
    player.CharacterAdded:Connect(onChar)
end

local function clearESP(player)
    if espObjects[player] then
        for _, v in pairs(espObjects[player]) do
            if v and v.Destroy then pcall(function() v:Destroy() end) end
        end
        espObjects[player] = nil
    end
end

local espInit = false
local function initESP()
    if espInit then return end
    espInit = true
    for _, p in ipairs(Players:GetPlayers()) do createESP(p) end
    Players.PlayerAdded:Connect(createESP)
    Players.PlayerRemoving:Connect(clearESP)
end

--========================================================
-- 玩家列表工具
--========================================================
local function getPlayerList()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then table.insert(list, p.Name) end
    end
    return list
end

--========================================================
-- 自瞄系统 (Aimbot)
--========================================================
local fovCircle = nil
local aimbotConn = nil

-- 创建/更新 FOV 圆圈
local function updateFOVCircle()
    if State.ShowFOV then
        if not fovCircle then
            fovCircle = Instance.new("Part")
            fovCircle.Name = "FOVCircle"
            fovCircle.Shape = Enum.PartType.Cylinder
            fovCircle.Material = Enum.Material.ForceField
            fovCircle.Color = Color3.fromRGB(255, 255, 255)
            fovCircle.Transparency = 0.5
            fovCircle.Anchored = true
            fovCircle.CanCollide = false
            fovCircle.CanQuery = false
            fovCircle.CastShadow = false
            fovCircle.Parent = Workspace
        end
        -- 用 ScreenGui 画圆更准确
        fovCircle.Transparency = 1
        local gui = game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
        if not gui then
            gui = Instance.new("ScreenGui")
            gui.Name = "AimbotFOV"
            gui.ResetOnSpawn = false
            gui.Parent = game:GetService("CoreGui")
        end
        local circle = gui:FindFirstChild("Circle")
        if not circle then
            circle = Instance.new("Frame")
            circle.Name = "Circle"
            circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            circle.BackgroundTransparency = 1
            circle.BorderSizePixel = 0
            circle.Parent = gui
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = circle
            local stroke = Instance.new("UIStroke")
            stroke.Name = "Stroke"
            stroke.Color = Color3.fromRGB(0, 255, 100)
            stroke.Thickness = 1.5
            stroke.Transparency = 0.3
            stroke.Parent = circle
        end
        circle.Visible = true
    else
        local gui = game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
        if gui then
            local circle = gui:FindFirstChild("Circle")
            if circle then circle.Visible = false end
        end
    end
end

-- 找到屏幕中心 FOV 范围内最近的玩家
local function getClosestPlayer()
    local closestP = nil
    local shortestDist = State.AimbotFOV
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local head = p.Character:FindFirstChild("Head")
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if head and hum and hum.Health > 0 then
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        closestP = p
                    end
                end
            end
        end
    end
    return closestP
end

local function startAimbot()
    aimbotConn = RunService.RenderStepped:Connect(function()
        if not State.Aimbot then return end

        -- 手机端: 默认开启就自瞄; 键盘端: 按住右键才自瞄
        local shouldAim = true
        if State.AimbotKey then
            shouldAim = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        end

        if not shouldAim then return end

        local target = getClosestPlayer()
        if target and target.Character then
            local head = target.Character:FindFirstChild("Head")
            if head then
                -- 平滑移动摄像机朝向目标头部
                local targetCF = CFrame.new(Camera.CFrame.Position, head.Position)
                Camera.CFrame = Camera.CFrame:Lerp(targetCF, 0.15)
            end
        end

        -- 更新 FOV 圆圈大小
        if State.ShowFOV then
            local gui = game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
            if gui then
                local circle = gui:FindFirstChild("Circle")
                if circle then
                    local size = State.AimbotFOV * 2
                    circle.Size = UDim2.new(0, size, 0, size)
                    circle.Position = UDim2.new(0.5, -size / 2, 0.5, -size / 2)
                end
            end
        end
    end)
end

local function stopAimbot()
    if aimbotConn then aimbotConn:Disconnect() aimbotConn = nil end
    local gui = game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
    if gui then gui:Destroy() end
end

--========================================================
-- 创建窗口
--========================================================
local Window = WindUI:CreateWindow({
    Title = "神不如平脚本",
    Icon = "sparkles",
    Folder = "ShenBuRuPing",
    HideSearchBar = true,
})

--========================================================
-- 彩虹边框动画
--========================================================
local rainbowConns = {}
local function setupRainbowBorder()
    -- 查找 WindUI 主窗口 Frame
    local function findMainFrame()
        -- 在 PlayerGui 和 CoreGui 中搜索
        local guis = {}
        if LocalPlayer:FindFirstChild("PlayerGui") then
            for _, g in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
                if g:IsA("ScreenGui") then table.insert(guis, g) end
            end
        end
        local coreGui = game:GetService("CoreGui")
        for _, g in ipairs(coreGui:GetChildren()) do
            if g:IsA("ScreenGui") then table.insert(guis, g) end
        end

        for _, gui in ipairs(guis) do
            for _, frame in ipairs(gui:GetDescendants()) do
                if frame:IsA("Frame") and frame.Name == "Window" then
                    return frame
                end
            end
        end
        -- 备选：查找最大的 Frame
        local largest = nil
        local largestArea = 0
        for _, gui in ipairs(guis) do
            for _, frame in ipairs(gui:GetDescendants()) do
                if frame:IsA("Frame") and frame.Parent and frame.Parent:IsA("ScreenGui") then
                    local area = frame.AbsoluteSize.X * frame.AbsoluteSize.Y
                    if area > largestArea then
                        largestArea = area
                        largest = frame
                    end
                end
            end
        end
        return largest
    end

    -- 延迟一帧查找（等 WindUI 完全渲染）
    task.defer(function()
        local mainFrame = findMainFrame()
        if not mainFrame then
            task.wait(1)
            mainFrame = findMainFrame()
        end
        if not mainFrame then return end

        -- 创建外层彩虹边框 (UIStroke + UIGradient)
        local outerStroke = Instance.new("UIStroke")
        outerStroke.Name = "RainbowStrokeOuter"
        outerStroke.Thickness = 4
        outerStroke.Transparency = 0.1
        outerStroke.Parent = mainFrame

        local outerGrad = Instance.new("UIGradient")
        outerGrad.Name = "RainbowGradient"
        outerGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 127, 0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 170, 255)),
            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
        })
        outerGrad.Rotation = 0
        outerGrad.Parent = outerStroke

        -- 创建内层彩虹边框
        local innerStroke = Instance.new("UIStroke")
        innerStroke.Name = "RainbowStrokeInner"
        innerStroke.Thickness = 2
        innerStroke.Transparency = 0.3
        innerStroke.Parent = mainFrame

        local innerGrad = Instance.new("UIGradient")
        innerGrad.Name = "RainbowGradient2"
        innerGrad.Color = outerGrad.Color
        innerGrad.Rotation = 180
        innerGrad.Parent = innerStroke

        -- 创建四个边的彩色条纹 (上下左右)
        local stripes = {}
        local positions = {"Top", "Bottom", "Left", "Right"}
        for _, pos in ipairs(positions) do
            local stripe = Instance.new("Frame")
            stripe.Name = "RainbowStripe_" .. pos
            stripe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            stripe.BorderSizePixel = 0
            stripe.ZIndex = 10

            local stripeGrad = Instance.new("UIGradient")
            stripeGrad.Name = "Grad"
            stripeGrad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 127, 0)),
                ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 170, 255)),
                ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
            })
            stripeGrad.Parent = stripe

            if pos == "Top" then
                stripe.Size = UDim2.new(1, 0, 0, 3)
                stripe.Position = UDim2.new(0, 0, 0, -3)
            elseif pos == "Bottom" then
                stripe.Size = UDim2.new(1, 0, 0, 3)
                stripe.Position = UDim2.new(0, 0, 1, 0)
            elseif pos == "Left" then
                stripe.Size = UDim2.new(0, 3, 1, 0)
                stripe.Position = UDim2.new(0, -3, 0, 0)
            elseif pos == "Right" then
                stripe.Size = UDim2.new(0, 3, 1, 0)
                stripe.Position = UDim2.new(1, 0, 0, 0)
            end

            stripe.Parent = mainFrame
            table.insert(stripes, {frame = stripe, grad = stripeGrad, pos = pos})
        end

        -- 动画：旋转渐变颜色
        local rotOuter = 0
        local rotInner = 180
        local stripeRots = {0, 90, 0, 90}
        local conn = RunService.RenderStepped:Connect(function(dt)
            rotOuter = (rotOuter + 60 * dt) % 360
            rotInner = (rotInner - 60 * dt) % 360
            outerGrad.Rotation = rotOuter
            innerGrad.Rotation = rotInner

            for i, s in ipairs(stripes) do
                s.grad.Rotation = (s.grad.Rotation + (50 + i * 10) * dt) % 360
            end
        end)
        table.insert(rainbowConns, conn)
    end)
end

setupRainbowBorder()

--========================================================
-- Tab1: 角色
--========================================================
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

CharTab:Divider()

CharTab:Toggle({
    Title = "飞行 (开启后弹出飞行面板)",
    Default = false,
    Callback = function(val)
        if val then runFlyScript() else stopFlyScript() end
    end,
})

CharTab:Divider()

CharTab:Button({
    Title = "立即重生",
    Callback = function()
        local h = GetHum() if h then h.Health = 0 end
    end,
})

--========================================================
-- Tab2: 传送
--========================================================
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
        if not tpTarget then Notify("未选择", "", 3) return end
        local t = Players:FindFirstChild(tpTarget)
        if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
            local r = GetRoot()
            if r then r.CFrame = t.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) end
        else Notify("失败", "目标不可用", 3) end
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

TeleTab:Button({
    Title = "传送到出生点",
    Callback = function()
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("SpawnLocation") then
                local r = GetRoot()
                if r then r.CFrame = v.CFrame + Vector3.new(0, 3, 0) end
                return
            end
        end
        Notify("失败", "未找到出生点", 3)
    end,
})

TeleTab:Divider()

-- 点击传送 (工具栏道具)
local clickTpTool = nil
local clickTpConn = nil
TeleTab:Toggle({
    Title = "点击传送 (装备道具后点击地面)",
    Default = false,
    Callback = function(val)
        if val then
            -- 创建传送工具
            clickTpTool = Instance.new("Tool")
            clickTpTool.Name = "点击传送"
            clickTpTool.ToolTip = "装备后点击任意位置传送"
            clickTpTool.RequiresHandle = false
            clickTpTool.CanBeDropped = false
            clickTpTool.Parent = LocalPlayer:WaitForChild("Backpack")

            clickTpConn = clickTpTool.Activated:Connect(function()
                local mouse = LocalPlayer:GetMouse()
                local r = GetRoot()
                if r and mouse.Hit then
                    r.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
                end
            end)
            Notify("点击传送", "已添加道具到物品栏，装备后点击任意位置传送", 4)
        else
            if clickTpConn then clickTpConn:Disconnect() clickTpConn = nil end
            if clickTpTool then
                -- 从背包和角色中移除
                if clickTpTool.Parent then clickTpTool:Destroy() end
                clickTpTool = nil
            end
            Notify("点击传送", "已关闭", 3)
        end
    end,
})

--========================================================
-- Tab3: 视觉
--========================================================
local VisTab = Window:Tab({Title = "视觉", Icon = "eye"})

VisTab:Toggle({
    Title = "ESP 透视 (名称+距离+血量)",
    Default = false,
    Callback = function(val)
        State.ESPEnabled = val
        if val then initESP() end
        for _, obj in pairs(espObjects) do
            if obj.bb then obj.bb.Enabled = val end
            if obj.hl then obj.hl.Enabled = val end
        end
    end,
})

VisTab:Divider()

local savedLighting = {}
VisTab:Toggle({
    Title = "全亮",
    Default = false,
    Callback = function(val)
        if val then
            savedLighting.B = Lighting.Brightness
            savedLighting.T = Lighting.ClockTime
            savedLighting.F = Lighting.FogEnd
            savedLighting.S = Lighting.GlobalShadows
            Lighting.Brightness = 3
            Lighting.ClockTime = 12
            Lighting.FogEnd = 1e9
            Lighting.GlobalShadows = false
        else
            if savedLighting.B then Lighting.Brightness = savedLighting.B end
            if savedLighting.T then Lighting.ClockTime = savedLighting.T end
            if savedLighting.F then Lighting.FogEnd = savedLighting.F end
            if savedLighting.S ~= nil then Lighting.GlobalShadows = savedLighting.S end
        end
    end,
})

VisTab:Slider({
    Title = "视野 FOV",
    Value = {Min = 30, Max = 120, Default = 70},
    Step = 1,
    Callback = function(val) Camera.FieldOfView = val end,
})

VisTab:Toggle({
    Title = "移除雾效",
    Default = false,
    Callback = function(val)
        if val then Lighting.FogEnd = 1e9 Lighting.FogStart = 1e9
        else Lighting.FogEnd = 100000 Lighting.FogStart = 0 end
    end,
})

--========================================================
-- Tab4: 世界 & 工具
--========================================================
local ToolTab = Window:Tab({Title = "工具", Icon = "wrench"})

ToolTab:Slider({
    Title = "重力",
    Value = {Min = 0, Max = 500, Default = 196},
    Step = 1,
    Callback = function(val) Workspace.Gravity = val end,
})

ToolTab:Button({
    Title = "重置重力",
    Callback = function() Workspace.Gravity = 196.2 end,
})

-- 飞车脚本
local carScriptCode = [=[
	local Speed = 50

	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart

	local ScreenGui = Instance.new("ScreenGui")
	local W = Instance.new("TextButton")
	local S = Instance.new("TextButton")
	local A = Instance.new("TextButton")
	local D = Instance.new("TextButton")
	local Fly = Instance.new("TextButton")
	local unfly = Instance.new("TextButton")
	local StopFly = Instance.new("TextButton")

	ScreenGui.Name = "CarFlyGUI"
	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.ResetOnSpawn = false

	unfly.Name = "上"
	unfly.Parent = ScreenGui
	unfly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	unfly.Position = UDim2.new(0.694387913, 0, 0.181818187, 0)
	unfly.Size = UDim2.new(0, 72, 0, 50)
	unfly.Font = Enum.Font.SourceSans
	unfly.Text = "上"
	unfly.TextColor3 = Color3.fromRGB(170, 0, 255)
	unfly.TextScaled = true
	unfly.TextSize = 14.000
	unfly.TextWrapped = true
	unfly.MouseButton1Down:Connect(function()
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
	end)

	StopFly.Name = "停止飞行"
	StopFly.Parent = ScreenGui
	StopFly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	StopFly.Position = UDim2.new(0.695689976, 0, 0.0213903747, 0)
	StopFly.Size = UDim2.new(0, 71, 0, 50)
	StopFly.Font = Enum.Font.SourceSans
	StopFly.Text = "停止飞行"
	StopFly.TextColor3 = Color3.fromRGB(170, 0, 255)
	StopFly.TextScaled = true
	StopFly.TextSize = 14.000
	StopFly.TextWrapped = true
	StopFly.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = true
	end)

	Fly.Name = "飞行"
	Fly.Parent = ScreenGui
	Fly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Fly.Position = UDim2.new(0.588797748, 0, 0.0213903747, 0)
	Fly.Size = UDim2.new(0, 66, 0, 50)
	Fly.Font = Enum.Font.SourceSans
	Fly.Text = "飞行"
	Fly.TextColor3 = Color3.fromRGB(170, 0, 127)
	Fly.TextScaled = true
	Fly.TextSize = 14.000
	Fly.TextWrapped = true
	Fly.MouseButton1Down:Connect(function()
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	end)

	W.Name = "W"
	W.Parent = ScreenGui
	W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	W.Position = UDim2.new(0.161668837, 0, 0.601604283, 0)
	W.Size = UDim2.new(0, 58, 0, 50)
	W.Font = Enum.Font.SourceSans
	W.Text = "↑"
	W.TextColor3 = Color3.fromRGB(226, 226, 526)
	W.TextScaled = true
	W.TextSize = 5.000
	W.TextWrapped = true
	W.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 50000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed
	end)


	S.Name = "S"
	S.Parent = ScreenGui
	S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	S.Position = UDim2.new(0.161668837, 0, 0.735294104, 0)
	S.Size = UDim2.new(0, 58, 0, 50)
	S.Font = Enum.Font.SourceSans
	S.Text = "↓"
	S.TextColor3 = Color3.fromRGB(255, 255, 255)
	S.TextScaled = true
	S.TextSize = 14.000
	S.TextWrapped = true
	S.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed
	end)
]=]

local function runCarScript()
    -- 清理旧的飞车 GUI
    local oldGui = game:GetService("CoreGui"):FindFirstChild("CarFlyGUI")
    if oldGui then oldGui:Destroy() end
    -- 直接执行原始飞车脚本
    loadstring(carScriptCode)()
    Notify("飞车", "飞车面板已开启", 3)
end

local function stopCarScript()
    local gui = game:GetService("CoreGui"):FindFirstChild("CarFlyGUI")
    if gui then gui:Destroy() end
    -- 清理 BodyVelocity/BodyGyro
    local root = GetRoot()
    if root then
        local bv = root:FindFirstChildOfClass("BodyVelocity")
        if bv then bv:Destroy() end
        local bg = root:FindFirstChildOfClass("BodyGyro")
        if bg then bg:Destroy() end
        root.Anchored = false
    end
    Notify("飞车", "飞车面板已关闭", 3)
end

ToolTab:Divider()

ToolTab:Button({
    Title = "FPS 提升",
    Callback = function()
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") then v.Material = Enum.Material.Plastic v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Enabled = false end
        end
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 1e9
        pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
        Notify("已优化", "", 3)
    end,
})

--========================================================
-- Tab4.5: 通用
--========================================================
local GenTab = Window:Tab({Title = "通用", Icon = "package"})

-- 飞车
GenTab:Toggle({
    Title = "飞车 (开启后弹出飞车面板)",
    Default = false,
    Callback = function(val)
        if val then runCarScript() else stopCarScript() end
    end,
})

GenTab:Divider()

-- 无掉落伤害
GenTab:Toggle({
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

GenTab:Divider()

-- 甩飞
local flingTarget = nil
GenTab:Dropdown({
    Title = "甩飞目标",
    Values = getPlayerList(),
    Callback = function(val) flingTarget = val end,
})

GenTab:Button({
    Title = "甩飞!",
    Callback = function()
        if flingTarget then flingPlayer(flingTarget)
        else Notify("未选择", "请先选择目标", 3) end
    end,
})

GenTab:Button({
    Title = "甩飞所有人!",
    Callback = function()
        task.spawn(flingAllPlayers)
    end,
})

GenTab:Divider()

-- 快速跑步
GenTab:Toggle({
    Title = "快速跑步 (3倍速度)",
    Default = false,
    Callback = function(val)
        if val then
            sprintConn = RunService.RenderStepped:Connect(function()
                local hum = GetHum()
                if hum then
                    hum.WalkSpeed = State.WalkSpeed * 3
                end
            end)
            Notify("快速跑步", "速度已提升至3倍", 3)
        else
            if sprintConn then sprintConn:Disconnect() sprintConn = nil end
            applyWalkSpeed()
            Notify("快速跑步", "已恢复正常速度", 3)
        end
    end,
})

-- 无限跳跃
GenTab:Toggle({
    Title = "无限跳跃",
    Default = false,
    Callback = function(val)
        if val then
            infJumpConn = UserInputService.JumpRequest:Connect(function()
                local h = GetHum()
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        else
            if infJumpConn then infJumpConn:Disconnect() infJumpConn = nil end
        end
    end,
})

-- 穿墙
GenTab:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(val)
        if val then
            noclipConn = RunService.Stepped:Connect(function()
                local c = GetChar()
                if c then
                    for _, p in ipairs(c:GetDescendants()) do
                        if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
                    end
                end
            end)
        else
            if noclipConn then noclipConn:Disconnect() noclipConn = nil end
        end
    end,
})

-- 防击退/防甩飞
GenTab:Toggle({
    Title = "防击退/防甩飞",
    Default = false,
    Callback = function(val)
        if val then
            antiKnockbackConn = RunService.Heartbeat:Connect(function()
                local root = GetRoot()
                local hum = GetHum()
                if root and hum and hum.Health > 0 then
                    if hum.MoveDirection.Magnitude < 0.1 then
                        root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
                        root.AssemblyAngularVelocity = Vector3.zero
                    end
                end
            end)
            Notify("防击退", "已开启防击退保护", 3)
        else
            if antiKnockbackConn then antiKnockbackConn:Disconnect() antiKnockbackConn = nil end
            Notify("防击退", "已关闭防击退保护", 3)
        end
    end,
})

GenTab:Divider()

-- 自瞄
GenTab:Toggle({
    Title = "自瞄 (Aimbot)",
    Default = false,
    Callback = function(val)
        State.Aimbot = val
        if val then startAimbot() else stopAimbot() end
    end,
})

GenTab:Slider({
    Title = "自瞄范围 (FOV)",
    Value = {Min = 30, Max = 500, Default = 150},
    Step = 10,
    Callback = function(val) State.AimbotFOV = val end,
})

GenTab:Toggle({
    Title = "显示自瞄范围圈",
    Default = false,
    Callback = function(val)
        State.ShowFOV = val
        updateFOVCircle()
    end,
})

GenTab:Toggle({
    Title = "按住右键才自瞄 (键盘端)",
    Default = false,
    Callback = function(val) State.AimbotKey = val end,
})

GenTab:Divider()

-- 防甩飞 (Anchor 根部件)
local antiFlingConn = nil
GenTab:Toggle({
    Title = "防甩飞",
    Default = false,
    Callback = function(val)
        if val then
            antiFlingConn = RunService.Heartbeat:Connect(function()
                local root = GetRoot()
                local hum = GetHum()
                if root and hum and hum.Health > 0 then
                    local vel = root.AssemblyAngularVelocity
                    if vel.Magnitude > 5000 then
                        root.AssemblyAngularVelocity = Vector3.zero
                        root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
                    end
                end
            end)
            Notify("防甩飞", "已开启防甩飞保护", 3)
        else
            if antiFlingConn then antiFlingConn:Disconnect() antiFlingConn = nil end
            Notify("防甩飞", "已关闭防甩飞保护", 3)
        end
    end,
})

-- 隐身
local invisibleConn = nil
GenTab:Toggle({
    Title = "隐身",
    Default = false,
    Callback = function(val)
        if val then
            invisibleConn = RunService.Heartbeat:Connect(function()
                local char = GetChar()
                if char then
                    for _, p in ipairs(char:GetDescendants()) do
                        if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                            p.LocalTransparencyModifier = 1
                        end
                    end
                end
            end)
            Notify("隐身", "已开启隐身 (仅本地可见)", 3)
        else
            if invisibleConn then invisibleConn:Disconnect() invisibleConn = nil end
            local char = GetChar()
            if char then
                for _, p in ipairs(char:GetDescendants()) do
                    if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                        p.LocalTransparencyModifier = 0
                    end
                end
            end
            Notify("隐身", "已关闭隐身", 3)
        end
    end,
})

-- 无敌
GenTab:Toggle({
    Title = "无敌",
    Default = false,
    Callback = function(val)
        if val then
            godModeConn = RunService.Heartbeat:Connect(function()
                local hum = GetHum()
                if hum then
                    if hum.Health < hum.MaxHealth then
                        hum.Health = hum.MaxHealth
                    end
                end
            end)
            Notify("无敌", "已开启无敌模式", 3)
        else
            if godModeConn then godModeConn:Disconnect() godModeConn = nil end
            Notify("无敌", "已关闭无敌模式", 3)
        end
    end,
})

-- 锁血
GenTab:Toggle({
    Title = "锁血 (锁定当前血量)",
    Default = false,
    Callback = function(val)
        if val then
            local hum = GetHum()
            local lockedHP = hum and hum.Health or 100
            Notify("锁血", "已锁定血量: " .. math.floor(lockedHP), 3)
            lockHealthConn = RunService.Heartbeat:Connect(function()
                local h = GetHum()
                if h and h.Health ~= lockedHP then
                    h.Health = lockedHP
                end
            end)
        else
            if lockHealthConn then lockHealthConn:Disconnect() lockHealthConn = nil end
            Notify("锁血", "已关闭锁血", 3)
        end
    end,
})

GenTab:Divider()

-- 服务器跳转
GenTab:Button({
    Title = "服务器跳转",
    Callback = function()
        pcall(function()
            local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)
            local data = HttpService:JSONDecode(game:HttpGet(url))
            if data and data.data then
                local c = {}
                for _, s in ipairs(data.data) do
                    if s.playing < s.maxPlayers and s.id ~= game.JobId then table.insert(c, s.id) end
                end
                if #c > 0 then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, c[math.random(1, #c)], LocalPlayer)
                else Notify("未找到", "没有可用服务器", 3) end
            end
        end)
    end,
})

GenTab:Button({
    Title = "重新加入",
    Callback = function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end,
})

GenTab:Button({
    Title = "离开游戏",
    Callback = function()
        LocalPlayer:Kick("已离开游戏")
    end,
})

GenTab:Divider()

-- 防挂机
local antiAFKConn
GenTab:Toggle({
    Title = "防挂机",
    Default = false,
    Callback = function(val)
        if val then
            local vu = game:GetService("VirtualUser")
            antiAFKConn = LocalPlayer.Idled:Connect(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
        else
            if antiAFKConn then antiAFKConn:Disconnect() antiAFKConn = nil end
        end
    end,
})

--========================================================
-- Tab5: 设置
--========================================================
local SetTab = Window:Tab({Title = "设置", Icon = "settings"})

SetTab:Dropdown({
    Title = "主题",
    Values = {"Pink", "Dark", "Light", "Violet", "Ocean"},
    Callback = function(val) pcall(function() WindUI:SetTheme(val) end) end,
})

SetTab:Button({
    Title = "销毁脚本",
    Callback = function()
        stopFlyScript()
        State.Aimbot = false stopAimbot()
        if infJumpConn then infJumpConn:Disconnect() end
        if noclipConn then noclipConn:Disconnect() end
        if antiAFKConn then antiAFKConn:Disconnect() end
        if sprintConn then sprintConn:Disconnect() end
        if antiKnockbackConn then antiKnockbackConn:Disconnect() end
        if godModeConn then godModeConn:Disconnect() end
        if lockHealthConn then lockHealthConn:Disconnect() end
        if antiFlingConn then antiFlingConn:Disconnect() end
        if invisibleConn then invisibleConn:Disconnect() end
        if clickTpConn then clickTpConn:Disconnect() end
        if clickTpTool then clickTpTool:Destroy() end
        for _, c in ipairs(rainbowConns) do c:Disconnect() end
        for p in pairs(espObjects) do clearESP(p) end
        local h = GetHum()
        if h then h.WalkSpeed = 16 h.JumpPower = 50 end
        Workspace.Gravity = 196.2
        Camera.FieldOfView = 70
        local ui = game:GetService("CoreGui"):FindFirstChild("WindUI")
        if ui then ui:Destroy() end
        local carGui = game:GetService("CoreGui"):FindFirstChild("CarFlyGUI")
        if carGui then carGui:Destroy() end
    end,
})

--=========== 启动 ===========
Notify("欢迎使用", "神不如平脚本", 5)
task.wait(1)
Notify("神不如平脚本", "v5.0 加载完成", 3)


end

--========================================================
-- 启动
--========================================================
showKeyUI(loadMain)
