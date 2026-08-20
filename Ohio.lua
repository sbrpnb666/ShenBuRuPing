local _v3MTQy3l = 0
local _thTTnxwI = ""
local _FZqXV3k4 = nil
local _0001  loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
local _0002  game:GetService("_0002")
local _0003  game:GetService("_0003")
local _0004  game:GetService("_0004")
local _0005  game:GetService("_0005")
local _0006  game:GetService("_0006")
local _0007  game:GetService("_0007")
local _0008  game:GetService("_0008")
local _0009  game:GetService("_0009")
local _000a  game:GetService("_000a")
local _000b  game:GetService("_000b")
local _000c  _0002._000c
local _000d  _0005.CurrentCamera
local _000e  _000c:GetMouse()
local _000f  _0001:CreateWindow({
Title = "Ohio",
Icon = "skull",
Author = "Ohio Script v2.0",
Folder = "OhioScript",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
HideSearchBar = false,
})
local _0010  _000f:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 255, 255)
})
local _0011  0
task._005f(function()
while true do
local _0012  os.date("*t")
local _0013  string.format("%02d", _0012.hour)
local _0014  string.format("%02d", _0012.min)
_0011 = (_0011 + 0.01) % 1
local _0015  Color3.fromHSV(_0011, 1, 1)
_0010:SetTitle(_0013 .. ":" .. _0014)
_0010:SetColor(_0015)
task.wait(0.06)
end
end)
_000f:Tag({
Title = "Ohio",
Color = Color3.fromHex("#FF4444")
})
_000f:EditOpenButton({
Title = "Ohio",
Icon = "skull",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FF4444")),
Draggable = true,
})
local _0016  {
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
OnePunch = false,
WalkSpeed = 16,
JumpPower = 50,
InfJump = false,
Noclip = false,
GodMode = false,
NoFallDamage = false,
ESPEnabled = false,
ESPBoxes = false,
ESPNames = false,
ESPDistance = false,
ESPHealth = false,
Tracers = false,
ShowFOV = false,
Chams = false,
Fullbright = false,
AutoCash = false,
AntiAFK = false,
FPSBoost = false,
}
local _0017  {}
local _0018  {}
local _0019  nil
local _001a  {}
local function GetChar()
return _000c.Character
end
local function GetRoot()
local _001b  GetChar()
return _001b and _001b:FindFirstChild("HumanoidRootPart") or nil
end
local function GetHum()
local _001b  GetChar()
return _001b and _001b:FindFirstChildOfClass("Humanoid") or nil
end
local function Notify(title, content, duration)
_0001:Notify({ Title = title, Content = content or "", Duration = duration or 3 })
end
local function GetPlayers()
local _001c  {}
for _, p in ipairs(_0002:GetPlayers()) do
if p ~= _000c then
table.insert(_001c, p.Name)
end
end
return _001c
end
local function GetScreenCenter()
local _001d  _000d.ViewportSize
return Vector2.new(_001d.X / 2, _001d.Y / 2)
end
local function WorldToScreen(pos)
local _001e  onScreen = _000d:WorldToViewportPoint(pos)
return Vector2.new(_001e.X, _001e.Y), onScreen
end
local function GetClosestPlayerToFov()
local _001f  nil
local _0020  math.huge
local _0021  GetScreenCenter()
local _0022  _0016.AimbotFOV
for _, _005c in ipairs(_0002:GetPlayers()) do
if _005c ~= _000c and _005c.Character then
local _0023  _005c.Character:FindFirstChild("Head")
local _0024  _005c.Character:FindFirstChild("HumanoidRootPart")
local _0025  _005c.Character:FindFirstChildOfClass("Humanoid")
if (_0023 or _0024) and _0025 and _0025.Health > 0 then
local _0026  _0023 or _0024
local _001e  onScreen = WorldToScreen(_0026.Position)
if onScreen then
local _0027  (_001e - _0021).Magnitude
if _0027 < _0020 and _0027 <= _0022 then
_0020 = _0027
_001f = _005c
end
end
end
end
end
return _001f
end
local function GetAimTargetPart(_005c)
if not _005c or not _005c.Character then return nil end
local _0023  _005c.Character:FindFirstChild("Head")
local _0025  _005c.Character:FindFirstChildOfClass("Humanoid")
if not _0025 or _0025.Health <= 0 then return nil end
return _0023 or _005c.Character:FindFirstChild("HumanoidRootPart")
end
local function GetTargetPosition(_005c)
local _0028  GetAimTargetPart(_005c)
if not _0028 then return nil end
local _0025  _005c.Character:FindFirstChildOfClass("Humanoid")
local _0029  _005c.Character:FindFirstChild("HumanoidRootPart")
if _0029 and _0029:FindFirstChild("BodyVelocity") then
local _002a  _0029.BodyVelocity.Velocity
return _0028.Position + _002a * 0.1
end
return _0028.Position
end
local _002b  _000f:Tab({
Title = "战斗",
Icon = "swords",
})
_002b:Section({ Title = "瞄准", TextXAlignment = "Left", TextSize = 17 })
local _002c  nil
_002b:Toggle({
Title = "自动瞄准",
Default = false,
Callback = function(val)
_0016.AimbotEnabled = val
if val then
Notify("战斗", "自瞄已开启 (自动锁定最近敌人)", 3)
_002c = _0003.RenderStepped:Connect(function()
if not _0016.AimbotEnabled then return end
local _002d  GetClosestPlayerToFov()
if _002d then
local _0028  GetAimTargetPart(_002d)
if _0028 then
local _002e  _000d.CFrame.Position
local _002f  CFrame.new(_002e, _0028.Position)
_000d.CFrame = _000d.CFrame:Lerp(_002f, _0016.AimbotSmooth)
end
end
end)
else
if _002c then _002c:Disconnect() _002c = nil end
Notify("战斗", "自瞄已关闭", 3)
end
end,
})
_002b:Slider({
Title = "瞄准范围",
Value = { Min = 30, Max = 500, Default = 120 },
Increment = 5,
Callback = function(val)
_0016.AimbotFOV = val
if _0019 then
_0019.Radius = val
end
end,
})
_002b:Slider({
Title = "瞄准平滑度",
Value = { Min = 5, Max = 100, Default = 40 },
Increment = 1,
Callback = function(val)
_0016.AimbotSmooth = val / 100
end,
})
local _0030  nil
_002b:Toggle({
Title = "静默瞄准",
Default = false,
Callback = function(val)
_0016.SilentAim = val
if val then
Notify("战斗", "静默瞄准已开启", 3)
local _0031  getrawmetatable(game)
local _0032  getrawmetatable(game).__namecall
local _0033  getrawmetatable(game).__index
setreadonly(_0031, false)
local _0034  _0031.__index
_0031.__index = newcclosure(function(self, key)
if key == "Hit" or key == "Target" or key == "TargetPoint" then
if _0016.SilentAim then
local _002d  GetClosestPlayerToFov()
if _002d then
local _0028  GetAimTargetPart(_002d)
if _0028 then
return _0028.Position
end
end
end
end
return _0034(self, key)
end)
setreadonly(_0031, true)
else
Notify("战斗", "静默瞄准已关闭", 3)
end
end,
})
_002b:Divider()
local _0035  nil
_002b:Toggle({
Title = "自动开火",
Default = false,
Callback = function(val)
_0016.TriggerBot = val
if val then
Notify("战斗", "触发器已开启", 3)
_0035 = _0003.Heartbeat:Connect(function()
if not _0016.TriggerBot then return end
local _002d  GetClosestPlayerToFov()
if _002d then
local _0028  GetAimTargetPart(_002d)
if _0028 then
local _001e  onScreen = WorldToScreen(_0028.Position)
local _0021  GetScreenCenter()
local _0027  (_001e - _0021).Magnitude
if _0027 < 30 then
local _0036  GetChar() and GetChar():FindFirstChildOfClass("Tool")
if _0036 then
pcall(function() _0036:Activate() end)
pcall(function()
_000a:SendMouseButtonEvent(_000e.X, _000e.Y, 0, true, game, 1)
task.wait(_0016.TriggerDelay)
_000a:SendMouseButtonEvent(_000e.X, _000e.Y, 0, false, game, 1)
end)
end
end
end
end
end)
else
if _0035 then _0035:Disconnect() _0035 = nil end
Notify("战斗", "触发器已关闭", 3)
end
end,
})
_002b:Slider({
Title = "开火延迟",
Value = { Min = 1, Max = 100, Default = 5 },
Increment = 1,
Callback = function(val)
_0016.TriggerDelay = val / 100
end,
})
_002b:Divider()
_002b:Toggle({
Title = "碰撞箱放大",
Default = false,
Callback = function(val)
_0016.HitboxExpand = val
if val then
Notify("战斗", "Hitbox 扩大已开启", 3)
_0017.Hitbox = _0003.Heartbeat:Connect(function()
for _, _005c in ipairs(_0002:GetPlayers()) do
if _005c ~= _000c and _005c.Character then
local _0024  _005c.Character:FindFirstChild("HumanoidRootPart")
local _0025  _005c.Character:FindFirstChildOfClass("Humanoid")
if _0024 and _0025 and _0025.Health > 0 then
_0024.Size = Vector3.new(_0016.HitboxSize, _0016.HitboxSize, _0016.HitboxSize)
_0024.Transparency = 0.5
_0024.CanCollide = false
_0024.CanQuery = true
end
end
end
end)
else
if _0017.Hitbox then _0017.Hitbox:Disconnect() _0017.Hitbox = nil end
for _, _005c in ipairs(_0002:GetPlayers()) do
if _005c ~= _000c and _005c.Character then
local _0024  _005c.Character:FindFirstChild("HumanoidRootPart")
if _0024 then
_0024.Size = Vector3.new(2, 2, 1)
_0024.Transparency = 0
_0024.CanCollide = true
end
end
end
Notify("战斗", "Hitbox 扩大已关闭", 3)
end
end,
})
_002b:Slider({
Title = "碰撞箱大小",
Value = { Min = 2, Max = 50, Default = 10 },
Increment = 1,
Callback = function(val)
_0016.HitboxSize = val
end,
})
_002b:Divider()
_002b:Section({ Title = "武器", TextXAlignment = "Left", TextSize = 17 })
_002b:Toggle({
Title = "无限弹药",
Default = false,
Callback = function(val)
_0016.InfiniteAmmo = val
if val then
Notify("战斗", "无限弹药已开启", 3)
_0017.Ammo = _0003.Heartbeat:Connect(function()
local _0037  GetChar()
if not _0037 then return end
for _, _0036 in ipairs(_0037:GetChildren()) do
if _0036:IsA("Tool") then
pcall(function()
local _0038  _0036:FindFirstChild("ACS_Modulo")
if _0038 then
local _0039  _0038:FindFirstChild("Variaveis")
if _0039 then
for _, v in ipairs(_0039:GetChildren()) do
local _003a  string.lower(v.Name)
if string.find(_003a, "ammo") or string.find(_003a, "mag") or string.find(_003a, "clip") or string.find(_003a, "bullet") then
v.Value = 9999
end
end
end
end
for _, desc in ipairs(_0036:GetDescendants()) do
if desc:IsA("ValueBase") then
local _003a  string.lower(desc.Name)
if string.find(_003a, "ammo") or string.find(_003a, "mag") or string.find(_003a, "clip") then
desc.Value = 9999
end
end
end
for k, _ in pairs(_0036:GetAttributes()) do
local _003b  string.lower(k)
if string.find(_003b, "ammo") or string.find(_003b, "mag") then
_0036:SetAttribute(k, 9999)
end
end
end)
end
end
end)
else
if _0017.Ammo then _0017.Ammo:Disconnect() _0017.Ammo = nil end
Notify("战斗", "无限弹药已关闭", 3)
end
end,
})
_002b:Toggle({
Title = "无后坐力",
Default = false,
Callback = function(val)
_0016.NoRecoil = val
if val then
Notify("战斗", "无后坐力已开启", 3)
_0017.Recoil = _0003.Heartbeat:Connect(function()
local _0037  GetChar()
if not _0037 then return end
for _, _0036 in ipairs(_0037:GetChildren()) do
if _0036:IsA("Tool") then
pcall(function()
local _0038  _0036:FindFirstChild("ACS_Modulo")
if _0038 then
local _0039  _0038:FindFirstChild("Variaveis")
if _0039 then
for _, v in ipairs(_0039:GetChildren()) do
local _003a  string.lower(v.Name)
if string.find(_003a, "recoil") or string.find(_003a, "kick") or string.find(_003a, "spread")
or string.find(_003a, "bloom") or string.find(_003a, "shake") or string.find(_003a, "deviation")
or string.find(_003a, "sway") then
v.Value = 0
end
if string.find(_003a, "accuracy") then v.Value = 100 end
if string.find(_003a, "range") then v.Value = 9999 end
if string.find(_003a, "firerate") then v.Value = 9999 end
end
end
end
for _, desc in ipairs(_0036:GetDescendants()) do
if desc:IsA("ValueBase") then
local _003a  string.lower(desc.Name)
if string.find(_003a, "recoil") or string.find(_003a, "kick") or string.find(_003a, "spread")
or string.find(_003a, "bloom") or string.find(_003a, "shake") or string.find(_003a, "deviation") then
desc.Value = 0
end
end
end
end)
end
end
end)
else
if _0017.Recoil then _0017.Recoil:Disconnect() _0017.Recoil = nil end
Notify("战斗", "无后坐力已关闭", 3)
end
end,
})
_002b:Toggle({
Title = "快速射击",
Default = false,
Callback = function(val)
_0016.RapidFire = val
if val then
Notify("战斗", "快速射击已开启", 3)
_0017.RapidFire = _0003.Heartbeat:Connect(function()
if not _0016.RapidFire then return end
if _0004:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
local _0037  GetChar()
if not _0037 then return end
local _0036  _0037:FindFirstChildOfClass("Tool")
if _0036 then
pcall(function() _0036:Activate() end)
end
end
end)
else
if _0017.RapidFire then _0017.RapidFire:Disconnect() _0017.RapidFire = nil end
Notify("战斗", "快速射击已关闭", 3)
end
end,
})
_002b:Toggle({
Title = "一拳超人 (伤害x100)",
Default = false,
Callback = function(val)
_0016.OnePunch = val
if val then
Notify("战斗", "一拳超人已开启! 伤害x100", 3)
local function boostToolDamage(_0036)
if not _0036 or not _0036:IsA("Tool") then return end
pcall(function()
local _0038  _0036:FindFirstChild("ACS_Modulo")
if _0038 then
local _0039  _0038:FindFirstChild("Variaveis")
if _0039 then
for _, v in ipairs(_0039:GetChildren()) do
local _003a  string.lower(v.Name)
if string.find(_003a, "damage") or string.find(_003a, "_003c") then
if v:IsA("NumberValue") or v:IsA("IntValue") then
v.Value = v.Value * 100
end
end
end
end
end
for _, desc in ipairs(_0036:GetDescendants()) do
if desc:IsA("ValueBase") then
local _003a  string.lower(desc.Name)
if string.find(_003a, "damage") or string.find(_003a, "_003c") then
if desc:IsA("NumberValue") or desc:IsA("IntValue") then
desc.Value = desc.Value * 100
end
end
end
end
for k, v in pairs(_0036:GetAttributes()) do
local _003b  string.lower(k)
if string.find(_003b, "damage") or string.find(_003b, "_003c") then
if type(v) == "number" then
_0036:SetAttribute(k, v * 100)
end
end
end
if _0036:FindFirstChild("Damage") then
local _003c  _0036.Damage
if _003c:IsA("NumberValue") or _003c:IsA("IntValue") then
_003c.Value = _003c.Value * 100
end
end
end)
end
local _0037  GetChar()
if _0037 then
for _, _0036 in ipairs(_0037:GetChildren()) do
boostToolDamage(_0036)
end
end
_0017.OnePunch = _0003.Heartbeat:Connect(function()
if not _0016.OnePunch then return end
local _001b  GetChar()
if not _001b then return end
for _, _0036 in ipairs(_001b:GetChildren()) do
if _0036:IsA("Tool") then
local _003d  _0036:GetAttribute("OhioOnePunch")
if not _003d then
boostToolDamage(_0036)
_0036:SetAttribute("OhioOnePunch", true)
end
end
end
end)
local _0031  getrawmetatable(game)
local _0032  _0031.__namecall
setreadonly(_0031, false)
_0031.__namecall = newcclosure(function(self, ...)
local _003e  getnamecallmethod()
if _0016.OnePunch and (_003e == "FireServer" or _003e == "InvokeServer") then
local _003f  {...}
pcall(function()
for i, arg in ipairs(_003f) do
if type(arg) == "number" then
if arg > 0 and arg < 1000 then
_003f[i] = arg * 100
end
end
end
end)
return _0032(self, unpack(_003f))
end
return _0032(self, ...)
end)
setreadonly(_0031, true)
else
if _0017.OnePunch then _0017.OnePunch:Disconnect() _0017.OnePunch = nil end
Notify("战斗", "一拳超人已关闭", 3)
end
end,
})
local _0040  _000f:Tab({
Title = "玩家",
Icon = "user",
})
_0040:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_0040:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
_0016.WalkSpeed = val
local _0041  GetHum()
if _0041 then _0041.WalkSpeed = val end
end,
})
_0040:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(val)
_0016.JumpPower = val
local _0041  GetHum()
if _0041 then
if _0041.UseJumpPower then _0041.JumpPower = val
else _0041.JumpHeight = val / 10 end
end
end,
})
_0040:Divider()
_0040:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
_0016.InfJump = val
if val then
_0017.InfJump = _0004.JumpRequest:Connect(function()
local _0041  GetHum()
if _0041 then _0041:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _0017.InfJump then _0017.InfJump:Disconnect() _0017.InfJump = nil end
end
end,
})
_0040:Toggle({
Title = "穿墙",
Default = false,
Callback = function(val)
_0016.Noclip = val
if val then
_0017.NoClip = _0003.Stepped:Connect(function()
if not _0016.Noclip then return end
local _001b  GetChar()
if _001b then
for _, p in ipairs(_001b:GetDescendants()) do
if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
end
end
end)
else
if _0017.NoClip then _0017.NoClip:Disconnect() _0017.NoClip = nil end
end
end,
})
_0040:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
_0016.GodMode = val
if val then
Notify("玩家", "无敌已开启", 3)
_0017.GodMode = _0003.Heartbeat:Connect(function()
local _0041  GetHum()
if _0041 and _0041.Health < _0041.MaxHealth then
_0041.Health = _0041.MaxHealth
end
end)
else
if _0017.GodMode then _0017.GodMode:Disconnect() _0017.GodMode = nil end
Notify("玩家", "无敌已关闭", 3)
end
end,
})
_0040:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
_0016.NoFallDamage = val
if val then
Notify("玩家", "摔落无伤害已开启", 3)
local function setupFall(_0041)
if not _0041 then return end
local _0042  _0041.Health
_0041.StateChanged:Connect(function(old, new)
if not _0016.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_0042 = _0041.Health
elseif old == Enum.HumanoidStateType.Freefall then
if _0041.Health < _0042 then
_0041.Health = _0042
end
end
end)
end
local _001b  GetChar()
if _001b then setupFall(_001b:FindFirstChildOfClass("Humanoid")) end
_0017.NoFall = _000c.CharacterAdded:Connect(function(_0037)
task.wait(0.3)
if _0016.NoFallDamage then
setupFall(_0037:FindFirstChildOfClass("Humanoid") or _0037:WaitForChild("Humanoid"))
end
end)
else
if _0017.NoFall then _0017.NoFall:Disconnect() _0017.NoFall = nil end
Notify("玩家", "摔落无伤害已关闭", 3)
end
end,
})
_0040:Divider()
local _0043  false
_0040:Button({
Title = "飞行 (手机版)",
Callback = function()
if _0043 then
Notify("飞行", "飞行面板已打开, 请用面板上的按钮控制", 3)
return
end
_0043 = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/飞行脚本V3(全游戏通用).txt"))()
end,
})
local _0044  _000f:Tab({
Title = "视觉",
Icon = "eye",
})
_0044:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })
local function createESP(player)
if player == _000c then return end
if _0018[player] then return end
local _0045  Instance.new("BillboardGui")
_0045.Name = "ESP_" .. player.Name
_0045.Size = UDim2.new(0, 200, 0, 60)
_0045.StudsOffset = Vector3.new(0, 3, 0)
_0045.AlwaysOnTop = true
_0045.LightInfluence = 0
local _0046  Instance.new("Frame")
_0046.Size = UDim2.new(1, 0, 1, 0)
_0046.BackgroundTransparency = 1
_0046.Parent = _0045
local _0047  Instance.new("TextLabel")
_0047.Size = UDim2.new(1, 0, 0, 20)
_0047.Position = UDim2.new(0, 0, 0, 0)
_0047.BackgroundTransparency = 1
_0047.TextColor3 = Color3.fromRGB(255, 255, 255)
_0047.TextSize = 14
_0047.Font = Enum.Font.SourceSansBold
_0047.TextStrokeTransparency = 0.5
_0047.Text = player.Name
_0047.Parent = _0046
local _0048  Instance.new("TextLabel")
_0048.Size = UDim2.new(1, 0, 0, 18)
_0048.Position = UDim2.new(0, 0, 0, 20)
_0048.BackgroundTransparency = 1
_0048.TextColor3 = Color3.fromRGB(200, 200, 200)
_0048.TextSize = 12
_0048.Font = Enum.Font.SourceSans
_0048.Text = ""
_0048.Parent = _0046
local _0049  Instance.new("TextLabel")
_0049.Size = UDim2.new(1, 0, 0, 18)
_0049.Position = UDim2.new(0, 0, 0, 40)
_0049.BackgroundTransparency = 1
_0049.TextColor3 = Color3.fromRGB(100, 255, 100)
_0049.TextSize = 12
_0049.Font = Enum.Font.SourceSans
_0049.Text = ""
_0049.Parent = _0046
local _004a  Instance.new("BillboardGui")
_004a.Name = "ESPBox_" .. player.Name
_004a.Size = UDim2.new(0, 100, 0, 150)
_004a.AlwaysOnTop = true
_004a.LightInfluence = 0
local _004b  Instance.new("Frame")
_004b.Size = UDim2.new(0, 15, 0, 2)
_004b.Position = UDim2.new(0, 0, 0, 0)
_004b.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
_004b.BorderSizePixel = 0
_004b.Parent = _004a
local _004c  Instance.new("Frame")
_004c.Size = UDim2.new(0, 15, 0, 2)
_004c.Position = UDim2.new(1, -15, 0, 0)
_004c.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
_004c.BorderSizePixel = 0
_004c.Parent = _004a
local _004d  Instance.new("Frame")
_004d.Size = UDim2.new(0, 15, 0, 2)
_004d.Position = UDim2.new(0, 0, 1, -2)
_004d.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
_004d.BorderSizePixel = 0
_004d.Parent = _004a
local _004e  Instance.new("Frame")
_004e.Size = UDim2.new(0, 15, 0, 2)
_004e.Position = UDim2.new(1, -15, 1, -2)
_004e.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
_004e.BorderSizePixel = 0
_004e.Parent = _004a
_0018[player] = {
_0045 = _0045,
_0047 = _0047,
_0048 = _0048,
_0049 = _0049,
_004a = _004a,
}
end
local function removeESP(player)
if _0018[player] then
if _0018[player]._0045 then _0018[player]._0045:Destroy() end
if _0018[player]._004a then _0018[player]._004a:Destroy() end
_0018[player] = nil
end
end
local function attachESP(player)
if not _0018[player] then return end
local _0037  player.Character
if not _0037 then return end
local _0024  _0037:FindFirstChild("HumanoidRootPart")
local _0023  _0037:FindFirstChild("Head")
if _0024 then
_0018[player]._0045.Adornee = _0023 or _0024
_0018[player]._004a.Adornee = _0024
end
end
_0044:Toggle({
Title = "人物透视",
Default = false,
Callback = function(val)
_0016.ESPEnabled = val
if val then
Notify("视觉", "ESP 已开启", 3)
for _, _005c in ipairs(_0002:GetPlayers()) do
if _005c ~= _000c then createESP(_005c) end
end
_0017.ESPUpdate = _0003.Heartbeat:Connect(function()
for _005c, data in pairs(_0018) do
local _0037  _005c.Character
if _0037 then
local _0024  _0037:FindFirstChild("HumanoidRootPart")
local _0025  _0037:FindFirstChildOfClass("Humanoid")
local _0023  _0037:FindFirstChild("Head")
local _004f  GetRoot()
attachESP(_005c)
if data._0047 then
data._0047.Visible = _0016.ESPNames
data._0047.Text = _005c.Name
if _0025 and _0025.Health > 0 then
data._0047.TextColor3 = Color3.fromRGB(255, 255, 255)
else
data._0047.TextColor3 = Color3.fromRGB(150, 150, 150)
end
end
if data._0048 then
data._0048.Visible = _0016.ESPDistance
if _004f and _0024 then
local _0027  math.floor((_004f.Position - _0024.Position).Magnitude)
data._0048.Text = _0027 .. " studs"
end
end
if data._0049 then
data._0049.Visible = _0016.ESPHealth
if _0025 then
local _0050  math.floor(_0025.Health)
local _0051  math.floor(_0025.MaxHealth)
data._0049.Text = _0050 .. " / " .. _0051
local _0052  _0025.Health / _0025.MaxHealth
if _0052 > 0.5 then
data._0049.TextColor3 = Color3.fromRGB(100, 255, 100)
elseif _0052 > 0.25 then
data._0049.TextColor3 = Color3.fromRGB(255, 255, 100)
else
data._0049.TextColor3 = Color3.fromRGB(255, 100, 100)
end
end
end
if data._004a then
data._004a.Enabled = _0016.ESPBoxes
end
end
end
end)
_0017.PlayerAdded = _0002.PlayerAdded:Connect(function(_005c) createESP(_005c) end)
_0017.PlayerRemoving = _0002.PlayerRemoving:Connect(function(_005c) removeESP(_005c) end)
else
if _0017.ESPUpdate then _0017.ESPUpdate:Disconnect() _0017.ESPUpdate = nil end
if _0017.PlayerAdded then _0017.PlayerAdded:Disconnect() _0017.PlayerAdded = nil end
if _0017.PlayerRemoving then _0017.PlayerRemoving:Disconnect() _0017.PlayerRemoving = nil end
for _005c, _ in pairs(_0018) do removeESP(_005c) end
_0018 = {}
Notify("视觉", "ESP 已关闭", 3)
end
end,
})
_0044:Toggle({
Title = "显示名字",
Default = true,
Callback = function(val) _0016.ESPNames = val end,
})
_0044:Toggle({
Title = "显示距离",
Default = true,
Callback = function(val) _0016.ESPDistance = val end,
})
_0044:Toggle({
Title = "显示血量",
Default = true,
Callback = function(val) _0016.ESPHealth = val end,
})
_0044:Toggle({
Title = "显示方框",
Default = false,
Callback = function(val) _0016.ESPBoxes = val end,
})
_0044:Divider()
_0044:Toggle({
Title = "追踪线",
Default = false,
Callback = function(val)
_0016.Tracers = val
if val then
Notify("视觉", "追踪线已开启", 3)
local _0053  Instance.new("Folder")
_0053.Name = "OhioTracers"
_0053.Parent = _0005
_0017.Tracers = _0003.RenderStepped:Connect(function()
_0053:ClearAllChildren()
if not _0016.Tracers then return end
local _004f  GetRoot()
if not _004f then return end
local _0021  GetScreenCenter()
for _, _005c in ipairs(_0002:GetPlayers()) do
if _005c ~= _000c and _005c.Character then
local _0024  _005c.Character:FindFirstChild("HumanoidRootPart")
local _0025  _005c.Character:FindFirstChildOfClass("Humanoid")
if _0024 and _0025 and _0025.Health > 0 then
local _001e  onScreen = WorldToScreen(_0024.Position)
if onScreen then
local _0054  Instance.new("Frame")
_0054.AnchorPoint = Vector2.new(0, 0.5)
_0054.Size = UDim2.new(0, (_001e - _0021).Magnitude, 0, 2)
_0054.Position = UDim2.new(0, _0021.X, 0, _0021.Y)
_0054.Rotation = math.deg(math.atan2(_001e.Y - _0021.Y, _001e.X - _0021.X))
_0054.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
_0054.BorderSizePixel = 0
_0054.Parent = _0053
end
end
end
end
end)
else
if _0017.Tracers then _0017.Tracers:Disconnect() _0017.Tracers = nil end
local _0055  _0005:FindFirstChild("OhioTracers")
if _0055 then _0055:Destroy() end
Notify("视觉", "追踪线已关闭", 3)
end
end,
})
_0044:Toggle({
Title = "显示瞄准圈",
Default = false,
Callback = function(val)
_0016.ShowFOV = val
if val then
_0019 = Instance.new("Frame")
_0019.Name = "OhioFOV"
_0019.Size = UDim2.new(0, _0016.AimbotFOV * 2, 0, _0016.AimbotFOV * 2)
_0019.AnchorPoint = Vector2.new(0.5, 0.5)
_0019.Position = UDim2.new(0.5, 0, 0.5, 0)
_0019.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_0019.BackgroundTransparency = 1
_0019.BorderSizePixel = 2
local _0056  Instance.new("UICorner")
_0056.CornerRadius = UDim.new(1, 0)
_0056.Parent = _0019
local _0057  Instance.new("UIStroke")
_0057.Color = Color3.fromRGB(255, 255, 255)
_0057.Thickness = 1.5
_0057.Transparency = 0.3
_0057.Parent = _0019
_0019.Parent = _000c:WaitForChild("PlayerGui"):FindFirstChild("CoreGui") or
(function()
local _0058  Instance.new("ScreenGui")
_0058.Name = "OhioGUI"
_0058.Parent = _000c:WaitForChild("PlayerGui")
return _0058
end)()
_0019.Radius = _0016.AimbotFOV
else
if _0019 then _0019:Destroy() _0019 = nil end
end
end,
})
_0044:Divider()
_0044:Section({ Title = "渲染", TextXAlignment = "Left", TextSize = 17 })
_0044:Toggle({
Title = "透视高亮",
Default = false,
Callback = function(val)
_0016.Chams = val
if val then
Notify("视觉", "Chams 已开启", 3)
_0017.Chams = _0003.Heartbeat:Connect(function()
for _, _005c in ipairs(_0002:GetPlayers()) do
if _005c ~= _000c and _005c.Character then
local _0025  _005c.Character:FindFirstChildOfClass("Humanoid")
if _0025 and _0025.Health > 0 then
for _, _0028 in ipairs(_005c.Character:GetChildren()) do
if _0028:IsA("BasePart") and _0028.Name ~= "HumanoidRootPart" then
if not _0028:FindFirstChild("OhioChams") then
local _0059  Instance.new("Highlight")
_0059.Name = "OhioChams"
_0059.FillColor = Color3.fromRGB(255, 50, 50)
_0059.FillTransparency = 0.5
_0059.OutlineColor = Color3.fromRGB(255, 255, 255)
_0059.OutlineTransparency = 0
_0059.Parent = _0028
end
end
end
end
end
end
end)
else
if _0017.Chams then _0017.Chams:Disconnect() _0017.Chams = nil end
for _, _005c in ipairs(_0002:GetPlayers()) do
if _005c ~= _000c and _005c.Character then
for _, _0028 in ipairs(_005c.Character:GetDescendants()) do
if _0028:IsA("Highlight") and _0028.Name == "OhioChams" then
_0028:Destroy()
end
end
end
end
Notify("视觉", "Chams 已关闭", 3)
end
end,
})
_0044:Toggle({
Title = "全图高亮",
Default = false,
Callback = function(val)
_0016.Fullbright = val
if val then
Notify("视觉", "全亮已开启", 3)
_0006.Brightness = 3
_0006.ClockTime = 14
_0006.FogEnd = 100000
_0006.FogStart = 0
_0006.GlobalShadows = false
_0006.EnvironmentDiffuseScale = 1
_0006.EnvironmentSpecularScale = 1
_0017.Fullbright = _0003.Heartbeat:Connect(function()
_0006.Brightness = 3
_0006.ClockTime = 14
_0006.FogEnd = 100000
_0006.GlobalShadows = false
end)
else
if _0017.Fullbright then _0017.Fullbright:Disconnect() _0017.Fullbright = nil end
_0006.Brightness = 1
_0006.ClockTime = 12
_0006.FogEnd = 100000
_0006.GlobalShadows = true
Notify("视觉", "全亮已关闭", 3)
end
end,
})
local _005a  _000f:Tab({
Title = "传送",
Icon = "map-pin",
})
_005a:Section({ Title = "传送", TextXAlignment = "Left", TextSize = 17 })
local _005b  nil
_005a:Dropdown({
Title = "选择玩家",
Value = { Default = "" },
Items = function()
return GetPlayers()
end,
Callback = function(val)
_005b = val
end,
})
_005a:Button({
Title = "传送到选中玩家",
Callback = function()
if not _005b or _005b == "" then
Notify("传送", "请先选择玩家", 3)
return
end
local _005c  _0002:FindFirstChild(_005b)
if _005c and _005c.Character then
local _005d  _005c.Character:FindFirstChild("HumanoidRootPart")
local _005e  GetRoot()
if _005d and _005e then
_005e.CFrame = _005d.CFrame * CFrame.new(0, 0, 5)
Notify("传送", "已传送到 " .. _005b, 3)
end
else
Notify("传送", "玩家不存在或无角色", 3)
end
end,
})
_005a:Button({
Title = "传送到触点",
Callback = function()
local _004f  GetRoot()
if _004f then
_004f.CFrame = _000e.Hit
Notify("传送", "已传送到鼠标位置", 3)
end
end,
})
_005a:Button({
Title = "传送到出生点",
Callback = function()
local _005f  _0005:FindFirstChildOfClass("SpawnLocation")
local _004f  GetRoot()
if _005f and _004f then
_004f.CFrame = _005f.CFrame * CFrame.new(0, 5, 0)
Notify("传送", "已传送到出生点", 3)
else
Notify("传送", "未找到出生点", 3)
end
end,
})
_005a:Divider()
_005a:Section({ Title = "快速地点", TextXAlignment = "Left", TextSize = 17 })
local _0060  {
{ name = "商店", keywords = {"shop", "store", "market"} },
{ name = "银行", keywords = {"bank"} },
{ name = "警察局", keywords = {"police", "station"} },
{ name = "医院", keywords = {"hospital", "clinic"} },
{ name = "车库", keywords = {"garage", "car"} },
{ name = "机场", keywords = {"airport", "plane"} },
}
for _, loc in ipairs(_0060) do
_005a:Button({
Title = "传送到" .. loc.name,
Callback = function()
local _0061  false
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _003a  string.lower(obj.Name)
for _, kw in ipairs(loc.keywords) do
if string.find(_003a, kw) then
local _004f  GetRoot()
if _004f then
local _0062  obj:IsA("BasePart") and obj.CFrame or (obj:GetPivot())
_004f.CFrame = _0062 * CFrame.new(0, 5, 0)
Notify("传送", "已传送到" .. loc.name, 3)
_0061 = true
end
break
end
end
if _0061 then break end
end
end
if not _0061 then
Notify("传送", "未找到" .. loc.name, 3)
end
end,
})
end
_005a:Divider()
local _0063  nil
local _0064  nil
_005a:Toggle({
Title = "长按传送",
Default = false,
Callback = function(val)
if val then
Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
_0063 = _0004.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_0064 = tick()
end
end)
_0017.TpHold = _0003.Heartbeat:Connect(function()
if not _0064 then return end
local _0065  tick() - _0064
if _0065 >= 0.5 then
local _004f  GetRoot()
if _004f then
_004f.CFrame = _000e.Hit
end
_0064 = nil
end
end)
_0017.TpEnd = _0004.InputEnded:Connect(function(input, gpe)
_0064 = nil
end)
else
if _0063 then _0063:Disconnect() _0063 = nil end
if _0017.TpHold then _0017.TpHold:Disconnect() _0017.TpHold = nil end
if _0017.TpEnd then _0017.TpEnd:Disconnect() _0017.TpEnd = nil end
_0064 = nil
Notify("传送", "长按传送已关闭", 3)
end
end,
})
local _0066  _000f:Tab({
Title = "经济",
Icon = "dollar-sign",
})
_0066:Section({ Title = "自动收集", TextXAlignment = "Left", TextSize = 17 })
_0066:Toggle({
Title = "自动收集现金",
Default = false,
Callback = function(val)
_0016.AutoCash = val
if val then
Notify("经济", "自动收集现金已开启", 3)
_0017.AutoCash = _0003.Heartbeat:Connect(function()
if not _0016.AutoCash then return end
local _004f  GetRoot()
if _004f then
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "cash") or string.find(_003a, "money") or string.find(_003a, "coin") or string.find(_003a, "pickup") then
pcall(function()
obj.CFrame = _004f.CFrame
end)
end
end
end
end
pcall(function()
for _, obj in ipairs(_0008:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "cash") or string.find(_003a, "money") or string.find(_003a, "collect") or string.find(_003a, "reward") then
obj:FireServer()
end
elseif obj:IsA("RemoteFunction") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "cash") or string.find(_003a, "money") or string.find(_003a, "collect") then
obj:InvokeServer()
end
end
end
end)
end)
else
if _0017.AutoCash then _0017.AutoCash:Disconnect() _0017.AutoCash = nil end
Notify("经济", "自动收集现金已关闭", 3)
end
end,
})
_0066:Divider()
_0066:Section({ Title = "刷钱", TextXAlignment = "Left", TextSize = 17 })
_0066:Button({
Title = "扫描给钱接口",
Callback = function()
local _0067  {}
for _, obj in ipairs(_0008:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "cash") or string.find(_003a, "money") or string.find(_003a, "buy")
or string.find(_003a, "reward") or string.find(_003a, "give") or string.find(_003a, "collect") then
table.insert(_0067, obj:GetFullName())
end
end
end
local _0068  #_0067 > 0 and table.concat(_0067, "\n") or "未找到经济相关 Remote"
Notify("扫描结果", _0068, 10)
end,
})
_0066:Button({
Title = "尝试刷钱",
Callback = function()
local _0069  0
for _, obj in ipairs(_0008:GetDescendants()) do
pcall(function()
if obj:IsA("RemoteEvent") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "cash") or string.find(_003a, "money") or string.find(_003a, "give")
or string.find(_003a, "reward") or string.find(_003a, "collect") then
obj:FireServer()
_0069 = _0069 + 1
end
elseif obj:IsA("RemoteFunction") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "cash") or string.find(_003a, "money") or string.find(_003a, "give") then
obj:InvokeServer()
_0069 = _0069 + 1
end
end
end)
end
Notify("经济", "尝试触发了 " .. _0069 .. " 个 Remote", 5)
end,
})
local _006a  _000f:Tab({
Title = "实用",
Icon = "settings",
})
_006a:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })
_006a:Toggle({
Title = "防挂机",
Default = false,
Callback = function(val)
_0016.AntiAFK = val
if val then
Notify("实用", "防挂机已开启", 3)
_0017.AntiAFK = _000c.Idled:Connect(function()
_000a:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
_000a:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
else
if _0017.AntiAFK then _0017.AntiAFK:Disconnect() _0017.AntiAFK = nil end
Notify("实用", "防挂机已关闭", 3)
end
end,
})
_006a:Toggle({
Title = "画质提速",
Default = false,
Callback = function(val)
_0016.FPSBoost = val
if val then
Notify("实用", "FPS 加速已开启", 3)
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
pcall(function()
if obj.Material == Enum.Material.Neon or obj.Material == Enum.Material.Glass then
obj.Material = Enum.Material.Plastic
end
end)
end
end
_0006.GlobalShadows = false
settings().Rendering.QualityLevel = 1
_0006.FogEnd = 9e9
_0017.FPSBoost = _0003.Heartbeat:Connect(function()
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false end)
end
end
end)
else
if _0017.FPSBoost then _0017.FPSBoost:Disconnect() _0017.FPSBoost = nil end
settings().Rendering.QualityLevel = Enum.RenderingQuality.Automatic
_0006.FogEnd = 100000
Notify("实用", "FPS 加速已关闭", 3)
end
end,
})
_006a:Divider()
_006a:Button({
Title = "换服",
Callback = function()
Notify("实用", "正在跳转服务器...", 3)
local _006b  game.PlaceId
_0009:Teleport(_006b, _000c)
end,
})
_006a:Button({
Title = "复制服务器号",
Callback = function()
local _006c  game.JobId
if setclipboard then
setclipboard(_006c)
Notify("实用", "已复制: " .. _006c, 3)
else
Notify("实用", "JobId: " .. _006c, 5)
end
end,
})
_006a:Divider()
_006a:Section({ Title = "角色信息", TextXAlignment = "Left", TextSize = 17 })
_006a:Button({
Title = "输出角色信息",
Callback = function()
local _0037  GetChar()
if not _0037 then Notify("实用", "无角色", 3) return end
local _006d  {}
local _0041  GetHum()
if _0041 then
table.insert(_006d, "血量: " .. math.floor(_0041.Health) .. "/" .. math.floor(_0041.MaxHealth))
table.insert(_006d, "速度: " .. _0041.WalkSpeed)
table.insert(_006d, "跳跃: " .. (_0041.UseJumpPower and _0041.JumpPower or _0041.JumpHeight))
end
local _004f  GetRoot()
if _004f then
table.insert(_006d, "位置: " .. tostring(_004f.Position))
end
local _0036  _0037:FindFirstChildOfClass("Tool")
if _0036 then
table.insert(_006d, "手持: " .. _0036.Name)
end
Notify("角色信息", table.concat(_006d, "\n"), 10)
end,
})
_006a:Button({
Title = "重置角色",
Callback = function()
local _0041  GetHum()
if _0041 then
_0041.Health = 0
Notify("实用", "已重置角色", 3)
end
end,
})
_006a:Divider()
_006a:Section({ Title = "清理", TextXAlignment = "Left", TextSize = 17 })
_006a:Button({
Title = "清理所有特效",
Callback = function()
local _0069  0
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false; _0069 = _0069 + 1 end)
end
end
Notify("实用", "已清理 " .. _0069 .. " 个特效", 3)
end,
})
_006a:Button({
Title = "卸载脚本",
Callback = function()
for _, conn in pairs(_0017) do
if conn then pcall(function() conn:Disconnect() end) end
end
_0017 = {}
for _005c, _ in pairs(_0018) do removeESP(_005c) end
_0018 = {}
local _0055  _0005:FindFirstChild("OhioTracers")
if _0055 then _0055:Destroy() end
if _0019 then _0019:Destroy() _0019 = nil end
Notify("实用", "脚本已卸载", 3)
end,
})
Notify("Ohio 脚本", "Ohio 超级脚本已加载!", 5)
_000c.CharacterAdded:Connect(function(_0037)
task.wait(0.5)
local _0041  _0037:FindFirstChildOfClass("Humanoid")
if _0041 then
if _0016.WalkSpeed ~= 16 then _0041.WalkSpeed = _0016.WalkSpeed end
if _0016.JumpPower ~= 50 then
if _0041.UseJumpPower then _0041.JumpPower = _0016.JumpPower
else _0041.JumpHeight = _0016.JumpPower / 10 end
end
end
end)