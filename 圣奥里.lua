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
Title = "圣奥里",
Icon = "shield",
Author = "圣奥里脚本",
Folder = "SaintOly",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
})
local TimeTag = Window:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 255, 255),
})
task.spawn(function()
local hue = 0
while task.wait(0.06) do
hue = hue + 0.01
if hue > 1 then hue = 0 end
local now = os.date("*t")
local hours = string.format("%02d", now.hour)
local minutes = string.format("%02d", now.min)
TimeTag:SetTitle(hours .. ":" .. minutes)
TimeTag:SetColor(Color3.fromHSV(hue, 1, 1))
end
end)
Window:Tag({
Title = "圣奥里",
Color = Color3.fromHex("#FFD700"),
})
Window:EditOpenButton({
Title = "圣奥里",
Icon = "shield",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FFD700")),
Draggable = true,
})
local State = {
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
local Connections = {}
local ESPObjects = {}
local _QWGa878zT21YQ = {}
local function GetChar()
return LocalPlayer.Character
end
local function GetRoot()
local char = GetChar()
if not char then return nil end
return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
end
local function GetHum()
local char = GetChar()
if not char then return nil end
return char:FindFirstChildOfClass("Humanoid")
end
local function Notify(title, content, duration)
WindUI:Notify({
Title = title,
Content = content,
Duration = duration or 5,
})
end
local function _O1vAxzJGzGr0Ipo(name, conn)
if Connections[name] then
Connections[name]:Disconnect()
end
Connections[name] = conn
end
local function _ekWWLICRwizwoh4a(name)
if Connections[name] then
Connections[name]:Disconnect()
Connections[name] = nil
end
end
local function _EZm0KZ9cbd6cIXe(maxDist)
maxDist = maxDist or math.huge
local closest = nil
local _qP2GtiUTbJT = maxDist
local root = GetRoot()
if not root then return nil end
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
local hum = player.Character:FindFirstChildOfClass("Humanoid")
local hrp = player.Character:FindFirstChild("HumanoidRootPart")
if hum and hrp and hum.Health > 0 then
local dist = (root.Position - hrp.Position).Magnitude
if dist < _qP2GtiUTbJT then
_qP2GtiUTbJT = dist
closest = player
end
end
end
end
return closest
end
local function _71hJFXtBMYfFZl5()
local _7Dp5V6FbD0 = Camera.ViewportSize
return Vector2.new(_7Dp5V6FbD0.X / 2, _7Dp5V6FbD0.Y / 2)
end
local function _8A9vI35NWlJZWAf(pos)
local _4ObUjwmd9TG0, onScreen = Camera:WorldToViewportPoint(pos)
return Vector2.new(_4ObUjwmd9TG0.X, _4ObUjwmd9TG0.Y), onScreen
end
local function _qlF18orxvOUS(character)
local _2CqSKfvU = 1428
if not character then return false end
local hum = character:FindFirstChildOfClass("Humanoid")
if not hum then return false end
local anim = character:FindFirstChildOfClass("Animator")
if not anim and hum then
anim = hum:FindFirstChildOfClass("Animator")
end
if anim then
for _, track in pairs(anim:GetPlayingAnimationTracks()) do
local name = (track.Name or ""):lower()
if name:match("attack") or name:match("punch") or name:match("hit")
or name:match("swing") or name:match("combo") or name:match("slash")
or name:match("strike") or name:match("kick") then
return true
end
end
end
return false
end
local function _RVIEOvbpw2()
return gethui and gethui() or game:GetService("CoreGui")
end
local function _s58YyyxrhY(player)
if player == LocalPlayer then return end
if ESPObjects[player] then return end
local esp = {}
local _RgS0NDwYzSKbJFaY = Instance.new("BillboardGui")
_RgS0NDwYzSKbJFaY.Name = "SaintOlyESP"
_RgS0NDwYzSKbJFaY.Size = UDim2.fromOffset(200, 80)
_RgS0NDwYzSKbJFaY.StudsOffset = Vector3.new(0, 3, 0)
_RgS0NDwYzSKbJFaY.AlwaysOnTop = true
_RgS0NDwYzSKbJFaY.Enabled = true
_RgS0NDwYzSKbJFaY.Parent = _RVIEOvbpw2()
local _3DQaiCfZZLFLNO = Instance.new("TextLabel")
_3DQaiCfZZLFLNO.Size = UDim2.new(1, 0, 0.33, 0)
_3DQaiCfZZLFLNO.BackgroundTransparency = 1
_3DQaiCfZZLFLNO.Text = player.Name
_3DQaiCfZZLFLNO.TextColor3 = Color3.new(1, 1, 1)
_3DQaiCfZZLFLNO.TextStrokeTransparency = 0
_3DQaiCfZZLFLNO.TextScaled = true
_3DQaiCfZZLFLNO.Font = Enum.Font.SourceSansBold
_3DQaiCfZZLFLNO.Parent = _RgS0NDwYzSKbJFaY
local _KBtdxU0EsKqIiTj = Instance.new("TextLabel")
_KBtdxU0EsKqIiTj.Size = UDim2.new(1, 0, 0.33, 0)
_KBtdxU0EsKqIiTj.Position = UDim2.new(0, 0, 0.33, 0)
_KBtdxU0EsKqIiTj.BackgroundTransparency = 1
_KBtdxU0EsKqIiTj.Text = "0m"
_KBtdxU0EsKqIiTj.TextColor3 = Color3.fromRGB(255, 255, 0)
_KBtdxU0EsKqIiTj.TextStrokeTransparency = 0
_KBtdxU0EsKqIiTj.TextScaled = true
_KBtdxU0EsKqIiTj.Font = Enum.Font.SourceSansBold
_KBtdxU0EsKqIiTj.Parent = _RgS0NDwYzSKbJFaY
local _QDBWmLKv0y = Instance.new("TextLabel")
_QDBWmLKv0y.Size = UDim2.new(1, 0, 0.34, 0)
_QDBWmLKv0y.Position = UDim2.new(0, 0, 0.66, 0)
_QDBWmLKv0y.BackgroundTransparency = 1
_QDBWmLKv0y.Text = "100/100"
_QDBWmLKv0y.TextColor3 = Color3.fromRGB(0, 255, 0)
_QDBWmLKv0y.TextStrokeTransparency = 0
_QDBWmLKv0y.TextScaled = true
_QDBWmLKv0y.Font = Enum.Font.SourceSansBold
_QDBWmLKv0y.Parent = _RgS0NDwYzSKbJFaY
esp.Billboard = _RgS0NDwYzSKbJFaY
esp.NameLabel = _3DQaiCfZZLFLNO
esp.DistLabel = _KBtdxU0EsKqIiTj
esp.HealthLabel = _QDBWmLKv0y
ESPObjects[player] = esp
end
local function _Jm2I70IqAZWKzI(player)
if ESPObjects[player] then
if ESPObjects[player].Billboard then
ESPObjects[player].Billboard:Destroy()
end
ESPObjects[player] = nil
end
end
local function _L5CFCvzHJFlf()
local root = GetRoot()
for player, esp in pairs(ESPObjects) do
if not player.Parent or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
esp.Billboard.Enabled = false
else
local _lM4ZhOLSmL1 = player.Character:FindFirstChild("HumanoidRootPart")
local hum = player.Character:FindFirstChildOfClass("Humanoid")
if _lM4ZhOLSmL1 and hum then
esp.Billboard.Adornee = _lM4ZhOLSmL1
esp.Billboard.Enabled = true
esp.NameLabel.Visible = State.ShowName
esp.NameLabel.Text = player.DisplayName or player.Name
if root then
local dist = (root.Position - _lM4ZhOLSmL1.Position).Magnitude
esp.DistLabel.Visible = State.ShowDistance
esp.DistLabel.Text = string.format("%.0fm", dist)
end
local health = hum.Health
local _QvadC37W9Kd = hum.MaxHealth
esp.HealthLabel.Visible = State.ShowHealth
esp.HealthLabel.Text = string.format("%.0f/%.0f", health, _QvadC37W9Kd)
local ratio = _QvadC37W9Kd > 0 and (health / _QvadC37W9Kd) or 0
if ratio < 0.3 then
esp.HealthLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
elseif ratio < 0.6 then
esp.HealthLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
else
esp.HealthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
end
end
end
end
end
local function _6WuGMg8tYiTx(index)
if not _QWGa878zT21YQ[index] then
local ok, line = pcall(function() return Drawing.new("Line") end)
if ok and line then
line.Thickness = 1
line.Transparency = 1
line.Color = Color3.fromRGB(255, 215, 0)
_QWGa878zT21YQ[index] = line
return line
end
return nil
end
return _QWGa878zT21YQ[index]
end
local function _RKv1PMpOPa()
for _, line in pairs(_QWGa878zT21YQ) do
pcall(function() line.Visible = false end)
end
end
local _yJXg2W7xLpONty = Window:Tab({
Title = "战斗",
Icon = "swords",
})
local _4nZ0a7y7DY1ui = _yJXg2W7xLpONty:Section({ Title = "攻击" })
_4nZ0a7y7DY1ui:Toggle({
Title = "攻击范围扩大",
Callback = function(state)
State.AttackRangeExpand = state
if state then
Notify("圣奥里", "攻击范围扩大已开启", 3)
_O1vAxzJGzGr0Ipo("AttackRangeExpand", RunService.Heartbeat:Connect(function()
local char = GetChar()
if not char then return end
for _, tool in pairs(char:GetChildren()) do
if tool:IsA("Tool") then
local handle = tool:FindFirstChild("Handle")
if handle and handle:IsA("BasePart") then
pcall(function()
handle.Size = Vector3.new(State.AttackRangeSize, State.AttackRangeSize, State.AttackRangeSize)
end)
end
local hitbox = tool:FindFirstChild("Hitbox") or tool:FindFirstChild("hitbox")
if hitbox and hitbox:IsA("BasePart") then
pcall(function()
hitbox.Size = Vector3.new(State.AttackRangeSize, State.AttackRangeSize, State.AttackRangeSize)
end)
end
end
end
end))
else
Notify("圣奥里", "攻击范围扩大已关闭", 3)
_ekWWLICRwizwoh4a("AttackRangeExpand")
end
end,
})
_4nZ0a7y7DY1ui:Slider({
Title = "攻击范围大小",
Value = { Min = 2, Max = 50, Default = 20 },
Callback = function(value)
State.AttackRangeSize = value
end,
})
_4nZ0a7y7DY1ui:Toggle({
Title = "快速出拳",
Callback = function(state)
State.FastPunch = state
if state then
Notify("圣奥里", "快速出拳已开启", 3)
_O1vAxzJGzGr0Ipo("FastPunch", UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.UserInputType == Enum.UserInputType.MouseButton1 then
task.spawn(function()
while State.FastPunch and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
local char = GetChar()
if char then
for _, tool in pairs(char:GetChildren()) do
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
_ekWWLICRwizwoh4a("FastPunch")
end
end,
})
_4nZ0a7y7DY1ui:Toggle({
Title = "自动攻击",
Callback = function(state)
State.AutoAttack = state
if state then
Notify("圣奥里", "自动攻击已开启", 3)
local _ktDYHPQIUYaq8 = 0
_O1vAxzJGzGr0Ipo("AutoAttack", RunService.Heartbeat:Connect(function()
if tick() - _ktDYHPQIUYaq8 < 0.5 then return end
local target = _EZm0KZ9cbd6cIXe(100)
local root = GetRoot()
if not target or not target.Character or not root then return end
local _lM4ZhOLSmL1 = target.Character:FindFirstChild("HumanoidRootPart")
if not _lM4ZhOLSmL1 then return end
_ktDYHPQIUYaq8 = tick()
pcall(function()
root.CFrame = CFrame.lookAt(root.Position, Vector3.new(_lM4ZhOLSmL1.Position.X, root.Position.Y, _lM4ZhOLSmL1.Position.Z))
end)
pcall(function()
VirtualInputManager:SendMouseButtonEvent(true, 0, 0, 0, game, 0)
end)
task.wait(0.05)
pcall(function()
VirtualInputManager:SendMouseButtonEvent(false, 0, 0, 0, game, 0)
end)
local char = GetChar()
if char then
for _, tool in pairs(char:GetChildren()) do
if tool:IsA("Tool") then
pcall(function() tool:Activate() end)
end
end
end
for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local name = (obj.Name or ""):lower()
if name:match("attack") or name:match("hit") or name:match("damage") then
pcall(function()
obj:FireServer(target)
end)
end
end
end
end))
else
Notify("圣奥里", "自动攻击已关闭", 3)
_ekWWLICRwizwoh4a("AutoAttack")
end
end,
})
local _bnp3cJRBS52l = _yJXg2W7xLpONty:Section({ Title = "属性" })
_bnp3cJRBS52l:Toggle({
Title = "无限体力",
Callback = function(state)
State.InfStamina = state
if state then
Notify("圣奥里", "无限体力已开启", 3)
_O1vAxzJGzGr0Ipo("InfStamina", RunService.Heartbeat:Connect(function()
local function _cURPvE5iH2f(parent)
if not parent then return end
for _, obj in pairs(parent:GetDescendants()) do
if obj:IsA("Value") or obj:IsA("IntValue") or obj:IsA("NumberValue") then
local name = (obj.Name or ""):lower()
if name:match("stamina") or name:match("energy") then
pcall(function() obj.Value = math.huge end)
end
end
end
end
_cURPvE5iH2f(GetChar())
_cURPvE5iH2f(LocalPlayer)
end))
else
Notify("圣奥里", "无限体力已关闭", 3)
_ekWWLICRwizwoh4a("InfStamina")
end
end,
})
_bnp3cJRBS52l:Toggle({
Title = "免疫眩晕",
Callback = function(state)
State.AntiStun = state
if state then
Notify("圣奥里", "免疫眩晕已开启", 3)
_O1vAxzJGzGr0Ipo("AntiStun", RunService.Heartbeat:Connect(function()
local char = GetChar()
if not char then return end
local hum = char:FindFirstChildOfClass("Humanoid")
if hum then
pcall(function() hum.PlatformStand = false end)
for _, obj in pairs(char:GetChildren()) do
local name = (obj.Name or ""):lower()
if name:match("stun") or name:match("dizzy") or name:match("knock") then
if obj:IsA("BoolValue") then
pcall(function() obj.Value = false end)
elseif obj:IsA("NumberValue") or obj:IsA("IntValue") then
pcall(function() obj.Value = 0 end)
end
end
end
end
local anim = char:FindFirstChildOfClass("Animator")
if not anim and hum then
anim = hum:FindFirstChildOfClass("Animator")
end
if anim then
for _, track in pairs(anim:GetPlayingAnimationTracks()) do
local name = (track.Name or ""):lower()
if name:match("stun") or name:match("dizzy") or name:match("knock") then
pcall(function() track:Stop() end)
end
end
end
for _, obj in pairs(char:GetDescendants()) do
if obj:IsA("BodyVelocity") or obj:IsA("BodyGyro") or obj:IsA("BodyAngularVelocity") then
local name = (obj.Name or ""):lower()
if name:match("stun") or name:match("knock") or name:match("push") then
pcall(function() obj:Destroy() end)
end
end
end
end))
else
Notify("圣奥里", "免疫眩晕已关闭", 3)
_ekWWLICRwizwoh4a("AntiStun")
end
end,
})
_bnp3cJRBS52l:Toggle({
Title = "技能无冷却",
Callback = function(state)
State.NoCooldown = state
if state then
Notify("圣奥里", "技能无冷却已开启", 3)
_O1vAxzJGzGr0Ipo("NoCooldown", RunService.Heartbeat:Connect(function()
local function _pqWqHIeLqcoP4Y0(parent)
if not parent then return end
for _, obj in pairs(parent:GetDescendants()) do
if obj:IsA("Value") or obj:IsA("IntValue") or obj:IsA("NumberValue") then
local name = (obj.Name or ""):lower()
if name:match("cooldown") or name:match("cd") or name:match("timer") then
pcall(function() obj.Value = 0 end)
end
end
end
end
_pqWqHIeLqcoP4Y0(GetChar())
_pqWqHIeLqcoP4Y0(LocalPlayer)
end))
else
Notify("圣奥里", "技能无冷却已关闭", 3)
_ekWWLICRwizwoh4a("NoCooldown")
end
end,
})
local _Ze2xtweUXjV = Window:Tab({
Title = "玩家",
Icon = "user",
})
local _Xb7uHnUflwumQt = _Ze2xtweUXjV:Section({ Title = "玩家属性" })
_Xb7uHnUflwumQt:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Callback = function(value)
State.WalkSpeed = value
local hum = GetHum()
if hum then
pcall(function() hum.WalkSpeed = value end)
end
end,
})
_Xb7uHnUflwumQt:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Callback = function(value)
State.JumpPower = value
local hum = GetHum()
if hum then
pcall(function() hum.JumpPower = value end)
end
end,
})
_Xb7uHnUflwumQt:Toggle({
Title = "无限跳跃",
Callback = function(state)
State.InfJump = state
if state then
Notify("圣奥里", "无限跳跃已开启", 3)
_O1vAxzJGzGr0Ipo("InfJump", UserInputService.JumpRequest:Connect(function()
local hum = GetHum()
if hum then
pcall(function()
hum:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end
end))
else
Notify("圣奥里", "无限跳跃已关闭", 3)
_ekWWLICRwizwoh4a("InfJump")
end
end,
})
_Xb7uHnUflwumQt:Toggle({
Title = "穿墙",
Callback = function(state)
State.NoClip = state
if state then
Notify("圣奥里", "穿墙已开启", 3)
_O1vAxzJGzGr0Ipo("NoClip", RunService.Stepped:Connect(function()
local char = GetChar()
if not char then return end
for _, part in pairs(char:GetDescendants()) do
if part:IsA("BasePart") and part.CanCollide then
part.CanCollide = false
end
end
end))
else
Notify("圣奥里", "穿墙已关闭", 3)
_ekWWLICRwizwoh4a("NoClip")
local char = GetChar()
if char then
for _, part in pairs(char:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = true
end
end
end
end
end,
})
_Xb7uHnUflwumQt:Toggle({
Title = "无敌",
Callback = function(state)
State.GodMode = state
if state then
Notify("圣奥里", "无敌已开启", 3)
_O1vAxzJGzGr0Ipo("GodMode", RunService.Heartbeat:Connect(function()
local hum = GetHum()
if hum then
pcall(function()
if hum.Health < hum.MaxHealth then
hum.Health = hum.MaxHealth
end
end)
end
end))
else
Notify("圣奥里", "无敌已关闭", 3)
_ekWWLICRwizwoh4a("GodMode")
end
end,
})
_Xb7uHnUflwumQt:Toggle({
Title = "摔落无伤害",
Callback = function(state)
State.NoFallDamage = state
if state then
Notify("圣奥里", "摔落无伤害已开启", 3)
_O1vAxzJGzGr0Ipo("NoFallDamage", RunService.Heartbeat:Connect(function()
local hum = GetHum()
if hum then
pcall(function()
hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
end)
end
local char = GetChar()
if char then
for _, obj in pairs(char:GetDescendants()) do
if obj:IsA("BodyVelocity") then
local name = (obj.Name or ""):lower()
if name:match("fall") or name:match("knock") then
pcall(function() obj:Destroy() end)
end
end
end
end
end))
else
Notify("圣奥里", "摔落无伤害已关闭", 3)
_ekWWLICRwizwoh4a("NoFallDamage")
end
end,
})
_Xb7uHnUflwumQt:Button({
Title = "飞行手机版",
Callback = function()
Notify("圣奥里", "正在加载飞行脚本...", 3)
local success, err = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
end)
if not success then
Notify("圣奥里", "飞行脚本加载失败: " .. tostring(err), 5)
end
end,
})
local _xXhNwcM13A5z47 = Window:Tab({
Title = "视觉",
Icon = "eye",
})
local _9upYXDbutRRFMz = _xXhNwcM13A5z47:Section({ Title = "透视设置" })
_9upYXDbutRRFMz:Toggle({
Title = "人物透视",
Callback = function(state)
State.ESP = state
if state then
Notify("圣奥里", "人物透视已开启", 3)
for _, player in pairs(Players:GetPlayers()) do
_s58YyyxrhY(player)
end
_O1vAxzJGzGr0Ipo("ESP", RunService.RenderStepped:Connect(_L5CFCvzHJFlf))
_O1vAxzJGzGr0Ipo("ESPPlayerAdded", Players.PlayerAdded:Connect(function(player)
_s58YyyxrhY(player)
end))
_O1vAxzJGzGr0Ipo("ESPPlayerRemoving", Players.PlayerRemoving:Connect(function(player)
_Jm2I70IqAZWKzI(player)
end))
else
Notify("圣奥里", "人物透视已关闭", 3)
_ekWWLICRwizwoh4a("ESP")
_ekWWLICRwizwoh4a("ESPPlayerAdded")
_ekWWLICRwizwoh4a("ESPPlayerRemoving")
for player, _ in pairs(ESPObjects) do
_Jm2I70IqAZWKzI(player)
end
end
end,
})
_9upYXDbutRRFMz:Toggle({
Title = "显示名字",
Value = true,
Callback = function(state)
State.ShowName = state
if state then
Notify("圣奥里", "显示名字已开启", 3)
else
Notify("圣奥里", "显示名字已关闭", 3)
end
end,
})
_9upYXDbutRRFMz:Toggle({
Title = "显示距离",
Value = true,
Callback = function(state)
State.ShowDistance = state
if state then
Notify("圣奥里", "显示距离已开启", 3)
else
Notify("圣奥里", "显示距离已关闭", 3)
end
end,
})
_9upYXDbutRRFMz:Toggle({
Title = "显示血量",
Value = true,
Callback = function(state)
State.ShowHealth = state
if state then
Notify("圣奥里", "显示血量已开启", 3)
else
Notify("圣奥里", "显示血量已关闭", 3)
end
end,
})
_9upYXDbutRRFMz:Toggle({
Title = "追踪线",
Callback = function(state)
State.TracerLine = state
if state then
local _i1mhFHoIuF = pcall(function() return Drawing.new("Line") end)
if not _i1mhFHoIuF then
State.TracerLine = false
Notify("圣奥里", "当前执行器不支持Drawing API,追踪线不可用", 5)
return
end
Notify("圣奥里", "追踪线已开启", 3)
_O1vAxzJGzGr0Ipo("TracerLine", RunService.RenderStepped:Connect(function()
local root = GetRoot()
if not root then
_RKv1PMpOPa()
return
end
local center = _71hJFXtBMYfFZl5()
local _PdgBOlPWjbdcETic = 1
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
local _lM4ZhOLSmL1 = player.Character:FindFirstChild("HumanoidRootPart")
local hum = player.Character:FindFirstChildOfClass("Humanoid")
if _lM4ZhOLSmL1 and hum and hum.Health > 0 then
local _4ObUjwmd9TG0, onScreen = _8A9vI35NWlJZWAf(_lM4ZhOLSmL1.Position)
if onScreen then
local line = _6WuGMg8tYiTx(_PdgBOlPWjbdcETic)
if line then
line.From = center
line.To = _4ObUjwmd9TG0
line.Visible = true
end
_PdgBOlPWjbdcETic = _PdgBOlPWjbdcETic + 1
end
end
end
end
for i = _PdgBOlPWjbdcETic, #_QWGa878zT21YQ do
if _QWGa878zT21YQ[i] then
pcall(function() _QWGa878zT21YQ[i].Visible = false end)
end
end
end))
else
Notify("圣奥里", "追踪线已关闭", 3)
_ekWWLICRwizwoh4a("TracerLine")
_RKv1PMpOPa()
end
end,
})
_9upYXDbutRRFMz:Toggle({
Title = "透视高亮",
Callback = function(state)
State.ESPHighlight = state
if state then
Notify("圣奥里", "透视高亮已开启", 3)
_O1vAxzJGzGr0Ipo("ESPHighlight", RunService.RenderStepped:Connect(function()
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
local hum = player.Character:FindFirstChildOfClass("Humanoid")
if hum and hum.Health > 0 then
local hl = player.Character:FindFirstChild("SaintOlyHL")
if not hl then
hl = Instance.new("Highlight")
hl.Name = "SaintOlyHL"
hl.FillColor = Color3.fromRGB(255, 215, 0)
hl.OutlineColor = Color3.fromRGB(255, 255, 255)
hl.FillTransparency = 0.5
hl.OutlineTransparency = 0
hl.Parent = player.Character
end
end
end
end
end))
else
Notify("圣奥里", "透视高亮已关闭", 3)
_ekWWLICRwizwoh4a("ESPHighlight")
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
local hl = player.Character:FindFirstChild("SaintOlyHL")
if hl then hl:Destroy() end
end
end
end
end,
})
_9upYXDbutRRFMz:Toggle({
Title = "全图高亮",
Callback = function(state)
State.FullMapHighlight = state
if state then
Notify("圣奥里", "全图高亮已开启", 3)
_O1vAxzJGzGr0Ipo("FullMapHighlight", RunService.Heartbeat:Connect(function()
local cc = Lighting:FindFirstChild("SaintOlyCC")
if not cc then
cc = Instance.new("ColorCorrectionEffect")
cc.Name = "SaintOlyCC"
cc.Brightness = 0.1
cc.Contrast = 0.2
cc.Saturation = 0.3
cc.Parent = Lighting
end
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
local hl = player.Character:FindFirstChild("SaintOlyFullHL")
if not hl then
hl = Instance.new("Highlight")
hl.Name = "SaintOlyFullHL"
hl.FillColor = Color3.fromRGB(255, 215, 0)
hl.FillTransparency = 0.7
hl.OutlineTransparency = 0.5
hl.Parent = player.Character
end
end
end
end))
else
Notify("圣奥里", "全图高亮已关闭", 3)
_ekWWLICRwizwoh4a("FullMapHighlight")
local cc = Lighting:FindFirstChild("SaintOlyCC")
if cc then cc:Destroy() end
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
local hl = player.Character:FindFirstChild("SaintOlyFullHL")
if hl then hl:Destroy() end
end
end
end
end,
})
local _f7bpsvhRT702h = Window:Tab({
Title = "传送",
Icon = "map-pin",
})
local _SDSchDjg5QeiUTd2 = _f7bpsvhRT702h:Section({ Title = "传送位置" })
local function _J4xjNbzsGm(pos)
local root = GetRoot()
if not root then return false end
pcall(function()
root.CFrame = CFrame.new(pos)
end)
return true
end
local function _r9tVk9FUAW(...)
local root = GetRoot()
if not root then return false end
local names = {...}
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local objName = string.lower(obj.Name)
local _hu1oOPqO = 6832
for _, searchName in pairs(names) do
if objName:match(string.lower(searchName)) then
return _J4xjNbzsGm(obj.Position + Vector3.new(0, 3, 0))
end
end
end
end
return false
end
_SDSchDjg5QeiUTd2:Button({
Title = "传送到主战场",
Callback = function()
if _r9tVk9FUAW("战场", "battle", "arena", "main") then
Notify("圣奥里", "已传送到主战场", 3)
else
Notify("圣奥里", "未找到主战场位置", 3)
end
end,
})
_SDSchDjg5QeiUTd2:Button({
Title = "传送到训练区",
Callback = function()
if _r9tVk9FUAW("训练", "train", "practice") then
Notify("圣奥里", "已传送到训练区", 3)
else
Notify("圣奥里", "未找到训练区位置", 3)
end
end,
})
_SDSchDjg5QeiUTd2:Button({
Title = "传送到商店",
Callback = function()
if _r9tVk9FUAW("商店", "shop", "store") then
Notify("圣奥里", "已传送到商店", 3)
else
Notify("圣奥里", "未找到商店位置", 3)
end
end,
})
_SDSchDjg5QeiUTd2:Button({
Title = "传送到武器店",
Callback = function()
if _r9tVk9FUAW("武器", "weapon") then
Notify("圣奥里", "已传送到武器店", 3)
else
Notify("圣奥里", "未找到武器店位置", 3)
end
end,
})
_SDSchDjg5QeiUTd2:Button({
Title = "传送到技能店",
Callback = function()
if _r9tVk9FUAW("技能", "skill") then
Notify("圣奥里", "已传送到技能店", 3)
else
Notify("圣奥里", "未找到技能店位置", 3)
end
end,
})
_SDSchDjg5QeiUTd2:Button({
Title = "传送到重生区",
Callback = function()
if _r9tVk9FUAW("重生", "spawn", "respawn") then
Notify("圣奥里", "已传送到重生区", 3)
else
Notify("圣奥里", "未找到重生区位置", 3)
end
end,
})
_SDSchDjg5QeiUTd2:Button({
Title = "传送到竞技场入口",
Callback = function()
if _r9tVk9FUAW("竞技", "arena", "entrance") then
Notify("圣奥里", "已传送到竞技场入口", 3)
else
Notify("圣奥里", "未找到竞技场入口位置", 3)
end
end,
})
_SDSchDjg5QeiUTd2:Button({
Title = "传送到最近玩家",
Callback = function()
local target = _EZm0KZ9cbd6cIXe(math.huge)
if target and target.Character then
local _lM4ZhOLSmL1 = target.Character:FindFirstChild("HumanoidRootPart")
if _lM4ZhOLSmL1 then
_J4xjNbzsGm(_lM4ZhOLSmL1.Position + Vector3.new(0, 3, 0))
Notify("圣奥里", "已传送到: " .. target.Name, 3)
end
else
Notify("圣奥里", "未找到玩家", 3)
end
end,
})
_SDSchDjg5QeiUTd2:Toggle({
Title = "长按传送",
Callback = function(state)
State.LongPressTeleport = state
if state then
Notify("圣奥里", "长按传送已开启 - 点击地面传送", 3)
_O1vAxzJGzGr0Ipo("LongPressTeleport", UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then
local root = GetRoot()
if not root then return end
local _zurvP9TC29UUPk = Mouse.Hit.Position
_J4xjNbzsGm(_zurvP9TC29UUPk + Vector3.new(0, 3, 0))
end
end))
else
Notify("圣奥里", "长按传送已关闭", 3)
_ekWWLICRwizwoh4a("LongPressTeleport")
end
end,
})
local _Hj0wkSBO1FF = Window:Tab({
Title = "实用",
Icon = "settings",
})
local _S8bW38El7nvLcj = _Hj0wkSBO1FF:Section({ Title = "实用工具" })
_S8bW38El7nvLcj:Toggle({
Title = "防挂机",
Callback = function(state)
State.AntiAFK = state
if state then
Notify("圣奥里", "防挂机已开启", 3)
local _y0OLCEEY3tbn8i = game:GetService("_y0OLCEEY3tbn8i")
_O1vAxzJGzGr0Ipo("AntiAFK", LocalPlayer.Idled:Connect(function()
pcall(function()
_y0OLCEEY3tbn8i:CaptureController()
_y0OLCEEY3tbn8i:ClickButton1(Vector2.new())
end)
end))
else
Notify("圣奥里", "防挂机已关闭", 3)
_ekWWLICRwizwoh4a("AntiAFK")
end
end,
})
_S8bW38El7nvLcj:Button({
Title = "画质提速",
Callback = function()
pcall(function()
Lighting.GlobalShadows = true
Lighting.FogEnd = 1000000
for _, obj in pairs(Lighting:GetChildren()) do
if obj:IsA("BlurEffect") then
obj:Destroy()
end
end
Camera.FieldOfView = 70
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
obj.Enabled = false
end
end
end)
Notify("圣奥里", "画质提速完成", 3)
end,
})
_S8bW38El7nvLcj:Button({
Title = "换服",
Callback = function()
Notify("圣奥里", "正在换服...", 3)
pcall(function()
TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)
end,
})
_S8bW38El7nvLcj:Button({
Title = "复制服务器号",
Callback = function()
local jobId = game.JobId
if setclipboard then
setclipboard(jobId)
Notify("圣奥里", "服务器号已复制: " .. jobId, 5)
else
Notify("圣奥里", "服务器号: " .. jobId, 10)
end
end,
})
_S8bW38El7nvLcj:Button({
Title = "角色信息",
Callback = function()
local char = GetChar()
local hum = GetHum()
local root = GetRoot()
local info = {}
table.insert(info, "名字: " .. LocalPlayer.Name)
table.insert(info, "UserId: " .. LocalPlayer.UserId)
if hum then
table.insert(info, "血量: " .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth))
table.insert(info, "速度: " .. hum.WalkSpeed)
table.insert(info, "跳跃力: " .. hum.JumpPower)
end
if root then
table.insert(info, "位置: " .. tostring(root.Position))
end
table.insert(info, "JobId: " .. game.JobId)
Notify("圣奥里", table.concat(info, "\n"), 10)
end,
})
_S8bW38El7nvLcj:Button({
Title = "清理特效",
Callback = function()
local count = 0
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Explosion") then
pcall(function() obj.Enabled = false end)
count = count + 1
end
end
for _, obj in pairs(Lighting:GetChildren()) do
if obj:IsA("PostEffect") then
pcall(function() obj:Destroy() end)
count = count + 1
end
end
Notify("圣奥里", "已清理 " .. count .. " 个特效", 3)
end,
})
_S8bW38El7nvLcj:Button({
Title = "卸载脚本",
Callback = function()
Notify("圣奥里", "正在卸载脚本...", 3)
for k, v in pairs(State) do
if type(v) == "boolean" then
State[k] = false
end
end
for name, conn in pairs(Connections) do
pcall(function() conn:Disconnect() end)
Connections[name] = nil
end
for player, _ in pairs(ESPObjects) do
_Jm2I70IqAZWKzI(player)
end
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
for _, obj in pairs(player.Character:GetChildren()) do
if obj:IsA("Highlight") then
pcall(function() obj:Destroy() end)
end
end
end
end
local cc = Lighting:FindFirstChild("SaintOlyCC")
if cc then pcall(function() cc:Destroy() end) end
for _, line in pairs(_QWGa878zT21YQ) do
pcall(function() line:Remove() end)
end
_QWGa878zT21YQ = {}
pcall(function()
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end)
task.wait(0.5)
pcall(function() Window:Destroy() end)
end,
})
LocalPlayer.CharacterAdded:Connect(function()
task.wait(0.5)
local hum = GetHum()
if hum then
pcall(function() hum.WalkSpeed = State.WalkSpeed end)
pcall(function() hum.JumpPower = State.JumpPower end)
end
if State.NoClip then
_ekWWLICRwizwoh4a("NoClip")
_O1vAxzJGzGr0Ipo("NoClip", RunService.Stepped:Connect(function()
local char = GetChar()
if not char then return end
for _, part in pairs(char:GetDescendants()) do
if part:IsA("BasePart") and part.CanCollide then
part.CanCollide = false
end
end
end))
end
if State.ESP then
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
_Jm2I70IqAZWKzI(player)
_s58YyyxrhY(player)
end
end
end
end)
task.wait(0.5)
Notify("圣奥里", "脚本已加载!", 5)