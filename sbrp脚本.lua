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
local _aUpMAkqOMNaZom = game:GetService("_aUpMAkqOMNaZom")
local TeleportService = game:GetService("TeleportService")
local _DTyVcuHA = 881
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
local State = {
WalkSpeed = 16,
JumpPower = 50,
NoFallDamage = false,
ESPEnabled = false,
Aimbot = false,
AimbotFOV = 150,
AimbotKey = false,
ShowFOV = false,
NpcAimbot = false,
CharRotate = false,
}
local _ODg8khUQdzlmF = nil
local _MkxVyvhcFb = nil
local _onbhIa20mXFTEIQ = nil
local _qrwg6HW82aJq8v4n = nil
local _SKiUyHqfGqK = nil
local _2obc8l9n2MFM = nil
local _LzgRUt8PhsBfhhIN = nil
local function _G7n6mEKXcIF()
local h = GetHum() if h then h.WalkSpeed = State.WalkSpeed end
end
local function _20so9dFla3LTG4Qm()
local h = GetHum()
local _Ljsb2uLt = 2407
if h then
if h.UseJumpPower then h.JumpPower = State.JumpPower
else h.JumpHeight = State.JumpPower / 10 end
end
end
local _18DW8uX46vLvABX
local function _x9nSZd8FQXo5GwHm(hum)
if not hum then return end
hum.StateChanged:Connect(function(_, new)
if new == Enum.HumanoidStateType.FallingDown then
task.wait()
hum:ChangeState(Enum.HumanoidStateType.GettingUp)
end
end)
end
local function _6oeiLvOYBbqZlw(char)
local hum = char:WaitForChild("Humanoid", 10)
if not hum then return end
task.wait(0.3)
_G7n6mEKXcIF()
_20so9dFla3LTG4Qm()
if State.NoFallDamage then _x9nSZd8FQXo5GwHm(hum) end
end
if LocalPlayer.Character then task.spawn(_6oeiLvOYBbqZlw, LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(_6oeiLvOYBbqZlw)
local _vvhj78cNYj = [=[
local main = Instance.new("_rID4eKtFwT")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local _GZm8GEiBVgB1gw = Instance.new("_GZm8GEiBVgB1gw")
local plus = Instance.new("TextButton")
local speed = Instance.new("_GZm8GEiBVgB1gw")
local mine = Instance.new("TextButton")
local _AAaFCIMXlpV4v = Instance.new("TextButton")
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
_GZm8GEiBVgB1gw.Parent = Frame
_GZm8GEiBVgB1gw.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
_GZm8GEiBVgB1gw.Position = UDim2.new(0.469327301, 0, 0, 0)
_GZm8GEiBVgB1gw.Size = UDim2.new(0, 100, 0, 28)
_GZm8GEiBVgB1gw.Font = Enum.Font.SourceSans
_GZm8GEiBVgB1gw.Text = "Fly GUI V3"
_GZm8GEiBVgB1gw.TextColor3 = Color3.fromRGB(0, 0, 0)
_GZm8GEiBVgB1gw.TextScaled = true
_GZm8GEiBVgB1gw.TextSize = 14.000
_GZm8GEiBVgB1gw.TextWrapped = true
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
_AAaFCIMXlpV4v.Name = "Close"
_AAaFCIMXlpV4v.Parent = main.Frame
_AAaFCIMXlpV4v.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
_AAaFCIMXlpV4v.Font = "SourceSans"
_AAaFCIMXlpV4v.Size = UDim2.new(0, 45, 0, 28)
_AAaFCIMXlpV4v.Text = "X"
_AAaFCIMXlpV4v.TextSize = 30
_AAaFCIMXlpV4v.Position =  UDim2.new(0, 0, -1, 27)
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
Frame.Active = true
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
local _8a6v3gBIjU2FLL = {f = 0, b = 0, l = 0, r = 0}
local _487dl7PcLIQKzTo7 = 50
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
speed = speed+.5+(speed/_487dl7PcLIQKzTo7)
if speed > _487dl7PcLIQKzTo7 then
speed = _487dl7PcLIQKzTo7
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
_8a6v3gBIjU2FLL = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (_8a6v3gBIjU2FLL.f+_8a6v3gBIjU2FLL.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(_8a6v3gBIjU2FLL.l+_8a6v3gBIjU2FLL.r,(_8a6v3gBIjU2FLL.f+_8a6v3gBIjU2FLL.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/_487dl7PcLIQKzTo7),0,0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
_8a6v3gBIjU2FLL = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
game.Players.LocalPlayer.Character.Animate.Disabled = false
tpwalking = false
else
local plr = game.Players.LocalPlayer
local _z3gxFcNintrX = plr.Character._z3gxFcNintrX
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local _8a6v3gBIjU2FLL = {f = 0, b = 0, l = 0, r = 0}
local _487dl7PcLIQKzTo7 = 50
local speed = 0
local bg = Instance.new("BodyGyro", _z3gxFcNintrX)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = _z3gxFcNintrX.CFrame
local bv = Instance.new("BodyVelocity", _z3gxFcNintrX)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == true then
plr.Character.Humanoid.PlatformStand = true
end
while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
wait()
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/_487dl7PcLIQKzTo7)
if speed > _487dl7PcLIQKzTo7 then
speed = _487dl7PcLIQKzTo7
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
_8a6v3gBIjU2FLL = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (_8a6v3gBIjU2FLL.f+_8a6v3gBIjU2FLL.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(_8a6v3gBIjU2FLL.l+_8a6v3gBIjU2FLL.r,(_8a6v3gBIjU2FLL.f+_8a6v3gBIjU2FLL.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/_487dl7PcLIQKzTo7),0,0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
_8a6v3gBIjU2FLL = {f = 0, b = 0, l = 0, r = 0}
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
_AAaFCIMXlpV4v.MouseButton1Click:Connect(function()
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
_AAaFCIMXlpV4v.Position =  UDim2.new(0, 0, -1, 57)
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
_AAaFCIMXlpV4v.Position =  UDim2.new(0, 0, -1, 27)
end)
]=]
local function _EPTjfZEeD5A()
local oldGui = LocalPlayer.PlayerGui:FindFirstChild("main")
if oldGui then oldGui:Destroy() end
loadstring(_vvhj78cNYj)()
end
local function _Y9FKosCPmCA5()
_G.nowe = false
_G.tpwalking = false
local gui = LocalPlayer.PlayerGui:FindFirstChild("main")
if gui then gui:Destroy() end
local char = LocalPlayer.Character
local hum = char and char:FindFirstChildOfClass("Humanoid")
if hum then
hum.PlatformStand = false
local animate = char:FindFirstChild("Animate")
if animate then animate.Disabled = false end
end
end
local function _TU1fRqIJdxcTF61s(targetName)
local _65mRmc47 = 6283
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
myRoot.CFrame = tRoot.CFrame + Vector3.new(0, 0, 0)
task.wait(0.5)
bav:Destroy()
bv:Destroy()
myRoot.CFrame = savedCF
Notify("甩飞", "已甩飞 " .. targetName, 3)
end
local _MXxBoQrP5Jh = false
local function _se4nr6euXZe()
if _MXxBoQrP5Jh then return end
_MXxBoQrP5Jh = true
local count = 0
Notify("甩飞所有人", "开始甩飞服务器内所有玩家...", 3)
local myRoot = GetRoot()
if not myRoot then _MXxBoQrP5Jh = false return end
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
_MXxBoQrP5Jh = false
Notify("甩飞完成", "共甩飞 " .. count .. " 名玩家", 5)
end
local _JJh65IvECFvUz = {}
local function _ZyoS6vXR7QpDtKzY(player)
if player == LocalPlayer then return end
local function onChar(char)
if not char then return end
local head = char:FindFirstChild("Head") or char:WaitForChild("Head", 5)
local root = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 5)
local hum = char:FindFirstChildOfClass("Humanoid")
if not head then return end
if _JJh65IvECFvUz[player] then
for _, v in pairs(_JJh65IvECFvUz[player]) do
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
local name = Instance.new("_GZm8GEiBVgB1gw")
local _likJjEra = 1967
name.BackgroundTransparency = 1
name.Size = UDim2.new(1, 0, 0, 20)
name.Font = Enum.Font.GothamBold
name.TextSize = 14
name.TextColor3 = Color3.fromRGB(255, 80, 80)
name.TextStrokeTransparency = 0
name.Text = player.Name
name.Parent = bb
local info = Instance.new("_GZm8GEiBVgB1gw")
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
_JJh65IvECFvUz[player] = {bb = bb, hl = hl, info = info, root = root, hum = hum}
task.spawn(function()
while _JJh65IvECFvUz[player] and char and char.Parent do
local obj = _JJh65IvECFvUz[player]
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
local function _Ra4F8XdWWT(player)
if _JJh65IvECFvUz[player] then
for _, v in pairs(_JJh65IvECFvUz[player]) do
if v and v.Destroy then pcall(function() v:Destroy() end) end
end
_JJh65IvECFvUz[player] = nil
end
end
local espInit = false
local function initESP()
if espInit then return end
espInit = true
for _, p in ipairs(Players:GetPlayers()) do _ZyoS6vXR7QpDtKzY(p) end
Players.PlayerAdded:Connect(_ZyoS6vXR7QpDtKzY)
Players.PlayerRemoving:Connect(_Ra4F8XdWWT)
end
local function _bSzkX0scJpM6V()
local list = {}
for _, p in ipairs(Players:GetPlayers()) do
if p ~= LocalPlayer then table.insert(list, p.Name) end
end
return list
end
local _ZvC1bTHD82KgX2d = nil
local _0CpYOPgJIoGS = nil
local function _IkWTJcaflL()
if State.ShowFOV then
if not _ZvC1bTHD82KgX2d then
_ZvC1bTHD82KgX2d = Instance.new("Part")
_ZvC1bTHD82KgX2d.Name = "FOVCircle"
_ZvC1bTHD82KgX2d.Shape = Enum.PartType.Cylinder
_ZvC1bTHD82KgX2d.Material = Enum.Material.ForceField
_ZvC1bTHD82KgX2d.Color = Color3.fromRGB(255, 255, 255)
_ZvC1bTHD82KgX2d.Transparency = 0.5
_ZvC1bTHD82KgX2d.Anchored = true
_ZvC1bTHD82KgX2d.CanCollide = false
_ZvC1bTHD82KgX2d.CanQuery = false
_ZvC1bTHD82KgX2d.CastShadow = false
_ZvC1bTHD82KgX2d.Parent = Workspace
end
_ZvC1bTHD82KgX2d.Transparency = 1
local gui = game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
if not gui then
gui = Instance.new("_rID4eKtFwT")
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
local function _LduQz4BFiN45l()
local _fAhA2Ama = 8409
local _jgIUfVvxsyvg = nil
local _LMxSaob8K6paO = State.AimbotFOV
local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
for _, p in ipairs(Players:GetPlayers()) do
if p ~= LocalPlayer and p.Character then
local head = p.Character:FindFirstChild("Head")
local hum = p.Character:FindFirstChildOfClass("Humanoid")
if head and hum and hum.Health > 0 then
local _ZFWMDi4aRaGajN, onScreen = Camera:WorldToViewportPoint(head.Position)
if onScreen then
local dist = (Vector2.new(_ZFWMDi4aRaGajN.X, _ZFWMDi4aRaGajN.Y) - center).Magnitude
if dist < _LMxSaob8K6paO then
_LMxSaob8K6paO = dist
_jgIUfVvxsyvg = p
end
end
end
end
end
return _jgIUfVvxsyvg
end
local function _IPehy0n47oKX8eK()
_0CpYOPgJIoGS = RunService.RenderStepped:Connect(function()
if not State.Aimbot then return end
local _oDI686EiuAON = true
if State.AimbotKey then
_oDI686EiuAON = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end
if not _oDI686EiuAON then return end
local target = _LduQz4BFiN45l()
if target and target.Character then
local head = target.Character:FindFirstChild("Head")
if head then
local _Dzkm85vzthH = CFrame.new(Camera.CFrame.Position, head.Position)
Camera.CFrame = Camera.CFrame:Lerp(_Dzkm85vzthH, 0.15)
end
end
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
local function _7rYMur4YL8TRq()
if _0CpYOPgJIoGS then _0CpYOPgJIoGS:Disconnect() _0CpYOPgJIoGS = nil end
local gui = game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
if gui then gui:Destroy() end
end
local _FYfauBgwJ1Ypx = nil
local function _3PV3HiIGSKAMy()
local set = {}
for _, p in ipairs(Players:GetPlayers()) do
if p.Character then set[p.Character] = true end
end
return set
end
local function _N2fpqonZGH()
local list = {}
local _Fvdvhp5jgXYu = _3PV3HiIGSKAMy()
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("Model") and not _Fvdvhp5jgXYu[obj] then
local hum = obj:FindFirstChildOfClass("Humanoid")
local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso") or obj:FindFirstChild("_z3gxFcNintrX")
if hum and root and hum.Health > 0 then
table.insert(list, obj.Name)
end
end
end
return list
end
local function _X5aqGr65SLX2(name)
local _Fvdvhp5jgXYu = _3PV3HiIGSKAMy()
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("Model") and not _Fvdvhp5jgXYu[obj] and obj.Name == name then
local hum = obj:FindFirstChildOfClass("Humanoid")
local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso") or obj:FindFirstChild("_z3gxFcNintrX")
if hum and root and hum.Health > 0 then
return obj
end
end
end
return nil
end
local function _ruEGUY7q73IMa()
local _9kle5Qj9Z4jqtFTu = nil
local _LMxSaob8K6paO = State.AimbotFOV
local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
local _Fvdvhp5jgXYu = _3PV3HiIGSKAMy()
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("Model") and not _Fvdvhp5jgXYu[obj] then
local hum = obj:FindFirstChildOfClass("Humanoid")
local head = obj:FindFirstChild("Head")
if hum and head and hum.Health > 0 then
local _ZFWMDi4aRaGajN, onScreen = Camera:WorldToViewportPoint(head.Position)
if onScreen then
local dist = (Vector2.new(_ZFWMDi4aRaGajN.X, _ZFWMDi4aRaGajN.Y) - center).Magnitude
if dist < _LMxSaob8K6paO then
_LMxSaob8K6paO = dist
_9kle5Qj9Z4jqtFTu = obj
end
end
end
end
end
return _9kle5Qj9Z4jqtFTu
end
local function _r5dq3wwk7Zsce()
_FYfauBgwJ1Ypx = RunService.RenderStepped:Connect(function()
if not State.NpcAimbot then return end
local _oDI686EiuAON = true
if State.AimbotKey then
_oDI686EiuAON = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end
if not _oDI686EiuAON then return end
local target = _ruEGUY7q73IMa()
if target then
local head = target:FindFirstChild("Head")
if head then
local _Dzkm85vzthH = CFrame.new(Camera.CFrame.Position, head.Position)
Camera.CFrame = Camera.CFrame:Lerp(_Dzkm85vzthH, 0.15)
end
end
end)
end
local function _7G4LtQ0aizdLmV()
if _FYfauBgwJ1Ypx then _FYfauBgwJ1Ypx:Disconnect() _FYfauBgwJ1Ypx = nil end
end
local Window = WindUI:CreateWindow({
Title = "sbrp脚本",
Icon = "sparkles",
Folder = "ShenBuRuPing",
HideSearchBar = true,
})
local _gKbjMf3Tiu5NF = {}
local function _crVB3kNPgS()
local function _L4zNB4gTuO()
local guis = {}
if LocalPlayer:FindFirstChild("PlayerGui") then
for _, g in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
if g:IsA("_rID4eKtFwT") then table.insert(guis, g) end
end
end
local coreGui = game:GetService("CoreGui")
for _, g in ipairs(coreGui:GetChildren()) do
if g:IsA("_rID4eKtFwT") then table.insert(guis, g) end
end
for _, gui in ipairs(guis) do
for _, frame in ipairs(gui:GetDescendants()) do
if frame:IsA("Frame") and frame.Name == "Window" then
return frame
end
end
end
local largest = nil
local _zX8qwxRIULE = 0
for _, gui in ipairs(guis) do
for _, frame in ipairs(gui:GetDescendants()) do
if frame:IsA("Frame") and frame.Parent and frame.Parent:IsA("_rID4eKtFwT") then
local area = frame.AbsoluteSize.X * frame.AbsoluteSize.Y
if area > _zX8qwxRIULE then
_zX8qwxRIULE = area
largest = frame
end
end
end
end
return largest
end
task.defer(function()
local _DGp1Trz5GjKqWKB = _L4zNB4gTuO()
if not _DGp1Trz5GjKqWKB then
task.wait(1)
_DGp1Trz5GjKqWKB = _L4zNB4gTuO()
end
if not _DGp1Trz5GjKqWKB then return end
local _tI11tVww1iXCZ5B = Instance.new("UIStroke")
_tI11tVww1iXCZ5B.Name = "RainbowStrokeOuter"
_tI11tVww1iXCZ5B.Thickness = 4
_tI11tVww1iXCZ5B.Transparency = 0.1
_tI11tVww1iXCZ5B.Parent = _DGp1Trz5GjKqWKB
local _p9mT3u9CIPfRyu = Instance.new("UIGradient")
_p9mT3u9CIPfRyu.Name = "RainbowGradient"
_p9mT3u9CIPfRyu.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 127, 0)),
ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 170, 255)),
ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
})
_p9mT3u9CIPfRyu.Rotation = 0
_p9mT3u9CIPfRyu.Parent = _tI11tVww1iXCZ5B
local _zZOjVbmmEMH3 = Instance.new("UIStroke")
_zZOjVbmmEMH3.Name = "RainbowStrokeInner"
_zZOjVbmmEMH3.Thickness = 2
_zZOjVbmmEMH3.Transparency = 0.3
_zZOjVbmmEMH3.Parent = _DGp1Trz5GjKqWKB
local _GyCG0CM7TbmyL = Instance.new("UIGradient")
_GyCG0CM7TbmyL.Name = "RainbowGradient2"
_GyCG0CM7TbmyL.Color = _p9mT3u9CIPfRyu.Color
_GyCG0CM7TbmyL.Rotation = 180
_GyCG0CM7TbmyL.Parent = _zZOjVbmmEMH3
local stripes = {}
local _t6UU6JkFCRSSBov = {"Top", "Bottom", "Left", "Right"}
for _, pos in ipairs(_t6UU6JkFCRSSBov) do
local stripe = Instance.new("Frame")
stripe.Name = "RainbowStripe_" .. pos
stripe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
stripe.BorderSizePixel = 0
stripe.ZIndex = 10
local _v5xPgQdYZpjsh = Instance.new("UIGradient")
_v5xPgQdYZpjsh.Name = "Grad"
_v5xPgQdYZpjsh.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 127, 0)),
ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 170, 255)),
ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
})
_v5xPgQdYZpjsh.Parent = stripe
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
stripe.Parent = _DGp1Trz5GjKqWKB
table.insert(stripes, {frame = stripe, grad = _v5xPgQdYZpjsh, pos = pos})
end
local _DAQEeRVhTCFHT = 0
local _wMbbOs6cKLhLrr = 180
local _1KPteBW8C8U9GF9q = {0, 90, 0, 90}
local conn = RunService.RenderStepped:Connect(function(dt)
_DAQEeRVhTCFHT = (_DAQEeRVhTCFHT + 60 * dt) % 360
_wMbbOs6cKLhLrr = (_wMbbOs6cKLhLrr - 60 * dt) % 360
_p9mT3u9CIPfRyu.Rotation = _DAQEeRVhTCFHT
_GyCG0CM7TbmyL.Rotation = _wMbbOs6cKLhLrr
for i, s in ipairs(stripes) do
s.grad.Rotation = (s.grad.Rotation + (50 + i * 10) * dt) % 360
end
end)
table.insert(_gKbjMf3Tiu5NF, conn)
end)
end
_crVB3kNPgS()
local CharTab = Window:Tab({Title = "角色", Icon = "user"})
CharTab:Slider({
Title = "行走速度",
Value = {Min = 16, Max = 500, Default = 16},
Step = 1,
Callback = function(val) State.WalkSpeed = val _G7n6mEKXcIF() end,
})
CharTab:Slider({
Title = "跳跃力度",
Value = {Min = 50, Max = 500, Default = 50},
Step = 1,
Callback = function(val) State.JumpPower = val _20so9dFla3LTG4Qm() end,
})
CharTab:Button({
Title = "重置移动",
Callback = function()
State.WalkSpeed = 16 State.JumpPower = 50
_G7n6mEKXcIF() _20so9dFla3LTG4Qm()
end,
})
CharTab:Divider()
CharTab:Toggle({
Title = "飞行 (开启后弹出飞行面板)",
Default = false,
Callback = function(val)
if val then _EPTjfZEeD5A() else _Y9FKosCPmCA5() end
end,
})
CharTab:Divider()
CharTab:Button({
Title = "立即重生",
Callback = function()
local h = GetHum() if h then h.Health = 0 end
end,
})
local TeleTab = Window:Tab({Title = "传送", Icon = "map-pin"})
local _8ws42jQNlVVhVLT = nil
local _aU2EAJHGjC = TeleTab:Dropdown({
Title = "选择玩家",
Values = _bSzkX0scJpM6V(),
Callback = function(val) _8ws42jQNlVVhVLT = val end,
})
TeleTab:Button({
Title = "传送到该玩家",
Callback = function()
if not _8ws42jQNlVVhVLT then Notify("未选择", "", 3) return end
local t = Players:FindFirstChild(_8ws42jQNlVVhVLT)
if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
local r = GetRoot()
if r then r.CFrame = t.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) end
else Notify("失败", "目标不可用", 3) end
end,
})
TeleTab:Button({
Title = "刷新列表",
Callback = function()
if _aU2EAJHGjC then pcall(function() _aU2EAJHGjC:Refresh(_bSzkX0scJpM6V()) end) end
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
local _lYoB7gut7A5 = nil
local _MH2RqlNk6ncvS = nil
TeleTab:Toggle({
Title = "点击传送 (装备道具后点击地面)",
Default = false,
Callback = function(val)
if val then
_lYoB7gut7A5 = Instance.new("Tool")
_lYoB7gut7A5.Name = "点击传送"
_lYoB7gut7A5.ToolTip = "装备后点击任意位置传送"
_lYoB7gut7A5.RequiresHandle = false
_lYoB7gut7A5.CanBeDropped = false
_lYoB7gut7A5.Parent = LocalPlayer:WaitForChild("Backpack")
_MH2RqlNk6ncvS = _lYoB7gut7A5.Activated:Connect(function()
local mouse = LocalPlayer:GetMouse()
local r = GetRoot()
if r and mouse.Hit then
r.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
end
end)
Notify("点击传送", "已添加道具到物品栏，装备后点击任意位置传送", 4)
else
if _MH2RqlNk6ncvS then _MH2RqlNk6ncvS:Disconnect() _MH2RqlNk6ncvS = nil end
if _lYoB7gut7A5 then
if _lYoB7gut7A5.Parent then _lYoB7gut7A5:Destroy() end
_lYoB7gut7A5 = nil
end
Notify("点击传送", "已关闭", 3)
end
end,
})
local VisTab = Window:Tab({Title = "视觉", Icon = "eye"})
VisTab:Toggle({
Title = "ESP 透视 (名称+距离+血量)",
Default = false,
Callback = function(val)
State.ESPEnabled = val
if val then initESP() end
for _, obj in pairs(_JJh65IvECFvUz) do
if obj.bb then obj.bb.Enabled = val end
if obj.hl then obj.hl.Enabled = val end
end
end,
})
VisTab:Divider()
local _95GXDD33OXI = {}
VisTab:Toggle({
Title = "全亮",
Default = false,
Callback = function(val)
if val then
_95GXDD33OXI.B = Lighting.Brightness
_95GXDD33OXI.T = Lighting.ClockTime
_95GXDD33OXI.F = Lighting.FogEnd
_95GXDD33OXI.S = Lighting.GlobalShadows
Lighting.Brightness = 3
Lighting.ClockTime = 12
Lighting.FogEnd = 1e9
Lighting.GlobalShadows = false
else
if _95GXDD33OXI.B then Lighting.Brightness = _95GXDD33OXI.B end
if _95GXDD33OXI.T then Lighting.ClockTime = _95GXDD33OXI.T end
if _95GXDD33OXI.F then Lighting.FogEnd = _95GXDD33OXI.F end
if _95GXDD33OXI.S ~= nil then Lighting.GlobalShadows = _95GXDD33OXI.S end
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
local _pEnHVyg61KZ5xKqq = [=[
local _MGoAkzir = 7641
local Speed = 50
local _RZ27gnYToUiJDT1 = game.Players.LocalPlayer.Character.HumanoidRootPart
local _rID4eKtFwT = Instance.new("_rID4eKtFwT")
local W = Instance.new("TextButton")
local S = Instance.new("TextButton")
local A = Instance.new("TextButton")
local D = Instance.new("TextButton")
local Fly = Instance.new("TextButton")
local unfly = Instance.new("TextButton")
local StopFly = Instance.new("TextButton")
_rID4eKtFwT.Name = "CarFlyGUI"
_rID4eKtFwT.Parent = game.CoreGui
_rID4eKtFwT.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_rID4eKtFwT.ResetOnSpawn = false
unfly.Name = "上"
unfly.Parent = _rID4eKtFwT
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
_RZ27gnYToUiJDT1:FindFirstChildOfClass("BodyVelocity"):Destroy()
_RZ27gnYToUiJDT1:FindFirstChildOfClass("BodyGyro"):Destroy()
end)
StopFly.Name = "停止飞行"
StopFly.Parent = _rID4eKtFwT
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
_RZ27gnYToUiJDT1.Anchored = true
end)
Fly.Name = "飞行"
Fly.Parent = _rID4eKtFwT
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
local BV = Instance.new("BodyVelocity",_RZ27gnYToUiJDT1)
local BG = Instance.new("BodyGyro",_RZ27gnYToUiJDT1)
BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
BG.D = 5000
BG.P = 50000
BG.CFrame = game.Workspace.CurrentCamera.CFrame
BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
end)
W.Name = "W"
W.Parent = _rID4eKtFwT
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
_RZ27gnYToUiJDT1.Anchored = false
_RZ27gnYToUiJDT1:FindFirstChildOfClass("BodyVelocity"):Destroy()
_RZ27gnYToUiJDT1:FindFirstChildOfClass("BodyGyro"):Destroy()
wait(.1)
local BV = Instance.new("BodyVelocity",_RZ27gnYToUiJDT1)
local _PGQyMVIC = 6420
local BG = Instance.new("BodyGyro",_RZ27gnYToUiJDT1)
BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
BG.D = 50000
BG.P = 50000
BG.CFrame = game.Workspace.CurrentCamera.CFrame
BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed
end)
S.Name = "S"
S.Parent = _rID4eKtFwT
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
_RZ27gnYToUiJDT1.Anchored = false
_RZ27gnYToUiJDT1:FindFirstChildOfClass("BodyVelocity"):Destroy()
_RZ27gnYToUiJDT1:FindFirstChildOfClass("BodyGyro"):Destroy()
wait(.1)
local BV = Instance.new("BodyVelocity",_RZ27gnYToUiJDT1)
local BG = Instance.new("BodyGyro",_RZ27gnYToUiJDT1)
BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
BG.D = 5000
BG.P = 50000
BG.CFrame = game.Workspace.CurrentCamera.CFrame
BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed
end)
]=]
local function _ZxlNfMTTRCQ7hHqO()
local oldGui = game:GetService("CoreGui"):FindFirstChild("CarFlyGUI")
if oldGui then oldGui:Destroy() end
loadstring(_pEnHVyg61KZ5xKqq)()
Notify("飞车", "飞车面板已开启", 3)
end
local function _9VqQDxdQOOTcZgn()
local gui = game:GetService("CoreGui"):FindFirstChild("CarFlyGUI")
if gui then gui:Destroy() end
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
local GenTab = Window:Tab({Title = "通用", Icon = "package"})
GenTab:Toggle({
Title = "飞车 (开启后弹出飞车面板)",
Default = false,
Callback = function(val)
if val then _ZxlNfMTTRCQ7hHqO() else _9VqQDxdQOOTcZgn() end
end,
})
GenTab:Divider()
GenTab:Toggle({
Title = "无掉落伤害",
Default = false,
Callback = function(val)
State.NoFallDamage = val
if val then
local h = GetHum()
if h then _x9nSZd8FQXo5GwHm(h) end
end
end,
})
GenTab:Divider()
local _RR3hcZxOUBL = nil
GenTab:Dropdown({
Title = "甩飞目标",
Values = _bSzkX0scJpM6V(),
Callback = function(val) _RR3hcZxOUBL = val end,
})
GenTab:Button({
Title = "甩飞!",
Callback = function()
if _RR3hcZxOUBL then _TU1fRqIJdxcTF61s(_RR3hcZxOUBL)
else Notify("未选择", "请先选择目标", 3) end
end,
})
GenTab:Button({
Title = "甩飞所有人!",
Callback = function()
task.spawn(_se4nr6euXZe)
end,
})
GenTab:Divider()
GenTab:Toggle({
Title = "快速跑步 (3倍速度)",
Default = false,
Callback = function(val)
if val then
_ODg8khUQdzlmF = RunService.RenderStepped:Connect(function()
local hum = GetHum()
if hum then
hum.WalkSpeed = State.WalkSpeed * 3
end
end)
Notify("快速跑步", "速度已提升至3倍", 3)
else
if _ODg8khUQdzlmF then _ODg8khUQdzlmF:Disconnect() _ODg8khUQdzlmF = nil end
_G7n6mEKXcIF()
Notify("快速跑步", "已恢复正常速度", 3)
end
end,
})
GenTab:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
if val then
_MkxVyvhcFb = UserInputService.JumpRequest:Connect(function()
local h = GetHum()
if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _MkxVyvhcFb then _MkxVyvhcFb:Disconnect() _MkxVyvhcFb = nil end
end
end,
})
GenTab:Toggle({
Title = "穿墙",
Default = false,
Callback = function(val)
if val then
_onbhIa20mXFTEIQ = RunService.Stepped:Connect(function()
local c = GetChar()
if c then
for _, p in ipairs(c:GetDescendants()) do
if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
end
end
end)
else
if _onbhIa20mXFTEIQ then _onbhIa20mXFTEIQ:Disconnect() _onbhIa20mXFTEIQ = nil end
end
end,
})
GenTab:Toggle({
Title = "防击退/防甩飞",
Default = false,
Callback = function(val)
if val then
_qrwg6HW82aJq8v4n = RunService.Heartbeat:Connect(function()
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
if _qrwg6HW82aJq8v4n then _qrwg6HW82aJq8v4n:Disconnect() _qrwg6HW82aJq8v4n = nil end
Notify("防击退", "已关闭防击退保护", 3)
end
end,
})
GenTab:Divider()
local _z5vPylgXWZYVAM = nil
GenTab:Toggle({
Title = "防甩飞",
Default = false,
Callback = function(val)
if val then
_z5vPylgXWZYVAM = RunService.Heartbeat:Connect(function()
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
if _z5vPylgXWZYVAM then _z5vPylgXWZYVAM:Disconnect() _z5vPylgXWZYVAM = nil end
Notify("防甩飞", "已关闭防甩飞保护", 3)
end
end,
})
local _6s0nnIsT1dKcWc9 = nil
GenTab:Toggle({
Title = "隐身",
Default = false,
Callback = function(val)
if val then
_6s0nnIsT1dKcWc9 = RunService.Heartbeat:Connect(function()
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
if _6s0nnIsT1dKcWc9 then _6s0nnIsT1dKcWc9:Disconnect() _6s0nnIsT1dKcWc9 = nil end
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
GenTab:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
if val then
_SKiUyHqfGqK = RunService.Heartbeat:Connect(function()
local hum = GetHum()
if hum then
if hum.Health < hum.MaxHealth then
hum.Health = hum.MaxHealth
end
end
end)
Notify("无敌", "已开启无敌模式", 3)
else
if _SKiUyHqfGqK then _SKiUyHqfGqK:Disconnect() _SKiUyHqfGqK = nil end
Notify("无敌", "已关闭无敌模式", 3)
end
end,
})
GenTab:Toggle({
Title = "锁血 (锁定当前血量)",
Default = false,
Callback = function(val)
if val then
local hum = GetHum()
local _ceFpbXo7hugJnNI = hum and hum.Health or 100
Notify("锁血", "已锁定血量: " .. math.floor(_ceFpbXo7hugJnNI), 3)
_2obc8l9n2MFM = RunService.Heartbeat:Connect(function()
local h = GetHum()
if h and h.Health ~= _ceFpbXo7hugJnNI then
h.Health = _ceFpbXo7hugJnNI
end
end)
else
if _2obc8l9n2MFM then _2obc8l9n2MFM:Disconnect() _2obc8l9n2MFM = nil end
Notify("锁血", "已关闭锁血", 3)
end
end,
})
GenTab:Divider()
GenTab:Button({
Title = "服务器跳转",
Callback = function()
pcall(function()
local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)
local data = _aUpMAkqOMNaZom:JSONDecode(game:HttpGet(url))
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
local _IXV22sfS4r
GenTab:Toggle({
Title = "防挂机",
Default = false,
Callback = function(val)
if val then
local vu = game:GetService("VirtualUser")
_IXV22sfS4r = LocalPlayer.Idled:Connect(function()
vu:CaptureController()
vu:ClickButton2(Vector2.new())
end)
else
if _IXV22sfS4r then _IXV22sfS4r:Disconnect() _IXV22sfS4r = nil end
end
end,
})
GenTab:Divider()
GenTab:Toggle({
Title = "汉化祖国人飞行",
Default = false,
Callback = function(val)
if val then
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/-/refs/heads/main/祖国人汉化"))()
end)
Notify("祖国人飞行", "已执行汉化祖国人飞行", 3)
end
end,
})
GenTab:Divider()
GenTab:Toggle({
Title = "人物旋转",
Default = false,
Callback = function(val)
State.CharRotate = val
if val then
Notify("通用", "人物旋转已开启", 3)
_LzgRUt8PhsBfhhIN = RunService.Heartbeat:Connect(function()
local hr = GetRoot()
if hr then
hr.CFrame = hr.CFrame * CFrame.Angles(0, math.rad(3), 0)
end
end)
else
if _LzgRUt8PhsBfhhIN then
_LzgRUt8PhsBfhhIN:Disconnect()
_LzgRUt8PhsBfhhIN = nil
end
Notify("通用", "人物旋转已关闭", 3)
end
end,
})
GenTab:Toggle({
Title = "秒互动",
Default = false,
Callback = function(val)
State.InstantPrompt = val
if val then
local _jV5TZP51CbVI = game:GetService("ProximityPromptService")
local function _0TVOX22ajCU(parent, duration)
for _, desc in ipairs(parent:GetDescendants()) do
if desc:IsA("ProximityPrompt") then
desc.HoldDuration = duration
end
end
end
_0TVOX22ajCU(workspace, 0.01)
State._PromptBind = _jV5TZP51CbVI.PromptButtonHoldBegan:Connect(function(prompt)
prompt.HoldDuration = 0.01
end)
State._PromptConn = workspace.DescendantAdded:Connect(function(desc)
if desc:IsA("ProximityPrompt") and State.InstantPrompt then
desc.HoldDuration = 0.01
end
end)
Notify("通用", "秒互动已开启", 3)
else
if State._PromptBind then State._PromptBind:Disconnect() State._PromptBind = nil end
if State._PromptConn then State._PromptConn:Disconnect() State._PromptConn = nil end
local function _4cy2qU2jLtw(parent, duration)
for _, desc in ipairs(parent:GetDescendants()) do
if desc:IsA("ProximityPrompt") then
desc.HoldDuration = duration
end
end
end
_4cy2qU2jLtw(workspace, 0.5)
Notify("通用", "秒互动已关闭", 3)
end
end,
})
local AimTab = Window:Tab({Title = "自瞄和子追", Icon = "crosshair"})
local _5prSrabN = 6577
AimTab:Toggle({
Title = "自瞄",
Default = false,
Callback = function(val)
State.Aimbot = val
if val then _IPehy0n47oKX8eK() else _7rYMur4YL8TRq() end
end,
})
AimTab:Slider({
Title = "FOV范围",
Value = {Min = 30, Max = 500, Default = 150},
Step = 10,
Callback = function(val) State.AimbotFOV = val end,
})
AimTab:Toggle({
Title = "显示范围圈",
Default = false,
Callback = function(val)
State.ShowFOV = val
_IkWTJcaflL()
end,
})
AimTab:Toggle({
Title = "右键自瞄",
Default = false,
Callback = function(val) State.AimbotKey = val end,
})
AimTab:Divider()
local _MLiopJxH6ZxRIET = nil
local _YU8C05AK0g = nil
local _MEp9lWwaZfvZ = 15
local _L9SUQo9bMJ3 = false
AimTab:Dropdown({
Title = "目标",
Values = _bSzkX0scJpM6V(),
Callback = function(val) _MLiopJxH6ZxRIET = val end,
})
AimTab:Button({
Title = "刷新列表",
Callback = function()
local list = _bSzkX0scJpM6V()
Notify("子追", "已刷新玩家列表 (" .. #list .. " 人)", 3)
end,
})
AimTab:Toggle({
Title = "通用子追",
Default = false,
Callback = function(val)
if val then
if not _MLiopJxH6ZxRIET then
Notify("未选择", "请先选择子追目标", 3)
return
end
_YU8C05AK0g = RunService.Heartbeat:Connect(function()
local target = Players:FindFirstChild(_MLiopJxH6ZxRIET)
if target and target.Character then
local tRoot = target.Character:FindFirstChild("HumanoidRootPart")
local tHum = target.Character:FindFirstChildOfClass("Humanoid")
local myRoot = GetRoot()
local myHum = GetHum()
if tRoot and tHum and tHum.Health > 0 and myRoot then
local dist = (tRoot.Position - myRoot.Position).Magnitude
local _1C1RssOB0pQxCW1a = _MEp9lWwaZfvZ
if dist > _1C1RssOB0pQxCW1a + 5 then
local _6tvcF35ZwheW65 = (tRoot.Position - myRoot.Position).Unit
local speed = dist > 50 and 3 or 1.5
if _L9SUQo9bMJ3 then speed = speed * 1.5 end
myRoot.CFrame = myRoot.CFrame + _6tvcF35ZwheW65 * speed
elseif dist < _1C1RssOB0pQxCW1a - 5 then
local _6tvcF35ZwheW65 = (myRoot.Position - tRoot.Position).Unit
myRoot.CFrame = myRoot.CFrame + _6tvcF35ZwheW65 * 1
end
if dist < 100 then
myRoot.CFrame = CFrame.lookAt(myRoot.Position, Vector3.new(tRoot.Position.X, myRoot.Position.Y, tRoot.Position.Z))
end
end
else
if not target or not target.Character then
Notify("子追", "目标已离开或死亡，子追暂停", 3)
end
end
end)
Notify("子追", "已开始子追 " .. _MLiopJxH6ZxRIET, 3)
else
if _YU8C05AK0g then _YU8C05AK0g:Disconnect() _YU8C05AK0g = nil end
Notify("子追", "已停止子追", 3)
end
end,
})
AimTab:Slider({
Title = "子追距离",
Value = {Min = 5, Max = 100, Default = 15},
Step = 1,
Callback = function(val) _MEp9lWwaZfvZ = val end,
})
AimTab:Divider()
AimTab:Toggle({
Title = "NPC自瞄",
Default = false,
Callback = function(val)
State.NpcAimbot = val
if val then _r5dq3wwk7Zsce() else _7G4LtQ0aizdLmV() end
end,
})
AimTab:Divider()
local _363TaNfIDR1OWCr = nil
local _7o0P49CN781iXnVM = nil
local _BnTLFEBLl9Y4dfe = 15
local _1VMzyKRWUcws4 = false
local _cE3CoWBnCs7w = AimTab:Dropdown({
Title = "NPC目标",
Values = _N2fpqonZGH(),
Callback = function(val) _363TaNfIDR1OWCr = val end,
})
AimTab:Button({
Title = "刷新列表",
Callback = function()
local list = _N2fpqonZGH()
Notify("NPC子追", "已刷新 NPC 列表 (" .. #list .. " 个)", 3)
end,
})
AimTab:Toggle({
Title = "NPC子追",
Default = false,
Callback = function(val)
if val then
if not _363TaNfIDR1OWCr then
Notify("未选择", "请先选择 NPC 子追目标", 3)
return
end
_7o0P49CN781iXnVM = RunService.Heartbeat:Connect(function()
local npc = _X5aqGr65SLX2(_363TaNfIDR1OWCr)
if npc then
local tRoot = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("Torso") or npc:FindFirstChild("_z3gxFcNintrX")
local tHum = npc:FindFirstChildOfClass("Humanoid")
local myRoot = GetRoot()
if tRoot and tHum and tHum.Health > 0 and myRoot then
local dist = (tRoot.Position - myRoot.Position).Magnitude
local _1C1RssOB0pQxCW1a = _BnTLFEBLl9Y4dfe
if dist > _1C1RssOB0pQxCW1a + 5 then
local _6tvcF35ZwheW65 = (tRoot.Position - myRoot.Position).Unit
local speed = dist > 50 and 3 or 1.5
if _1VMzyKRWUcws4 then speed = speed * 1.5 end
myRoot.CFrame = myRoot.CFrame + _6tvcF35ZwheW65 * speed
elseif dist < _1C1RssOB0pQxCW1a - 5 then
local _6tvcF35ZwheW65 = (myRoot.Position - tRoot.Position).Unit
myRoot.CFrame = myRoot.CFrame + _6tvcF35ZwheW65 * 1
end
if dist < 100 then
myRoot.CFrame = CFrame.lookAt(myRoot.Position, Vector3.new(tRoot.Position.X, myRoot.Position.Y, tRoot.Position.Z))
end
end
else
Notify("NPC子追", "NPC 已消失或死亡，子追暂停", 3)
end
end)
Notify("NPC子追", "已开始子追 " .. _363TaNfIDR1OWCr, 3)
else
if _7o0P49CN781iXnVM then _7o0P49CN781iXnVM:Disconnect() _7o0P49CN781iXnVM = nil end
Notify("NPC子追", "已停止 NPC 子追", 3)
end
end,
})
AimTab:Slider({
Title = "NPC子追距离",
Value = {Min = 5, Max = 100, Default = 15},
Step = 1,
Callback = function(val) _BnTLFEBLl9Y4dfe = val end,
})
AimTab:Toggle({
Title = "NPC自动飞行",
Default = false,
Callback = function(val)
if val then
_1VMzyKRWUcws4 = true
Notify("NPC子追", "NPC 子追时将自动飞行", 3)
else
_1VMzyKRWUcws4 = false
Notify("NPC子追", "NPC 子追飞行已关闭", 3)
end
end,
})
local SetTab = Window:Tab({Title = "设置", Icon = "settings"})
SetTab:Dropdown({
Title = "主题",
Values = {"Pink", "Dark", "Light", "Violet", "Ocean"},
Callback = function(val) pcall(function() WindUI:SetTheme(val) end) end,
})
SetTab:Button({
Title = "销毁脚本",
Callback = function()
_Y9FKosCPmCA5()
State.Aimbot = false _7rYMur4YL8TRq()
State.NpcAimbot = false _7G4LtQ0aizdLmV()
State.CharRotate = false
if _LzgRUt8PhsBfhhIN then _LzgRUt8PhsBfhhIN:Disconnect() end
if _MkxVyvhcFb then _MkxVyvhcFb:Disconnect() end
if _onbhIa20mXFTEIQ then _onbhIa20mXFTEIQ:Disconnect() end
if _IXV22sfS4r then _IXV22sfS4r:Disconnect() end
if _ODg8khUQdzlmF then _ODg8khUQdzlmF:Disconnect() end
if _qrwg6HW82aJq8v4n then _qrwg6HW82aJq8v4n:Disconnect() end
if _SKiUyHqfGqK then _SKiUyHqfGqK:Disconnect() end
if _2obc8l9n2MFM then _2obc8l9n2MFM:Disconnect() end
if _z5vPylgXWZYVAM then _z5vPylgXWZYVAM:Disconnect() end
if _6s0nnIsT1dKcWc9 then _6s0nnIsT1dKcWc9:Disconnect() end
if _MH2RqlNk6ncvS then _MH2RqlNk6ncvS:Disconnect() end
if _lYoB7gut7A5 then _lYoB7gut7A5:Destroy() end
if _YU8C05AK0g then _YU8C05AK0g:Disconnect() end
if _7o0P49CN781iXnVM then _7o0P49CN781iXnVM:Disconnect() end
for _, c in ipairs(_gKbjMf3Tiu5NF) do c:Disconnect() end
for p in pairs(_JJh65IvECFvUz) do _Ra4F8XdWWT(p) end
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
local _PL7JiXv2M6wIn67 = Window:Tab({Title = "脚本服务器", Icon = "server"})
local _GhJgpDapEFr2 = "https://raw.githubusercontent.com/GGG792/RobloxAeroScripts/main/Aero%E6%9C%80%E6%96%B0%E5%90%88%E9%9B%86/"
local _AwM065eC99d = {
{name = "8个球池经典", file = "8个球池经典.lua"},
{name = "99 夜", file = "99 夜.lua"},
{name = "Blox Fruit", file = "Blox Fruit.lua"},
{name = "Dungeon Hunters", file = "Dungeon Hunters.lua"},
{name = "GB", file = "GB.lua"},
{name = "chain", file = "chain.lua"},
{name = "po大po", file = "po大po.lua"},
{name = "举重模拟器", file = "举重模拟器.lua"},
{name = "亡命速递", file = "亡命速递.lua"},
{name = "保护房子不受怪物入侵", file = "保护房子不受怪物入侵.lua"},
{name = "像素之刃", file = "像素之刃.lua"},
{name = "僵尸之塔", file = "僵尸之塔.lua"},
{name = "僵尸生存竞技场", file = "僵尸生存竞技场.lua"},
{name = "克隆王国大亨", file = "克隆王国大亨.lua"},
{name = "决斗场", file = "决斗场.lua"},
{name = "刀刃球", file = "刀刃球.lua"},
{name = "划开大海", file = "划开大海.lua"},
{name = "力量传奇", file = "力量传奇.lua"},
{name = "南极洲探险", file = "南极洲探险.lua"},
{name = "启示录", file = "启示录.lua"},
{name = "奴才大亨", file = "奴才大亨.lua"},
{name = "寻找巨型鱼", file = "寻找巨型鱼.lua"},
{name = "平滑切片", file = "平滑切片.lua"},
{name = "强壮传奇", file = "强壮传奇.lua"},
{name = "忍者传奇", file = "忍者传奇.lua"},
{name = "戒网瘾中心", file = "戒网瘾中心.lua"},
{name = "战争机器", file = "战争机器.lua"},
{name = "手枪竞技场", file = "手枪竞技场.lua"},
{name = "撕咬之夜", file = "撕咬之夜.lua"},
{name = "无家可归", file = "无家可归.lua"},
{name = "最强战场", file = "最强战场.lua"},
{name = "最强的拳击模拟器", file = "最强的拳击模拟器.lua"},
{name = "月球增量", file = "月球增量.lua"},
{name = "木筏101天生存", file = "木筏101天生存.lua"},
{name = "极速传奇", file = "极速传奇.lua"},
{name = "模仿者", file = "模仿者.lua"},
{name = "死铁轨", file = "死铁轨.lua"},
{name = "每步+1 智商", file = "每步+1 智商.lua"},
{name = "水手碎片", file = "水手碎片.lua"},
{name = "汽车经销商大亨", file = "汽车经销商大亨.lua"},
{name = "沉默的刺客", file = "沉默的刺客.lua"},
{name = "滑石头RNG", file = "滑石头RNG.lua"},
{name = "火球训练", file = "火球训练.lua"},
{name = "火箭发射模拟器", file = "火箭发射模拟器.lua"},
{name = "犯罪", file = "犯罪.lua"},
{name = "生存于杀手", file = "生存于杀手.lua"},
{name = "画我", file = "画我.lua"},
{name = "监狱泵", file = "监狱泵.lua"},
{name = "矿井", file = "矿井.lua"},
{name = "砍伐树木", file = "砍伐树木.lua"},
{name = "破坏者谜团2", file = "破坏者谜团2.lua"},
{name = "种植花园", file = "种植花园.lua"},
{name = "竞争对手", file = "竞争对手.lua"},
{name = "花园地平线", file = "花园地平线.lua"},
{name = "血债", file = "血债.lua"},
{name = "血色地带", file = "血色地带.lua"},
{name = "训练怪兽进行破坏", file = "训练怪兽进行破坏.lua"},
{name = "诅咒之刃", file = "诅咒之刃.lua"},
{name = "超真实csgo", file = "超真实csgo.lua"},
{name = "超高速跑者", file = "超高速跑者.lua"},
{name = "迷你帝国", file = "迷你帝国.lua"},
{name = "造船寻宝", file = "造船寻宝.lua"},
{name = "金币点击器", file = "金币点击器.lua"},
{name = "钓鱼模拟器", file = "钓鱼模拟器.lua"},
{name = "闪光", file = "闪光.lua"},
{name = "防御", file = "防御.lua"},
{name = "集装箱RNG", file = "集装箱RNG.lua"},
{name = "餐厅大亨3", file = "餐厅大亨3.lua"},
{name = "鲨鱼咬", file = "鲨鱼咬.lua"},
}
local function _S8ALWZDtsdym9d(scriptName, fileName)
local url = _GhJgpDapEFr2 .. _aUpMAkqOMNaZom:UrlEncode(fileName)
Notify("正在加载", "正在获取 " .. scriptName .. " 源码...", 3)
local success, result = pcall(function()
return game:HttpGet(url)
end)
if success and result then
local _ex3AjsCJp5BSF, execErr = pcall(function()
loadstring(result)()
end)
if _ex3AjsCJp5BSF then
Notify("加载成功", scriptName .. " 已成功运行!", 3)
else
sysMsg("执行失败", tostring(execErr))
end
else
sysMsg("获取失败", "无法获取 " .. scriptName .. " 的源码")
end
end
_PL7JiXv2M6wIn67:Input({
Title = "搜索脚本",
Placeholder = "输入脚本名称搜索...",
Callback = function(text)
if text and #text > 0 then
local found = false
for _, s in ipairs(_AwM065eC99d) do
if string.find(string.lower(s.name), string.lower(text), 1, true) then
found = true
break
end
end
if not found then
Notify("搜索结果", "未找到匹配 '" .. text .. "' 的脚本", 3)
end
end
end,
})
_PL7JiXv2M6wIn67:Divider()
local _ojFCuWzCx2Vo = nil
local _rVgnSozy06 = _PL7JiXv2M6wIn67:Dropdown({
Title = "选择脚本",
Values = (function()
local names = {}
for _, s in ipairs(_AwM065eC99d) do
table.insert(names, s.name)
end
return names
end)(),
Callback = function(val) _ojFCuWzCx2Vo = val end,
})
_PL7JiXv2M6wIn67:Button({
Title = "执行选中脚本",
Callback = function()
if _ojFCuWzCx2Vo then
for _, s in ipairs(_AwM065eC99d) do
if s.name == _ojFCuWzCx2Vo then
_S8ALWZDtsdym9d(s.name, s.file)
return
end
end
else
Notify("提示", "请先选择一个脚本", 3)
end
end,
})
_PL7JiXv2M6wIn67:Button({
Title = "刷新脚本列表",
Callback = function()
local names = {}
for _, s in ipairs(_AwM065eC99d) do
table.insert(names, s.name)
end
Notify("脚本列表", "共 " .. #names .. " 个脚本", 3)
end,
})
_PL7JiXv2M6wIn67:Divider()
_PL7JiXv2M6wIn67:Button({
Title = "圣奥里",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://pastebin.com/raw/3U9WtQGU"))()
end)
Notify("圣奥里", "已执行圣奥里脚本", 3)
end,
})
local _3ughf3k6G8 = Window:Tab({Title = "其他脚本", Icon = "file-text"})
_3ughf3k6G8:Button({
Title = "情云脚本",
Callback = function()
pcall(function()
loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
end)
Notify("情云脚本", "已执行情云脚本", 3)
end,
})
_3ughf3k6G8:Button({
Title = "夜脚本",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ylt410/roblox-Script/refs/heads/main/yejiaoben"))()
end)
Notify("夜脚本", "已执行夜脚本", 3)
end,
})
_3ughf3k6G8:Button({
Title = "XA脚本",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.gitcode.com/Xingtaiduan/Scripts/raw/main/Loader.lua"))()
end)
Notify("XA脚本", "已执行XA脚本", 3)
end,
})
_3ughf3k6G8:Button({
Title = "皮脚本",
Callback = function()
pcall(function()
getgenv().XiaoPi = "皮脚本QQ群1065725086"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
end)
Notify("皮脚本", "已执行皮脚本", 3)
end,
})
_3ughf3k6G8:Button({
Title = "ROB脚本",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.gitcode.com/ROB5201314/robscript/raw/main/ROB.V3"))()
end)
Notify("ROB脚本", "已执行ROB脚本", 3)
end,
})
Notify("欢迎使用", "sbrp脚本", 5)
task.wait(1)
Notify("sbrp脚本", "v5.0 加载完成", 3)