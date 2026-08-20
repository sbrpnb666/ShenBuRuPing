local _TTdYrD1w = 0
local _Angr4yg2 = ""
local _Ihey6Nqx = nil
local _0001  game:GetService("_0001")
local function sysMsg(title, text)
pcall(function()
_0001:SetCore("SendNotification", {Title = title, Text = text or "", Duration = 5})
end)
end
local _0002 pcall(function()
_0002 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/_0002/_0019/_0057/_0019.lua"))()
end)
if not _0002 then
sysMsg("加载失败", "_0002 无法加载")
return
end
local _0003  game:GetService("_0003")
local _0004  game:GetService("_0004")
local _0005  game:GetService("_0005")
local _0006  game:GetService("_0006")
local _0007  game:GetService("_0007")
local _0008  game:GetService("_0008")
local _0009  game:GetService("_0009")
local _000a  _0003._000a
local _000b  _0007.CurrentCamera
local function Notify(title, content, duration)
pcall(function()
_0002:Notify({Title = title, Content = content or "", Duration = duration or 3})
end)
end
local function GetChar() return _000a.Character end
local function GetRoot()
local _000c  GetChar()
return _000c and _000c:FindFirstChild("HumanoidRootPart") or nil
end
local function GetHum()
local _000c  GetChar()
return _000c and _000c:FindFirstChildOfClass("Humanoid") or nil
end
local _000d  {
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
local _000e  nil
local _000f  nil
local _0010  nil
local _0011  nil
local _0012  nil
local _0013  nil
local _0014  nil
local function applyWalkSpeed()
local _0015  GetHum() if _0015 then _0015.WalkSpeed = _000d.WalkSpeed end
end
local function applyJumpPower()
local _0015  GetHum()
if _0015 then
if _0015.UseJumpPower then _0015.JumpPower = _000d.JumpPower
else _0015.JumpHeight = _000d.JumpPower / 10 end
end
end
local _0016 local function setupNoFallDamage(_0017)
if not _0017 then return end
_0017.StateChanged:Connect(function(_, new)
if new == Enum.HumanoidStateType.FallingDown then
task.wait()
_0017:ChangeState(Enum.HumanoidStateType.GettingUp)
end
end)
end
local function onCharacterAdded(_0038)
local _0017  _0038:WaitForChild("Humanoid", 10)
if not _0017 then return end
task.wait(0.3)
applyWalkSpeed()
applyJumpPower()
if _000d.NoFallDamage then setupNoFallDamage(_0017) end
end
if _000a.Character then task.spawn(onCharacterAdded, _000a.Character) end
_000a.CharacterAdded:Connect(onCharacterAdded)
local _0018  [=[
local _0019  Instance.new("_0083")
local _001a  Instance.new("_001a")
local _001b  Instance.new("TextButton")
local _001c  Instance.new("TextButton")
local _001d  Instance.new("TextButton")
local _001e  Instance.new("_001e")
local _001f  Instance.new("TextButton")
local _0020  Instance.new("_001e")
local _0021  Instance.new("TextButton")
local _0022  Instance.new("TextButton")
local _0023  Instance.new("TextButton")
local _0024  Instance.new("TextButton")
_0019.Name = "_0019"
_0019.Parent = game._0003._000a:WaitForChild("PlayerGui")
_0019.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_0019.ResetOnSpawn = false
_001a.Parent = _0019
_001a.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
_001a.BorderColor3 = Color3.fromRGB(103, 221, 213)
_001a.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
_001a.Size = UDim2.new(0, 190, 0, 57)
_001b.Name = "_001b"
_001b.Parent = _001a
_001b.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
_001b.Size = UDim2.new(0, 44, 0, 28)
_001b.Font = Enum.Font.SourceSans
_001b.Text = "_001b"
_001b.TextColor3 = Color3.fromRGB(0, 0, 0)
_001b.TextSize = 14.000
_001c.Name = "_001c"
_001c.Parent = _001a
_001c.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
_001c.Position = UDim2.new(0, 0, 0.491228074, 0)
_001c.Size = UDim2.new(0, 44, 0, 28)
_001c.Font = Enum.Font.SourceSans
_001c.Text = "_001c"
_001c.TextColor3 = Color3.fromRGB(0, 0, 0)
_001c.TextSize = 14.000
_001d.Name = "_001d"
_001d.Parent = _001a
_001d.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
_001d.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
_001d.Size = UDim2.new(0, 56, 0, 28)
_001d.Font = Enum.Font.SourceSans
_001d.Text = "fly"
_001d.TextColor3 = Color3.fromRGB(0, 0, 0)
_001d.TextSize = 14.000
_001e.Parent = _001a
_001e.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
_001e.Position = UDim2.new(0.469327301, 0, 0, 0)
_001e.Size = UDim2.new(0, 100, 0, 28)
_001e.Font = Enum.Font.SourceSans
_001e.Text = "_0088 GUI V3"
_001e.TextColor3 = Color3.fromRGB(0, 0, 0)
_001e.TextScaled = true
_001e.TextSize = 14.000
_001e.TextWrapped = true
_001f.Name = "_001f"
_001f.Parent = _001a
_001f.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
_001f.Position = UDim2.new(0.231578946, 0, 0, 0)
_001f.Size = UDim2.new(0, 45, 0, 28)
_001f.Font = Enum.Font.SourceSans
_001f.Text = "+"
_001f.TextColor3 = Color3.fromRGB(0, 0, 0)
_001f.TextScaled = true
_001f.TextSize = 14.000
_001f.TextWrapped = true
_0020.Name = "_0020"
_0020.Parent = _001a
_0020.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
_0020.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
_0020.Size = UDim2.new(0, 44, 0, 28)
_0020.Font = Enum.Font.SourceSans
_0020.Text = "1"
_0020.TextColor3 = Color3.fromRGB(0, 0, 0)
_0020.TextScaled = true
_0020.TextSize = 14.000
_0020.TextWrapped = true
_0021.Name = "_0021"
_0021.Parent = _001a
_0021.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
_0021.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
_0021.Size = UDim2.new(0, 45, 0, 29)
_0021.Font = Enum.Font.SourceSans
_0021.Text = "-"
_0021.TextColor3 = Color3.fromRGB(0, 0, 0)
_0021.TextScaled = true
_0021.TextSize = 14.000
_0021.TextWrapped = true
_0022.Name = "Close"
_0022.Parent = _0019._001a
_0022.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
_0022.Font = "SourceSans"
_0022.Size = UDim2.new(0, 45, 0, 28)
_0022.Text = "X"
_0022.TextSize = 30
_0022.Position =  UDim2.new(0, 0, -1, 27)
_0023.Name = "minimize"
_0023.Parent = _0019._001a
_0023.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
_0023.Font = "SourceSans"
_0023.Size = UDim2.new(0, 45, 0, 28)
_0023.Text = "T"
_0023.TextSize = 30
_0023.Position = UDim2.new(0, 44, -1, 27)
_0024.Name = "minimize2"
_0024.Parent = _0019._001a
_0024.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
_0024.Font = "SourceSans"
_0024.Size = UDim2.new(0, 45, 0, 28)
_0024.Text = "T"
_0024.TextSize = 30
_0024.Position = UDim2.new(0, 44, -1, 57)
_0024.Visible = false
speeds = 1
local _0025  game:GetService("_0003")._000a
local _0026  game._0003._000a.Character
local _0017  _0026 and _0026:FindFirstChildWhichIsA("Humanoid")
nowe = false
game:GetService("_0001"):SetCore("SendNotification", {
Title = "_0088 GUI V3";
Text = "lnjection succeeded";
Icon = "rbxthumb://type=Asset&id=5107182114&w=150&_0015=150"})
Duration = 5;
_001a.Active = true
_001a.Draggable = true
_001d.MouseButton1Down:connect(function()
if nowe == true then
nowe = false
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
_0025.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
else
nowe = true
for i = 1, speeds do
spawn(function()
local _0027  game:GetService("_0004").Heartbeat
tpwalking = true
local _0026  game._0003._000a.Character
local _0017  _0026 and _0026:FindFirstChildWhichIsA("Humanoid")
while tpwalking and _0027:Wait() and _0026 and _0017 and _0017.Parent do
if _0017.MoveDirection.Magnitude > 0 then
_0026:TranslateBy(_0017.MoveDirection)
end
end
end)
end
game._0003._000a.Character.Animate.Disabled = true
local _0028  game._0003._000a.Character
local _0029  _0028:FindFirstChildOfClass("Humanoid") or _0028:FindFirstChildOfClass("AnimationController")
for i,v in next, _0029:GetPlayingAnimationTracks() do
v:AdjustSpeed(0)
end
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
_0025.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
_0025.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end
if game:GetService("_0003")._000a.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
local _002a  game._0003._000a
local _002b  _002a.Character.Torso
local _002c  true
local _002d  true
local _002e  {f = 0, b = 0, l = 0, _0078 = 0}
local _002f  {f = 0, b = 0, l = 0, _0078 = 0}
local _0030  50
local _0020  0
local _0031  Instance.new("BodyGyro", _002b)
_0031.P = 9e4
_0031.maxTorque = Vector3.new(9e9, 9e9, 9e9)
_0031.cframe = _002b.CFrame
local _0032  Instance.new("BodyVelocity", _002b)
_0032.velocity = Vector3.new(0,0.1,0)
_0032.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == true then
_002a.Character.Humanoid.PlatformStand = true
end
while nowe == true or game:GetService("_0003")._000a.Character.Humanoid.Health == 0 do
game:GetService("_0004").RenderStepped:Wait()
if _002e.l + _002e._0078 ~= 0 or _002e.f + _002e.b ~= 0 then
_0020 = _0020+.5+(_0020/_0030)
if _0020 > _0030 then
_0020 = _0030
end
elseif not (_002e.l + _002e._0078 ~= 0 or _002e.f + _002e.b ~= 0) and _0020 ~= 0 then
_0020 = _0020-1
if _0020 < 0 then
_0020 = 0
end
end
if (_002e.l + _002e._0078) ~= 0 or (_002e.f + _002e.b) ~= 0 then
_0032.velocity = ((game._0007.CurrentCamera.CoordinateFrame.lookVector * (_002e.f+_002e.b)) + ((game._0007.CurrentCamera.CoordinateFrame * CFrame.new(_002e.l+_002e._0078,(_002e.f+_002e.b)*.2,0).p) - game._0007.CurrentCamera.CoordinateFrame.p))*_0020
_002f = {f = _002e.f, b = _002e.b, l = _002e.l, _0078 = _002e._0078}
elseif (_002e.l + _002e._0078) == 0 and (_002e.f + _002e.b) == 0 and _0020 ~= 0 then
_0032.velocity = ((game._0007.CurrentCamera.CoordinateFrame.lookVector * (_002f.f+_002f.b)) + ((game._0007.CurrentCamera.CoordinateFrame * CFrame.new(_002f.l+_002f._0078,(_002f.f+_002f.b)*.2,0).p) - game._0007.CurrentCamera.CoordinateFrame.p))*_0020
else
_0032.velocity = Vector3.new(0,0,0)
end
_0031.cframe = game._0007.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((_002e.f+_002e.b)*50*_0020/_0030),0,0)
end
_002e = {f = 0, b = 0, l = 0, _0078 = 0}
_002f = {f = 0, b = 0, l = 0, _0078 = 0}
_0020 = 0
_0031:Destroy()
_0032:Destroy()
_002a.Character.Humanoid.PlatformStand = false
game._0003._000a.Character.Animate.Disabled = false
tpwalking = false
else
local _002a  game._0003._000a
local _0033  _002a.Character._0033
local _002c  true
local _002d  true
local _002e  {f = 0, b = 0, l = 0, _0078 = 0}
local _002f  {f = 0, b = 0, l = 0, _0078 = 0}
local _0030  50
local _0020  0
local _0031  Instance.new("BodyGyro", _0033)
_0031.P = 9e4
_0031.maxTorque = Vector3.new(9e9, 9e9, 9e9)
_0031.cframe = _0033.CFrame
local _0032  Instance.new("BodyVelocity", _0033)
_0032.velocity = Vector3.new(0,0.1,0)
_0032.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == true then
_002a.Character.Humanoid.PlatformStand = true
end
while nowe == true or game:GetService("_0003")._000a.Character.Humanoid.Health == 0 do
wait()
if _002e.l + _002e._0078 ~= 0 or _002e.f + _002e.b ~= 0 then
_0020 = _0020+.5+(_0020/_0030)
if _0020 > _0030 then
_0020 = _0030
end
elseif not (_002e.l + _002e._0078 ~= 0 or _002e.f + _002e.b ~= 0) and _0020 ~= 0 then
_0020 = _0020-1
if _0020 < 0 then
_0020 = 0
end
end
if (_002e.l + _002e._0078) ~= 0 or (_002e.f + _002e.b) ~= 0 then
_0032.velocity = ((game._0007.CurrentCamera.CoordinateFrame.lookVector * (_002e.f+_002e.b)) + ((game._0007.CurrentCamera.CoordinateFrame * CFrame.new(_002e.l+_002e._0078,(_002e.f+_002e.b)*.2,0).p) - game._0007.CurrentCamera.CoordinateFrame.p))*_0020
_002f = {f = _002e.f, b = _002e.b, l = _002e.l, _0078 = _002e._0078}
elseif (_002e.l + _002e._0078) == 0 and (_002e.f + _002e.b) == 0 and _0020 ~= 0 then
_0032.velocity = ((game._0007.CurrentCamera.CoordinateFrame.lookVector * (_002f.f+_002f.b)) + ((game._0007.CurrentCamera.CoordinateFrame * CFrame.new(_002f.l+_002f._0078,(_002f.f+_002f.b)*.2,0).p) - game._0007.CurrentCamera.CoordinateFrame.p))*_0020
else
_0032.velocity = Vector3.new(0,0,0)
end
_0031.cframe = game._0007.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((_002e.f+_002e.b)*50*_0020/_0030),0,0)
end
_002e = {f = 0, b = 0, l = 0, _0078 = 0}
_002f = {f = 0, b = 0, l = 0, _0078 = 0}
_0020 = 0
_0031:Destroy()
_0032:Destroy()
_002a.Character.Humanoid.PlatformStand = false
game._0003._000a.Character.Animate.Disabled = false
tpwalking = false
end
end)
local _0034 _001b.MouseButton1Down:connect(function()
_0034 = _001b.MouseEnter:connect(function()
while _0034 do
wait()
game._0003._000a.Character.HumanoidRootPart.CFrame = game._0003._000a.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
end
end)
end)
_001b.MouseLeave:connect(function()
if _0034 then
_0034:Disconnect()
_0034 = nil
end
end)
local _0035 _001c.MouseButton1Down:connect(function()
_0035 = _001c.MouseEnter:connect(function()
while _0035 do
wait()
game._0003._000a.Character.HumanoidRootPart.CFrame = game._0003._000a.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
end
end)
end)
_001c.MouseLeave:connect(function()
if _0035 then
_0035:Disconnect()
_0035 = nil
end
end)
game:GetService("_0003")._000a.CharacterAdded:Connect(function(_0038)
wait(0.7)
game._0003._000a.Character.Humanoid.PlatformStand = false
game._0003._000a.Character.Animate.Disabled = false
end)
_001f.MouseButton1Down:connect(function()
speeds = speeds + 1
_0020.Text = speeds
if nowe == true then
tpwalking = false
for i = 1, speeds do
spawn(function()
local _0027  game:GetService("_0004").Heartbeat
tpwalking = true
local _0026  game._0003._000a.Character
local _0017  _0026 and _0026:FindFirstChildWhichIsA("Humanoid")
while tpwalking and _0027:Wait() and _0026 and _0017 and _0017.Parent do
if _0017.MoveDirection.Magnitude > 0 then
_0026:TranslateBy(_0017.MoveDirection)
end
end
end)
end
end
end)
_0021.MouseButton1Down:connect(function()
if speeds == 1 then
_0020.Text = 'flyno1'
wait(1)
_0020.Text = speeds
else
speeds = speeds - 1
_0020.Text = speeds
if nowe == true then
tpwalking = false
for i = 1, speeds do
spawn(function()
local _0027  game:GetService("_0004").Heartbeat
tpwalking = true
local _0026  game._0003._000a.Character
local _0017  _0026 and _0026:FindFirstChildWhichIsA("Humanoid")
while tpwalking and _0027:Wait() and _0026 and _0017 and _0017.Parent do
if _0017.MoveDirection.Magnitude > 0 then
_0026:TranslateBy(_0017.MoveDirection)
end
end
end)
end
end
end
end)
_0022.MouseButton1Click:Connect(function()
_0019:Destroy()
end)
_0023.MouseButton1Click:Connect(function()
_001b.Visible = false
_001c.Visible = false
_001d.Visible = false
_001f.Visible = false
_0020.Visible = false
_0021.Visible = false
_0023.Visible = false
_0024.Visible = true
_0019._001a.BackgroundTransparency = 1
_0022.Position =  UDim2.new(0, 0, -1, 57)
end)
_0024.MouseButton1Click:Connect(function()
_001b.Visible = true
_001c.Visible = true
_001d.Visible = true
_001f.Visible = true
_0020.Visible = true
_0021.Visible = true
_0023.Visible = true
_0024.Visible = false
_0019._001a.BackgroundTransparency = 0
_0022.Position =  UDim2.new(0, 0, -1, 27)
end)
]=]
local function runFlyScript()
local _0036  _000a.PlayerGui:FindFirstChild("_0019")
if _0036 then _0036:Destroy() end
loadstring(_0018)()
end
local function stopFlyScript()
_G.nowe = false
_G.tpwalking = false
local _0037  _000a.PlayerGui:FindFirstChild("_0019")
if _0037 then _0037:Destroy() end
local _0038  _000a.Character
local _0017  _0038 and _0038:FindFirstChildOfClass("Humanoid")
if _0017 then
_0017.PlatformStand = false
local _0039  _0038:FindFirstChild("Animate")
if _0039 then _0039.Disabled = false end
end
end
local function flingPlayer(targetName)
local _003a  _0003:FindFirstChild(targetName)
if not _003a or not _003a.Character then
Notify("失败", "目标玩家不可用", 3) return
end
local _003b  _003a.Character:FindFirstChild("HumanoidRootPart")
local _003c  GetRoot()
if not _003b or not _003c then return end
local _003d  _003c.CFrame
local _003e  Instance.new("BodyAngularVelocity")
_003e.AngularVelocity = Vector3.new(0, 99999, 0)
_003e.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
_003e.Parent = _003c
local _0032  Instance.new("BodyVelocity")
_0032.Velocity = Vector3.zero
_0032.MaxForce = Vector3.new(1e9, 1e9, 1e9)
_0032.Parent = _003c
_003c.CFrame = _003b.CFrame + Vector3.new(0, 0, 0)
task.wait(0.5)
_003e:Destroy()
_0032:Destroy()
_003c.CFrame = _003d
Notify("甩飞", "已甩飞 " .. targetName, 3)
end
local _003f  false
local function flingAllPlayers()
if _003f then return end
_003f = true
local _0040  0
Notify("甩飞所有人", "开始甩飞服务器内所有玩家...", 3)
local _003c  GetRoot()
if not _003c then _003f = false return end
local _003d  _003c.CFrame
for _, p in ipairs(_0003:GetPlayers()) do
if p ~= _000a and p.Character then
local _003b  p.Character:FindFirstChild("HumanoidRootPart")
local _0041  p.Character:FindFirstChildOfClass("Humanoid")
if _003b and _0041 and _0041.Health > 0 then
local _003e  Instance.new("BodyAngularVelocity")
_003e.AngularVelocity = Vector3.new(0, 99999, 0)
_003e.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
_003e.Parent = _003c
local _0032  Instance.new("BodyVelocity")
_0032.Velocity = Vector3.zero
_0032.MaxForce = Vector3.new(1e9, 1e9, 1e9)
_0032.Parent = _003c
_003c.CFrame = _003b.CFrame
task.wait(0.3)
_003e:Destroy()
_0032:Destroy()
_003c.CFrame = _003d
_0040 = _0040 + 1
task.wait(0.1)
end
end
end
_003f = false
Notify("甩飞完成", "共甩飞 " .. _0040 .. " 名玩家", 5)
end
local _0042  {}
local function createESP(player)
if player == _000a then return end
local function onChar(_0038)
if not _0038 then return end
local _0043  _0038:FindFirstChild("Head") or _0038:WaitForChild("Head", 5)
local _0044  _0038:FindFirstChild("HumanoidRootPart") or _0038:WaitForChild("HumanoidRootPart", 5)
local _0017  _0038:FindFirstChildOfClass("Humanoid")
if not _0043 then return end
if _0042[player] then
for _, v in pairs(_0042[player]) do
if v and v.Destroy then pcall(function() v:Destroy() end) end
end
end
local _0045  Instance.new("BillboardGui")
_0045.Name = "ESP"
_0045.Adornee = _0043
_0045.Size = UDim2.new(0, 200, 0, 50)
_0045.StudsOffset = Vector3.new(0, 2.5, 0)
_0045.AlwaysOnTop = true
_0045.Enabled = _000d.ESPEnabled
local _0046  Instance.new("_001e")
_0046.BackgroundTransparency = 1
_0046.Size = UDim2.new(1, 0, 0, 20)
_0046.Font = Enum.Font.GothamBold
_0046.TextSize = 14
_0046.TextColor3 = Color3.fromRGB(255, 80, 80)
_0046.TextStrokeTransparency = 0
_0046.Text = player.Name
_0046.Parent = _0045
local _0047  Instance.new("_001e")
_0047.BackgroundTransparency = 1
_0047.Size = UDim2.new(1, 0, 0, 16)
_0047.Position = UDim2.new(0, 0, 0, 20)
_0047.Font = Enum.Font.Gotham
_0047.TextSize = 12
_0047.TextColor3 = Color3.fromRGB(200, 200, 200)
_0047.TextStrokeTransparency = 0.5
_0047.Text = ""
_0047.Parent = _0045
_0045.Parent = _0043
local _0048  Instance.new("Highlight")
_0048.Adornee = _0038
_0048.FillColor = Color3.fromRGB(255, 80, 80)
_0048.FillTransparency = 0.8
_0048.OutlineColor = Color3.fromRGB(255, 255, 255)
_0048.Enabled = _000d.ESPEnabled
_0048.Parent = _0038
_0042[player] = {_0045 = _0045, _0048 = _0048, _0047 = _0047, _0044 = _0044, _0017 = _0017}
task.spawn(function()
while _0042[player] and _0038 and _0038.Parent do
local _0049  _0042[player]
if not _0049 then break end
local _003c  GetRoot()
if _0049._0044 and _003c then
local _004a  math.floor((_0049._0044.Position - _003c.Position).Magnitude)
local _004b  _0049._0017 and math.floor(_0049._0017.Health) or "?"
_0049._0047.Text = _004a .. "m  HP:" .. _004b
end
task.wait(0.15)
end
end)
end
if player.Character then onChar(player.Character) end
player.CharacterAdded:Connect(onChar)
end
local function clearESP(player)
if _0042[player] then
for _, v in pairs(_0042[player]) do
if v and v.Destroy then pcall(function() v:Destroy() end) end
end
_0042[player] = nil
end
end
local _004c  false
local function initESP()
if _004c then return end
_004c = true
for _, p in ipairs(_0003:GetPlayers()) do createESP(p) end
_0003.PlayerAdded:Connect(createESP)
_0003.PlayerRemoving:Connect(clearESP)
end
local function getPlayerList()
local _004d  {}
for _, p in ipairs(_0003:GetPlayers()) do
if p ~= _000a then table.insert(_004d, p.Name) end
end
return _004d
end
local _004e  nil
local _004f  nil
local function updateFOVCircle()
if _000d.ShowFOV then
if not _004e then
_004e = Instance.new("Part")
_004e.Name = "FOVCircle"
_004e.Shape = Enum.PartType.Cylinder
_004e.Material = Enum.Material.ForceField
_004e.Color = Color3.fromRGB(255, 255, 255)
_004e.Transparency = 0.5
_004e.Anchored = true
_004e.CanCollide = false
_004e.CanQuery = false
_004e.CastShadow = false
_004e.Parent = _0007
end
_004e.Transparency = 1
local _0037  game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
if not _0037 then
_0037 = Instance.new("_0083")
_0037.Name = "AimbotFOV"
_0037.ResetOnSpawn = false
_0037.Parent = game:GetService("CoreGui")
end
local _0050  _0037:FindFirstChild("Circle")
if not _0050 then
_0050 = Instance.new("_001a")
_0050.Name = "Circle"
_0050.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_0050.BackgroundTransparency = 1
_0050.BorderSizePixel = 0
_0050.Parent = _0037
local _0051  Instance.new("UICorner")
_0051.CornerRadius = UDim.new(1, 0)
_0051.Parent = _0050
local _0052  Instance.new("UIStroke")
_0052.Name = "Stroke"
_0052.Color = Color3.fromRGB(0, 255, 100)
_0052.Thickness = 1.5
_0052.Transparency = 0.3
_0052.Parent = _0050
end
_0050.Visible = true
else
local _0037  game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
if _0037 then
local _0050  _0037:FindFirstChild("Circle")
if _0050 then _0050.Visible = false end
end
end
end
local function getClosestPlayer()
local _0053  nil
local _0054  _000d.AimbotFOV
local _0055  Vector2.new(_000b.ViewportSize.X / 2, _000b.ViewportSize.Y / 2)
for _, p in ipairs(_0003:GetPlayers()) do
if p ~= _000a and p.Character then
local _0043  p.Character:FindFirstChild("Head")
local _0017  p.Character:FindFirstChildOfClass("Humanoid")
if _0043 and _0017 and _0017.Health > 0 then
local _0056  onScreen = _000b:WorldToViewportPoint(_0043.Position)
if onScreen then
local _0057  (Vector2.new(_0056.X, _0056.Y) - _0055).Magnitude
if _0057 < _0054 then
_0054 = _0057
_0053 = p
end
end
end
end
end
return _0053
end
local function startAimbot()
_004f = _0004.RenderStepped:Connect(function()
if not _000d.Aimbot then return end
local _0058  true
if _000d.AimbotKey then
_0058 = _0005:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end
if not _0058 then return end
local _003a  getClosestPlayer()
if _003a and _003a.Character then
local _0043  _003a.Character:FindFirstChild("Head")
if _0043 then
local _0059  CFrame.new(_000b.CFrame.Position, _0043.Position)
_000b.CFrame = _000b.CFrame:Lerp(_0059, 0.15)
end
end
if _000d.ShowFOV then
local _0037  game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
if _0037 then
local _0050  _0037:FindFirstChild("Circle")
if _0050 then
local _005a  _000d.AimbotFOV * 2
_0050.Size = UDim2.new(0, _005a, 0, _005a)
_0050.Position = UDim2.new(0.5, -_005a / 2, 0.5, -_005a / 2)
end
end
end
end)
end
local function stopAimbot()
if _004f then _004f:Disconnect() _004f = nil end
local _0037  game:GetService("CoreGui"):FindFirstChild("AimbotFOV")
if _0037 then _0037:Destroy() end
end
local _005b  nil
local function getPlayerCharSet()
local _005c  {}
for _, p in ipairs(_0003:GetPlayers()) do
if p.Character then _005c[p.Character] = true end
end
return _005c
end
local function getNPCList()
local _004d  {}
local _005d  getPlayerCharSet()
for _, _0049 in ipairs(_0007:GetDescendants()) do
if _0049:IsA("Model") and not _005d[_0049] then
local _0017  _0049:FindFirstChildOfClass("Humanoid")
local _0044  _0049:FindFirstChild("HumanoidRootPart") or _0049:FindFirstChild("Torso") or _0049:FindFirstChild("_0033")
if _0017 and _0044 and _0017.Health > 0 then
table.insert(_004d, _0049.Name)
end
end
end
return _004d
end
local function findNPCByName(_0046)
local _005d  getPlayerCharSet()
for _, _0049 in ipairs(_0007:GetDescendants()) do
if _0049:IsA("Model") and not _005d[_0049] and _0049.Name == _0046 then
local _0017  _0049:FindFirstChildOfClass("Humanoid")
local _0044  _0049:FindFirstChild("HumanoidRootPart") or _0049:FindFirstChild("Torso") or _0049:FindFirstChild("_0033")
if _0017 and _0044 and _0017.Health > 0 then
return _0049
end
end
end
return nil
end
local function getClosestNPC()
local _005e  nil
local _0054  _000d.AimbotFOV
local _0055  Vector2.new(_000b.ViewportSize.X / 2, _000b.ViewportSize.Y / 2)
local _005d  getPlayerCharSet()
for _, _0049 in ipairs(_0007:GetDescendants()) do
if _0049:IsA("Model") and not _005d[_0049] then
local _0017  _0049:FindFirstChildOfClass("Humanoid")
local _0043  _0049:FindFirstChild("Head")
if _0017 and _0043 and _0017.Health > 0 then
local _0056  onScreen = _000b:WorldToViewportPoint(_0043.Position)
if onScreen then
local _0057  (Vector2.new(_0056.X, _0056.Y) - _0055).Magnitude
if _0057 < _0054 then
_0054 = _0057
_005e = _0049
end
end
end
end
end
return _005e
end
local function startNpcAimbot()
_005b = _0004.RenderStepped:Connect(function()
if not _000d.NpcAimbot then return end
local _0058  true
if _000d.AimbotKey then
_0058 = _0005:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end
if not _0058 then return end
local _003a  getClosestNPC()
if _003a then
local _0043  _003a:FindFirstChild("Head")
if _0043 then
local _0059  CFrame.new(_000b.CFrame.Position, _0043.Position)
_000b.CFrame = _000b.CFrame:Lerp(_0059, 0.15)
end
end
end)
end
local function stopNpcAimbot()
if _005b then _005b:Disconnect() _005b = nil end
end
local _005f  _0002:CreateWindow({
Title = "sbrp脚本",
Icon = "sparkles",
Folder = "ShenBuRuPing",
HideSearchBar = true,
})
local _0060  {}
local function setupRainbowBorder()
local function findMainFrame()
local _0061  {}
if _000a:FindFirstChild("PlayerGui") then
for _, g in ipairs(_000a.PlayerGui:GetChildren()) do
if g:IsA("_0083") then table.insert(_0061, g) end
end
end
local _0062  game:GetService("CoreGui")
for _, g in ipairs(_0062:GetChildren()) do
if g:IsA("_0083") then table.insert(_0061, g) end
end
for _, _0037 in ipairs(_0061) do
for _, frame in ipairs(_0037:GetDescendants()) do
if frame:IsA("_001a") and frame.Name == "_005f" then
return frame
end
end
end
local _0063  nil
local _0064  0
for _, _0037 in ipairs(_0061) do
for _, frame in ipairs(_0037:GetDescendants()) do
if frame:IsA("_001a") and frame.Parent and frame.Parent:IsA("_0083") then
local _0065  frame.AbsoluteSize.X * frame.AbsoluteSize.Y
if _0065 > _0064 then
_0064 = _0065
_0063 = frame
end
end
end
end
return _0063
end
task.defer(function()
local _0066  findMainFrame()
if not _0066 then
task.wait(1)
_0066 = findMainFrame()
end
if not _0066 then return end
local _0067  Instance.new("UIStroke")
_0067.Name = "RainbowStrokeOuter"
_0067.Thickness = 4
_0067.Transparency = 0.1
_0067.Parent = _0066
local _0068  Instance.new("UIGradient")
_0068.Name = "RainbowGradient"
_0068.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 127, 0)),
ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 170, 255)),
ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
})
_0068.Rotation = 0
_0068.Parent = _0067
local _0069  Instance.new("UIStroke")
_0069.Name = "RainbowStrokeInner"
_0069.Thickness = 2
_0069.Transparency = 0.3
_0069.Parent = _0066
local _006a  Instance.new("UIGradient")
_006a.Name = "RainbowGradient2"
_006a.Color = _0068.Color
_006a.Rotation = 180
_006a.Parent = _0069
local _006b  {}
local _006c  {"Top", "Bottom", "Left", "Right"}
for _, pos in ipairs(_006c) do
local _006d  Instance.new("_001a")
_006d.Name = "RainbowStripe_" .. pos
_006d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_006d.BorderSizePixel = 0
_006d.ZIndex = 10
local _006e  Instance.new("UIGradient")
_006e.Name = "Grad"
_006e.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 127, 0)),
ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 170, 255)),
ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
})
_006e.Parent = _006d
if pos == "Top" then
_006d.Size = UDim2.new(1, 0, 0, 3)
_006d.Position = UDim2.new(0, 0, 0, -3)
elseif pos == "Bottom" then
_006d.Size = UDim2.new(1, 0, 0, 3)
_006d.Position = UDim2.new(0, 0, 1, 0)
elseif pos == "Left" then
_006d.Size = UDim2.new(0, 3, 1, 0)
_006d.Position = UDim2.new(0, -3, 0, 0)
elseif pos == "Right" then
_006d.Size = UDim2.new(0, 3, 1, 0)
_006d.Position = UDim2.new(1, 0, 0, 0)
end
_006d.Parent = _0066
table.insert(_006b, {frame = _006d, grad = _006e, pos = pos})
end
local _006f  0
local _0070  180
local _0071  {0, 90, 0, 90}
local _0072  _0004.RenderStepped:Connect(function(dt)
_006f = (_006f + 60 * dt) % 360
_0070 = (_0070 - 60 * dt) % 360
_0068.Rotation = _006f
_006a.Rotation = _0070
for i, s in ipairs(_006b) do
s.grad.Rotation = (s.grad.Rotation + (50 + i * 10) * dt) % 360
end
end)
table.insert(_0060, _0072)
end)
end
setupRainbowBorder()
local _0073  _005f:Tab({Title = "角色", Icon = "user"})
_0073:Slider({
Title = "行走速度",
Value = {Min = 16, Max = 500, Default = 16},
Step = 1,
Callback = function(val) _000d.WalkSpeed = val applyWalkSpeed() end,
})
_0073:Slider({
Title = "跳跃力度",
Value = {Min = 50, Max = 500, Default = 50},
Step = 1,
Callback = function(val) _000d.JumpPower = val applyJumpPower() end,
})
_0073:Button({
Title = "重置移动",
Callback = function()
_000d.WalkSpeed = 16 _000d.JumpPower = 50
applyWalkSpeed() applyJumpPower()
end,
})
_0073:Divider()
_0073:Toggle({
Title = "飞行 (开启后弹出飞行面板)",
Default = false,
Callback = function(val)
if val then runFlyScript() else stopFlyScript() end
end,
})
_0073:Divider()
_0073:Button({
Title = "立即重生",
Callback = function()
local _0015  GetHum() if _0015 then _0015.Health = 0 end
end,
})
local _0074  _005f:Tab({Title = "传送", Icon = "map-pin"})
local _0075  nil
local _0076  _0074:Dropdown({
Title = "选择玩家",
Values = getPlayerList(),
Callback = function(val) _0075 = val end,
})
_0074:Button({
Title = "传送到该玩家",
Callback = function()
if not _0075 then Notify("未选择", "", 3) return end
local _0077  _0003:FindFirstChild(_0075)
if _0077 and _0077.Character and _0077.Character:FindFirstChild("HumanoidRootPart") then
local _0078  GetRoot()
if _0078 then _0078.CFrame = _0077.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) end
else Notify("失败", "目标不可用", 3) end
end,
})
_0074:Button({
Title = "刷新列表",
Callback = function()
if _0076 then pcall(function() _0076:Refresh(getPlayerList()) end) end
end,
})
_0074:Divider()
local _0079  cy, cz = 0, 0, 0
_0074:Input({Title = "X", Callback = function(v) _0079 = tonumber(v) or 0 end})
_0074:Input({Title = "Y", Callback = function(v) cy = tonumber(v) or 0 end})
_0074:Input({Title = "Z", Callback = function(v) cz = tonumber(v) or 0 end})
_0074:Button({
Title = "传送到坐标",
Callback = function()
local _0078  GetRoot()
if _0078 then _0078.CFrame = CFrame.new(_0079, cy, cz) end
end,
})
_0074:Button({
Title = "传送到出生点",
Callback = function()
for _, v in ipairs(_0007:GetDescendants()) do
if v:IsA("SpawnLocation") then
local _0078  GetRoot()
if _0078 then _0078.CFrame = v.CFrame + Vector3.new(0, 3, 0) end
return
end
end
Notify("失败", "未找到出生点", 3)
end,
})
_0074:Divider()
local _007a  nil
local _007b  nil
_0074:Toggle({
Title = "点击传送 (装备道具后点击地面)",
Default = false,
Callback = function(val)
if val then
_007a = Instance.new("Tool")
_007a.Name = "点击传送"
_007a.ToolTip = "装备后点击任意位置传送"
_007a.RequiresHandle = false
_007a.CanBeDropped = false
_007a.Parent = _000a:WaitForChild("Backpack")
_007b = _007a.Activated:Connect(function()
local _007c  _000a:GetMouse()
local _0078  GetRoot()
if _0078 and _007c.Hit then
_0078.CFrame = CFrame.new(_007c.Hit.Position + Vector3.new(0, 3, 0))
end
end)
Notify("点击传送", "已添加道具到物品栏，装备后点击任意位置传送", 4)
else
if _007b then _007b:Disconnect() _007b = nil end
if _007a then
if _007a.Parent then _007a:Destroy() end
_007a = nil
end
Notify("点击传送", "已关闭", 3)
end
end,
})
local _007d  _005f:Tab({Title = "视觉", Icon = "eye"})
_007d:Toggle({
Title = "ESP 透视 (名称+距离+血量)",
Default = false,
Callback = function(val)
_000d.ESPEnabled = val
if val then initESP() end
for _, _0049 in pairs(_0042) do
if _0049._0045 then _0049._0045.Enabled = val end
if _0049._0048 then _0049._0048.Enabled = val end
end
end,
})
_007d:Divider()
local _007e  {}
_007d:Toggle({
Title = "全亮",
Default = false,
Callback = function(val)
if val then
_007e.B = _0006.Brightness
_007e.T = _0006.ClockTime
_007e.F = _0006.FogEnd
_007e._0085 = _0006.GlobalShadows
_0006.Brightness = 3
_0006.ClockTime = 12
_0006.FogEnd = 1e9
_0006.GlobalShadows = false
else
if _007e.B then _0006.Brightness = _007e.B end
if _007e.T then _0006.ClockTime = _007e.T end
if _007e.F then _0006.FogEnd = _007e.F end
if _007e._0085 ~= nil then _0006.GlobalShadows = _007e._0085 end
end
end,
})
_007d:Slider({
Title = "视野 FOV",
Value = {Min = 30, Max = 120, Default = 70},
Step = 1,
Callback = function(val) _000b.FieldOfView = val end,
})
_007d:Toggle({
Title = "移除雾效",
Default = false,
Callback = function(val)
if val then _0006.FogEnd = 1e9 _0006.FogStart = 1e9
else _0006.FogEnd = 100000 _0006.FogStart = 0 end
end,
})
local _007f  _005f:Tab({Title = "工具", Icon = "wrench"})
_007f:Slider({
Title = "重力",
Value = {Min = 0, Max = 500, Default = 196},
Step = 1,
Callback = function(val) _0007.Gravity = val end,
})
_007f:Button({
Title = "重置重力",
Callback = function() _0007.Gravity = 196.2 end,
})
local _0080  [=[
local _0081  50
local _0082  game._0003._000a.Character.HumanoidRootPart
local _0083  Instance.new("_0083")
local _0084  Instance.new("TextButton")
local _0085  Instance.new("TextButton")
local _0086  Instance.new("TextButton")
local _0087  Instance.new("TextButton")
local _0088  Instance.new("TextButton")
local _0089  Instance.new("TextButton")
local _008a  Instance.new("TextButton")
_0083.Name = "CarFlyGUI"
_0083.Parent = game.CoreGui
_0083.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_0083.ResetOnSpawn = false
_0089.Name = "上"
_0089.Parent = _0083
_0089.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_0089.Position = UDim2.new(0.694387913, 0, 0.181818187, 0)
_0089.Size = UDim2.new(0, 72, 0, 50)
_0089.Font = Enum.Font.SourceSans
_0089.Text = "上"
_0089.TextColor3 = Color3.fromRGB(170, 0, 255)
_0089.TextScaled = true
_0089.TextSize = 14.000
_0089.TextWrapped = true
_0089.MouseButton1Down:Connect(function()
_0082:FindFirstChildOfClass("BodyVelocity"):Destroy()
_0082:FindFirstChildOfClass("BodyGyro"):Destroy()
end)
_008a.Name = "停止飞行"
_008a.Parent = _0083
_008a.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_008a.Position = UDim2.new(0.695689976, 0, 0.0213903747, 0)
_008a.Size = UDim2.new(0, 71, 0, 50)
_008a.Font = Enum.Font.SourceSans
_008a.Text = "停止飞行"
_008a.TextColor3 = Color3.fromRGB(170, 0, 255)
_008a.TextScaled = true
_008a.TextSize = 14.000
_008a.TextWrapped = true
_008a.MouseButton1Down:Connect(function()
_0082.Anchored = true
end)
_0088.Name = "飞行"
_0088.Parent = _0083
_0088.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_0088.Position = UDim2.new(0.588797748, 0, 0.0213903747, 0)
_0088.Size = UDim2.new(0, 66, 0, 50)
_0088.Font = Enum.Font.SourceSans
_0088.Text = "飞行"
_0088.TextColor3 = Color3.fromRGB(170, 0, 127)
_0088.TextScaled = true
_0088.TextSize = 14.000
_0088.TextWrapped = true
_0088.MouseButton1Down:Connect(function()
local _008b  Instance.new("BodyVelocity",_0082)
local _008c  Instance.new("BodyGyro",_0082)
_008c.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
_008c._0087 = 5000
_008c.P = 50000
_008c.CFrame = game._0007.CurrentCamera.CFrame
_008b.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
end)
_0084.Name = "_0084"
_0084.Parent = _0083
_0084.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_0084.Position = UDim2.new(0.161668837, 0, 0.601604283, 0)
_0084.Size = UDim2.new(0, 58, 0, 50)
_0084.Font = Enum.Font.SourceSans
_0084.Text = "↑"
_0084.TextColor3 = Color3.fromRGB(226, 226, 526)
_0084.TextScaled = true
_0084.TextSize = 5.000
_0084.TextWrapped = true
_0084.MouseButton1Down:Connect(function()
_0082.Anchored = false
_0082:FindFirstChildOfClass("BodyVelocity"):Destroy()
_0082:FindFirstChildOfClass("BodyGyro"):Destroy()
wait(.1)
local _008b  Instance.new("BodyVelocity",_0082)
local _008c  Instance.new("BodyGyro",_0082)
_008c.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
_008c._0087 = 50000
_008c.P = 50000
_008c.CFrame = game._0007.CurrentCamera.CFrame
_008b.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
_008b.Velocity = game._0007.CurrentCamera.CFrame.LookVector * _0081
end)
_0085.Name = "_0085"
_0085.Parent = _0083
_0085.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_0085.Position = UDim2.new(0.161668837, 0, 0.735294104, 0)
_0085.Size = UDim2.new(0, 58, 0, 50)
_0085.Font = Enum.Font.SourceSans
_0085.Text = "↓"
_0085.TextColor3 = Color3.fromRGB(255, 255, 255)
_0085.TextScaled = true
_0085.TextSize = 14.000
_0085.TextWrapped = true
_0085.MouseButton1Down:Connect(function()
_0082.Anchored = false
_0082:FindFirstChildOfClass("BodyVelocity"):Destroy()
_0082:FindFirstChildOfClass("BodyGyro"):Destroy()
wait(.1)
local _008b  Instance.new("BodyVelocity",_0082)
local _008c  Instance.new("BodyGyro",_0082)
_008c.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
_008c._0087 = 5000
_008c.P = 50000
_008c.CFrame = game._0007.CurrentCamera.CFrame
_008b.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
_008b.Velocity = game._0007.CurrentCamera.CFrame.LookVector * -_0081
end)
]=]
local function runCarScript()
local _0036  game:GetService("CoreGui"):FindFirstChild("CarFlyGUI")
if _0036 then _0036:Destroy() end
loadstring(_0080)()
Notify("飞车", "飞车面板已开启", 3)
end
local function stopCarScript()
local _0037  game:GetService("CoreGui"):FindFirstChild("CarFlyGUI")
if _0037 then _0037:Destroy() end
local _0044  GetRoot()
if _0044 then
local _0032  _0044:FindFirstChildOfClass("BodyVelocity")
if _0032 then _0032:Destroy() end
local _0031  _0044:FindFirstChildOfClass("BodyGyro")
if _0031 then _0031:Destroy() end
_0044.Anchored = false
end
Notify("飞车", "飞车面板已关闭", 3)
end
_007f:Divider()
_007f:Button({
Title = "FPS 提升",
Callback = function()
for _, v in ipairs(_0007:GetDescendants()) do
if v:IsA("BasePart") then v.Material = Enum.Material.Plastic v.Reflectance = 0
elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Enabled = false end
end
_0006.GlobalShadows = false
_0006.FogEnd = 1e9
pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
Notify("已优化", "", 3)
end,
})
local _008d  _005f:Tab({Title = "通用", Icon = "package"})
_008d:Toggle({
Title = "飞车 (开启后弹出飞车面板)",
Default = false,
Callback = function(val)
if val then runCarScript() else stopCarScript() end
end,
})
_008d:Divider()
_008d:Toggle({
Title = "无掉落伤害",
Default = false,
Callback = function(val)
_000d.NoFallDamage = val
if val then
local _0015  GetHum()
if _0015 then setupNoFallDamage(_0015) end
end
end,
})
_008d:Divider()
local _008e  nil
_008d:Dropdown({
Title = "甩飞目标",
Values = getPlayerList(),
Callback = function(val) _008e = val end,
})
_008d:Button({
Title = "甩飞!",
Callback = function()
if _008e then flingPlayer(_008e)
else Notify("未选择", "请先选择目标", 3) end
end,
})
_008d:Button({
Title = "甩飞所有人!",
Callback = function()
task.spawn(flingAllPlayers)
end,
})
_008d:Divider()
_008d:Toggle({
Title = "快速跑步 (3倍速度)",
Default = false,
Callback = function(val)
if val then
_000e = _0004.RenderStepped:Connect(function()
local _0017  GetHum()
if _0017 then
_0017.WalkSpeed = _000d.WalkSpeed * 3
end
end)
Notify("快速跑步", "速度已提升至3倍", 3)
else
if _000e then _000e:Disconnect() _000e = nil end
applyWalkSpeed()
Notify("快速跑步", "已恢复正常速度", 3)
end
end,
})
_008d:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
if val then
_000f = _0005.JumpRequest:Connect(function()
local _0015  GetHum()
if _0015 then _0015:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _000f then _000f:Disconnect() _000f = nil end
end
end,
})
_008d:Toggle({
Title = "穿墙",
Default = false,
Callback = function(val)
if val then
_0010 = _0004.Stepped:Connect(function()
local _000c  GetChar()
if _000c then
for _, p in ipairs(_000c:GetDescendants()) do
if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
end
end
end)
else
if _0010 then _0010:Disconnect() _0010 = nil end
end
end,
})
_008d:Toggle({
Title = "防击退/防甩飞",
Default = false,
Callback = function(val)
if val then
_0011 = _0004.Heartbeat:Connect(function()
local _0044  GetRoot()
local _0017  GetHum()
if _0044 and _0017 and _0017.Health > 0 then
if _0017.MoveDirection.Magnitude < 0.1 then
_0044.AssemblyLinearVelocity = Vector3.new(0, _0044.AssemblyLinearVelocity.Y, 0)
_0044.AssemblyAngularVelocity = Vector3.zero
end
end
end)
Notify("防击退", "已开启防击退保护", 3)
else
if _0011 then _0011:Disconnect() _0011 = nil end
Notify("防击退", "已关闭防击退保护", 3)
end
end,
})
_008d:Divider()
local _008f  nil
_008d:Toggle({
Title = "防甩飞",
Default = false,
Callback = function(val)
if val then
_008f = _0004.Heartbeat:Connect(function()
local _0044  GetRoot()
local _0017  GetHum()
if _0044 and _0017 and _0017.Health > 0 then
local _0090  _0044.AssemblyAngularVelocity
if _0090.Magnitude > 5000 then
_0044.AssemblyAngularVelocity = Vector3.zero
_0044.AssemblyLinearVelocity = Vector3.new(0, _0044.AssemblyLinearVelocity.Y, 0)
end
end
end)
Notify("防甩飞", "已开启防甩飞保护", 3)
else
if _008f then _008f:Disconnect() _008f = nil end
Notify("防甩飞", "已关闭防甩飞保护", 3)
end
end,
})
local _0091  nil
_008d:Toggle({
Title = "隐身",
Default = false,
Callback = function(val)
if val then
_0091 = _0004.Heartbeat:Connect(function()
local _0038  GetChar()
if _0038 then
for _, p in ipairs(_0038:GetDescendants()) do
if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
p.LocalTransparencyModifier = 1
end
end
end
end)
Notify("隐身", "已开启隐身 (仅本地可见)", 3)
else
if _0091 then _0091:Disconnect() _0091 = nil end
local _0038  GetChar()
if _0038 then
for _, p in ipairs(_0038:GetDescendants()) do
if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
p.LocalTransparencyModifier = 0
end
end
end
Notify("隐身", "已关闭隐身", 3)
end
end,
})
_008d:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
if val then
_0012 = _0004.Heartbeat:Connect(function()
local _0017  GetHum()
if _0017 then
if _0017.Health < _0017.MaxHealth then
_0017.Health = _0017.MaxHealth
end
end
end)
Notify("无敌", "已开启无敌模式", 3)
else
if _0012 then _0012:Disconnect() _0012 = nil end
Notify("无敌", "已关闭无敌模式", 3)
end
end,
})
_008d:Toggle({
Title = "锁血 (锁定当前血量)",
Default = false,
Callback = function(val)
if val then
local _0017  GetHum()
local _0092  _0017 and _0017.Health or 100
Notify("锁血", "已锁定血量: " .. math.floor(_0092), 3)
_0013 = _0004.Heartbeat:Connect(function()
local _0015  GetHum()
if _0015 and _0015.Health ~= _0092 then
_0015.Health = _0092
end
end)
else
if _0013 then _0013:Disconnect() _0013 = nil end
Notify("锁血", "已关闭锁血", 3)
end
end,
})
_008d:Divider()
_008d:Button({
Title = "服务器跳转",
Callback = function()
pcall(function()
local _0093  string.format("https://games.roblox.com/v1/games/%_004a/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)
local _0094  _0008:JSONDecode(game:HttpGet(_0093))
if _0094 and _0094._0094 then
local _000c  {}
for _, s in ipairs(_0094._0094) do
if s.playing < s.maxPlayers and s.id ~= game.JobId then table.insert(_000c, s.id) end
end
if #_000c > 0 then
_0009:TeleportToPlaceInstance(game.PlaceId, _000c[math.random(1, #_000c)], _000a)
else Notify("未找到", "没有可用服务器", 3) end
end
end)
end,
})
_008d:Button({
Title = "重新加入",
Callback = function() _0009:TeleportToPlaceInstance(game.PlaceId, game.JobId, _000a) end,
})
_008d:Button({
Title = "离开游戏",
Callback = function()
_000a:Kick("已离开游戏")
end,
})
_008d:Divider()
local _0095 _008d:Toggle({
Title = "防挂机",
Default = false,
Callback = function(val)
if val then
local _0096  game:GetService("VirtualUser")
_0095 = _000a.Idled:Connect(function()
_0096:CaptureController()
_0096:ClickButton2(Vector2.new())
end)
else
if _0095 then _0095:Disconnect() _0095 = nil end
end
end,
})
_008d:Divider()
_008d:Toggle({
Title = "汉化祖国人飞行",
Default = false,
Callback = function(val)
if val then
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/-/refs/heads/_0019/祖国人汉化"))()
end)
Notify("祖国人飞行", "已执行汉化祖国人飞行", 3)
end
end,
})
_008d:Divider()
_008d:Toggle({
Title = "人物旋转",
Default = false,
Callback = function(val)
_000d.CharRotate = val
if val then
Notify("通用", "人物旋转已开启", 3)
_0014 = _0004.Heartbeat:Connect(function()
local _0097  GetRoot()
if _0097 then
_0097.CFrame = _0097.CFrame * CFrame.Angles(0, math.rad(3), 0)
end
end)
else
if _0014 then
_0014:Disconnect()
_0014 = nil
end
Notify("通用", "人物旋转已关闭", 3)
end
end,
})
_008d:Toggle({
Title = "秒互动",
Default = false,
Callback = function(val)
_000d.InstantPrompt = val
if val then
local _0098  game:GetService("ProximityPromptService")
local function setAllPromptDuration(parent, duration)
for _, desc in ipairs(parent:GetDescendants()) do
if desc:IsA("ProximityPrompt") then
desc.HoldDuration = duration
end
end
end
setAllPromptDuration(workspace, 0.01)
_000d._PromptBind = _0098.PromptButtonHoldBegan:Connect(function(prompt)
prompt.HoldDuration = 0.01
end)
_000d._PromptConn = workspace.DescendantAdded:Connect(function(desc)
if desc:IsA("ProximityPrompt") and _000d.InstantPrompt then
desc.HoldDuration = 0.01
end
end)
Notify("通用", "秒互动已开启", 3)
else
if _000d._PromptBind then _000d._PromptBind:Disconnect() _000d._PromptBind = nil end
if _000d._PromptConn then _000d._PromptConn:Disconnect() _000d._PromptConn = nil end
local function resetAllPromptDuration(parent, duration)
for _, desc in ipairs(parent:GetDescendants()) do
if desc:IsA("ProximityPrompt") then
desc.HoldDuration = duration
end
end
end
resetAllPromptDuration(workspace, 0.5)
Notify("通用", "秒互动已关闭", 3)
end
end,
})
local _0099  _005f:Tab({Title = "自瞄和子追", Icon = "crosshair"})
_0099:Toggle({
Title = "自瞄",
Default = false,
Callback = function(val)
_000d.Aimbot = val
if val then startAimbot() else stopAimbot() end
end,
})
_0099:Slider({
Title = "FOV范围",
Value = {Min = 30, Max = 500, Default = 150},
Step = 10,
Callback = function(val) _000d.AimbotFOV = val end,
})
_0099:Toggle({
Title = "显示范围圈",
Default = false,
Callback = function(val)
_000d.ShowFOV = val
updateFOVCircle()
end,
})
_0099:Toggle({
Title = "右键自瞄",
Default = false,
Callback = function(val) _000d.AimbotKey = val end,
})
_0099:Divider()
local _009a  nil
local _009b  nil
local _009c  15
local _009d  false
_0099:Dropdown({
Title = "目标",
Values = getPlayerList(),
Callback = function(val) _009a = val end,
})
_0099:Button({
Title = "刷新列表",
Callback = function()
local _004d  getPlayerList()
Notify("子追", "已刷新玩家列表 (" .. #_004d .. " 人)", 3)
end,
})
_0099:Toggle({
Title = "通用子追",
Default = false,
Callback = function(val)
if val then
if not _009a then
Notify("未选择", "请先选择子追目标", 3)
return
end
_009b = _0004.Heartbeat:Connect(function()
local _003a  _0003:FindFirstChild(_009a)
if _003a and _003a.Character then
local _003b  _003a.Character:FindFirstChild("HumanoidRootPart")
local _0041  _003a.Character:FindFirstChildOfClass("Humanoid")
local _003c  GetRoot()
local _009e  GetHum()
if _003b and _0041 and _0041.Health > 0 and _003c then
local _0057  (_003b.Position - _003c.Position).Magnitude
local _009f  _009c
if _0057 > _009f + 5 then
local _00a0  (_003b.Position - _003c.Position).Unit
local _0020  _0057 > 50 and 3 or 1.5
if _009d then _0020 = _0020 * 1.5 end
_003c.CFrame = _003c.CFrame + _00a0 * _0020
elseif _0057 < _009f - 5 then
local _00a0  (_003c.Position - _003b.Position).Unit
_003c.CFrame = _003c.CFrame + _00a0 * 1
end
if _0057 < 100 then
_003c.CFrame = CFrame.lookAt(_003c.Position, Vector3.new(_003b.Position.X, _003c.Position.Y, _003b.Position.Z))
end
end
else
if not _003a or not _003a.Character then
Notify("子追", "目标已离开或死亡，子追暂停", 3)
end
end
end)
Notify("子追", "已开始子追 " .. _009a, 3)
else
if _009b then _009b:Disconnect() _009b = nil end
Notify("子追", "已停止子追", 3)
end
end,
})
_0099:Slider({
Title = "子追距离",
Value = {Min = 5, Max = 100, Default = 15},
Step = 1,
Callback = function(val) _009c = val end,
})
_0099:Divider()
_0099:Toggle({
Title = "NPC自瞄",
Default = false,
Callback = function(val)
_000d.NpcAimbot = val
if val then startNpcAimbot() else stopNpcAimbot() end
end,
})
_0099:Divider()
local _00a1  nil
local _00a2  nil
local _00a3  15
local _00a4  false
local _00a5  _0099:Dropdown({
Title = "NPC目标",
Values = getNPCList(),
Callback = function(val) _00a1 = val end,
})
_0099:Button({
Title = "刷新列表",
Callback = function()
local _004d  getNPCList()
Notify("NPC子追", "已刷新 NPC 列表 (" .. #_004d .. " 个)", 3)
end,
})
_0099:Toggle({
Title = "NPC子追",
Default = false,
Callback = function(val)
if val then
if not _00a1 then
Notify("未选择", "请先选择 NPC 子追目标", 3)
return
end
_00a2 = _0004.Heartbeat:Connect(function()
local _00a6  findNPCByName(_00a1)
if _00a6 then
local _003b  _00a6:FindFirstChild("HumanoidRootPart") or _00a6:FindFirstChild("Torso") or _00a6:FindFirstChild("_0033")
local _0041  _00a6:FindFirstChildOfClass("Humanoid")
local _003c  GetRoot()
if _003b and _0041 and _0041.Health > 0 and _003c then
local _0057  (_003b.Position - _003c.Position).Magnitude
local _009f  _00a3
if _0057 > _009f + 5 then
local _00a0  (_003b.Position - _003c.Position).Unit
local _0020  _0057 > 50 and 3 or 1.5
if _00a4 then _0020 = _0020 * 1.5 end
_003c.CFrame = _003c.CFrame + _00a0 * _0020
elseif _0057 < _009f - 5 then
local _00a0  (_003c.Position - _003b.Position).Unit
_003c.CFrame = _003c.CFrame + _00a0 * 1
end
if _0057 < 100 then
_003c.CFrame = CFrame.lookAt(_003c.Position, Vector3.new(_003b.Position.X, _003c.Position.Y, _003b.Position.Z))
end
end
else
Notify("NPC子追", "NPC 已消失或死亡，子追暂停", 3)
end
end)
Notify("NPC子追", "已开始子追 " .. _00a1, 3)
else
if _00a2 then _00a2:Disconnect() _00a2 = nil end
Notify("NPC子追", "已停止 NPC 子追", 3)
end
end,
})
_0099:Slider({
Title = "NPC子追距离",
Value = {Min = 5, Max = 100, Default = 15},
Step = 1,
Callback = function(val) _00a3 = val end,
})
_0099:Toggle({
Title = "NPC自动飞行",
Default = false,
Callback = function(val)
if val then
_00a4 = true
Notify("NPC子追", "NPC 子追时将自动飞行", 3)
else
_00a4 = false
Notify("NPC子追", "NPC 子追飞行已关闭", 3)
end
end,
})
local _00a7  _005f:Tab({Title = "设置", Icon = "settings"})
_00a7:Dropdown({
Title = "主题",
Values = {"Pink", "Dark", "Light", "Violet", "Ocean"},
Callback = function(val) pcall(function() _0002:SetTheme(val) end) end,
})
_00a7:Button({
Title = "销毁脚本",
Callback = function()
stopFlyScript()
_000d.Aimbot = false stopAimbot()
_000d.NpcAimbot = false stopNpcAimbot()
_000d.CharRotate = false
if _0014 then _0014:Disconnect() end
if _000f then _000f:Disconnect() end
if _0010 then _0010:Disconnect() end
if _0095 then _0095:Disconnect() end
if _000e then _000e:Disconnect() end
if _0011 then _0011:Disconnect() end
if _0012 then _0012:Disconnect() end
if _0013 then _0013:Disconnect() end
if _008f then _008f:Disconnect() end
if _0091 then _0091:Disconnect() end
if _007b then _007b:Disconnect() end
if _007a then _007a:Destroy() end
if _009b then _009b:Disconnect() end
if _00a2 then _00a2:Disconnect() end
for _, _000c in ipairs(_0060) do _000c:Disconnect() end
for p in pairs(_0042) do clearESP(p) end
local _0015  GetHum()
if _0015 then _0015.WalkSpeed = 16 _0015.JumpPower = 50 end
_0007.Gravity = 196.2
_000b.FieldOfView = 70
local _00a8  game:GetService("CoreGui"):FindFirstChild("_0002")
if _00a8 then _00a8:Destroy() end
local _00a9  game:GetService("CoreGui"):FindFirstChild("CarFlyGUI")
if _00a9 then _00a9:Destroy() end
end,
})
local _00aa  _005f:Tab({Title = "脚本服务器", Icon = "server"})
local _00ab  "https://raw.githubusercontent.com/GGG792/RobloxAeroScripts/_0019/Aero%E6%9C%80%E6%96%B0%E5%90%88%E9%9B%86/"
local _00ac  {
{_0046 = "8个球池经典", file = "8个球池经典.lua"},
{_0046 = "99 夜", file = "99 夜.lua"},
{_0046 = "Blox Fruit", file = "Blox Fruit.lua"},
{_0046 = "Dungeon Hunters", file = "Dungeon Hunters.lua"},
{_0046 = "GB", file = "GB.lua"},
{_0046 = "chain", file = "chain.lua"},
{_0046 = "po大po", file = "po大po.lua"},
{_0046 = "举重模拟器", file = "举重模拟器.lua"},
{_0046 = "亡命速递", file = "亡命速递.lua"},
{_0046 = "保护房子不受怪物入侵", file = "保护房子不受怪物入侵.lua"},
{_0046 = "像素之刃", file = "像素之刃.lua"},
{_0046 = "僵尸之塔", file = "僵尸之塔.lua"},
{_0046 = "僵尸生存竞技场", file = "僵尸生存竞技场.lua"},
{_0046 = "克隆王国大亨", file = "克隆王国大亨.lua"},
{_0046 = "决斗场", file = "决斗场.lua"},
{_0046 = "刀刃球", file = "刀刃球.lua"},
{_0046 = "划开大海", file = "划开大海.lua"},
{_0046 = "力量传奇", file = "力量传奇.lua"},
{_0046 = "南极洲探险", file = "南极洲探险.lua"},
{_0046 = "启示录", file = "启示录.lua"},
{_0046 = "奴才大亨", file = "奴才大亨.lua"},
{_0046 = "寻找巨型鱼", file = "寻找巨型鱼.lua"},
{_0046 = "平滑切片", file = "平滑切片.lua"},
{_0046 = "强壮传奇", file = "强壮传奇.lua"},
{_0046 = "忍者传奇", file = "忍者传奇.lua"},
{_0046 = "戒网瘾中心", file = "戒网瘾中心.lua"},
{_0046 = "战争机器", file = "战争机器.lua"},
{_0046 = "手枪竞技场", file = "手枪竞技场.lua"},
{_0046 = "撕咬之夜", file = "撕咬之夜.lua"},
{_0046 = "无家可归", file = "无家可归.lua"},
{_0046 = "最强战场", file = "最强战场.lua"},
{_0046 = "最强的拳击模拟器", file = "最强的拳击模拟器.lua"},
{_0046 = "月球增量", file = "月球增量.lua"},
{_0046 = "木筏101天生存", file = "木筏101天生存.lua"},
{_0046 = "极速传奇", file = "极速传奇.lua"},
{_0046 = "模仿者", file = "模仿者.lua"},
{_0046 = "死铁轨", file = "死铁轨.lua"},
{_0046 = "每步+1 智商", file = "每步+1 智商.lua"},
{_0046 = "水手碎片", file = "水手碎片.lua"},
{_0046 = "汽车经销商大亨", file = "汽车经销商大亨.lua"},
{_0046 = "沉默的刺客", file = "沉默的刺客.lua"},
{_0046 = "滑石头RNG", file = "滑石头RNG.lua"},
{_0046 = "火球训练", file = "火球训练.lua"},
{_0046 = "火箭发射模拟器", file = "火箭发射模拟器.lua"},
{_0046 = "犯罪", file = "犯罪.lua"},
{_0046 = "生存于杀手", file = "生存于杀手.lua"},
{_0046 = "画我", file = "画我.lua"},
{_0046 = "监狱泵", file = "监狱泵.lua"},
{_0046 = "矿井", file = "矿井.lua"},
{_0046 = "砍伐树木", file = "砍伐树木.lua"},
{_0046 = "破坏者谜团2", file = "破坏者谜团2.lua"},
{_0046 = "种植花园", file = "种植花园.lua"},
{_0046 = "竞争对手", file = "竞争对手.lua"},
{_0046 = "花园地平线", file = "花园地平线.lua"},
{_0046 = "血债", file = "血债.lua"},
{_0046 = "血色地带", file = "血色地带.lua"},
{_0046 = "训练怪兽进行破坏", file = "训练怪兽进行破坏.lua"},
{_0046 = "诅咒之刃", file = "诅咒之刃.lua"},
{_0046 = "超真实csgo", file = "超真实csgo.lua"},
{_0046 = "超高速跑者", file = "超高速跑者.lua"},
{_0046 = "迷你帝国", file = "迷你帝国.lua"},
{_0046 = "造船寻宝", file = "造船寻宝.lua"},
{_0046 = "金币点击器", file = "金币点击器.lua"},
{_0046 = "钓鱼模拟器", file = "钓鱼模拟器.lua"},
{_0046 = "闪光", file = "闪光.lua"},
{_0046 = "防御", file = "防御.lua"},
{_0046 = "集装箱RNG", file = "集装箱RNG.lua"},
{_0046 = "餐厅大亨3", file = "餐厅大亨3.lua"},
{_0046 = "鲨鱼咬", file = "鲨鱼咬.lua"},
}
local function LoadRemoteScript(scriptName, fileName)
local _0093  _00ab .. _0008:UrlEncode(fileName)
Notify("正在加载", "正在获取 " .. scriptName .. " 源码...", 3)
local _00ad  result = pcall(function()
return game:HttpGet(_0093)
end)
if _00ad and result then
local _00ae  execErr = pcall(function()
loadstring(result)()
end)
if _00ae then
Notify("加载成功", scriptName .. " 已成功运行!", 3)
else
sysMsg("执行失败", tostring(execErr))
end
else
sysMsg("获取失败", "无法获取 " .. scriptName .. " 的源码")
end
end
_00aa:Input({
Title = "搜索脚本",
Placeholder = "输入脚本名称搜索...",
Callback = function(text)
if text and #text > 0 then
local _00af  false
for _, s in ipairs(_00ac) do
if string.find(string.lower(s._0046), string.lower(text), 1, true) then
_00af = true
break
end
end
if not _00af then
Notify("搜索结果", "未找到匹配 '" .. text .. "' 的脚本", 3)
end
end
end,
})
_00aa:Divider()
local _00b0  nil
local scriptDropdown = _00aa:Dropdown({
Title = "选择脚本",
Values = (function()
local _00b1  {}
for _, s in ipairs(_00ac) do
table.insert(_00b1, s._0046)
end
return _00b1
end)(),
Callback = function(val) _00b0 = val end,
})
_00aa:Button({
Title = "执行选中脚本",
Callback = function()
if _00b0 then
for _, s in ipairs(_00ac) do
if s._0046 == _00b0 then
LoadRemoteScript(s._0046, s.file)
return
end
end
else
Notify("提示", "请先选择一个脚本", 3)
end
end,
})
_00aa:Button({
Title = "刷新脚本列表",
Callback = function()
local _00b1  {}
for _, s in ipairs(_00ac) do
table.insert(_00b1, s._0046)
end
Notify("脚本列表", "共 " .. #_00b1 .. " 个脚本", 3)
end,
})
_00aa:Divider()
_00aa:Button({
Title = "圣奥里",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://pastebin.com/raw/3U9WtQGU"))()
end)
Notify("圣奥里", "已执行圣奥里脚本", 3)
end,
})
local _00b2  _005f:Tab({Title = "其他脚本", Icon = "file-text"})
_00b2:Button({
Title = "情云脚本",
Callback = function()
pcall(function()
loadstring(utf8._0038((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
end)
Notify("情云脚本", "已执行情云脚本", 3)
end,
})
_00b2:Button({
Title = "夜脚本",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ylt410/roblox-Script/refs/heads/_0019/yejiaoben"))()
end)
Notify("夜脚本", "已执行夜脚本", 3)
end,
})
_00b2:Button({
Title = "XA脚本",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.gitcode.com/Xingtaiduan/Scripts/raw/_0019/Loader.lua"))()
end)
Notify("XA脚本", "已执行XA脚本", 3)
end,
})
_00b2:Button({
Title = "皮脚本",
Callback = function()
pcall(function()
getgenv().XiaoPi = "皮脚本QQ群1065725086"
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/_0019/QQ1002100032-Roblox-Pi-script.lua"))()
end)
Notify("皮脚本", "已执行皮脚本", 3)
end,
})
_00b2:Button({
Title = "ROB脚本",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.gitcode.com/ROB5201314/robscript/raw/_0019/ROB.V3"))()
end)
Notify("ROB脚本", "已执行ROB脚本", 3)
end,
})
Notify("欢迎使用", "sbrp脚本", 5)
task.wait(1)
Notify("sbrp脚本", "v5.0 加载完成", 3)