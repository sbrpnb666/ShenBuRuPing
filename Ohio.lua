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
local _1rMaSixHFAiIC8 = game:GetService("_1rMaSixHFAiIC8")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local Window = WindUI:CreateWindow({
Title = "Ohio",
Icon = "skull",
Author = "Ohio Script v2.0",
Folder = "OhioScript",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
HideSearchBar = false,
})
local TimeTag = Window:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 255, 255)
})
local hue = 0
task.spawn(function()
while true do
local now = os.date("*t")
local hours = string.format("%02d", now.hour)
local minutes = string.format("%02d", now.min)
hue = (hue + 0.01) % 1
local _EfT3vdcAZsWk = Color3.fromHSV(hue, 1, 1)
TimeTag:SetTitle(hours .. ":" .. minutes)
TimeTag:SetColor(_EfT3vdcAZsWk)
task.wait(0.06)
end
end)
Window:Tag({
Title = "Ohio",
Color = Color3.fromHex("#FF4444")
})
Window:EditOpenButton({
Title = "Ohio",
Icon = "skull",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FF4444")),
Draggable = true,
})
local State = {
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
local Connections = {}
local ESPObjects = {}
local _AJCO4pKWbGrcQwb = nil
local _ndcWzUehnGC = {}
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
local function _th21THWNjmu83cr()
local list = {}
for _, p in ipairs(Players:_th21THWNjmu83cr()) do
if p ~= LocalPlayer then
table.insert(list, p.Name)
end
end
return list
end
local function _rrdlVNArGrXLg1Q()
local vp = Camera.ViewportSize
return Vector2.new(vp.X / 2, vp.Y / 2)
end
local function _AqmnhL8iZP(pos)
local _FfIkcyvSyIzSg, onScreen = Camera:WorldToViewportPoint(pos)
return Vector2.new(_FfIkcyvSyIzSg.X, _FfIkcyvSyIzSg.Y), onScreen
end
local function _ccWZkCX3bxra()
local closest = nil
local _4OFrz7uF6ZHtSXeV = math.huge
local center = _rrdlVNArGrXLg1Q()
local _Ijjl0xjwerIe1D = State.AimbotFOV
for _, plr in ipairs(Players:_th21THWNjmu83cr()) do
if plr ~= LocalPlayer and plr.Character then
local head = plr.Character:FindFirstChild("Head")
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
if (head or hrp) and hum and hum.Health > 0 then
local _VWIhjGuKu0UMI = head or hrp
local _FfIkcyvSyIzSg, onScreen = _AqmnhL8iZP(_VWIhjGuKu0UMI.Position)
if onScreen then
local dist = (_FfIkcyvSyIzSg - center).Magnitude
if dist < _4OFrz7uF6ZHtSXeV and dist <= _Ijjl0xjwerIe1D then
_4OFrz7uF6ZHtSXeV = dist
closest = plr
end
end
end
end
end
return closest
end
local function _Z6YCQ9rpCOZbbUA(plr)
if not plr or not plr.Character then return nil end
local head = plr.Character:FindFirstChild("Head")
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
if not hum or hum.Health <= 0 then return nil end
return head or plr.Character:FindFirstChild("HumanoidRootPart")
end
local function _YVoTftgFXTH4H(plr)
local part = _Z6YCQ9rpCOZbbUA(plr)
if not part then return nil end
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
local rootVel = plr.Character:FindFirstChild("HumanoidRootPart")
if rootVel and rootVel:FindFirstChild("BodyVelocity") then
local vel = rootVel.BodyVelocity.Velocity
return part.Position + vel * 0.1
end
return part.Position
end
local _CRxJbiUhy6i = Window:Tab({
Title = "战斗",
Icon = "swords",
})
_CRxJbiUhy6i:Section({ Title = "瞄准", TextXAlignment = "Left", TextSize = 17 })
local _3wopUmqzEmrd0 = nil
_CRxJbiUhy6i:Toggle({
Title = "自动瞄准",
Default = false,
Callback = function(val)
State.AimbotEnabled = val
if val then
Notify("战斗", "自瞄已开启 (自动锁定最近敌人)", 3)
_3wopUmqzEmrd0 = RunService.RenderStepped:Connect(function()
if not State.AimbotEnabled then return end
local target = _ccWZkCX3bxra()
if target then
local part = _Z6YCQ9rpCOZbbUA(target)
if part then
local camPos = Camera.CFrame.Position
local lookCF = CFrame.new(camPos, part.Position)
Camera.CFrame = Camera.CFrame:Lerp(lookCF, State.AimbotSmooth)
end
end
end)
else
if _3wopUmqzEmrd0 then _3wopUmqzEmrd0:Disconnect() _3wopUmqzEmrd0 = nil end
Notify("战斗", "自瞄已关闭", 3)
end
end,
})
_CRxJbiUhy6i:Slider({
Title = "瞄准范围",
Value = { Min = 30, Max = 500, Default = 120 },
Increment = 5,
Callback = function(val)
State.AimbotFOV = val
if _AJCO4pKWbGrcQwb then
_AJCO4pKWbGrcQwb.Radius = val
end
end,
})
_CRxJbiUhy6i:Slider({
Title = "瞄准平滑度",
Value = { Min = 5, Max = 100, Default = 40 },
Increment = 1,
Callback = function(val)
State.AimbotSmooth = val / 100
end,
})
local _0vGn1oP88hbcfVoF = nil
_CRxJbiUhy6i:Toggle({
Title = "静默瞄准",
Default = false,
Callback = function(val)
State.SilentAim = val
if val then
Notify("战斗", "静默瞄准已开启", 3)
local mt = getrawmetatable(game)
local _nBkGiT9G = 4821
local _zM8CawJTfXdW4x = getrawmetatable(game).__namecall
local _eqrn8K3MrvO28fC = getrawmetatable(game).__index
setreadonly(mt, false)
local _dVGaYGiuVnokz9sY = mt.__index
mt.__index = newcclosure(function(self, key)
if key == "Hit" or key == "Target" or key == "TargetPoint" then
if State.SilentAim then
local target = _ccWZkCX3bxra()
if target then
local part = _Z6YCQ9rpCOZbbUA(target)
if part then
return part.Position
end
end
end
end
return _dVGaYGiuVnokz9sY(self, key)
end)
setreadonly(mt, true)
else
Notify("战斗", "静默瞄准已关闭", 3)
end
end,
})
_CRxJbiUhy6i:Divider()
local _HiVyZo5owz6M = nil
_CRxJbiUhy6i:Toggle({
Title = "自动开火",
Default = false,
Callback = function(val)
State.TriggerBot = val
if val then
Notify("战斗", "触发器已开启", 3)
_HiVyZo5owz6M = RunService.Heartbeat:Connect(function()
if not State.TriggerBot then return end
local target = _ccWZkCX3bxra()
if target then
local part = _Z6YCQ9rpCOZbbUA(target)
if part then
local _FfIkcyvSyIzSg, onScreen = _AqmnhL8iZP(part.Position)
local _Nnrh9jo6 = 1908
local center = _rrdlVNArGrXLg1Q()
local dist = (_FfIkcyvSyIzSg - center).Magnitude
if dist < 30 then
local tool = GetChar() and GetChar():FindFirstChildOfClass("Tool")
if tool then
pcall(function() tool:Activate() end)
pcall(function()
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
task.wait(State.TriggerDelay)
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
end)
end
end
end
end
end)
else
if _HiVyZo5owz6M then _HiVyZo5owz6M:Disconnect() _HiVyZo5owz6M = nil end
Notify("战斗", "触发器已关闭", 3)
end
end,
})
_CRxJbiUhy6i:Slider({
Title = "开火延迟",
Value = { Min = 1, Max = 100, Default = 5 },
Increment = 1,
Callback = function(val)
State.TriggerDelay = val / 100
end,
})
_CRxJbiUhy6i:Divider()
_CRxJbiUhy6i:Toggle({
Title = "碰撞箱放大",
Default = false,
Callback = function(val)
State.HitboxExpand = val
if val then
Notify("战斗", "Hitbox 扩大已开启", 3)
Connections.Hitbox = RunService.Heartbeat:Connect(function()
for _, plr in ipairs(Players:_th21THWNjmu83cr()) do
if plr ~= LocalPlayer and plr.Character then
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
if hrp and hum and hum.Health > 0 then
hrp.Size = Vector3.new(State.HitboxSize, State.HitboxSize, State.HitboxSize)
hrp.Transparency = 0.5
hrp.CanCollide = false
hrp.CanQuery = true
end
end
end
end)
else
if Connections.Hitbox then Connections.Hitbox:Disconnect() Connections.Hitbox = nil end
for _, plr in ipairs(Players:_th21THWNjmu83cr()) do
if plr ~= LocalPlayer and plr.Character then
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
if hrp then
hrp.Size = Vector3.new(2, 2, 1)
hrp.Transparency = 0
hrp.CanCollide = true
end
end
end
Notify("战斗", "Hitbox 扩大已关闭", 3)
end
end,
})
_CRxJbiUhy6i:Slider({
Title = "碰撞箱大小",
Value = { Min = 2, Max = 50, Default = 10 },
Increment = 1,
Callback = function(val)
State.HitboxSize = val
end,
})
_CRxJbiUhy6i:Divider()
_CRxJbiUhy6i:Section({ Title = "武器", TextXAlignment = "Left", TextSize = 17 })
_CRxJbiUhy6i:Toggle({
Title = "无限弹药",
Default = false,
Callback = function(val)
State.InfiniteAmmo = val
if val then
Notify("战斗", "无限弹药已开启", 3)
Connections.Ammo = RunService.Heartbeat:Connect(function()
local char = GetChar()
if not char then return end
for _, tool in ipairs(char:GetChildren()) do
if tool:IsA("Tool") then
pcall(function()
local acs = tool:FindFirstChild("ACS_Modulo")
if acs then
local vars = acs:FindFirstChild("Variaveis")
if vars then
for _, v in ipairs(vars:GetChildren()) do
local ln = string.lower(v.Name)
if string.find(ln, "ammo") or string.find(ln, "mag") or string.find(ln, "clip") or string.find(ln, "bullet") then
v.Value = 9999
end
end
end
end
for _, desc in ipairs(tool:GetDescendants()) do
if desc:IsA("ValueBase") then
local ln = string.lower(desc.Name)
if string.find(ln, "ammo") or string.find(ln, "mag") or string.find(ln, "clip") then
desc.Value = 9999
end
end
end
for k, _ in pairs(tool:GetAttributes()) do
local lk = string.lower(k)
if string.find(lk, "ammo") or string.find(lk, "mag") then
tool:SetAttribute(k, 9999)
end
end
end)
end
end
end)
else
if Connections.Ammo then Connections.Ammo:Disconnect() Connections.Ammo = nil end
Notify("战斗", "无限弹药已关闭", 3)
end
end,
})
_CRxJbiUhy6i:Toggle({
Title = "无后坐力",
Default = false,
Callback = function(val)
State.NoRecoil = val
if val then
Notify("战斗", "无后坐力已开启", 3)
Connections.Recoil = RunService.Heartbeat:Connect(function()
local char = GetChar()
if not char then return end
for _, tool in ipairs(char:GetChildren()) do
if tool:IsA("Tool") then
pcall(function()
local acs = tool:FindFirstChild("ACS_Modulo")
if acs then
local vars = acs:FindFirstChild("Variaveis")
if vars then
for _, v in ipairs(vars:GetChildren()) do
local ln = string.lower(v.Name)
if string.find(ln, "recoil") or string.find(ln, "kick") or string.find(ln, "spread")
or string.find(ln, "bloom") or string.find(ln, "shake") or string.find(ln, "deviation")
or string.find(ln, "sway") then
v.Value = 0
end
if string.find(ln, "accuracy") then v.Value = 100 end
if string.find(ln, "range") then v.Value = 9999 end
if string.find(ln, "firerate") then v.Value = 9999 end
end
end
end
for _, desc in ipairs(tool:GetDescendants()) do
if desc:IsA("ValueBase") then
local ln = string.lower(desc.Name)
local _FuiVAMVg = 7189
if string.find(ln, "recoil") or string.find(ln, "kick") or string.find(ln, "spread")
or string.find(ln, "bloom") or string.find(ln, "shake") or string.find(ln, "deviation") then
desc.Value = 0
end
end
end
end)
end
end
end)
else
if Connections.Recoil then Connections.Recoil:Disconnect() Connections.Recoil = nil end
Notify("战斗", "无后坐力已关闭", 3)
end
end,
})
_CRxJbiUhy6i:Toggle({
Title = "快速射击",
Default = false,
Callback = function(val)
State.RapidFire = val
if val then
Notify("战斗", "快速射击已开启", 3)
Connections.RapidFire = RunService.Heartbeat:Connect(function()
if not State.RapidFire then return end
if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
local char = GetChar()
if not char then return end
local tool = char:FindFirstChildOfClass("Tool")
if tool then
pcall(function() tool:Activate() end)
end
end
end)
else
if Connections.RapidFire then Connections.RapidFire:Disconnect() Connections.RapidFire = nil end
Notify("战斗", "快速射击已关闭", 3)
end
end,
})
_CRxJbiUhy6i:Toggle({
Title = "一拳超人 (伤害x100)",
Default = false,
Callback = function(val)
State.OnePunch = val
if val then
Notify("战斗", "一拳超人已开启! 伤害x100", 3)
local function _GiJibGKSiW6(tool)
if not tool or not tool:IsA("Tool") then return end
pcall(function()
local acs = tool:FindFirstChild("ACS_Modulo")
if acs then
local vars = acs:FindFirstChild("Variaveis")
if vars then
for _, v in ipairs(vars:GetChildren()) do
local ln = string.lower(v.Name)
if string.find(ln, "damage") or string.find(ln, "dmg") then
if v:IsA("NumberValue") or v:IsA("IntValue") then
v.Value = v.Value * 100
end
end
end
end
end
for _, desc in ipairs(tool:GetDescendants()) do
if desc:IsA("ValueBase") then
local ln = string.lower(desc.Name)
if string.find(ln, "damage") or string.find(ln, "dmg") then
if desc:IsA("NumberValue") or desc:IsA("IntValue") then
desc.Value = desc.Value * 100
end
end
end
end
for k, v in pairs(tool:GetAttributes()) do
local lk = string.lower(k)
if string.find(lk, "damage") or string.find(lk, "dmg") then
if type(v) == "number" then
tool:SetAttribute(k, v * 100)
end
end
end
if tool:FindFirstChild("Damage") then
local dmg = tool.Damage
if dmg:IsA("NumberValue") or dmg:IsA("IntValue") then
dmg.Value = dmg.Value * 100
end
end
end)
end
local char = GetChar()
if char then
for _, tool in ipairs(char:GetChildren()) do
_GiJibGKSiW6(tool)
end
end
Connections.OnePunch = RunService.Heartbeat:Connect(function()
if not State.OnePunch then return end
local c = GetChar()
if not c then return end
for _, tool in ipairs(c:GetChildren()) do
if tool:IsA("Tool") then
local already = tool:GetAttribute("OhioOnePunch")
if not already then
_GiJibGKSiW6(tool)
tool:SetAttribute("OhioOnePunch", true)
end
end
end
end)
local mt = getrawmetatable(game)
local _zM8CawJTfXdW4x = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
local method = getnamecallmethod()
if State.OnePunch and (method == "FireServer" or method == "InvokeServer") then
local args = {...}
pcall(function()
for i, arg in ipairs(args) do
if type(arg) == "number" then
if arg > 0 and arg < 1000 then
args[i] = arg * 100
end
end
end
end)
return _zM8CawJTfXdW4x(self, unpack(args))
end
return _zM8CawJTfXdW4x(self, ...)
end)
setreadonly(mt, true)
else
if Connections.OnePunch then Connections.OnePunch:Disconnect() Connections.OnePunch = nil end
Notify("战斗", "一拳超人已关闭", 3)
end
end,
})
local _Z5UEEXkFBMO211iA = Window:Tab({
Title = "玩家",
Icon = "user",
})
_Z5UEEXkFBMO211iA:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_Z5UEEXkFBMO211iA:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
State.WalkSpeed = val
local h = GetHum()
if h then h.WalkSpeed = val end
end,
})
_Z5UEEXkFBMO211iA:Slider({
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
_Z5UEEXkFBMO211iA:Divider()
_Z5UEEXkFBMO211iA:Toggle({
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
_Z5UEEXkFBMO211iA:Toggle({
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
_Z5UEEXkFBMO211iA:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
State.GodMode = val
if val then
Notify("玩家", "无敌已开启", 3)
Connections.GodMode = RunService.Heartbeat:Connect(function()
local h = GetHum()
if h and h.Health < h.MaxHealth then
h.Health = h.MaxHealth
end
end)
else
if Connections.GodMode then Connections.GodMode:Disconnect() Connections.GodMode = nil end
Notify("玩家", "无敌已关闭", 3)
end
end,
})
_Z5UEEXkFBMO211iA:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
State.NoFallDamage = val
if val then
Notify("玩家", "摔落无伤害已开启", 3)
local function _Ob5PRnBFVaURVW7(h)
if not h then return end
local _J5AaBPUXyFB5VdO = h.Health
h.StateChanged:Connect(function(old, new)
if not State.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_J5AaBPUXyFB5VdO = h.Health
elseif old == Enum.HumanoidStateType.Freefall then
if h.Health < _J5AaBPUXyFB5VdO then
h.Health = _J5AaBPUXyFB5VdO
end
end
end)
end
local c = GetChar()
if c then _Ob5PRnBFVaURVW7(c:FindFirstChildOfClass("Humanoid")) end
Connections.NoFall = LocalPlayer.CharacterAdded:Connect(function(char)
task.wait(0.3)
if State.NoFallDamage then
_Ob5PRnBFVaURVW7(char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid"))
end
end)
else
if Connections.NoFall then Connections.NoFall:Disconnect() Connections.NoFall = nil end
Notify("玩家", "摔落无伤害已关闭", 3)
end
end,
})
_Z5UEEXkFBMO211iA:Divider()
local _X4biaTiscU = false
_Z5UEEXkFBMO211iA:Button({
Title = "飞行 (手机版)",
Callback = function()
if _X4biaTiscU then
Notify("飞行", "飞行面板已打开, 请用面板上的按钮控制", 3)
return
end
_X4biaTiscU = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/飞行脚本V3(全游戏通用).txt"))()
end,
})
local _8uGTB5BoQExu8t5 = Window:Tab({
Title = "视觉",
Icon = "eye",
})
_8uGTB5BoQExu8t5:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })
local function _krUKAtuJ6j(player)
if player == LocalPlayer then return end
if ESPObjects[player] then return end
local _n4WHxRW5y8hh = Instance.new("BillboardGui")
_n4WHxRW5y8hh.Name = "ESP_" .. player.Name
_n4WHxRW5y8hh.Size = UDim2.new(0, 200, 0, 60)
_n4WHxRW5y8hh.StudsOffset = Vector3.new(0, 3, 0)
_n4WHxRW5y8hh.AlwaysOnTop = true
_n4WHxRW5y8hh.LightInfluence = 0
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundTransparency = 1
frame.Parent = _n4WHxRW5y8hh
local _JVuEo5DafgR6TaJ = Instance.new("TextLabel")
_JVuEo5DafgR6TaJ.Size = UDim2.new(1, 0, 0, 20)
_JVuEo5DafgR6TaJ.Position = UDim2.new(0, 0, 0, 0)
_JVuEo5DafgR6TaJ.BackgroundTransparency = 1
_JVuEo5DafgR6TaJ.TextColor3 = Color3.fromRGB(255, 255, 255)
_JVuEo5DafgR6TaJ.TextSize = 14
_JVuEo5DafgR6TaJ.Font = Enum.Font.SourceSansBold
_JVuEo5DafgR6TaJ.TextStrokeTransparency = 0.5
_JVuEo5DafgR6TaJ.Text = player.Name
_JVuEo5DafgR6TaJ.Parent = frame
local _vtlCiUa69Z = Instance.new("TextLabel")
_vtlCiUa69Z.Size = UDim2.new(1, 0, 0, 18)
_vtlCiUa69Z.Position = UDim2.new(0, 0, 0, 20)
_vtlCiUa69Z.BackgroundTransparency = 1
_vtlCiUa69Z.TextColor3 = Color3.fromRGB(200, 200, 200)
_vtlCiUa69Z.TextSize = 12
_vtlCiUa69Z.Font = Enum.Font.SourceSans
_vtlCiUa69Z.Text = ""
_vtlCiUa69Z.Parent = frame
local _bl2Muo6mhY7d = Instance.new("TextLabel")
_bl2Muo6mhY7d.Size = UDim2.new(1, 0, 0, 18)
_bl2Muo6mhY7d.Position = UDim2.new(0, 0, 0, 40)
_bl2Muo6mhY7d.BackgroundTransparency = 1
_bl2Muo6mhY7d.TextColor3 = Color3.fromRGB(100, 255, 100)
_bl2Muo6mhY7d.TextSize = 12
_bl2Muo6mhY7d.Font = Enum.Font.SourceSans
_bl2Muo6mhY7d.Text = ""
_bl2Muo6mhY7d.Parent = frame
local _OwEeyTsRzVdsIRzB = Instance.new("BillboardGui")
_OwEeyTsRzVdsIRzB.Name = "ESPBox_" .. player.Name
_OwEeyTsRzVdsIRzB.Size = UDim2.new(0, 100, 0, 150)
_OwEeyTsRzVdsIRzB.AlwaysOnTop = true
_OwEeyTsRzVdsIRzB.LightInfluence = 0
local topLeft = Instance.new("Frame")
local _uNf2VavJ = 1724
topLeft.Size = UDim2.new(0, 15, 0, 2)
topLeft.Position = UDim2.new(0, 0, 0, 0)
topLeft.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
topLeft.BorderSizePixel = 0
topLeft.Parent = _OwEeyTsRzVdsIRzB
local _KQ1qurwRxQ = Instance.new("Frame")
_KQ1qurwRxQ.Size = UDim2.new(0, 15, 0, 2)
_KQ1qurwRxQ.Position = UDim2.new(1, -15, 0, 0)
_KQ1qurwRxQ.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
_KQ1qurwRxQ.BorderSizePixel = 0
_KQ1qurwRxQ.Parent = _OwEeyTsRzVdsIRzB
local _eWiq3PHMaUK = Instance.new("Frame")
_eWiq3PHMaUK.Size = UDim2.new(0, 15, 0, 2)
_eWiq3PHMaUK.Position = UDim2.new(0, 0, 1, -2)
_eWiq3PHMaUK.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
_eWiq3PHMaUK.BorderSizePixel = 0
_eWiq3PHMaUK.Parent = _OwEeyTsRzVdsIRzB
local _qDnetORkjfd = Instance.new("Frame")
_qDnetORkjfd.Size = UDim2.new(0, 15, 0, 2)
_qDnetORkjfd.Position = UDim2.new(1, -15, 1, -2)
_qDnetORkjfd.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
_qDnetORkjfd.BorderSizePixel = 0
_qDnetORkjfd.Parent = _OwEeyTsRzVdsIRzB
ESPObjects[player] = {
_n4WHxRW5y8hh = _n4WHxRW5y8hh,
_JVuEo5DafgR6TaJ = _JVuEo5DafgR6TaJ,
_vtlCiUa69Z = _vtlCiUa69Z,
_bl2Muo6mhY7d = _bl2Muo6mhY7d,
_OwEeyTsRzVdsIRzB = _OwEeyTsRzVdsIRzB,
}
end
local function _MrmiVReVKsN9(player)
if ESPObjects[player] then
if ESPObjects[player]._n4WHxRW5y8hh then ESPObjects[player]._n4WHxRW5y8hh:Destroy() end
if ESPObjects[player]._OwEeyTsRzVdsIRzB then ESPObjects[player]._OwEeyTsRzVdsIRzB:Destroy() end
ESPObjects[player] = nil
end
end
local function _UWbgoY7HbzW(player)
if not ESPObjects[player] then return end
local char = player.Character
if not char then return end
local hrp = char:FindFirstChild("HumanoidRootPart")
local head = char:FindFirstChild("Head")
if hrp then
ESPObjects[player]._n4WHxRW5y8hh.Adornee = head or hrp
ESPObjects[player]._OwEeyTsRzVdsIRzB.Adornee = hrp
end
end
_8uGTB5BoQExu8t5:Toggle({
Title = "人物透视",
Default = false,
Callback = function(val)
State.ESPEnabled = val
if val then
Notify("视觉", "ESP 已开启", 3)
for _, plr in ipairs(Players:_th21THWNjmu83cr()) do
if plr ~= LocalPlayer then _krUKAtuJ6j(plr) end
end
Connections.ESPUpdate = RunService.Heartbeat:Connect(function()
for plr, data in pairs(ESPObjects) do
local char = plr.Character
if char then
local hrp = char:FindFirstChild("HumanoidRootPart")
local hum = char:FindFirstChildOfClass("Humanoid")
local head = char:FindFirstChild("Head")
local root = GetRoot()
_UWbgoY7HbzW(plr)
if data._JVuEo5DafgR6TaJ then
data._JVuEo5DafgR6TaJ.Visible = State.ESPNames
data._JVuEo5DafgR6TaJ.Text = plr.Name
if hum and hum.Health > 0 then
data._JVuEo5DafgR6TaJ.TextColor3 = Color3.fromRGB(255, 255, 255)
else
data._JVuEo5DafgR6TaJ.TextColor3 = Color3.fromRGB(150, 150, 150)
end
end
if data._vtlCiUa69Z then
data._vtlCiUa69Z.Visible = State.ESPDistance
if root and hrp then
local dist = math.floor((root.Position - hrp.Position).Magnitude)
data._vtlCiUa69Z.Text = dist .. " studs"
end
end
if data._bl2Muo6mhY7d then
data._bl2Muo6mhY7d.Visible = State.ESPHealth
if hum then
local hp = math.floor(hum.Health)
local maxHp = math.floor(hum.MaxHealth)
data._bl2Muo6mhY7d.Text = hp .. " / " .. maxHp
local pct = hum.Health / hum.MaxHealth
if pct > 0.5 then
data._bl2Muo6mhY7d.TextColor3 = Color3.fromRGB(100, 255, 100)
elseif pct > 0.25 then
data._bl2Muo6mhY7d.TextColor3 = Color3.fromRGB(255, 255, 100)
else
data._bl2Muo6mhY7d.TextColor3 = Color3.fromRGB(255, 100, 100)
end
end
end
if data._OwEeyTsRzVdsIRzB then
data._OwEeyTsRzVdsIRzB.Enabled = State.ESPBoxes
end
end
end
end)
Connections.PlayerAdded = Players.PlayerAdded:Connect(function(plr) _krUKAtuJ6j(plr) end)
Connections.PlayerRemoving = Players.PlayerRemoving:Connect(function(plr) _MrmiVReVKsN9(plr) end)
else
if Connections.ESPUpdate then Connections.ESPUpdate:Disconnect() Connections.ESPUpdate = nil end
if Connections.PlayerAdded then Connections.PlayerAdded:Disconnect() Connections.PlayerAdded = nil end
if Connections.PlayerRemoving then Connections.PlayerRemoving:Disconnect() Connections.PlayerRemoving = nil end
for plr, _ in pairs(ESPObjects) do _MrmiVReVKsN9(plr) end
ESPObjects = {}
Notify("视觉", "ESP 已关闭", 3)
end
end,
})
_8uGTB5BoQExu8t5:Toggle({
Title = "显示名字",
Default = true,
Callback = function(val) State.ESPNames = val end,
})
_8uGTB5BoQExu8t5:Toggle({
Title = "显示距离",
Default = true,
Callback = function(val) State.ESPDistance = val end,
})
_8uGTB5BoQExu8t5:Toggle({
Title = "显示血量",
Default = true,
Callback = function(val) State.ESPHealth = val end,
})
_8uGTB5BoQExu8t5:Toggle({
Title = "显示方框",
Default = false,
Callback = function(val) State.ESPBoxes = val end,
})
_8uGTB5BoQExu8t5:Divider()
_8uGTB5BoQExu8t5:Toggle({
Title = "追踪线",
Default = false,
Callback = function(val)
State.Tracers = val
if val then
Notify("视觉", "追踪线已开启", 3)
local _oVg5WnGwPoJMv = Instance.new("Folder")
_oVg5WnGwPoJMv.Name = "OhioTracers"
_oVg5WnGwPoJMv.Parent = Workspace
Connections.Tracers = RunService.RenderStepped:Connect(function()
_oVg5WnGwPoJMv:ClearAllChildren()
if not State.Tracers then return end
local root = GetRoot()
if not root then return end
local center = _rrdlVNArGrXLg1Q()
for _, plr in ipairs(Players:_th21THWNjmu83cr()) do
if plr ~= LocalPlayer and plr.Character then
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
if hrp and hum and hum.Health > 0 then
local _FfIkcyvSyIzSg, onScreen = _AqmnhL8iZP(hrp.Position)
if onScreen then
local tracer = Instance.new("Frame")
tracer.AnchorPoint = Vector2.new(0, 0.5)
tracer.Size = UDim2.new(0, (_FfIkcyvSyIzSg - center).Magnitude, 0, 2)
tracer.Position = UDim2.new(0, center.X, 0, center.Y)
tracer.Rotation = math.deg(math.atan2(_FfIkcyvSyIzSg.Y - center.Y, _FfIkcyvSyIzSg.X - center.X))
tracer.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
tracer.BorderSizePixel = 0
tracer.Parent = _oVg5WnGwPoJMv
end
end
end
end
end)
else
if Connections.Tracers then Connections.Tracers:Disconnect() Connections.Tracers = nil end
local tf = Workspace:FindFirstChild("OhioTracers")
if tf then tf:Destroy() end
Notify("视觉", "追踪线已关闭", 3)
end
end,
})
_8uGTB5BoQExu8t5:Toggle({
Title = "显示瞄准圈",
Default = false,
Callback = function(val)
State.ShowFOV = val
if val then
_AJCO4pKWbGrcQwb = Instance.new("Frame")
_AJCO4pKWbGrcQwb.Name = "OhioFOV"
_AJCO4pKWbGrcQwb.Size = UDim2.new(0, State.AimbotFOV * 2, 0, State.AimbotFOV * 2)
_AJCO4pKWbGrcQwb.AnchorPoint = Vector2.new(0.5, 0.5)
_AJCO4pKWbGrcQwb.Position = UDim2.new(0.5, 0, 0.5, 0)
_AJCO4pKWbGrcQwb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_AJCO4pKWbGrcQwb.BackgroundTransparency = 1
_AJCO4pKWbGrcQwb.BorderSizePixel = 2
local _w5Gd6nD1pqrvO0uq = Instance.new("UICorner")
_w5Gd6nD1pqrvO0uq.CornerRadius = UDim.new(1, 0)
_w5Gd6nD1pqrvO0uq.Parent = _AJCO4pKWbGrcQwb
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 1.5
stroke.Transparency = 0.3
stroke.Parent = _AJCO4pKWbGrcQwb
_AJCO4pKWbGrcQwb.Parent = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("CoreGui") or
(function()
local gui = Instance.new("ScreenGui")
gui.Name = "OhioGUI"
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
return gui
end)()
_AJCO4pKWbGrcQwb.Radius = State.AimbotFOV
else
if _AJCO4pKWbGrcQwb then _AJCO4pKWbGrcQwb:Destroy() _AJCO4pKWbGrcQwb = nil end
end
end,
})
_8uGTB5BoQExu8t5:Divider()
_8uGTB5BoQExu8t5:Section({ Title = "渲染", TextXAlignment = "Left", TextSize = 17 })
_8uGTB5BoQExu8t5:Toggle({
Title = "透视高亮",
Default = false,
Callback = function(val)
State.Chams = val
if val then
Notify("视觉", "Chams 已开启", 3)
Connections.Chams = RunService.Heartbeat:Connect(function()
for _, plr in ipairs(Players:_th21THWNjmu83cr()) do
if plr ~= LocalPlayer and plr.Character then
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
if hum and hum.Health > 0 then
for _, part in ipairs(plr.Character:GetChildren()) do
if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
if not part:FindFirstChild("OhioChams") then
local hl = Instance.new("Highlight")
hl.Name = "OhioChams"
hl.FillColor = Color3.fromRGB(255, 50, 50)
hl.FillTransparency = 0.5
hl.OutlineColor = Color3.fromRGB(255, 255, 255)
hl.OutlineTransparency = 0
hl.Parent = part
end
end
end
end
end
end
end)
else
if Connections.Chams then Connections.Chams:Disconnect() Connections.Chams = nil end
for _, plr in ipairs(Players:_th21THWNjmu83cr()) do
if plr ~= LocalPlayer and plr.Character then
for _, part in ipairs(plr.Character:GetDescendants()) do
if part:IsA("Highlight") and part.Name == "OhioChams" then
part:Destroy()
end
end
end
end
Notify("视觉", "Chams 已关闭", 3)
end
end,
})
_8uGTB5BoQExu8t5:Toggle({
Title = "全图高亮",
Default = false,
Callback = function(val)
State.Fullbright = val
if val then
Notify("视觉", "全亮已开启", 3)
Lighting.Brightness = 3
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Lighting.FogStart = 0
Lighting.GlobalShadows = false
Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1
Connections.Fullbright = RunService.Heartbeat:Connect(function()
Lighting.Brightness = 3
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Lighting.GlobalShadows = false
end)
else
if Connections.Fullbright then Connections.Fullbright:Disconnect() Connections.Fullbright = nil end
Lighting.Brightness = 1
Lighting.ClockTime = 12
Lighting.FogEnd = 100000
Lighting.GlobalShadows = true
Notify("视觉", "全亮已关闭", 3)
end
end,
})
local _ki7owKJSmWdoBYch = Window:Tab({
Title = "传送",
Icon = "map-pin",
})
_ki7owKJSmWdoBYch:Section({ Title = "传送", TextXAlignment = "Left", TextSize = 17 })
local _sfWjBII63IHNarDn = nil
_ki7owKJSmWdoBYch:Dropdown({
Title = "选择玩家",
Value = { Default = "" },
Items = function()
return _th21THWNjmu83cr()
end,
Callback = function(val)
_sfWjBII63IHNarDn = val
end,
})
_ki7owKJSmWdoBYch:Button({
Title = "传送到选中玩家",
Callback = function()
if not _sfWjBII63IHNarDn or _sfWjBII63IHNarDn == "" then
Notify("传送", "请先选择玩家", 3)
return
end
local plr = Players:FindFirstChild(_sfWjBII63IHNarDn)
if plr and plr.Character then
local _TLKLf0TAzgQNL = plr.Character:FindFirstChild("HumanoidRootPart")
local _XlTgyxcu = 8175
local myRoot = GetRoot()
if _TLKLf0TAzgQNL and myRoot then
myRoot.CFrame = _TLKLf0TAzgQNL.CFrame * CFrame.new(0, 0, 5)
Notify("传送", "已传送到 " .. _sfWjBII63IHNarDn, 3)
end
else
Notify("传送", "玩家不存在或无角色", 3)
end
end,
})
_ki7owKJSmWdoBYch:Button({
Title = "传送到触点",
Callback = function()
local root = GetRoot()
if root then
root.CFrame = Mouse.Hit
Notify("传送", "已传送到鼠标位置", 3)
end
end,
})
_ki7owKJSmWdoBYch:Button({
Title = "传送到出生点",
Callback = function()
local spawn = Workspace:FindFirstChildOfClass("SpawnLocation")
local root = GetRoot()
if spawn and root then
root.CFrame = spawn.CFrame * CFrame.new(0, 5, 0)
Notify("传送", "已传送到出生点", 3)
else
Notify("传送", "未找到出生点", 3)
end
end,
})
_ki7owKJSmWdoBYch:Divider()
_ki7owKJSmWdoBYch:Section({ Title = "快速地点", TextXAlignment = "Left", TextSize = 17 })
local _8TVG8BUZDE0J = {
{ name = "商店", keywords = {"shop", "store", "market"} },
{ name = "银行", keywords = {"bank"} },
{ name = "警察局", keywords = {"police", "station"} },
{ name = "医院", keywords = {"hospital", "clinic"} },
{ name = "车库", keywords = {"garage", "car"} },
{ name = "机场", keywords = {"airport", "plane"} },
}
for _, loc in ipairs(_8TVG8BUZDE0J) do
_ki7owKJSmWdoBYch:Button({
Title = "传送到" .. loc.name,
Callback = function()
local found = false
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local ln = string.lower(obj.Name)
for _, kw in ipairs(loc.keywords) do
if string.find(ln, kw) then
local root = GetRoot()
if root then
local cf = obj:IsA("BasePart") and obj.CFrame or (obj:GetPivot())
root.CFrame = cf * CFrame.new(0, 5, 0)
Notify("传送", "已传送到" .. loc.name, 3)
found = true
end
break
end
end
if found then break end
end
end
if not found then
Notify("传送", "未找到" .. loc.name, 3)
end
end,
})
end
_ki7owKJSmWdoBYch:Divider()
local _5XmziOn1JLdq = nil
local _lKB7Pct5KSBh = nil
_ki7owKJSmWdoBYch:Toggle({
Title = "长按传送",
Default = false,
Callback = function(val)
if val then
Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
_5XmziOn1JLdq = UserInputService.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_lKB7Pct5KSBh = tick()
end
end)
Connections.TpHold = RunService.Heartbeat:Connect(function()
if not _lKB7Pct5KSBh then return end
local _Bhx1ny2EOoP = tick() - _lKB7Pct5KSBh
if _Bhx1ny2EOoP >= 0.5 then
local root = GetRoot()
if root then
root.CFrame = Mouse.Hit
end
_lKB7Pct5KSBh = nil
end
end)
Connections.TpEnd = UserInputService.InputEnded:Connect(function(input, gpe)
_lKB7Pct5KSBh = nil
end)
else
if _5XmziOn1JLdq then _5XmziOn1JLdq:Disconnect() _5XmziOn1JLdq = nil end
if Connections.TpHold then Connections.TpHold:Disconnect() Connections.TpHold = nil end
if Connections.TpEnd then Connections.TpEnd:Disconnect() Connections.TpEnd = nil end
_lKB7Pct5KSBh = nil
Notify("传送", "长按传送已关闭", 3)
end
end,
})
local _Q7v1eBPrX9RJ7fQ = Window:Tab({
Title = "经济",
Icon = "dollar-sign",
})
_Q7v1eBPrX9RJ7fQ:Section({ Title = "自动收集", TextXAlignment = "Left", TextSize = 17 })
_Q7v1eBPrX9RJ7fQ:Toggle({
Title = "自动收集现金",
Default = false,
Callback = function(val)
State.AutoCash = val
if val then
Notify("经济", "自动收集现金已开启", 3)
Connections.AutoCash = RunService.Heartbeat:Connect(function()
if not State.AutoCash then return end
local root = GetRoot()
if root then
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local ln = string.lower(obj.Name)
if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "coin") or string.find(ln, "pickup") then
pcall(function()
obj.CFrame = root.CFrame
end)
end
end
end
end
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "collect") or string.find(ln, "reward") then
obj:FireServer()
end
elseif obj:IsA("RemoteFunction") then
local ln = string.lower(obj.Name)
if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "collect") then
obj:InvokeServer()
end
end
end
end)
end)
else
if Connections.AutoCash then Connections.AutoCash:Disconnect() Connections.AutoCash = nil end
Notify("经济", "自动收集现金已关闭", 3)
end
end,
})
_Q7v1eBPrX9RJ7fQ:Divider()
_Q7v1eBPrX9RJ7fQ:Section({ Title = "刷钱", TextXAlignment = "Left", TextSize = 17 })
_Q7v1eBPrX9RJ7fQ:Button({
Title = "扫描给钱接口",
Callback = function()
local results = {}
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local ln = string.lower(obj.Name)
if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "buy")
or string.find(ln, "reward") or string.find(ln, "give") or string.find(ln, "collect") then
table.insert(results, obj:GetFullName())
end
end
end
local msg = #results > 0 and table.concat(results, "\n") or "未找到经济相关 Remote"
Notify("扫描结果", msg, 10)
end,
})
_Q7v1eBPrX9RJ7fQ:Button({
Title = "尝试刷钱",
Callback = function()
local count = 0
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
pcall(function()
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "give")
or string.find(ln, "reward") or string.find(ln, "collect") then
obj:FireServer()
count = count + 1
end
elseif obj:IsA("RemoteFunction") then
local ln = string.lower(obj.Name)
if string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "give") then
obj:InvokeServer()
count = count + 1
end
end
end)
end
Notify("经济", "尝试触发了 " .. count .. " 个 Remote", 5)
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
Notify("实用", "防挂机已开启", 3)
Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
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
Notify("实用", "FPS 加速已开启", 3)
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
pcall(function()
if obj.Material == Enum.Material.Neon or obj.Material == Enum.Material.Glass then
obj.Material = Enum.Material.Plastic
end
end)
end
end
Lighting.GlobalShadows = false
settings().Rendering.QualityLevel = 1
Lighting.FogEnd = 9e9
Connections.FPSBoost = RunService.Heartbeat:Connect(function()
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false end)
end
end
end)
else
if Connections.FPSBoost then Connections.FPSBoost:Disconnect() Connections.FPSBoost = nil end
settings().Rendering.QualityLevel = Enum.RenderingQuality.Automatic
Lighting.FogEnd = 100000
Notify("实用", "FPS 加速已关闭", 3)
end
end,
})
MiscTab:Divider()
MiscTab:Button({
Title = "换服",
Callback = function()
Notify("实用", "正在跳转服务器...", 3)
local placeId = game.PlaceId
TeleportService:Teleport(placeId, LocalPlayer)
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
MiscTab:Divider()
MiscTab:Section({ Title = "角色信息", TextXAlignment = "Left", TextSize = 17 })
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
table.insert(info, "跳跃: " .. (h.UseJumpPower and h.JumpPower or h.JumpHeight))
end
local root = GetRoot()
if root then
table.insert(info, "位置: " .. tostring(root.Position))
end
local tool = char:FindFirstChildOfClass("Tool")
if tool then
table.insert(info, "手持: " .. tool.Name)
end
Notify("角色信息", table.concat(info, "\n"), 10)
end,
})
MiscTab:Button({
Title = "重置角色",
Callback = function()
local h = GetHum()
if h then
h.Health = 0
Notify("实用", "已重置角色", 3)
end
end,
})
MiscTab:Divider()
MiscTab:Section({ Title = "清理", TextXAlignment = "Left", TextSize = 17 })
MiscTab:Button({
Title = "清理所有特效",
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
for plr, _ in pairs(ESPObjects) do _MrmiVReVKsN9(plr) end
ESPObjects = {}
local tf = Workspace:FindFirstChild("OhioTracers")
if tf then tf:Destroy() end
if _AJCO4pKWbGrcQwb then _AJCO4pKWbGrcQwb:Destroy() _AJCO4pKWbGrcQwb = nil end
Notify("实用", "脚本已卸载", 3)
end,
})
Notify("Ohio 脚本", "Ohio 超级脚本已加载!", 5)
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