local _sgIIo7x2 = 0
local _S2mphzfz = ""
local _E5Zpo5bD = nil
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
local _000b  _0002._000b
local _000c  _0005.CurrentCamera
local _000d  _000b:GetMouse()
local _000e  _0001:CreateWindow({
Title = "最强战场",
Icon = "swords",
Author = "最强战场脚本",
Folder = "StrongestBattlegrounds",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
HideSearchBar = false,
})
local _000f  _000e:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 180, 0)
})
local _0010  0
task.spawn(function()
while true do
local _0011  os.date("*t")
_0010 = (_0010 + 0.01) % 1
_000f:SetTitle(string.format("%02d:%02d", _0011.hour, _0011.min))
_000f:SetColor(Color3.fromHSV(_0010, 1, 1))
task.wait(0.06)
end
end)
_000e:Tag({ Title = "最强战场", Color = Color3.fromHex("#FFB400") })
_000e:EditOpenButton({
Title = "最强战场",
Icon = "swords",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FFB400")),
Draggable = true,
})
local _0012  {
AutoBlock = false,
AutoDodge = false,
ReachExpand = false,
ReachSize = 20,
AutoCombo = false,
FastPunch = false,
InfStamina = false,
NoStun = false,
AutoPunch = false,
NoCooldown = false,
GodMode = false,
WalkSpeed = 16,
JumpPower = 50,
InfJump = false,
Noclip = false,
NoFallDamage = false,
ESPEnabled = false,
ESPNames = true,
ESPDistance = true,
ESPHealth = true,
Tracers = false,
Chams = false,
Fullbright = false,
AntiAFK = false,
FPSBoost = false,
}
local _0013  {}
local _0014  {}
local _0015  {}
local function GetChar()
return _000b.Character
end
local function GetRoot()
local _0016  GetChar()
return _0016 and _0016:FindFirstChild("HumanoidRootPart") or nil
end
local function GetHum()
local _0016  GetChar()
return _0016 and _0016:FindFirstChildOfClass("Humanoid") or nil
end
local function Notify(title, content, duration)
_0001:Notify({ Title = title, Content = content or "", Duration = duration or 3 })
end
local function GetScreenCenter()
local _0017  _000c.ViewportSize
return Vector2.new(_0017.X / 2, _0017.Y / 2)
end
local function WorldToScreen(pos)
local _0018  onScreen = _000c:WorldToViewportPoint(pos)
return Vector2.new(_0018.X, _0018.Y), onScreen
end
local function GetClosestPlayer(maxDist)
local _0019  nil
local _001a  maxDist or math.huge
local _001b  GetRoot()
if not _001b then return nil end
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000b and plr.Character then
local _001c  plr.Character:FindFirstChildOfClass("Humanoid")
local _001d  plr.Character:FindFirstChild("HumanoidRootPart")
if _001c and _001d and _001c.Health > 0 then
local _001e  (_001b.Position - _001d.Position).Magnitude
if _001e < _001a then
_001a = _001e
_0019 = plr
end
end
end
end
return _0019
end
local function GetClosestPlayerToFov(fovRadius)
local _0019  nil
local _001a  math.huge
local _001f  GetScreenCenter()
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000b and plr.Character then
local _0020  plr.Character:FindFirstChild("Head")
local _001d  plr.Character:FindFirstChild("HumanoidRootPart")
local _001c  plr.Character:FindFirstChildOfClass("Humanoid")
if (_0020 or _001d) and _001c and _001c.Health > 0 then
local _0021  _0020 or _001d
local _0022  onScreen = WorldToScreen(_0021.Position)
if onScreen then
local _001e  (_0022 - _001f).Magnitude
if _001e < _001a and _001e <= fovRadius then
_001a = _001e
_0019 = plr
end
end
end
end
end
return _0019
end
local _0023  _000e:Tab({
Title = "战斗",
Icon = "swords",
})
_0023:Section({ Title = "格斗辅助", TextXAlignment = "Left", TextSize = 17 })
_0023:Toggle({
Title = "自动格挡",
Default = false,
Callback = function(val)
_0012.AutoBlock = val
if val then
Notify("战斗", "自动格挡已开启", 3)
local _0024  0
_0013.AutoBlock = _0003.Heartbeat:Connect(function()
if not _0012.AutoBlock then return end
local _001b  GetRoot()
if not _001b then return end
local _0019  GetClosestPlayer(15)
if not _0019 or not _0019.Character then return end
local _0025  _0019.Character:FindFirstChildOfClass("Humanoid")
if not _0025 then return end
local _0026  _0019.Character:FindFirstChild("HumanoidRootPart")
if not _0026 then return end
local _001e  (_001b.Position - _0026.Position).Magnitude
if _001e < 12 then
local _0027  _0019.Character
local _0028  _0025:GetPlayingAnimationTracks()
local _0029  false
for _, track in ipairs(_0028) do
local _002a  string.lower(track.Name)
if string.find(_002a, "punch") or string.find(_002a, "hit")
or string.find(_002a, "attack") or string.find(_002a, "combo")
or string.find(_002a, "kick") or string.find(_002a, "strike") then
if track.IsPlaying then _0029 = true break end
end
end
local _002b  _0027:FindFirstChildOfClass("Tool")
if _002b and _002b:GetAttribute("IsActive") then _0029 = true end
if _0029 and tick() - _0024 > 0.3 then
_0024 = tick()
pcall(function()
_000a:SendKeyEvent(true, Enum.KeyCode.F, false, game)
end)
task.delay(0.15, function()
pcall(function()
_000a:SendKeyEvent(false, Enum.KeyCode.F, false, game)
end)
end)
end
end
end)
else
if _0013.AutoBlock then _0013.AutoBlock:Disconnect() _0013.AutoBlock = nil end
Notify("战斗", "自动格挡已关闭", 3)
end
end,
})
_0023:Toggle({
Title = "自动闪避",
Default = false,
Callback = function(val)
_0012.AutoDodge = val
if val then
Notify("战斗", "自动闪避已开启", 3)
local _002c  0
_0013.AutoDodge = _0003.Heartbeat:Connect(function()
if not _0012.AutoDodge then return end
local _001b  GetRoot()
if not _001b then return end
local _0019  GetClosestPlayer(20)
if not _0019 or not _0019.Character then return end
local _0025  _0019.Character:FindFirstChildOfClass("Humanoid")
if not _0025 then return end
local _0026  _0019.Character:FindFirstChild("HumanoidRootPart")
if not _0026 then return end
local _001e  (_001b.Position - _0026.Position).Magnitude
if _001e < 10 and tick() - _002c > 1 then
local _0028  _0025:GetPlayingAnimationTracks()
local _0029  false
for _, track in ipairs(_0028) do
local _002a  string.lower(track.Name)
if string.find(_002a, "punch") or string.find(_002a, "attack")
or string.find(_002a, "combo") or string.find(_002a, "kick") then
if track.IsPlaying then _0029 = true break end
end
end
if _0029 then
_002c = tick()
local _002d  math.random() > 0.5 and Enum.KeyCode.Q or Enum.KeyCode.E
pcall(function()
_000a:SendKeyEvent(true, _002d, false, game)
end)
task.delay(0.2, function()
pcall(function()
_000a:SendKeyEvent(false, _002d, false, game)
end)
end)
end
end
end)
else
if _0013.AutoDodge then _0013.AutoDodge:Disconnect() _0013.AutoDodge = nil end
Notify("战斗", "自动闪避已关闭", 3)
end
end,
})
_0023:Divider()
_0023:Section({ Title = "攻击", TextXAlignment = "Left", TextSize = 17 })
_0023:Toggle({
Title = "攻击范围扩大",
Default = false,
Callback = function(val)
_0012.ReachExpand = val
if val then
Notify("战斗", "攻击范围扩大已开启", 3)
_0013.Reach = _0003.Heartbeat:Connect(function()
if not _0012.ReachExpand then return end
local _002e  GetChar()
if not _002e then return end
for _, _002b in ipairs(_002e:GetChildren()) do
if _002b:IsA("Tool") then
local _002f  _002b:FindFirstChild("Handle")
if _002f then
_002f.Size = Vector3.new(
math.clamp(_0012.ReachSize, 2, 50),
_002f.Size.Y,
math.clamp(_0012.ReachSize, 2, 50)
)
end
for _, v in ipairs(_002b:GetDescendants()) do
if v:IsA("BasePart") and string.find(string.lower(v.Name), "hit") then
v.Size = Vector3.new(_0012.ReachSize, _0012.ReachSize, _0012.ReachSize)
v.Transparency = 0.5
end
end
end
end
end)
else
if _0013.Reach then _0013.Reach:Disconnect() _0013.Reach = nil end
Notify("战斗", "攻击范围扩大已关闭", 3)
end
end,
})
_0023:Slider({
Title = "攻击范围大小",
Value = { Min = 2, Max = 50, Default = 20 },
Increment = 1,
Callback = function(val) _0012.ReachSize = val end,
})
_0023:Toggle({
Title = "自动连招",
Default = false,
Callback = function(val)
_0012.AutoCombo = val
if val then
Notify("战斗", "自动连招已开启", 3)
local _0030  1
local _0031  0
_0013.AutoCombo = _0003.Heartbeat:Connect(function()
if not _0012.AutoCombo then return end
local _0011  tick()
if _0011 - _0031 < 0.35 then return end
_0031 = _0011
local _0019  GetClosestPlayer(15)
if not _0019 or not _0019.Character then return end
local _002e  GetChar()
if not _002e then return end
_000a:SendMouseButtonEvent(_000d.X, _000d.Y, 0, true, game, 1)
task.wait(0.02)
_000a:SendMouseButtonEvent(_000d.X, _000d.Y, 0, false, game, 1)
_0030 = _0030 + 1
if _0030 > 4 then _0030 = 1 end
end)
else
if _0013.AutoCombo then _0013.AutoCombo:Disconnect() _0013.AutoCombo = nil end
Notify("战斗", "自动连招已关闭", 3)
end
end,
})
_0023:Toggle({
Title = "快速出拳",
Default = false,
Callback = function(val)
_0012.FastPunch = val
if val then
Notify("战斗", "快速出拳已开启", 3)
_0013.FastPunch = _0003.Heartbeat:Connect(function()
if not _0012.FastPunch then return end
local _0032  _0004:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or _0004:IsMouseButtonPressed(Enum.UserInputType.Touch)
if _0032 then
local _002e  GetChar()
if _002e then
local _002b  _002e:FindFirstChildOfClass("Tool")
if _002b then
pcall(function() _002b:Activate() end)
end
pcall(function()
for _, obj in ipairs(_0008:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0033  string.lower(obj.Name)
if string.find(_0033, "punch") or string.find(_0033, "hit") or string.find(_0033, "attack")
or string.find(_0033, "combo") or string.find(_0033, "strike") then
obj:FireServer()
end
end
end
end)
end
end
end)
else
if _0013.FastPunch then _0013.FastPunch:Disconnect() _0013.FastPunch = nil end
Notify("战斗", "快速出拳已关闭", 3)
end
end,
})
_0023:Toggle({
Title = "自动攻击",
Default = false,
Callback = function(val)
_0012.AutoPunch = val
if val then
Notify("战斗", "自动攻击已开启", 3)
local _0034  0
_0013.AutoPunch = _0003.Heartbeat:Connect(function()
if not _0012.AutoPunch then return end
local _0011  tick()
if _0011 - _0034 < math.random(0.25, 0.5) then return end
_0034 = _0011
local _0019  GetClosestPlayer(20)
if not _0019 or not _0019.Character then return end
local _001b  GetRoot()
local _0026  _0019.Character:FindFirstChild("HumanoidRootPart")
if _001b and _0026 then
_001b.CFrame = CFrame.lookAt(_001b.Position, Vector3.new(_0026.Position.X, _001b.Position.Y, _0026.Position.Z))
end
_000a:SendMouseButtonEvent(_000d.X, _000d.Y, 0, true, game, 1)
task.wait(0.02)
_000a:SendMouseButtonEvent(_000d.X, _000d.Y, 0, false, game, 1)
pcall(function()
for _, obj in ipairs(_0008:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0033  string.lower(obj.Name)
if string.find(_0033, "punch") or string.find(_0033, "hit") or string.find(_0033, "attack")
or string.find(_0033, "combo") or string.find(_0033, "fight") or string.find(_0033, "strike") then
obj:FireServer()
end
end
end
end)
end)
else
if _0013.AutoPunch then _0013.AutoPunch:Disconnect() _0013.AutoPunch = nil end
Notify("战斗", "自动攻击已关闭", 3)
end
end,
})
_0023:Divider()
_0023:Section({ Title = "属性", TextXAlignment = "Left", TextSize = 17 })
_0023:Toggle({
Title = "无限体力",
Default = false,
Callback = function(val)
_0012.InfStamina = val
if val then
Notify("战斗", "无限体力已开启", 3)
_0013.InfStamina = _0003.Heartbeat:Connect(function()
if not _0012.InfStamina then return end
local _002e  GetChar()
if not _002e then return end
for _, v in ipairs(_002e:GetDescendants()) do
if v:IsA("NumberValue") or v:IsA("IntValue") then
local _0033  string.lower(v.Name)
if string.find(_0033, "stamina") or string.find(_0033, "energy") or string.find(_0033, "charge") then
v.Value = math.huge
end
end
end
pcall(function()
local _0035  _000b:FindFirstChild("leaderstats")
if _0035 then
for _, v in ipairs(_0035:GetDescendants()) do
if v:IsA("NumberValue") or v:IsA("IntValue") then
local _0033  string.lower(v.Name)
if string.find(_0033, "stamina") or string.find(_0033, "energy") then
v.Value = math.huge
end
end
end
end
end)
end)
else
if _0013.InfStamina then _0013.InfStamina:Disconnect() _0013.InfStamina = nil end
Notify("战斗", "无限体力已关闭", 3)
end
end,
})
_0023:Toggle({
Title = "免疫眩晕",
Default = false,
Callback = function(val)
_0012.NoStun = val
if val then
Notify("战斗", "免疫眩晕已开启", 3)
_0013.NoStun = _0003.Heartbeat:Connect(function()
if not _0012.NoStun then return end
local _002e  GetChar()
if not _002e then return end
local _001c  _002e:FindFirstChildOfClass("Humanoid")
if _001c then
local _0036  _002e:FindFirstChild("Stun") or _002e:FindFirstChild("Stunned")
if _0036 then _0036:Destroy() end
for _, track in ipairs(_001c:GetPlayingAnimationTracks()) do
local _002a  string.lower(track.Name)
if string.find(_002a, "_0036") or string.find(_002a, "dizzy")
or string.find(_002a, "hit") or string.find(_002a, "knockback") then
track:Stop()
end
end
if _001c.PlatformStand then _001c.PlatformStand = false end
local _001b  _002e:FindFirstChild("HumanoidRootPart")
if _001b and _001b:FindFirstChild("Stun") then _001b.Stun:Destroy() end
end
local _001b  _002e and _002e:FindFirstChild("HumanoidRootPart")
if _001b then
local _0037  _001b:FindFirstChildWhichIsA("BodyVelocity")
local _0038  _001b:FindFirstChildWhichIsA("BodyGyro")
local _0039  _001b:FindFirstChildWhichIsA("AngularVelocity")
if _0037 and _0037.Name == "StunVelocity" then _0037:Destroy() end
end
end)
else
if _0013.NoStun then _0013.NoStun:Disconnect() _0013.NoStun = nil end
Notify("战斗", "免疫眩晕已关闭", 3)
end
end,
})
_0023:Toggle({
Title = "技能无冷却",
Default = false,
Callback = function(val)
_0012.NoCooldown = val
if val then
Notify("战斗", "技能无冷却已开启", 3)
_0013.NoCD = _0003.Heartbeat:Connect(function()
if not _0012.NoCooldown then return end
local _002e  GetChar()
if not _002e then return end
for _, v in ipairs(_002e:GetDescendants()) do
if v:IsA("NumberValue") or v:IsA("IntValue") or v:IsA("BoolValue") then
local _0033  string.lower(v.Name)
if string.find(_0033, "cooldown") or string.find(_0033, "cd") or string.find(_0033, "charge")
or string.find(_0033, "timer") or string.find(_0033, "delay") then
if v:IsA("BoolValue") then v.Value = true
else v.Value = 0 end
end
end
end
pcall(function()
for _, v in ipairs(_002e:GetAttributes()) do
end
end)
end)
else
if _0013.NoCD then _0013.NoCD:Disconnect() _0013.NoCD = nil end
Notify("战斗", "技能无冷却已关闭", 3)
end
end,
})
local _003a  _000e:Tab({
Title = "玩家",
Icon = "user",
})
_003a:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_003a:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
_0012.WalkSpeed = val
local _003b  GetHum()
if _003b then _003b.WalkSpeed = val end
end,
})
_003a:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(val)
_0012.JumpPower = val
local _003b  GetHum()
if _003b then
if _003b.UseJumpPower then _003b.JumpPower = val
else _003b.JumpHeight = val / 10 end
end
end,
})
_003a:Divider()
_003a:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
_0012.InfJump = val
if val then
_0013.InfJump = _0004.JumpRequest:Connect(function()
local _003b  GetHum()
if _003b then _003b:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _0013.InfJump then _0013.InfJump:Disconnect() _0013.InfJump = nil end
end
end,
})
_003a:Toggle({
Title = "穿墙",
Default = false,
Callback = function(val)
_0012.Noclip = val
if val then
_0013.NoClip = _0003.Stepped:Connect(function()
if not _0012.Noclip then return end
local _0016  GetChar()
if _0016 then
for _, p in ipairs(_0016:GetDescendants()) do
if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
end
end
end)
else
if _0013.NoClip then _0013.NoClip:Disconnect() _0013.NoClip = nil end
end
end,
})
_003a:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
_0012.GodMode = val
if val then
Notify("玩家", "无敌已开启", 3)
_0013.GodMode = _0003.Heartbeat:Connect(function()
local _003b  GetHum()
if _003b and _003b.Health < _003b.MaxHealth then _003b.Health = _003b.MaxHealth end
end)
else
if _0013.GodMode then _0013.GodMode:Disconnect() _0013.GodMode = nil end
Notify("玩家", "无敌已关闭", 3)
end
end,
})
_003a:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
_0012.NoFallDamage = val
if val then
Notify("玩家", "摔落无伤害已开启", 3)
local function setupFall(_003b)
if not _003b then return end
local _003c  _003b.Health
_003b.StateChanged:Connect(function(old, new)
if not _0012.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_003c = _003b.Health
elseif old == Enum.HumanoidStateType.Freefall then
if _003b.Health < _003c then _003b.Health = _003c end
end
end)
end
local _0016  GetChar()
if _0016 then setupFall(_0016:FindFirstChildOfClass("Humanoid")) end
_0013.NoFall = _000b.CharacterAdded:Connect(function(_002e)
task.wait(0.3)
if _0012.NoFallDamage then setupFall(_002e:FindFirstChildOfClass("Humanoid")) end
end)
else
if _0013.NoFall then _0013.NoFall:Disconnect() _0013.NoFall = nil end
Notify("玩家", "摔落无伤害已关闭", 3)
end
end,
})
_003a:Divider()
local _003d  false
_003a:Button({
Title = "飞行 (手机版)",
Callback = function()
if _003d then
Notify("飞行", "飞行面板已打开", 3)
return
end
_003d = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
end,
})
local _003e  _000e:Tab({
Title = "视觉",
Icon = "eye",
})
_003e:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })
local function createESP(player)
if player == _000b then return end
if _0014[player] then return end
local _003f  Instance.new("BillboardGui")
_003f.Name = "BG_ESP_" .. player.Name
_003f.Size = UDim2.new(0, 200, 0, 60)
_003f.StudsOffset = Vector3.new(0, 3, 0)
_003f.AlwaysOnTop = true
local _0040  Instance.new("TextLabel")
_0040.Size = UDim2.new(1, 0, 0, 20)
_0040.BackgroundTransparency = 1
_0040.TextColor3 = Color3.fromRGB(255, 180, 0)
_0040.TextSize = 14
_0040.Font = Enum.Font.SourceSansBold
_0040.TextStrokeTransparency = 0.5
_0040.Text = player.Name
_0040.Parent = _003f
local _0041  Instance.new("TextLabel")
_0041.Size = UDim2.new(1, 0, 0, 18)
_0041.Position = UDim2.new(0, 0, 0, 22)
_0041.BackgroundTransparency = 1
_0041.TextColor3 = Color3.fromRGB(200, 200, 200)
_0041.TextSize = 12
_0041.Text = ""
_0041.Parent = _003f
local _0042  Instance.new("TextLabel")
_0042.Size = UDim2.new(1, 0, 0, 18)
_0042.Position = UDim2.new(0, 0, 0, 42)
_0042.BackgroundTransparency = 1
_0042.TextColor3 = Color3.fromRGB(0, 255, 100)
_0042.TextSize = 12
_0042.Text = ""
_0042.Parent = _003f
_0014[player] = { _003f = _003f, _0040 = _0040, _0041 = _0041, _0042 = _0042 }
end
local function removeESP(player)
if _0014[player] then
if _0014[player]._003f then _0014[player]._003f:Destroy() end
_0014[player] = nil
end
end
_003e:Toggle({
Title = "人物透视",
Default = false,
Callback = function(val)
_0012.ESPEnabled = val
if val then
Notify("视觉", "透视已开启", 3)
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000b then createESP(plr) end
end
_0013.ESP = _0003.Heartbeat:Connect(function()
for plr, data in pairs(_0014) do
local _002e  plr.Character
if _002e then
local _0020  _002e:FindFirstChild("Head")
local _001d  _002e:FindFirstChild("HumanoidRootPart")
local _001c  _002e:FindFirstChildOfClass("Humanoid")
if _0020 or _001d then
data._003f.Adornee = _0020 or _001d
data._0040.Visible = _0012.ESPNames
data._0041.Visible = _0012.ESPDistance
data._0042.Visible = _0012.ESPHealth
if _0012.ESPDistance then
local _001b  GetRoot()
if _001b and _001d then
data._0041.Text = math.floor((_001b.Position - _001d.Position).Magnitude) .. " 米"
end
end
if _0012.ESPHealth and _001c then
local _0043  math.floor(_001c.Health)
local _0044  math.floor(_001c.MaxHealth)
data._0042.Text = "HP: " .. _0043 .. "/" .. _0044
if _001c.Health < _001c.MaxHealth * 0.3 then
data._0042.TextColor3 = Color3.fromRGB(255, 50, 50)
elseif _001c.Health < _001c.MaxHealth * 0.6 then
data._0042.TextColor3 = Color3.fromRGB(255, 200, 0)
else
data._0042.TextColor3 = Color3.fromRGB(0, 255, 100)
end
end
end
end
end
end)
_0013.PAdd = _0002.PlayerAdded:Connect(function(p) createESP(p) end)
_0013.PRem = _0002.PlayerRemoving:Connect(function(p) removeESP(p) end)
else
if _0013.ESP then _0013.ESP:Disconnect() _0013.ESP = nil end
if _0013.PAdd then _0013.PAdd:Disconnect() _0013.PAdd = nil end
if _0013.PRem then _0013.PRem:Disconnect() _0013.PRem = nil end
for p, _ in pairs(_0014) do removeESP(p) end
_0014 = {}
Notify("视觉", "透视已关闭", 3)
end
end,
})
_003e:Toggle({
Title = "显示名字",
Default = true,
Callback = function(val) _0012.ESPNames = val end,
})
_003e:Toggle({
Title = "显示距离",
Default = true,
Callback = function(val) _0012.ESPDistance = val end,
})
_003e:Toggle({
Title = "显示血量",
Default = true,
Callback = function(val) _0012.ESPHealth = val end,
})
_003e:Toggle({
Title = "追踪线",
Default = false,
Callback = function(val)
_0012.Tracers = val
if val then
Notify("视觉", "追踪线已开启", 3)
_0013.Tracers = _0003.RenderStepped:Connect(function()
if not _0012.Tracers then return end
for _, obj in ipairs(_0005:GetChildren()) do
if obj.Name == "BG_Tracer" then obj:Destroy() end
end
local _001b  GetRoot()
if not _001b then return end
local _001f  GetScreenCenter()
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000b and plr.Character then
local _001d  plr.Character:FindFirstChild("HumanoidRootPart")
local _001c  plr.Character:FindFirstChildOfClass("Humanoid")
if _001d and _001c and _001c.Health > 0 then
local _0018  onScreen = WorldToScreen(_001d.Position)
if onScreen then
local _0045  Instance.new("Frame")
_0045.Name = "BG_Tracer"
_0045.AnchorPoint = Vector2.new(0.5, 0.5)
_0045.Parent = _0005:FindFirstChildWhichIsA("ScreenGui") or (function()
local _0046  Instance.new("ScreenGui", game.CoreGui)
_0046.Name = "BG_Tracers"
return _0046
end)()
local _0046  game.CoreGui:FindFirstChild("BG_Tracers") or game.CoreGui:GetChildren()[1]
_0045.Parent = _0046
_0045.Size = UDim2.new(0, 2, 0, (_0018 - _001f).Magnitude)
_0045.Position = UDim2.new(0, _001f.X + (_0018.X - _001f.X) / 2, 0, _001f.Y + (_0018.Y - _001f.Y) / 2)
_0045.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
_0045.BorderSizePixel = 0
local _0047  math.deg(math.atan2(_0018.Y - _001f.Y, _0018.X - _001f.X)) - 90
_0045.Rotation = _0047
end
end
end
end
end)
else
if _0013.Tracers then _0013.Tracers:Disconnect() _0013.Tracers = nil end
local _0046  game.CoreGui:FindFirstChild("BG_Tracers")
if _0046 then _0046:Destroy() end
Notify("视觉", "追踪线已关闭", 3)
end
end,
})
_003e:Toggle({
Title = "透视高亮",
Default = false,
Callback = function(val)
_0012.Chams = val
if val then
Notify("视觉", "透视高亮已开启", 3)
_0013.Chams = _0003.Heartbeat:Connect(function()
if not _0012.Chams then return end
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000b and plr.Character then
for _, _004c in ipairs(plr.Character:GetChildren()) do
if _004c:IsA("BasePart") and _004c.Name ~= "HumanoidRootPart" then
if not _004c:FindFirstChild("BG_Cham") then
local _0048  Instance.new("Highlight")
_0048.Name = "BG_Cham"
_0048.FillColor = Color3.fromRGB(255, 180, 0)
_0048.FillTransparency = 0.4
_0048.OutlineColor = Color3.fromRGB(255, 255, 255)
_0048.Adornee = _004c
_0048.Parent = _004c
end
end
end
end
end
end)
else
if _0013.Chams then _0013.Chams:Disconnect() _0013.Chams = nil end
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000b and plr.Character then
for _, _004c in ipairs(plr.Character:GetChildren()) do
if _004c:IsA("BasePart") and _004c:FindFirstChild("BG_Cham") then
_004c.BG_Cham:Destroy()
end
end
end
end
Notify("视觉", "透视高亮已关闭", 3)
end
end,
})
_003e:Toggle({
Title = "全图高亮",
Default = false,
Callback = function(val)
_0012.Fullbright = val
if val then
_0006.Brightness = 3
_0006.ClockTime = 14
_0006.FogEnd = 100000
_0006.GlobalShadows = false
_0013.FB = _0003.Heartbeat:Connect(function()
_0006.Brightness = 3
_0006.ClockTime = 14
_0006.FogEnd = 100000
_0006.GlobalShadows = false
end)
else
if _0013.FB then _0013.FB:Disconnect() _0013.FB = nil end
_0006.Brightness = 1
_0006.ClockTime = 12
_0006.GlobalShadows = true
Notify("视觉", "全图高亮已关闭", 3)
end
end,
})
local _0049  _000e:Tab({
Title = "传送",
Icon = "map-pin",
})
_0049:Section({ Title = "快速地点", TextXAlignment = "Left", TextSize = 17 })
local _004a  {
{ name = "主战场", keywords = {"arena", "battle", "fight", "map"} },
{ name = "训练区", keywords = {"train", "practice", "dummy", "sparring"} },
{ name = "商店", keywords = {"shop", "store", "market"} },
{ name = "武器店", keywords = {"weapon", "sword", "blade"} },
{ name = "技能店", keywords = {"skill", "ability", "power"} },
{ name = "重生区", keywords = {"spawn", "lobby", "start", "reset"} },
{ name = "商店NPC", keywords = {"npc", "merchant", "dealer"} },
{ name = "竞技场入口", keywords = {"entrance", "gate", "door"} },
{ name = "Boss区", keywords = {"boss", "raid"} },
}
for _, loc in ipairs(_004a) do
_0049:Button({
Title = "传送到" .. loc.name,
Callback = function()
local _004b  false
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _0033  string.lower(obj.Name)
for _, kw in ipairs(loc.keywords) do
if string.find(_0033, kw) then
local _004c  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _004c then
local _001b  GetRoot()
if _001b then
_001b.CFrame = _004c.CFrame * CFrame.new(0, 5, 0)
Notify("传送", "已传送到" .. loc.name, 3)
_004b = true
end
break
end
end
end
if _004b then break end
end
end
if not _004b then Notify("传送", "未找到" .. loc.name, 3) end
end,
})
end
_0049:Divider()
_0049:Button({
Title = "传送到最近玩家",
Callback = function()
local _0019  GetClosestPlayer(9999)
if _0019 and _0019.Character then
local _001b  GetRoot()
local _004d  _0019.Character:FindFirstChild("HumanoidRootPart")
if _001b and _004d then
_001b.CFrame = _004d.CFrame * CFrame.new(0, 0, -3)
Notify("传送", "已传送到 " .. _0019.Name, 3)
end
else
Notify("传送", "未找到玩家", 3)
end
end,
})
_0049:Button({
Title = "传送到所有人中心",
Callback = function()
local _001b  GetRoot()
if not _001b then return end
local _004e  Vector3.new(0, 0, 0)
local _004f  0
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000b and plr.Character then
local _001d  plr.Character:FindFirstChild("HumanoidRootPart")
if _001d then
_004e = _004e + _001d.Position
_004f = _004f + 1
end
end
end
if _004f > 0 then
local _001f  _004e / _004f
_001b.CFrame = CFrame.new(_001f + Vector3.new(0, 5, 0))
Notify("传送", "已传送到所有人中心", 3)
else
Notify("传送", "未找到其他玩家", 3)
end
end,
})
_0049:Divider()
local _0050  nil
_0049:Toggle({
Title = "长按传送",
Default = false,
Callback = function(val)
if val then
Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
_0013.TpBegin = _0004.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_0050 = tick()
end
end)
_0013.TpHold = _0003.Heartbeat:Connect(function()
if not _0050 then return end
if tick() - _0050 >= 0.5 then
local _001b  GetRoot()
if _001b then _001b.CFrame = _000d.Hit end
_0050 = nil
end
end)
_0013.TpEnd = _0004.InputEnded:Connect(function() _0050 = nil end)
else
if _0013.TpBegin then _0013.TpBegin:Disconnect() _0013.TpBegin = nil end
if _0013.TpHold then _0013.TpHold:Disconnect() _0013.TpHold = nil end
if _0013.TpEnd then _0013.TpEnd:Disconnect() _0013.TpEnd = nil end
Notify("传送", "长按传送已关闭", 3)
end
end,
})
local _0051  _000e:Tab({
Title = "实用",
Icon = "settings",
})
_0051:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })
_0051:Toggle({
Title = "防挂机",
Default = false,
Callback = function(val)
_0012.AntiAFK = val
if val then
_0013.AntiAFK = _000b.Idled:Connect(function()
_000a:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
_000a:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
Notify("实用", "防挂机已开启", 3)
else
if _0013.AntiAFK then _0013.AntiAFK:Disconnect() _0013.AntiAFK = nil end
Notify("实用", "防挂机已关闭", 3)
end
end,
})
_0051:Toggle({
Title = "画质提速",
Default = false,
Callback = function(val)
_0012.FPSBoost = val
if val then
settings().Rendering.QualityLevel = 1
_0006.GlobalShadows = false
_0006.FogEnd = 9e9
_0013.FPS = _0003.Heartbeat:Connect(function()
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false end)
end
end
end)
Notify("实用", "画质提速已开启", 3)
else
if _0013.FPS then _0013.FPS:Disconnect() _0013.FPS = nil end
settings().Rendering.QualityLevel = Enum.RenderingQuality.Automatic
_0006.FogEnd = 100000
Notify("实用", "画质提速已关闭", 3)
end
end,
})
_0051:Divider()
_0051:Button({
Title = "换服",
Callback = function()
Notify("实用", "正在跳转服务器...", 3)
_0009:Teleport(game.PlaceId, _000b)
end,
})
_0051:Button({
Title = "复制服务器号",
Callback = function()
local _0052  game.JobId
if setclipboard then
setclipboard(_0052)
Notify("实用", "已复制: " .. _0052, 3)
else
Notify("实用", "JobId: " .. _0052, 5)
end
end,
})
_0051:Button({
Title = "输出角色信息",
Callback = function()
local _002e  GetChar()
if not _002e then Notify("实用", "无角色", 3) return end
local _0053  {}
local _003b  GetHum()
if _003b then
table.insert(_0053, "血量: " .. math.floor(_003b.Health) .. "/" .. math.floor(_003b.MaxHealth))
table.insert(_0053, "速度: " .. _003b.WalkSpeed)
end
local _001b  GetRoot()
if _001b then table.insert(_0053, "位置: " .. tostring(_001b.Position)) end
local _0035  _000b:FindFirstChild("leaderstats")
if _0035 then
for _, v in ipairs(_0035:GetChildren()) do
table.insert(_0053, v.Name .. ": " .. tostring(v.Value))
end
end
Notify("角色信息", table.concat(_0053, "\n"), 10)
end,
})
_0051:Divider()
_0051:Button({
Title = "清理特效",
Callback = function()
local _004f  0
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false; _004f = _004f + 1 end)
end
end
Notify("实用", "已清理 " .. _004f .. " 个特效", 3)
end,
})
_0051:Button({
Title = "卸载脚本",
Callback = function()
for _, conn in pairs(_0013) do
if conn then pcall(function() conn:Disconnect() end) end
end
_0013 = {}
for p, _ in pairs(_0014) do removeESP(p) end
_0014 = {}
local _0046  game.CoreGui:FindFirstChild("BG_Tracers")
if _0046 then _0046:Destroy() end
Notify("实用", "脚本已卸载", 3)
end,
})
Notify("最强战场", "脚本已加载!", 5)
_000b.CharacterAdded:Connect(function(_002e)
task.wait(0.5)
local _003b  _002e:FindFirstChildOfClass("Humanoid")
if _003b then
if _0012.WalkSpeed ~= 16 then _003b.WalkSpeed = _0012.WalkSpeed end
if _0012.JumpPower ~= 50 then
if _003b.UseJumpPower then _003b.JumpPower = _0012.JumpPower
else _003b.JumpHeight = _0012.JumpPower / 10 end
end
end
end)