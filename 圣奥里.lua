local _5ilgM7jm = 0
local _NdWMu8IC = ""
local _tSaNpzcW = nil
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
Title = "圣奥里",
Icon = "shield",
Author = "圣奥里脚本",
Folder = "SaintOly",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
})
local _000f  _000e:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 255, 255),
})
task.spawn(function()
local _0010  0
while task.wait(0.06) do
_0010 = _0010 + 0.01
if _0010 > 1 then _0010 = 0 end
local _0011  os.date("*t")
local _0012  string.format("%02d", _0011.hour)
local _0013  string.format("%02d", _0011.min)
_000f:SetTitle(_0012 .. ":" .. _0013)
_000f:SetColor(Color3.fromHSV(_0010, 1, 1))
end
end)
_000e:Tag({
Title = "圣奥里",
Color = Color3.fromHex("#FFD700"),
})
_000e:EditOpenButton({
Title = "圣奥里",
Icon = "shield",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FFD700")),
Draggable = true,
})
local _0014  {
AutoBlock = false,
AutoDodge = false,
AttackRangeExpand = false,
AttackRangeSize = 20,
AutoCombo = false,
FastPunch = false,
AutoAttack = false,
InfStamina = false,
AntiStun = false,
NoCooldown = false,
WalkSpeed = 16,
JumpPower = 50,
InfJump = false,
NoClip = false,
GodMode = false,
NoFallDamage = false,
ESP = false,
ShowName = true,
ShowDistance = true,
ShowHealth = true,
TracerLine = false,
ESPHighlight = false,
FullMapHighlight = false,
LongPressTeleport = false,
AntiAFK = false,
}
local _0015  {}
local _0016  {}
local _0017  {}
local function GetChar()
return _000b.Character
end
local function GetRoot()
local _0018  GetChar()
if not _0018 then return nil end
return _0018:FindFirstChild("HumanoidRootPart") or _0018:FindFirstChild("Torso")
end
local function GetHum()
local _0018  GetChar()
if not _0018 then return nil end
return _0018:FindFirstChildOfClass("Humanoid")
end
local function Notify(title, content, duration)
_0001:Notify({
Title = title,
Content = content,
Duration = duration or 5,
})
end
local function AddConnection(_0022, conn)
if _0015[_0022] then
_0015[_0022]:Disconnect()
end
_0015[_0022] = conn
end
local function RemoveConnection(_0022)
if _0015[_0022] then
_0015[_0022]:Disconnect()
_0015[_0022] = nil
end
end
local function GetClosestPlayer(maxDist)
maxDist = maxDist or math.huge
local _0019  nil
local _001a  maxDist
local _001b  GetRoot()
if not _001b then return nil end
for _, player in pairs(_0002:GetPlayers()) do
if player ~= _000b and player.Character then
local _001c  player.Character:FindFirstChildOfClass("Humanoid")
local _001d  player.Character:FindFirstChild("HumanoidRootPart")
if _001c and _001d and _001c.Health > 0 then
local _001e  (_001b.Position - _001d.Position).Magnitude
if _001e < _001a then
_001a = _001e
_0019 = player
end
end
end
end
return _0019
end
local function GetScreenCenter()
local _001f  _000c.ViewportSize
return Vector2.new(_001f.X / 2, _001f.Y / 2)
end
local function WorldToScreen(pos)
local _0020  onScreen = _000c:WorldToViewportPoint(pos)
return Vector2.new(_0020.X, _0020.Y), onScreen
end
local function IsAttacking(character)
if not character then return false end
local _001c  character:FindFirstChildOfClass("Humanoid")
if not _001c then return false end
local _0021  character:FindFirstChildOfClass("Animator")
if not _0021 and _001c then
_0021 = _001c:FindFirstChildOfClass("Animator")
end
if _0021 then
for _, track in pairs(_0021:GetPlayingAnimationTracks()) do
local _0022  (track.Name or ""):lower()
if _0022:match("attack") or _0022:match("punch") or _0022:match("hit")
or _0022:match("swing") or _0022:match("combo") or _0022:match("slash")
or _0022:match("strike") or _0022:match("kick") then
return true
end
end
end
return false
end
local function GetUIParent()
return gethui and gethui() or game:GetService("CoreGui")
end
local function CreateESPForPlayer(player)
if player == _000b then return end
if _0016[player] then return end
local _0023  {}
local _0024  Instance.new("BillboardGui")
_0024.Name = "SaintOlyESP"
_0024.Size = UDim2.fromOffset(200, 80)
_0024.StudsOffset = Vector3.new(0, 3, 0)
_0024.AlwaysOnTop = true
_0024.Enabled = true
_0024.Parent = GetUIParent()
local _0025  Instance.new("TextLabel")
_0025.Size = UDim2.new(1, 0, 0.33, 0)
_0025.BackgroundTransparency = 1
_0025.Text = player.Name
_0025.TextColor3 = Color3.new(1, 1, 1)
_0025.TextStrokeTransparency = 0
_0025.TextScaled = true
_0025.Font = Enum.Font.SourceSansBold
_0025.Parent = _0024
local _0026  Instance.new("TextLabel")
_0026.Size = UDim2.new(1, 0, 0.33, 0)
_0026.Position = UDim2.new(0, 0, 0.33, 0)
_0026.BackgroundTransparency = 1
_0026.Text = "0m"
_0026.TextColor3 = Color3.fromRGB(255, 255, 0)
_0026.TextStrokeTransparency = 0
_0026.TextScaled = true
_0026.Font = Enum.Font.SourceSansBold
_0026.Parent = _0024
local _0027  Instance.new("TextLabel")
_0027.Size = UDim2.new(1, 0, 0.34, 0)
_0027.Position = UDim2.new(0, 0, 0.66, 0)
_0027.BackgroundTransparency = 1
_0027.Text = "100/100"
_0027.TextColor3 = Color3.fromRGB(0, 255, 0)
_0027.TextStrokeTransparency = 0
_0027.TextScaled = true
_0027.Font = Enum.Font.SourceSansBold
_0027.Parent = _0024
_0023.Billboard = _0024
_0023.NameLabel = _0025
_0023.DistLabel = _0026
_0023.HealthLabel = _0027
_0016[player] = _0023
end
local function RemoveESPForPlayer(player)
if _0016[player] then
if _0016[player].Billboard then
_0016[player].Billboard:Destroy()
end
_0016[player] = nil
end
end
local function UpdateESP()
local _001b  GetRoot()
for player, _0023 in pairs(_0016) do
if not player.Parent or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
_0023.Billboard.Enabled = false
else
local _0028  player.Character:FindFirstChild("HumanoidRootPart")
local _001c  player.Character:FindFirstChildOfClass("Humanoid")
if _0028 and _001c then
_0023.Billboard.Adornee = _0028
_0023.Billboard.Enabled = true
_0023.NameLabel.Visible = _0014.ShowName
_0023.NameLabel.Text = player.DisplayName or player.Name
if _001b then
local _001e  (_001b.Position - _0028.Position).Magnitude
_0023.DistLabel.Visible = _0014.ShowDistance
_0023.DistLabel.Text = string.format("%.0fm", _001e)
end
local _0029  _001c.Health
local _002a  _001c.MaxHealth
_0023.HealthLabel.Visible = _0014.ShowHealth
_0023.HealthLabel.Text = string.format("%.0f/%.0f", _0029, _002a)
local _002b  _002a > 0 and (_0029 / _002a) or 0
if _002b < 0.3 then
_0023.HealthLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
elseif _002b < 0.6 then
_0023.HealthLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
else
_0023.HealthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
end
end
end
end
end
local function GetTracerLine(index)
if not _0017[index] then
local _002c  _003c = pcall(function() return Drawing.new("Line") end)
if _002c and _003c then
_003c.Thickness = 1
_003c.Transparency = 1
_003c.Color = Color3.fromRGB(255, 215, 0)
_0017[index] = _003c
return _003c
end
return nil
end
return _0017[index]
end
local function HideAllTracerLines()
for _, _003c in pairs(_0017) do
pcall(function() _003c.Visible = false end)
end
end
local _002d  _000e:Tab({
Title = "战斗",
Icon = "swords",
})
local _002e  _002d:Section({ Title = "攻击" })
_002e:Toggle({
Title = "攻击范围扩大",
Callback = function(state)
_0014.AttackRangeExpand = state
if state then
Notify("圣奥里", "攻击范围扩大已开启", 3)
AddConnection("AttackRangeExpand", _0003.Heartbeat:Connect(function()
local _0018  GetChar()
if not _0018 then return end
for _, tool in pairs(_0018:GetChildren()) do
if tool:IsA("Tool") then
local _002f  tool:FindFirstChild("Handle")
if _002f and _002f:IsA("BasePart") then
pcall(function()
_002f.Size = Vector3.new(_0014.AttackRangeSize, _0014.AttackRangeSize, _0014.AttackRangeSize)
end)
end
local _0030  tool:FindFirstChild("Hitbox") or tool:FindFirstChild("_0030")
if _0030 and _0030:IsA("BasePart") then
pcall(function()
_0030.Size = Vector3.new(_0014.AttackRangeSize, _0014.AttackRangeSize, _0014.AttackRangeSize)
end)
end
end
end
end))
else
Notify("圣奥里", "攻击范围扩大已关闭", 3)
RemoveConnection("AttackRangeExpand")
end
end,
})
_002e:Slider({
Title = "攻击范围大小",
Value = { Min = 2, Max = 50, Default = 20 },
Callback = function(value)
_0014.AttackRangeSize = value
end,
})
_002e:Toggle({
Title = "快速出拳",
Callback = function(state)
_0014.FastPunch = state
if state then
Notify("圣奥里", "快速出拳已开启", 3)
AddConnection("FastPunch", _0004.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.UserInputType == Enum.UserInputType.MouseButton1 then
task.spawn(function()
while _0014.FastPunch and _0004:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
local _0018  GetChar()
if _0018 then
for _, tool in pairs(_0018:GetChildren()) do
if tool:IsA("Tool") then
pcall(function() tool:Activate() end)
end
end
end
task.wait(0.02)
end
end)
end
end))
else
Notify("圣奥里", "快速出拳已关闭", 3)
RemoveConnection("FastPunch")
end
end,
})
_002e:Toggle({
Title = "自动攻击",
Callback = function(state)
_0014.AutoAttack = state
if state then
Notify("圣奥里", "自动攻击已开启", 3)
local _0031  0
AddConnection("AutoAttack", _0003.Heartbeat:Connect(function()
if tick() - _0031 < 0.5 then return end
local _0032  GetClosestPlayer(100)
local _001b  GetRoot()
if not _0032 or not _0032.Character or not _001b then return end
local _0028  _0032.Character:FindFirstChild("HumanoidRootPart")
if not _0028 then return end
_0031 = tick()
pcall(function()
_001b.CFrame = CFrame.lookAt(_001b.Position, Vector3.new(_0028.Position.X, _001b.Position.Y, _0028.Position.Z))
end)
pcall(function()
_000a:SendMouseButtonEvent(true, 0, 0, 0, game, 0)
end)
task.wait(0.05)
pcall(function()
_000a:SendMouseButtonEvent(false, 0, 0, 0, game, 0)
end)
local _0018  GetChar()
if _0018 then
for _, tool in pairs(_0018:GetChildren()) do
if tool:IsA("Tool") then
pcall(function() tool:Activate() end)
end
end
end
for _, obj in pairs(_0008:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local _0022  (obj.Name or ""):lower()
if _0022:match("attack") or _0022:match("hit") or _0022:match("damage") then
pcall(function()
obj:FireServer(_0032)
end)
end
end
end
end))
else
Notify("圣奥里", "自动攻击已关闭", 3)
RemoveConnection("AutoAttack")
end
end,
})
local _0033  _002d:Section({ Title = "属性" })
_0033:Toggle({
Title = "无限体力",
Callback = function(state)
_0014.InfStamina = state
if state then
Notify("圣奥里", "无限体力已开启", 3)
AddConnection("InfStamina", _0003.Heartbeat:Connect(function()
local function setStamina(parent)
if not parent then return end
for _, obj in pairs(parent:GetDescendants()) do
if obj:IsA("Value") or obj:IsA("IntValue") or obj:IsA("NumberValue") then
local _0022  (obj.Name or ""):lower()
if _0022:match("stamina") or _0022:match("energy") then
pcall(function() obj.Value = math.huge end)
end
end
end
end
setStamina(GetChar())
setStamina(_000b)
end))
else
Notify("圣奥里", "无限体力已关闭", 3)
RemoveConnection("InfStamina")
end
end,
})
_0033:Toggle({
Title = "免疫眩晕",
Callback = function(state)
_0014.AntiStun = state
if state then
Notify("圣奥里", "免疫眩晕已开启", 3)
AddConnection("AntiStun", _0003.Heartbeat:Connect(function()
local _0018  GetChar()
if not _0018 then return end
local _001c  _0018:FindFirstChildOfClass("Humanoid")
if _001c then
pcall(function() _001c.PlatformStand = false end)
for _, obj in pairs(_0018:GetChildren()) do
local _0022  (obj.Name or ""):lower()
if _0022:match("stun") or _0022:match("dizzy") or _0022:match("knock") then
if obj:IsA("BoolValue") then
pcall(function() obj.Value = false end)
elseif obj:IsA("NumberValue") or obj:IsA("IntValue") then
pcall(function() obj.Value = 0 end)
end
end
end
end
local _0021  _0018:FindFirstChildOfClass("Animator")
if not _0021 and _001c then
_0021 = _001c:FindFirstChildOfClass("Animator")
end
if _0021 then
for _, track in pairs(_0021:GetPlayingAnimationTracks()) do
local _0022  (track.Name or ""):lower()
if _0022:match("stun") or _0022:match("dizzy") or _0022:match("knock") then
pcall(function() track:Stop() end)
end
end
end
for _, obj in pairs(_0018:GetDescendants()) do
if obj:IsA("BodyVelocity") or obj:IsA("BodyGyro") or obj:IsA("BodyAngularVelocity") then
local _0022  (obj.Name or ""):lower()
if _0022:match("stun") or _0022:match("knock") or _0022:match("push") then
pcall(function() obj:Destroy() end)
end
end
end
end))
else
Notify("圣奥里", "免疫眩晕已关闭", 3)
RemoveConnection("AntiStun")
end
end,
})
_0033:Toggle({
Title = "技能无冷却",
Callback = function(state)
_0014.NoCooldown = state
if state then
Notify("圣奥里", "技能无冷却已开启", 3)
AddConnection("NoCooldown", _0003.Heartbeat:Connect(function()
local function clearCooldowns(parent)
if not parent then return end
for _, obj in pairs(parent:GetDescendants()) do
if obj:IsA("Value") or obj:IsA("IntValue") or obj:IsA("NumberValue") then
local _0022  (obj.Name or ""):lower()
if _0022:match("cooldown") or _0022:match("cd") or _0022:match("timer") then
pcall(function() obj.Value = 0 end)
end
end
end
end
clearCooldowns(GetChar())
clearCooldowns(_000b)
end))
else
Notify("圣奥里", "技能无冷却已关闭", 3)
RemoveConnection("NoCooldown")
end
end,
})
local _0034  _000e:Tab({
Title = "玩家",
Icon = "user",
})
local _0035  _0034:Section({ Title = "玩家属性" })
_0035:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Callback = function(value)
_0014.WalkSpeed = value
local _001c  GetHum()
if _001c then
pcall(function() _001c.WalkSpeed = value end)
end
end,
})
_0035:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Callback = function(value)
_0014.JumpPower = value
local _001c  GetHum()
if _001c then
pcall(function() _001c.JumpPower = value end)
end
end,
})
_0035:Toggle({
Title = "无限跳跃",
Callback = function(state)
_0014.InfJump = state
if state then
Notify("圣奥里", "无限跳跃已开启", 3)
AddConnection("InfJump", _0004.JumpRequest:Connect(function()
local _001c  GetHum()
if _001c then
pcall(function()
_001c:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end
end))
else
Notify("圣奥里", "无限跳跃已关闭", 3)
RemoveConnection("InfJump")
end
end,
})
_0035:Toggle({
Title = "穿墙",
Callback = function(state)
_0014.NoClip = state
if state then
Notify("圣奥里", "穿墙已开启", 3)
AddConnection("NoClip", _0003.Stepped:Connect(function()
local _0018  GetChar()
if not _0018 then return end
for _, part in pairs(_0018:GetDescendants()) do
if part:IsA("BasePart") and part.CanCollide then
part.CanCollide = false
end
end
end))
else
Notify("圣奥里", "穿墙已关闭", 3)
RemoveConnection("NoClip")
local _0018  GetChar()
if _0018 then
for _, part in pairs(_0018:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = true
end
end
end
end
end,
})
_0035:Toggle({
Title = "无敌",
Callback = function(state)
_0014.GodMode = state
if state then
Notify("圣奥里", "无敌已开启", 3)
AddConnection("GodMode", _0003.Heartbeat:Connect(function()
local _001c  GetHum()
if _001c then
pcall(function()
if _001c.Health < _001c.MaxHealth then
_001c.Health = _001c.MaxHealth
end
end)
end
end))
else
Notify("圣奥里", "无敌已关闭", 3)
RemoveConnection("GodMode")
end
end,
})
_0035:Toggle({
Title = "摔落无伤害",
Callback = function(state)
_0014.NoFallDamage = state
if state then
Notify("圣奥里", "摔落无伤害已开启", 3)
AddConnection("NoFallDamage", _0003.Heartbeat:Connect(function()
local _001c  GetHum()
if _001c then
pcall(function()
_001c:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
_001c:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
end)
end
local _0018  GetChar()
if _0018 then
for _, obj in pairs(_0018:GetDescendants()) do
if obj:IsA("BodyVelocity") then
local _0022  (obj.Name or ""):lower()
if _0022:match("fall") or _0022:match("knock") then
pcall(function() obj:Destroy() end)
end
end
end
end
end))
else
Notify("圣奥里", "摔落无伤害已关闭", 3)
RemoveConnection("NoFallDamage")
end
end,
})
_0035:Button({
Title = "飞行手机版",
Callback = function()
Notify("圣奥里", "正在加载飞行脚本...", 3)
local _0036  err = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
end)
if not _0036 then
Notify("圣奥里", "飞行脚本加载失败: " .. tostring(err), 5)
end
end,
})
local _0037  _000e:Tab({
Title = "视觉",
Icon = "eye",
})
local _0038  _0037:Section({ Title = "透视设置" })
_0038:Toggle({
Title = "人物透视",
Callback = function(state)
_0014.ESP = state
if state then
Notify("圣奥里", "人物透视已开启", 3)
for _, player in pairs(_0002:GetPlayers()) do
CreateESPForPlayer(player)
end
AddConnection("ESP", _0003.RenderStepped:Connect(UpdateESP))
AddConnection("ESPPlayerAdded", _0002.PlayerAdded:Connect(function(player)
CreateESPForPlayer(player)
end))
AddConnection("ESPPlayerRemoving", _0002.PlayerRemoving:Connect(function(player)
RemoveESPForPlayer(player)
end))
else
Notify("圣奥里", "人物透视已关闭", 3)
RemoveConnection("ESP")
RemoveConnection("ESPPlayerAdded")
RemoveConnection("ESPPlayerRemoving")
for player, _ in pairs(_0016) do
RemoveESPForPlayer(player)
end
end
end,
})
_0038:Toggle({
Title = "显示名字",
Value = true,
Callback = function(state)
_0014.ShowName = state
if state then
Notify("圣奥里", "显示名字已开启", 3)
else
Notify("圣奥里", "显示名字已关闭", 3)
end
end,
})
_0038:Toggle({
Title = "显示距离",
Value = true,
Callback = function(state)
_0014.ShowDistance = state
if state then
Notify("圣奥里", "显示距离已开启", 3)
else
Notify("圣奥里", "显示距离已关闭", 3)
end
end,
})
_0038:Toggle({
Title = "显示血量",
Value = true,
Callback = function(state)
_0014.ShowHealth = state
if state then
Notify("圣奥里", "显示血量已开启", 3)
else
Notify("圣奥里", "显示血量已关闭", 3)
end
end,
})
_0038:Toggle({
Title = "追踪线",
Callback = function(state)
_0014.TracerLine = state
if state then
local _0039  pcall(function() return Drawing.new("Line") end)
if not _0039 then
_0014.TracerLine = false
Notify("圣奥里", "当前执行器不支持Drawing API,追踪线不可用", 5)
return
end
Notify("圣奥里", "追踪线已开启", 3)
AddConnection("TracerLine", _0003.RenderStepped:Connect(function()
local _001b  GetRoot()
if not _001b then
HideAllTracerLines()
return
end
local _003a  GetScreenCenter()
local _003b  1
for _, player in pairs(_0002:GetPlayers()) do
if player ~= _000b and player.Character then
local _0028  player.Character:FindFirstChild("HumanoidRootPart")
local _001c  player.Character:FindFirstChildOfClass("Humanoid")
if _0028 and _001c and _001c.Health > 0 then
local _0020  onScreen = WorldToScreen(_0028.Position)
if onScreen then
local _003c  GetTracerLine(_003b)
if _003c then
_003c.From = _003a
_003c.To = _0020
_003c.Visible = true
end
_003b = _003b + 1
end
end
end
end
for i = _003b, #_0017 do
if _0017[i] then
pcall(function() _0017[i].Visible = false end)
end
end
end))
else
Notify("圣奥里", "追踪线已关闭", 3)
RemoveConnection("TracerLine")
HideAllTracerLines()
end
end,
})
_0038:Toggle({
Title = "透视高亮",
Callback = function(state)
_0014.ESPHighlight = state
if state then
Notify("圣奥里", "透视高亮已开启", 3)
AddConnection("ESPHighlight", _0003.RenderStepped:Connect(function()
for _, player in pairs(_0002:GetPlayers()) do
if player ~= _000b and player.Character then
local _001c  player.Character:FindFirstChildOfClass("Humanoid")
if _001c and _001c.Health > 0 then
local _003d  player.Character:FindFirstChild("SaintOlyHL")
if not _003d then
_003d = Instance.new("Highlight")
_003d.Name = "SaintOlyHL"
_003d.FillColor = Color3.fromRGB(255, 215, 0)
_003d.OutlineColor = Color3.fromRGB(255, 255, 255)
_003d.FillTransparency = 0.5
_003d.OutlineTransparency = 0
_003d.Parent = player.Character
end
end
end
end
end))
else
Notify("圣奥里", "透视高亮已关闭", 3)
RemoveConnection("ESPHighlight")
for _, player in pairs(_0002:GetPlayers()) do
if player ~= _000b and player.Character then
local _003d  player.Character:FindFirstChild("SaintOlyHL")
if _003d then _003d:Destroy() end
end
end
end
end,
})
_0038:Toggle({
Title = "全图高亮",
Callback = function(state)
_0014.FullMapHighlight = state
if state then
Notify("圣奥里", "全图高亮已开启", 3)
AddConnection("FullMapHighlight", _0003.Heartbeat:Connect(function()
local _003e  _0006:FindFirstChild("SaintOlyCC")
if not _003e then
_003e = Instance.new("ColorCorrectionEffect")
_003e.Name = "SaintOlyCC"
_003e.Brightness = 0.1
_003e.Contrast = 0.2
_003e.Saturation = 0.3
_003e.Parent = _0006
end
for _, player in pairs(_0002:GetPlayers()) do
if player ~= _000b and player.Character then
local _003d  player.Character:FindFirstChild("SaintOlyFullHL")
if not _003d then
_003d = Instance.new("Highlight")
_003d.Name = "SaintOlyFullHL"
_003d.FillColor = Color3.fromRGB(255, 215, 0)
_003d.FillTransparency = 0.7
_003d.OutlineTransparency = 0.5
_003d.Parent = player.Character
end
end
end
end))
else
Notify("圣奥里", "全图高亮已关闭", 3)
RemoveConnection("FullMapHighlight")
local _003e  _0006:FindFirstChild("SaintOlyCC")
if _003e then _003e:Destroy() end
for _, player in pairs(_0002:GetPlayers()) do
if player ~= _000b and player.Character then
local _003d  player.Character:FindFirstChild("SaintOlyFullHL")
if _003d then _003d:Destroy() end
end
end
end
end,
})
local _003f  _000e:Tab({
Title = "传送",
Icon = "map-pin",
})
local _0040  _003f:Section({ Title = "传送位置" })
local function TeleportToPosition(pos)
local _001b  GetRoot()
if not _001b then return false end
pcall(function()
_001b.CFrame = CFrame.new(pos)
end)
return true
end
local function FindAndTeleport(...)
local _001b  GetRoot()
if not _001b then return false end
local _0041  {...}
for _, obj in pairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0042  string.lower(obj.Name)
for _, searchName in pairs(_0041) do
if _0042:match(string.lower(searchName)) then
return TeleportToPosition(obj.Position + Vector3.new(0, 3, 0))
end
end
end
end
return false
end
_0040:Button({
Title = "传送到主战场",
Callback = function()
if FindAndTeleport("战场", "battle", "arena", "main") then
Notify("圣奥里", "已传送到主战场", 3)
else
Notify("圣奥里", "未找到主战场位置", 3)
end
end,
})
_0040:Button({
Title = "传送到训练区",
Callback = function()
if FindAndTeleport("训练", "train", "practice") then
Notify("圣奥里", "已传送到训练区", 3)
else
Notify("圣奥里", "未找到训练区位置", 3)
end
end,
})
_0040:Button({
Title = "传送到商店",
Callback = function()
if FindAndTeleport("商店", "shop", "store") then
Notify("圣奥里", "已传送到商店", 3)
else
Notify("圣奥里", "未找到商店位置", 3)
end
end,
})
_0040:Button({
Title = "传送到武器店",
Callback = function()
if FindAndTeleport("武器", "weapon") then
Notify("圣奥里", "已传送到武器店", 3)
else
Notify("圣奥里", "未找到武器店位置", 3)
end
end,
})
_0040:Button({
Title = "传送到技能店",
Callback = function()
if FindAndTeleport("技能", "skill") then
Notify("圣奥里", "已传送到技能店", 3)
else
Notify("圣奥里", "未找到技能店位置", 3)
end
end,
})
_0040:Button({
Title = "传送到重生区",
Callback = function()
if FindAndTeleport("重生", "spawn", "respawn") then
Notify("圣奥里", "已传送到重生区", 3)
else
Notify("圣奥里", "未找到重生区位置", 3)
end
end,
})
_0040:Button({
Title = "传送到竞技场入口",
Callback = function()
if FindAndTeleport("竞技", "arena", "entrance") then
Notify("圣奥里", "已传送到竞技场入口", 3)
else
Notify("圣奥里", "未找到竞技场入口位置", 3)
end
end,
})
_0040:Button({
Title = "传送到最近玩家",
Callback = function()
local _0032  GetClosestPlayer(math.huge)
if _0032 and _0032.Character then
local _0028  _0032.Character:FindFirstChild("HumanoidRootPart")
if _0028 then
TeleportToPosition(_0028.Position + Vector3.new(0, 3, 0))
Notify("圣奥里", "已传送到: " .. _0032.Name, 3)
end
else
Notify("圣奥里", "未找到玩家", 3)
end
end,
})
_0040:Toggle({
Title = "长按传送",
Callback = function(state)
_0014.LongPressTeleport = state
if state then
Notify("圣奥里", "长按传送已开启 - 点击地面传送", 3)
AddConnection("LongPressTeleport", _0004.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then
local _001b  GetRoot()
if not _001b then return end
local _0043  _000d.Hit.Position
TeleportToPosition(_0043 + Vector3.new(0, 3, 0))
end
end))
else
Notify("圣奥里", "长按传送已关闭", 3)
RemoveConnection("LongPressTeleport")
end
end,
})
local _0044  _000e:Tab({
Title = "实用",
Icon = "settings",
})
local _0045  _0044:Section({ Title = "实用工具" })
_0045:Toggle({
Title = "防挂机",
Callback = function(state)
_0014.AntiAFK = state
if state then
Notify("圣奥里", "防挂机已开启", 3)
local _0046  game:GetService("_0046")
AddConnection("AntiAFK", _000b.Idled:Connect(function()
pcall(function()
_0046:CaptureController()
_0046:ClickButton1(Vector2.new())
end)
end))
else
Notify("圣奥里", "防挂机已关闭", 3)
RemoveConnection("AntiAFK")
end
end,
})
_0045:Button({
Title = "画质提速",
Callback = function()
pcall(function()
_0006.GlobalShadows = true
_0006.FogEnd = 1000000
for _, obj in pairs(_0006:GetChildren()) do
if obj:IsA("BlurEffect") then
obj:Destroy()
end
end
_000c.FieldOfView = 70
for _, obj in pairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
obj.Enabled = false
end
end
end)
Notify("圣奥里", "画质提速完成", 3)
end,
})
_0045:Button({
Title = "换服",
Callback = function()
Notify("圣奥里", "正在换服...", 3)
pcall(function()
_0009:Teleport(game.PlaceId, _000b)
end)
end,
})
_0045:Button({
Title = "复制服务器号",
Callback = function()
local _0047  game.JobId
if setclipboard then
setclipboard(_0047)
Notify("圣奥里", "服务器号已复制: " .. _0047, 5)
else
Notify("圣奥里", "服务器号: " .. _0047, 10)
end
end,
})
_0045:Button({
Title = "角色信息",
Callback = function()
local _0018  GetChar()
local _001c  GetHum()
local _001b  GetRoot()
local _0048  {}
table.insert(_0048, "名字: " .. _000b.Name)
table.insert(_0048, "UserId: " .. _000b.UserId)
if _001c then
table.insert(_0048, "血量: " .. math.floor(_001c.Health) .. "/" .. math.floor(_001c.MaxHealth))
table.insert(_0048, "速度: " .. _001c.WalkSpeed)
table.insert(_0048, "跳跃力: " .. _001c.JumpPower)
end
if _001b then
table.insert(_0048, "位置: " .. tostring(_001b.Position))
end
table.insert(_0048, "JobId: " .. game.JobId)
Notify("圣奥里", table.concat(_0048, "\n"), 10)
end,
})
_0045:Button({
Title = "清理特效",
Callback = function()
local _0049  0
for _, obj in pairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Explosion") then
pcall(function() obj.Enabled = false end)
_0049 = _0049 + 1
end
end
for _, obj in pairs(_0006:GetChildren()) do
if obj:IsA("PostEffect") then
pcall(function() obj:Destroy() end)
_0049 = _0049 + 1
end
end
Notify("圣奥里", "已清理 " .. _0049 .. " 个特效", 3)
end,
})
_0045:Button({
Title = "卸载脚本",
Callback = function()
Notify("圣奥里", "正在卸载脚本...", 3)
for k, v in pairs(_0014) do
if type(v) == "boolean" then
_0014[k] = false
end
end
for _0022, conn in pairs(_0015) do
pcall(function() conn:Disconnect() end)
_0015[_0022] = nil
end
for player, _ in pairs(_0016) do
RemoveESPForPlayer(player)
end
for _, player in pairs(_0002:GetPlayers()) do
if player ~= _000b and player.Character then
for _, obj in pairs(player.Character:GetChildren()) do
if obj:IsA("Highlight") then
pcall(function() obj:Destroy() end)
end
end
end
end
local _003e  _0006:FindFirstChild("SaintOlyCC")
if _003e then pcall(function() _003e:Destroy() end) end
for _, _003c in pairs(_0017) do
pcall(function() _003c:Remove() end)
end
_0017 = {}
pcall(function()
_000a:SendKeyEvent(false, Enum.KeyCode.F, false, game)
_000a:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
_000a:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end)
task.wait(0.5)
pcall(function() _000e:Destroy() end)
end,
})
_000b.CharacterAdded:Connect(function()
task.wait(0.5)
local _001c  GetHum()
if _001c then
pcall(function() _001c.WalkSpeed = _0014.WalkSpeed end)
pcall(function() _001c.JumpPower = _0014.JumpPower end)
end
if _0014.NoClip then
RemoveConnection("NoClip")
AddConnection("NoClip", _0003.Stepped:Connect(function()
local _0018  GetChar()
if not _0018 then return end
for _, part in pairs(_0018:GetDescendants()) do
if part:IsA("BasePart") and part.CanCollide then
part.CanCollide = false
end
end
end))
end
if _0014.ESP then
for _, player in pairs(_0002:GetPlayers()) do
if player ~= _000b then
RemoveESPForPlayer(player)
CreateESPForPlayer(player)
end
end
end
end)
task.wait(0.5)
Notify("圣奥里", "脚本已加载!", 5)