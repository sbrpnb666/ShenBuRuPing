local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local Window = WindUI:CreateWindow({
Title = "最强战场",
Icon = "swords",
Author = "最强战场脚本",
Folder = "StrongestBattlegrounds",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
HideSearchBar = false,
})
local TimeTag = Window:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 180, 0)
})
local hue = 0
task.spawn(function()
while true do
local now = os.date("*t")
hue = (hue + 0.01) % 1
TimeTag:SetTitle(string.format("%02d:%02d", now.hour, now.min))
TimeTag:SetColor(Color3.fromHSV(hue, 1, 1))
task.wait(0.06)
end
end)
Window:Tag({ Title = "最强战场", Color = Color3.fromHex("#FFB400") })
Window:EditOpenButton({
Title = "最强战场",
Icon = "swords",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FFB400")),
Draggable = true,
})
local State = {
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
local Connections = {}
local ESPObjects = {}
local _PRRNQxOgjdIFxrMY = {}
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
local function _S1RzTTOMR3yDSv()
local vp = Camera.ViewportSize
return Vector2.new(vp.X / 2, vp.Y / 2)
end
local function _kal05nd3I3u2(pos)
local sp, onScreen = Camera:WorldToViewportPoint(pos)
return Vector2.new(sp.X, sp.Y), onScreen
end
local function _2KQTfTjFqNuaZD(maxDist)
local closest = nil
local _t9I1SvyEoNmrcx = maxDist or math.huge
local root = GetRoot()
local _ZusaezJd = 342
if not root then return nil end
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
if hum and hrp and hum.Health > 0 then
local dist = (root.Position - hrp.Position).Magnitude
if dist < _t9I1SvyEoNmrcx then
_t9I1SvyEoNmrcx = dist
closest = plr
end
end
end
end
return closest
end
local function _VdiW1d9DAl(fovRadius)
local closest = nil
local _t9I1SvyEoNmrcx = math.huge
local center = _S1RzTTOMR3yDSv()
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local head = plr.Character:FindFirstChild("Head")
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
if (head or hrp) and hum and hum.Health > 0 then
local _P1Ks28N3atjQ = head or hrp
local _ZRYpztLHAY16wK9, onScreen = _kal05nd3I3u2(_P1Ks28N3atjQ.Position)
if onScreen then
local dist = (_ZRYpztLHAY16wK9 - center).Magnitude
if dist < _t9I1SvyEoNmrcx and dist <= fovRadius then
_t9I1SvyEoNmrcx = dist
closest = plr
end
end
end
end
end
return closest
end
local _FtQGPhPz66 = Window:Tab({
Title = "战斗",
Icon = "swords",
})
_FtQGPhPz66:Section({ Title = "格斗辅助", TextXAlignment = "Left", TextSize = 17 })
_FtQGPhPz66:Toggle({
Title = "自动格挡",
Default = false,
Callback = function(val)
State.AutoBlock = val
if val then
Notify("战斗", "自动格挡已开启", 3)
local _E5Wn0Ngp2sJzdR = 0
Connections.AutoBlock = RunService.Heartbeat:Connect(function()
if not State.AutoBlock then return end
local root = GetRoot()
if not root then return end
local closest = _2KQTfTjFqNuaZD(15)
if not closest or not closest.Character then return end
local _KK7uMXufhYm3cS = closest.Character:FindFirstChildOfClass("Humanoid")
if not _KK7uMXufhYm3cS then return end
local _NftoMytPjk315 = closest.Character:FindFirstChild("HumanoidRootPart")
if not _NftoMytPjk315 then return end
local dist = (root.Position - _NftoMytPjk315.Position).Magnitude
if dist < 12 then
local _bFhSbjkJ9LLDEUr4 = closest.Character
local _tRGXuCFkKbGp = _KK7uMXufhYm3cS:GetPlayingAnimationTracks()
local _m3TXkyhUlSgZJq = false
for _, track in ipairs(_tRGXuCFkKbGp) do
local _nlXekma1CTfwECVs = string.lower(track.Name)
if string.find(_nlXekma1CTfwECVs, "punch") or string.find(_nlXekma1CTfwECVs, "hit")
or string.find(_nlXekma1CTfwECVs, "attack") or string.find(_nlXekma1CTfwECVs, "combo")
or string.find(_nlXekma1CTfwECVs, "kick") or string.find(_nlXekma1CTfwECVs, "strike") then
if track.IsPlaying then _m3TXkyhUlSgZJq = true break end
end
end
local tool = _bFhSbjkJ9LLDEUr4:FindFirstChildOfClass("Tool")
if tool and tool:GetAttribute("IsActive") then _m3TXkyhUlSgZJq = true end
if _m3TXkyhUlSgZJq and tick() - _E5Wn0Ngp2sJzdR > 0.3 then
_E5Wn0Ngp2sJzdR = tick()
pcall(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
end)
task.delay(0.15, function()
pcall(function()
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
end)
end)
end
end
end)
else
if Connections.AutoBlock then Connections.AutoBlock:Disconnect() Connections.AutoBlock = nil end
Notify("战斗", "自动格挡已关闭", 3)
end
end,
})
_FtQGPhPz66:Toggle({
Title = "自动闪避",
Default = false,
Callback = function(val)
State.AutoDodge = val
if val then
Notify("战斗", "自动闪避已开启", 3)
local _1ZKdImvP8sc0U = 0
Connections.AutoDodge = RunService.Heartbeat:Connect(function()
if not State.AutoDodge then return end
local root = GetRoot()
if not root then return end
local closest = _2KQTfTjFqNuaZD(20)
if not closest or not closest.Character then return end
local _KK7uMXufhYm3cS = closest.Character:FindFirstChildOfClass("Humanoid")
if not _KK7uMXufhYm3cS then return end
local _NftoMytPjk315 = closest.Character:FindFirstChild("HumanoidRootPart")
if not _NftoMytPjk315 then return end
local dist = (root.Position - _NftoMytPjk315.Position).Magnitude
if dist < 10 and tick() - _1ZKdImvP8sc0U > 1 then
local _tRGXuCFkKbGp = _KK7uMXufhYm3cS:GetPlayingAnimationTracks()
local _m3TXkyhUlSgZJq = false
for _, track in ipairs(_tRGXuCFkKbGp) do
local _nlXekma1CTfwECVs = string.lower(track.Name)
if string.find(_nlXekma1CTfwECVs, "punch") or string.find(_nlXekma1CTfwECVs, "attack")
or string.find(_nlXekma1CTfwECVs, "combo") or string.find(_nlXekma1CTfwECVs, "kick") then
if track.IsPlaying then _m3TXkyhUlSgZJq = true break end
end
end
if _m3TXkyhUlSgZJq then
_1ZKdImvP8sc0U = tick()
local _TITIvqJKPcPG = math.random() > 0.5 and Enum.KeyCode.Q or Enum.KeyCode.E
pcall(function()
VirtualInputManager:SendKeyEvent(true, _TITIvqJKPcPG, false, game)
end)
task.delay(0.2, function()
pcall(function()
VirtualInputManager:SendKeyEvent(false, _TITIvqJKPcPG, false, game)
end)
end)
end
end
end)
else
if Connections.AutoDodge then Connections.AutoDodge:Disconnect() Connections.AutoDodge = nil end
Notify("战斗", "自动闪避已关闭", 3)
end
end,
})
_FtQGPhPz66:Divider()
_FtQGPhPz66:Section({ Title = "攻击", TextXAlignment = "Left", TextSize = 17 })
_FtQGPhPz66:Toggle({
Title = "攻击范围扩大",
Default = false,
Callback = function(val)
State.ReachExpand = val
if val then
Notify("战斗", "攻击范围扩大已开启", 3)
Connections.Reach = RunService.Heartbeat:Connect(function()
if not State.ReachExpand then return end
local char = GetChar()
if not char then return end
for _, tool in ipairs(char:GetChildren()) do
if tool:IsA("Tool") then
local handle = tool:FindFirstChild("Handle")
if handle then
handle.Size = Vector3.new(
math.clamp(State.ReachSize, 2, 50),
handle.Size.Y,
math.clamp(State.ReachSize, 2, 50)
)
end
for _, v in ipairs(tool:GetDescendants()) do
if v:IsA("BasePart") and string.find(string.lower(v.Name), "hit") then
v.Size = Vector3.new(State.ReachSize, State.ReachSize, State.ReachSize)
v.Transparency = 0.5
end
end
end
end
end)
else
if Connections.Reach then Connections.Reach:Disconnect() Connections.Reach = nil end
Notify("战斗", "攻击范围扩大已关闭", 3)
end
end,
})
_FtQGPhPz66:Slider({
Title = "攻击范围大小",
Value = { Min = 2, Max = 50, Default = 20 },
Increment = 1,
Callback = function(val) State.ReachSize = val end,
})
_FtQGPhPz66:Toggle({
Title = "自动连招",
Default = false,
Callback = function(val)
State.AutoCombo = val
if val then
Notify("战斗", "自动连招已开启", 3)
local _qO01sMiMYTPt = 1
local _e3VXoiyC5ad7 = 0
Connections.AutoCombo = RunService.Heartbeat:Connect(function()
if not State.AutoCombo then return end
local now = tick()
if now - _e3VXoiyC5ad7 < 0.35 then return end
_e3VXoiyC5ad7 = now
local closest = _2KQTfTjFqNuaZD(15)
if not closest or not closest.Character then return end
local char = GetChar()
if not char then return end
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
task.wait(0.02)
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
_qO01sMiMYTPt = _qO01sMiMYTPt + 1
if _qO01sMiMYTPt > 4 then _qO01sMiMYTPt = 1 end
end)
else
if Connections.AutoCombo then Connections.AutoCombo:Disconnect() Connections.AutoCombo = nil end
Notify("战斗", "自动连招已关闭", 3)
end
end,
})
_FtQGPhPz66:Toggle({
Title = "快速出拳",
Default = false,
Callback = function(val)
State.FastPunch = val
if val then
Notify("战斗", "快速出拳已开启", 3)
Connections.FastPunch = RunService.Heartbeat:Connect(function()
if not State.FastPunch then return end
local _sXKt5obbYMMO5 = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or UserInputService:IsMouseButtonPressed(Enum.UserInputType.Touch)
if _sXKt5obbYMMO5 then
local char = GetChar()
if char then
local tool = char:FindFirstChildOfClass("Tool")
if tool then
pcall(function() tool:Activate() end)
end
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "punch") or string.find(ln, "hit") or string.find(ln, "attack")
or string.find(ln, "combo") or string.find(ln, "strike") then
obj:FireServer()
end
end
end
end)
end
end
end)
else
if Connections.FastPunch then Connections.FastPunch:Disconnect() Connections.FastPunch = nil end
Notify("战斗", "快速出拳已关闭", 3)
end
end,
})
_FtQGPhPz66:Toggle({
Title = "自动攻击",
Default = false,
Callback = function(val)
State.AutoPunch = val
if val then
Notify("战斗", "自动攻击已开启", 3)
local _zIetpotgwNq = 0
Connections.AutoPunch = RunService.Heartbeat:Connect(function()
if not State.AutoPunch then return end
local now = tick()
if now - _zIetpotgwNq < math.random(0.25, 0.5) then return end
_zIetpotgwNq = now
local closest = _2KQTfTjFqNuaZD(20)
if not closest or not closest.Character then return end
local root = GetRoot()
local _NftoMytPjk315 = closest.Character:FindFirstChild("HumanoidRootPart")
if root and _NftoMytPjk315 then
root.CFrame = CFrame.lookAt(root.Position, Vector3.new(_NftoMytPjk315.Position.X, root.Position.Y, _NftoMytPjk315.Position.Z))
end
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
task.wait(0.02)
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "punch") or string.find(ln, "hit") or string.find(ln, "attack")
or string.find(ln, "combo") or string.find(ln, "fight") or string.find(ln, "strike") then
obj:FireServer()
end
end
end
end)
end)
else
if Connections.AutoPunch then Connections.AutoPunch:Disconnect() Connections.AutoPunch = nil end
Notify("战斗", "自动攻击已关闭", 3)
end
end,
})
_FtQGPhPz66:Divider()
_FtQGPhPz66:Section({ Title = "属性", TextXAlignment = "Left", TextSize = 17 })
_FtQGPhPz66:Toggle({
Title = "无限体力",
Default = false,
Callback = function(val)
State.InfStamina = val
if val then
Notify("战斗", "无限体力已开启", 3)
Connections.InfStamina = RunService.Heartbeat:Connect(function()
if not State.InfStamina then return end
local char = GetChar()
if not char then return end
for _, v in ipairs(char:GetDescendants()) do
if v:IsA("NumberValue") or v:IsA("IntValue") then
local ln = string.lower(v.Name)
if string.find(ln, "stamina") or string.find(ln, "energy") or string.find(ln, "charge") then
v.Value = math.huge
end
end
end
pcall(function()
local ls = LocalPlayer:FindFirstChild("leaderstats")
if ls then
for _, v in ipairs(ls:GetDescendants()) do
if v:IsA("NumberValue") or v:IsA("IntValue") then
local ln = string.lower(v.Name)
if string.find(ln, "stamina") or string.find(ln, "energy") then
v.Value = math.huge
end
end
end
end
end)
end)
else
if Connections.InfStamina then Connections.InfStamina:Disconnect() Connections.InfStamina = nil end
Notify("战斗", "无限体力已关闭", 3)
end
end,
})
_FtQGPhPz66:Toggle({
Title = "免疫眩晕",
Default = false,
Callback = function(val)
State.NoStun = val
if val then
Notify("战斗", "免疫眩晕已开启", 3)
Connections.NoStun = RunService.Heartbeat:Connect(function()
if not State.NoStun then return end
local char = GetChar()
if not char then return end
local hum = char:FindFirstChildOfClass("Humanoid")
if hum then
local stun = char:FindFirstChild("Stun") or char:FindFirstChild("Stunned")
if stun then stun:Destroy() end
for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
local _nlXekma1CTfwECVs = string.lower(track.Name)
if string.find(_nlXekma1CTfwECVs, "stun") or string.find(_nlXekma1CTfwECVs, "dizzy")
or string.find(_nlXekma1CTfwECVs, "hit") or string.find(_nlXekma1CTfwECVs, "knockback") then
track:Stop()
end
end
if hum.PlatformStand then hum.PlatformStand = false end
local root = char:FindFirstChild("HumanoidRootPart")
if root and root:FindFirstChild("Stun") then root.Stun:Destroy() end
end
local root = char and char:FindFirstChild("HumanoidRootPart")
if root then
local bv = root:FindFirstChildWhichIsA("BodyVelocity")
local bg = root:FindFirstChildWhichIsA("BodyGyro")
local at = root:FindFirstChildWhichIsA("AngularVelocity")
if bv and bv.Name == "StunVelocity" then bv:Destroy() end
end
end)
else
if Connections.NoStun then Connections.NoStun:Disconnect() Connections.NoStun = nil end
Notify("战斗", "免疫眩晕已关闭", 3)
end
end,
})
_FtQGPhPz66:Toggle({
Title = "技能无冷却",
Default = false,
Callback = function(val)
State.NoCooldown = val
if val then
Notify("战斗", "技能无冷却已开启", 3)
Connections.NoCD = RunService.Heartbeat:Connect(function()
if not State.NoCooldown then return end
local char = GetChar()
if not char then return end
for _, v in ipairs(char:GetDescendants()) do
if v:IsA("NumberValue") or v:IsA("IntValue") or v:IsA("BoolValue") then
local ln = string.lower(v.Name)
if string.find(ln, "cooldown") or string.find(ln, "cd") or string.find(ln, "charge")
or string.find(ln, "timer") or string.find(ln, "delay") then
if v:IsA("BoolValue") then v.Value = true
else v.Value = 0 end
end
end
end
pcall(function()
for _, v in ipairs(char:GetAttributes()) do
end
end)
end)
else
if Connections.NoCD then Connections.NoCD:Disconnect() Connections.NoCD = nil end
Notify("战斗", "技能无冷却已关闭", 3)
end
end,
})
local _zcKyCTsovQ = Window:Tab({
Title = "玩家",
Icon = "user",
})
_zcKyCTsovQ:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_zcKyCTsovQ:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
State.WalkSpeed = val
local h = GetHum()
if h then h.WalkSpeed = val end
end,
})
_zcKyCTsovQ:Slider({
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
_zcKyCTsovQ:Divider()
_zcKyCTsovQ:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
State.InfJump = val
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
_zcKyCTsovQ:Toggle({
Title = "穿墙",
Default = false,
Callback = function(val)
State.Noclip = val
if val then
Connections.NoClip = RunService.Stepped:Connect(function()
if not State.Noclip then return end
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
_zcKyCTsovQ:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
State.GodMode = val
if val then
Notify("玩家", "无敌已开启", 3)
Connections.GodMode = RunService.Heartbeat:Connect(function()
local h = GetHum()
if h and h.Health < h.MaxHealth then h.Health = h.MaxHealth end
end)
else
if Connections.GodMode then Connections.GodMode:Disconnect() Connections.GodMode = nil end
Notify("玩家", "无敌已关闭", 3)
end
end,
})
_zcKyCTsovQ:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
State.NoFallDamage = val
if val then
Notify("玩家", "摔落无伤害已开启", 3)
local function _IQkS71G6o7a1(h)
if not h then return end
local saved = h.Health
h.StateChanged:Connect(function(old, new)
if not State.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
saved = h.Health
elseif old == Enum.HumanoidStateType.Freefall then
if h.Health < saved then h.Health = saved end
end
end)
end
local c = GetChar()
if c then _IQkS71G6o7a1(c:FindFirstChildOfClass("Humanoid")) end
Connections.NoFall = LocalPlayer.CharacterAdded:Connect(function(char)
task.wait(0.3)
if State.NoFallDamage then _IQkS71G6o7a1(char:FindFirstChildOfClass("Humanoid")) end
end)
else
if Connections.NoFall then Connections.NoFall:Disconnect() Connections.NoFall = nil end
Notify("玩家", "摔落无伤害已关闭", 3)
end
end,
})
_zcKyCTsovQ:Divider()
local _Q8CPixvvsWrAdU = false
_zcKyCTsovQ:Button({
Title = "飞行 (手机版)",
Callback = function()
if _Q8CPixvvsWrAdU then
Notify("飞行", "飞行面板已打开", 3)
return
end
_Q8CPixvvsWrAdU = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
end,
})
local _lME2GX2DMRu7 = Window:Tab({
Title = "视觉",
Icon = "eye",
})
_lME2GX2DMRu7:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })
local function _vTfYUMaotaddAF8(player)
if player == LocalPlayer then return end
if ESPObjects[player] then return end
local _jbWsEO72Imt1gqP = Instance.new("BillboardGui")
_jbWsEO72Imt1gqP.Name = "BG_ESP_" .. player.Name
_jbWsEO72Imt1gqP.Size = UDim2.new(0, 200, 0, 60)
_jbWsEO72Imt1gqP.StudsOffset = Vector3.new(0, 3, 0)
_jbWsEO72Imt1gqP.AlwaysOnTop = true
local _U0Rw3MJPTtJd6a9h = Instance.new("TextLabel")
_U0Rw3MJPTtJd6a9h.Size = UDim2.new(1, 0, 0, 20)
_U0Rw3MJPTtJd6a9h.BackgroundTransparency = 1
_U0Rw3MJPTtJd6a9h.TextColor3 = Color3.fromRGB(255, 180, 0)
_U0Rw3MJPTtJd6a9h.TextSize = 14
_U0Rw3MJPTtJd6a9h.Font = Enum.Font.SourceSansBold
_U0Rw3MJPTtJd6a9h.TextStrokeTransparency = 0.5
_U0Rw3MJPTtJd6a9h.Text = player.Name
_U0Rw3MJPTtJd6a9h.Parent = _jbWsEO72Imt1gqP
local _T20PiBlRgr0Pr = Instance.new("TextLabel")
local _hvisZ8oW = 8143
_T20PiBlRgr0Pr.Size = UDim2.new(1, 0, 0, 18)
_T20PiBlRgr0Pr.Position = UDim2.new(0, 0, 0, 22)
_T20PiBlRgr0Pr.BackgroundTransparency = 1
_T20PiBlRgr0Pr.TextColor3 = Color3.fromRGB(200, 200, 200)
_T20PiBlRgr0Pr.TextSize = 12
_T20PiBlRgr0Pr.Text = ""
_T20PiBlRgr0Pr.Parent = _jbWsEO72Imt1gqP
local hpLabel = Instance.new("TextLabel")
hpLabel.Size = UDim2.new(1, 0, 0, 18)
hpLabel.Position = UDim2.new(0, 0, 0, 42)
hpLabel.BackgroundTransparency = 1
hpLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
hpLabel.TextSize = 12
hpLabel.Text = ""
hpLabel.Parent = _jbWsEO72Imt1gqP
ESPObjects[player] = { _jbWsEO72Imt1gqP = _jbWsEO72Imt1gqP, _U0Rw3MJPTtJd6a9h = _U0Rw3MJPTtJd6a9h, _T20PiBlRgr0Pr = _T20PiBlRgr0Pr, hpLabel = hpLabel }
end
local function _2WKjaHcG76Q(player)
if ESPObjects[player] then
if ESPObjects[player]._jbWsEO72Imt1gqP then ESPObjects[player]._jbWsEO72Imt1gqP:Destroy() end
ESPObjects[player] = nil
end
end
_lME2GX2DMRu7:Toggle({
Title = "人物透视",
Default = false,
Callback = function(val)
State.ESPEnabled = val
if val then
Notify("视觉", "透视已开启", 3)
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer then _vTfYUMaotaddAF8(plr) end
end
Connections.ESP = RunService.Heartbeat:Connect(function()
for plr, data in pairs(ESPObjects) do
local char = plr.Character
if char then
local head = char:FindFirstChild("Head")
local hrp = char:FindFirstChild("HumanoidRootPart")
local hum = char:FindFirstChildOfClass("Humanoid")
local _o1cCyFku = 8970
if head or hrp then
data._jbWsEO72Imt1gqP.Adornee = head or hrp
data._U0Rw3MJPTtJd6a9h.Visible = State.ESPNames
data._T20PiBlRgr0Pr.Visible = State.ESPDistance
data.hpLabel.Visible = State.ESPHealth
if State.ESPDistance then
local root = GetRoot()
if root and hrp then
data._T20PiBlRgr0Pr.Text = math.floor((root.Position - hrp.Position).Magnitude) .. " 米"
end
end
if State.ESPHealth and hum then
local hp = math.floor(hum.Health)
local maxHp = math.floor(hum.MaxHealth)
data.hpLabel.Text = "HP: " .. hp .. "/" .. maxHp
if hum.Health < hum.MaxHealth * 0.3 then
data.hpLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
elseif hum.Health < hum.MaxHealth * 0.6 then
data.hpLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
else
data.hpLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
end
end
end
end
end
end)
Connections.PAdd = Players.PlayerAdded:Connect(function(p) _vTfYUMaotaddAF8(p) end)
Connections.PRem = Players.PlayerRemoving:Connect(function(p) _2WKjaHcG76Q(p) end)
else
if Connections.ESP then Connections.ESP:Disconnect() Connections.ESP = nil end
if Connections.PAdd then Connections.PAdd:Disconnect() Connections.PAdd = nil end
if Connections.PRem then Connections.PRem:Disconnect() Connections.PRem = nil end
for p, _ in pairs(ESPObjects) do _2WKjaHcG76Q(p) end
ESPObjects = {}
Notify("视觉", "透视已关闭", 3)
end
end,
})
_lME2GX2DMRu7:Toggle({
Title = "显示名字",
Default = true,
Callback = function(val) State.ESPNames = val end,
})
_lME2GX2DMRu7:Toggle({
Title = "显示距离",
Default = true,
Callback = function(val) State.ESPDistance = val end,
})
_lME2GX2DMRu7:Toggle({
Title = "显示血量",
Default = true,
Callback = function(val) State.ESPHealth = val end,
})
_lME2GX2DMRu7:Toggle({
Title = "追踪线",
Default = false,
Callback = function(val)
State.Tracers = val
if val then
Notify("视觉", "追踪线已开启", 3)
Connections.Tracers = RunService.RenderStepped:Connect(function()
if not State.Tracers then return end
for _, obj in ipairs(Workspace:GetChildren()) do
if obj.Name == "BG_Tracer" then obj:Destroy() end
end
local root = GetRoot()
if not root then return end
local center = _S1RzTTOMR3yDSv()
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
if hrp and hum and hum.Health > 0 then
local sp, onScreen = _kal05nd3I3u2(hrp.Position)
if onScreen then
local line = Instance.new("Frame")
line.Name = "BG_Tracer"
line.AnchorPoint = Vector2.new(0.5, 0.5)
line.Parent = Workspace:FindFirstChildWhichIsA("ScreenGui") or (function()
local sg = Instance.new("ScreenGui", game.CoreGui)
sg.Name = "BG_Tracers"
return sg
end)()
local sg = game.CoreGui:FindFirstChild("BG_Tracers") or game.CoreGui:GetChildren()[1]
line.Parent = sg
line.Size = UDim2.new(0, 2, 0, (sp - center).Magnitude)
line.Position = UDim2.new(0, center.X + (sp.X - center.X) / 2, 0, center.Y + (sp.Y - center.Y) / 2)
line.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
line.BorderSizePixel = 0
local angle = math.deg(math.atan2(sp.Y - center.Y, sp.X - center.X)) - 90
line.Rotation = angle
end
end
end
end
end)
else
if Connections.Tracers then Connections.Tracers:Disconnect() Connections.Tracers = nil end
local sg = game.CoreGui:FindFirstChild("BG_Tracers")
if sg then sg:Destroy() end
Notify("视觉", "追踪线已关闭", 3)
end
end,
})
_lME2GX2DMRu7:Toggle({
Title = "透视高亮",
Default = false,
Callback = function(val)
State.Chams = val
if val then
Notify("视觉", "透视高亮已开启", 3)
Connections.Chams = RunService.Heartbeat:Connect(function()
if not State.Chams then return end
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
for _, part in ipairs(plr.Character:GetChildren()) do
if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
if not part:FindFirstChild("BG_Cham") then
local hl = Instance.new("Highlight")
local _WUpCx3QM = 1827
hl.Name = "BG_Cham"
hl.FillColor = Color3.fromRGB(255, 180, 0)
hl.FillTransparency = 0.4
hl.OutlineColor = Color3.fromRGB(255, 255, 255)
hl.Adornee = part
hl.Parent = part
end
end
end
end
end
end)
else
if Connections.Chams then Connections.Chams:Disconnect() Connections.Chams = nil end
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
for _, part in ipairs(plr.Character:GetChildren()) do
if part:IsA("BasePart") and part:FindFirstChild("BG_Cham") then
part.BG_Cham:Destroy()
end
end
end
end
Notify("视觉", "透视高亮已关闭", 3)
end
end,
})
_lME2GX2DMRu7:Toggle({
Title = "全图高亮",
Default = false,
Callback = function(val)
State.Fullbright = val
if val then
Lighting.Brightness = 3
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Lighting.GlobalShadows = false
Connections.FB = RunService.Heartbeat:Connect(function()
Lighting.Brightness = 3
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Lighting.GlobalShadows = false
end)
else
if Connections.FB then Connections.FB:Disconnect() Connections.FB = nil end
Lighting.Brightness = 1
Lighting.ClockTime = 12
Lighting.GlobalShadows = true
Notify("视觉", "全图高亮已关闭", 3)
end
end,
})
local _Cur9DjfSTX2lg9b = Window:Tab({
Title = "传送",
Icon = "map-pin",
})
_Cur9DjfSTX2lg9b:Section({ Title = "快速地点", TextXAlignment = "Left", TextSize = 17 })
local _pkFOeaVRwuAhC = {
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
for _, loc in ipairs(_pkFOeaVRwuAhC) do
_Cur9DjfSTX2lg9b:Button({
Title = "传送到" .. loc.name,
Callback = function()
local found = false
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local ln = string.lower(obj.Name)
for _, kw in ipairs(loc.keywords) do
if string.find(ln, kw) then
local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if part then
local root = GetRoot()
if root then
root.CFrame = part.CFrame * CFrame.new(0, 5, 0)
Notify("传送", "已传送到" .. loc.name, 3)
found = true
end
break
end
end
end
if found then break end
end
end
if not found then Notify("传送", "未找到" .. loc.name, 3) end
end,
})
end
_Cur9DjfSTX2lg9b:Divider()
_Cur9DjfSTX2lg9b:Button({
Title = "传送到最近玩家",
Callback = function()
local closest = _2KQTfTjFqNuaZD(9999)
if closest and closest.Character then
local root = GetRoot()
local _A0TsXTghFhh = closest.Character:FindFirstChild("HumanoidRootPart")
if root and _A0TsXTghFhh then
root.CFrame = _A0TsXTghFhh.CFrame * CFrame.new(0, 0, -3)
Notify("传送", "已传送到 " .. closest.Name, 3)
end
else
Notify("传送", "未找到玩家", 3)
end
end,
})
_Cur9DjfSTX2lg9b:Button({
Title = "传送到所有人中心",
Callback = function()
local root = GetRoot()
if not root then return end
local _FshelRwnYoo = Vector3.new(0, 0, 0)
local _40uHgwFn = 9210
local count = 0
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
if hrp then
_FshelRwnYoo = _FshelRwnYoo + hrp.Position
count = count + 1
end
end
end
if count > 0 then
local center = _FshelRwnYoo / count
root.CFrame = CFrame.new(center + Vector3.new(0, 5, 0))
Notify("传送", "已传送到所有人中心", 3)
else
Notify("传送", "未找到其他玩家", 3)
end
end,
})
_Cur9DjfSTX2lg9b:Divider()
local _WGUbgdfnQo8 = nil
_Cur9DjfSTX2lg9b:Toggle({
Title = "长按传送",
Default = false,
Callback = function(val)
if val then
Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
Connections.TpBegin = UserInputService.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_WGUbgdfnQo8 = tick()
end
end)
Connections.TpHold = RunService.Heartbeat:Connect(function()
if not _WGUbgdfnQo8 then return end
if tick() - _WGUbgdfnQo8 >= 0.5 then
local root = GetRoot()
if root then root.CFrame = Mouse.Hit end
_WGUbgdfnQo8 = nil
end
end)
Connections.TpEnd = UserInputService.InputEnded:Connect(function() _WGUbgdfnQo8 = nil end)
else
if Connections.TpBegin then Connections.TpBegin:Disconnect() Connections.TpBegin = nil end
if Connections.TpHold then Connections.TpHold:Disconnect() Connections.TpHold = nil end
if Connections.TpEnd then Connections.TpEnd:Disconnect() Connections.TpEnd = nil end
Notify("传送", "长按传送已关闭", 3)
end
end,
})
local MiscTab = Window:Tab({
Title = "实用",
Icon = "settings",
})
MiscTab:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })
MiscTab:Toggle({
Title = "防挂机",
Default = false,
Callback = function(val)
State.AntiAFK = val
if val then
Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
Notify("实用", "防挂机已开启", 3)
else
if Connections.AntiAFK then Connections.AntiAFK:Disconnect() Connections.AntiAFK = nil end
Notify("实用", "防挂机已关闭", 3)
end
end,
})
MiscTab:Toggle({
Title = "画质提速",
Default = false,
Callback = function(val)
State.FPSBoost = val
if val then
settings().Rendering.QualityLevel = 1
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Connections.FPS = RunService.Heartbeat:Connect(function()
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false end)
end
end
end)
Notify("实用", "画质提速已开启", 3)
else
if Connections.FPS then Connections.FPS:Disconnect() Connections.FPS = nil end
settings().Rendering.QualityLevel = Enum.RenderingQuality.Automatic
Lighting.FogEnd = 100000
Notify("实用", "画质提速已关闭", 3)
end
end,
})
MiscTab:Divider()
MiscTab:Button({
Title = "换服",
Callback = function()
Notify("实用", "正在跳转服务器...", 3)
TeleportService:Teleport(game.PlaceId, LocalPlayer)
end,
})
MiscTab:Button({
Title = "复制服务器号",
Callback = function()
local jobId = game.JobId
if setclipboard then
setclipboard(jobId)
Notify("实用", "已复制: " .. jobId, 3)
else
Notify("实用", "JobId: " .. jobId, 5)
end
end,
})
MiscTab:Button({
Title = "输出角色信息",
Callback = function()
local char = GetChar()
if not char then Notify("实用", "无角色", 3) return end
local info = {}
local h = GetHum()
if h then
table.insert(info, "血量: " .. math.floor(h.Health) .. "/" .. math.floor(h.MaxHealth))
table.insert(info, "速度: " .. h.WalkSpeed)
end
local root = GetRoot()
if root then table.insert(info, "位置: " .. tostring(root.Position)) end
local ls = LocalPlayer:FindFirstChild("leaderstats")
if ls then
for _, v in ipairs(ls:GetChildren()) do
table.insert(info, v.Name .. ": " .. tostring(v.Value))
end
end
Notify("角色信息", table.concat(info, "\n"), 10)
end,
})
MiscTab:Divider()
MiscTab:Button({
Title = "清理特效",
Callback = function()
local count = 0
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false; count = count + 1 end)
end
end
Notify("实用", "已清理 " .. count .. " 个特效", 3)
end,
})
MiscTab:Button({
Title = "卸载脚本",
Callback = function()
for _, conn in pairs(Connections) do
if conn then pcall(function() conn:Disconnect() end) end
end
Connections = {}
for p, _ in pairs(ESPObjects) do _2WKjaHcG76Q(p) end
ESPObjects = {}
local sg = game.CoreGui:FindFirstChild("BG_Tracers")
if sg then sg:Destroy() end
Notify("实用", "脚本已卸载", 3)
end,
})
Notify("最强战场", "脚本已加载!", 5)
LocalPlayer.CharacterAdded:Connect(function(char)
task.wait(0.5)
local h = char:FindFirstChildOfClass("Humanoid")
if h then
if State.WalkSpeed ~= 16 then h.WalkSpeed = State.WalkSpeed end
if State.JumpPower ~= 50 then
if h.UseJumpPower then h.JumpPower = State.JumpPower
else h.JumpHeight = State.JumpPower / 10 end
end
end
end)