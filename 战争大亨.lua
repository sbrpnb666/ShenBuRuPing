local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Window = WindUI:CreateWindow({
Title = "战争大亨",
Icon = "swords",
Author = "战争大亨脚本",
Folder = "WarTycoon",
Size = UDim2.fromOffset(450, 450),
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
local _vcFg1RQRZtt8 = Color3.fromHSV(hue, 1, 1)
TimeTag:SetTitle(hours .. ":" .. minutes)
TimeTag:SetColor(_vcFg1RQRZtt8)
task.wait(0.06)
end
end)
Window:Tag({
Title = "战争大亨",
Color = Color3.fromHex("#FF6B6B")
})
Window:EditOpenButton({
Title = "战争大亨",
Icon = "swords",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
Draggable = true,
})
local State = {
AutoCash = false,
ESPEnabled = false,
InfiniteAmmo = false,
NoRecoil = false,
AutoFire = false,
WalkSpeed = 16,
JumpPower = 50,
NoClip = false,
FlyEnabled = false,
GodMode = false,
NoFallDamage = false,
AimbotEnabled = false,
BulletTracer = false,
OneHitKill = false,
}
local Connections = {}
local ESPObjects = {}
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
local function _baABNqaicrLR(parent, duration)
for _, desc in ipairs(parent:GetDescendants()) do
if desc:IsA("ProximityPrompt") then
desc.HoldDuration = duration
end
end
end
local F = {
Active = false,
Connection = nil,
Bind = nil,
Enable = function()
F.Active = true
local _rs2lZ6LuS1Fa6vr = game:GetService("ProximityPromptService")
F.Bind = _rs2lZ6LuS1Fa6vr.PromptButtonHoldBegan:Connect(function(prompt)
prompt.HoldDuration = 0.01
end)
_baABNqaicrLR(Workspace, 0.01)
F.Connection = Workspace.DescendantAdded:Connect(function(desc)
if desc:IsA("ProximityPrompt") and F.Active then
desc.HoldDuration = 0.01
end
end)
end,
Disable = function()
F.Active = false
if F.Bind then F.Bind:Disconnect(); F.Bind = nil end
if F.Connection then F.Connection:Disconnect(); F.Connection = nil end
_baABNqaicrLR(Workspace, 0.5)
end
}
local function _Gy4A7jVD2vDp()
local remotes = {}
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local name = string.lower(obj.Name)
if string.find(name, "cash") or string.find(name, "money") or string.find(name, "collect") or string.find(name, "reward") then
table.insert(remotes, obj)
end
end
end
return remotes
end
local function _ARvLpMKAqWfFR9()
local parts = {}
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local name = string.lower(obj.Name)
if string.find(name, "cash") or string.find(name, "money") or string.find(name, "collect") then
table.insert(parts, obj)
end
end
end
return parts
end
local _95oedBEhQDg6oHM = Window:Tab({
Title = "大亨",
Icon = "factory",
})
_95oedBEhQDg6oHM:Section({ Title = "自动收集", TextXAlignment = "Left", TextSize = 17 })
_95oedBEhQDg6oHM:Toggle({
Title = "自动收集现金",
Default = false,
Callback = function(val)
State.AutoCash = val
if val then
Notify("自动收集", "已开启自动收集现金", 3)
Connections.AutoCash = RunService.Heartbeat:Connect(function()
local root = GetRoot()
if not root then return end
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local name = string.lower(obj.Name)
if (string.find(name, "cash") or string.find(name, "money") or string.find(name, "collect")) and obj:IsA("BasePart") then
local dist = (obj.Position - root.Position).Magnitude
if dist < 200 then
obj.Position = root.Position + Vector3.new(0, 5, 0)
end
end
end
end
end)
else
if Connections.AutoCash then Connections.AutoCash:Disconnect() Connections.AutoCash = nil end
Notify("自动收集", "已关闭自动收集现金", 3)
end
end,
})
_95oedBEhQDg6oHM:Divider()
local _q2BWnzEi1joPAwLa = {}
_95oedBEhQDg6oHM:Button({
Title = "扫描金钱 RemoteEvent",
Callback = function()
_q2BWnzEi1joPAwLa = _Gy4A7jVD2vDp()
Notify("扫描完成", "找到 " .. #_q2BWnzEi1joPAwLa .. " 个相关 RemoteEvent", 5)
end,
})
_95oedBEhQDg6oHM:Button({
Title = "尝试 +$100000",
Callback = function()
local found = false
for _, remote in ipairs(_q2BWnzEi1joPAwLa) do
pcall(function()
if remote:IsA("RemoteEvent") then
remote:FireServer(100000)
elseif remote:IsA("RemoteFunction") then
remote:InvokeServer(100000)
end
found = true
end)
end
if found then
Notify("发送请求", "已尝试发送金钱请求", 3)
else
Notify("提示", "请先扫描 RemoteEvent", 3)
end
end,
})
_95oedBEhQDg6oHM:Divider()
_95oedBEhQDg6oHM:Toggle({
Title = "自动触碰收集板",
Default = false,
Callback = function(val)
if val then
Connections.TouchCollect = RunService.Heartbeat:Connect(function()
local root = GetRoot()
if not root then return end
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local name = string.lower(obj.Name)
if string.find(name, "collect") or string.find(name, "pad") or string.find(name, "button") then
local dist = (obj.Position - root.Position).Magnitude
if dist < 50 then
firetouchinterest(root, obj, 0)
end
end
end
end
end)
else
if Connections.TouchCollect then Connections.TouchCollect:Disconnect() Connections.TouchCollect = nil end
end
end,
})
local _Awf7nFqxfjhCMd = Window:Tab({
Title = "战斗",
Icon = "swords",
})
_Awf7nFqxfjhCMd:Section({ Title = "武器功能", TextXAlignment = "Left", TextSize = 17 })
_Awf7nFqxfjhCMd:Button({
Title = "扫描武器信息 (输出到通知)",
Callback = function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local info = {}
local char = GetChar()
if char then
for _, tool in ipairs(char:GetChildren()) do
if tool:IsA("Tool") then
table.insert(info, "Tool: " .. tool.Name)
for _, d in ipairs(tool:GetDescendants()) do
if d:IsA("RemoteEvent") or d:IsA("RemoteFunction") then
table.insert(info, "  Remote: " .. d:GetFullName())
elseif d:IsA("ValueBase") then
table.insert(info, "  Value: " .. d.Name .. " = " .. tostring(d.Value))
end
end
end
end
end
local bp = LocalPlayer:FindFirstChild("Backpack")
if bp then
for _, tool in ipairs(bp:GetChildren()) do
if tool:IsA("Tool") then
table.insert(info, "Backpack Tool: " .. tool.Name)
end
end
end
for _, d in ipairs(ReplicatedStorage:GetDescendants()) do
if d:IsA("RemoteEvent") or d:IsA("RemoteFunction") then
local ln = string.lower(d.Name)
if string.find(ln, "fire") or string.find(ln, "shoot") or string.find(ln, "weapon") or string.find(ln, "gun") or string.find(ln, "ammo") then
table.insert(info, "RS Remote: " .. d:GetFullName())
end
end
end
local ls = LocalPlayer:FindFirstChild("leaderstats")
if ls then
for _, v in ipairs(ls:GetChildren()) do
table.insert(info, "Stat: " .. v.Name .. " = " .. tostring(v.Value))
end
end
local msg = table.concat(info, "\n")
if msg == "" then msg = "未找到任何武器相关信息" end
Notify("扫描结果", msg, 10)
end,
})
_Awf7nFqxfjhCMd:Divider()
local _oqDYVpohTZ2GgYFD = nil
_Awf7nFqxfjhCMd:Toggle({
Title = "自动射击 (全兼容)",
Default = false,
Callback = function(val)
State.AutoFire = val
if val then
Notify("战斗", "自动射击已开启", 3)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local _xMFCasAs51F = {"fire", "shoot", "attack", "click", "gun", "weapon"}
local _KITCLOH7E8D = 0
_oqDYVpohTZ2GgYFD = RunService.Heartbeat:Connect(function()
local now = tick()
if now - _KITCLOH7E8D < 0.1 then return end
_KITCLOH7E8D = now
local char = GetChar()
if not char then return end
local tool = char:FindFirstChildOfClass("Tool")
if tool then
pcall(function() tool:Activate() end)
end
pcall(function()
local mouse = LocalPlayer:GetMouse()
if tool and mouse then
VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 0, true, game, 1)
VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 0, false, game, 1)
end
end)
if tool then
for _, desc in ipairs(tool:GetDescendants()) do
pcall(function()
if desc:IsA("RemoteEvent") then
local ln = string.lower(desc.Name)
for _, kw in ipairs(_xMFCasAs51F) do
if string.find(ln, kw) then
desc:FireServer()
break
end
end
elseif desc:IsA("RemoteFunction") then
local ln = string.lower(desc.Name)
for _, kw in ipairs(_xMFCasAs51F) do
if string.find(ln, kw) then
desc:InvokeServer()
break
end
end
end
end)
end
end
pcall(function()
for _, desc in ipairs(ReplicatedStorage:GetDescendants()) do
if desc:IsA("RemoteEvent") then
local ln = string.lower(desc.Name)
for _, kw in ipairs(_xMFCasAs51F) do
if string.find(ln, kw) then
desc:FireServer()
break
end
end
end
end
end)
end)
else
if _oqDYVpohTZ2GgYFD then _oqDYVpohTZ2GgYFD:Disconnect() _oqDYVpohTZ2GgYFD = nil end
Notify("战斗", "自动射击已关闭", 3)
end
end,
})
local _rUihREeo1Ydof = nil
_Awf7nFqxfjhCMd:Toggle({
Title = "无限弹药",
Default = false,
Callback = function(val)
State.InfiniteAmmo = val
if val then
Notify("战斗", "无限弹药已开启", 3)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
pcall(function()
local _mjXFaoIBi5AZ = ReplicatedStorage:FindFirstChild("BulletFireSystem")
and ReplicatedStorage.BulletFireSystem:FindFirstChild("GunReload")
if _mjXFaoIBi5AZ then
_mjXFaoIBi5AZ:Destroy()
local fake = Instance.new("Part")
fake.Name = "GunReload"
fake.Parent = ReplicatedStorage.BulletFireSystem
end
end)
_rUihREeo1Ydof = RunService.Heartbeat:Connect(function()
local char = GetChar()
if not char then return end
for _, tool in ipairs(char:GetChildren()) do
if tool:IsA("Tool") then
pcall(function()
local acsMod = tool:FindFirstChild("ACS_Modulo")
if acsMod then
local vars = acsMod:FindFirstChild("Variaveis")
if vars then
local ammo = vars:FindFirstChild("Ammo")
if ammo then ammo.Value = 9999 end
local maxAmmo = vars:FindFirstChild("MaxAmmo")
if maxAmmo then maxAmmo.Value = 9999 end
local reserve = vars:FindFirstChild("ReserveAmmo")
if reserve then reserve.Value = 9999 end
end
end
for _, desc in ipairs(tool:GetDescendants()) do
if desc:IsA("ValueBase") then
local ln = string.lower(desc.Name)
if string.find(ln, "ammo") or string.find(ln, "mag") or string.find(ln, "clip") or string.find(ln, "bullet") then
desc.Value = 9999
end
end
end
local attrs = tool:GetAttributes()
for k, v in pairs(attrs) do
local lk = string.lower(k)
if string.find(lk, "ammo") or string.find(lk, "mag") or string.find(lk, "clip") then
tool:SetAttribute(k, 9999)
end
end
end)
end
end
local bp = LocalPlayer:FindFirstChild("Backpack")
if bp then
for _, tool in ipairs(bp:GetChildren()) do
if tool:IsA("Tool") then
pcall(function()
local acsMod = tool:FindFirstChild("ACS_Modulo")
if acsMod then
local vars = acsMod:FindFirstChild("Variaveis")
if vars then
local ammo = vars:FindFirstChild("Ammo")
if ammo then ammo.Value = 9999 end
end
end
end)
end
end
end
end)
else
if _rUihREeo1Ydof then _rUihREeo1Ydof:Disconnect() _rUihREeo1Ydof = nil end
Notify("战斗", "无限弹药已关闭", 3)
end
end,
})
local _Xz0twabOn6vF4H = nil
_Awf7nFqxfjhCMd:Toggle({
Title = "无后坐力",
Default = false,
Callback = function(val)
State.NoRecoil = val
if val then
Notify("战斗", "无后坐力已开启", 3)
_Xz0twabOn6vF4H = RunService.Heartbeat:Connect(function()
local char = GetChar()
if not char then return end
for _, tool in ipairs(char:GetChildren()) do
if tool:IsA("Tool") then
pcall(function()
local acsMod = tool:FindFirstChild("ACS_Modulo")
if acsMod then
local vars = acsMod:FindFirstChild("Variaveis")
if vars then
local recoil = vars:FindFirstChild("Recoil")
if recoil then recoil.Value = 0 end
local kick = vars:FindFirstChild("Kick")
if kick then kick.Value = 0 end
local spread = vars:FindFirstChild("Spread")
if spread then spread.Value = 0 end
local _hnH53iXMyLn = vars:FindFirstChild("HipFireSpread")
if _hnH53iXMyLn then _hnH53iXMyLn.Value = 0 end
local bloom = vars:FindFirstChild("Bloom")
if bloom then bloom.Value = 0 end
local _sNJXsiupJmtr84n = vars:FindFirstChild("CameraShake")
if _sNJXsiupJmtr84n then _sNJXsiupJmtr84n.Value = 0 end
local _jBK3FZn7MawCYbY6 = vars:FindFirstChild("Deviation")
if _jBK3FZn7MawCYbY6 then _jBK3FZn7MawCYbY6.Value = 0 end
local sway = vars:FindFirstChild("Sway")
if sway then sway.Value = 0 end
local _cajg5r25Uvm = vars:FindFirstChild("Accuracy")
if _cajg5r25Uvm then _cajg5r25Uvm.Value = 100 end
local range = vars:FindFirstChild("Range")
if range then range.Value = 9999 end
local _tajbaXaPdQkYW = vars:FindFirstChild("FireRate")
if _tajbaXaPdQkYW then _tajbaXaPdQkYW.Value = 9999 end
local _mVawtXwWValP6Q23 = vars:FindFirstChild("Cooldown")
if _mVawtXwWValP6Q23 then _mVawtXwWValP6Q23.Value = 0 end
end
end
for _, desc in ipairs(tool:GetDescendants()) do
if desc:IsA("ValueBase") then
local ln = string.lower(desc.Name)
if string.find(ln, "recoil") or string.find(ln, "kick")
or string.find(ln, "spread") or string.find(ln, "bloom")
or string.find(ln, "shake") or string.find(ln, "_jBK3FZn7MawCYbY6")
or string.find(ln, "sway") then
desc.Value = 0
end
end
end
local attrs = tool:GetAttributes()
for k, v in pairs(attrs) do
local lk = string.lower(k)
if string.find(lk, "recoil") or string.find(lk, "kick")
or string.find(lk, "spread") or string.find(lk, "bloom")
or string.find(lk, "shake") or string.find(lk, "_jBK3FZn7MawCYbY6") then
tool:SetAttribute(k, 0)
end
end
end)
end
end
end)
else
if _Xz0twabOn6vF4H then _Xz0twabOn6vF4H:Disconnect() _Xz0twabOn6vF4H = nil end
Notify("战斗", "无后坐力已关闭", 3)
end
end,
})
_Awf7nFqxfjhCMd:Divider()
_Awf7nFqxfjhCMd:Toggle({
Title = "Hitbox 扩大",
Default = false,
Callback = function(val)
if val then
Notify("战斗", "已开启 Hitbox 扩大", 3)
Connections.Hitbox = RunService.Heartbeat:Connect(function()
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
if hrp then
hrp.Size = Vector3.new(8, 8, 8)
hrp.Transparency = 0.5
hrp.CanCollide = false
end
end
end
end)
else
if Connections.Hitbox then Connections.Hitbox:Disconnect() Connections.Hitbox = nil end
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
if hrp then
hrp.Size = Vector3.new(2, 2, 1)
hrp.Transparency = 0
hrp.CanCollide = true
end
end
end
end
end,
})
local _cV8tVoeEtcaOe63 = nil
local _19ctnjid17HIR = nil
local function _Atb4THWqnF()
local _LhW2XbxGdMbCzlAM = nil
local _6UHONzPc6aog = math.huge
local _T22sQfvfLhowb2 = UserInputService:GetMouseLocation()
local _GGKooj4O = 1153
local _G5EhwiN2SgxEmFLH = Camera.ViewportSize
local center = Vector2.new(_G5EhwiN2SgxEmFLH.X / 2, _G5EhwiN2SgxEmFLH.Y / 2)
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local head = plr.Character:FindFirstChild("Head")
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local hum = plr.Character:FindFirstChildOfClass("Humanoid")
if (head or hrp) and hum and hum.Health > 0 then
local _soRVBoJ2lQU5 = head or hrp
local _x7L9NSCfOr, onScreen = Camera:WorldToViewportPoint(_soRVBoJ2lQU5.Position)
if onScreen then
local dist = (Vector2.new(_x7L9NSCfOr.X, _x7L9NSCfOr.Y) - center).Magnitude
if dist < _6UHONzPc6aog and dist <= 150 then
_6UHONzPc6aog = dist
_LhW2XbxGdMbCzlAM = plr
end
end
end
end
end
return _LhW2XbxGdMbCzlAM
end
_Awf7nFqxfjhCMd:Toggle({
Title = "自瞄 (Aimbot)",
Default = false,
Callback = function(val)
State.AimbotEnabled = val
if val then
Notify("战斗", "自瞄已开启 (按住右键激活)", 3)
_cV8tVoeEtcaOe63 = RunService.RenderStepped:Connect(function()
if not State.AimbotEnabled then return end
if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
local target = _Atb4THWqnF()
if target and target.Character then
local head = target.Character:FindFirstChild("Head")
local hrp = target.Character:FindFirstChild("HumanoidRootPart")
local hum = target.Character:FindFirstChildOfClass("Humanoid")
if (head or hrp) and hum and hum.Health > 0 then
local _soRVBoJ2lQU5 = head or hrp
local root = GetRoot()
local _9KeJcsJ7 = 8526
if root then
local _ZjcgWB9X8mbd9Oa = _soRVBoJ2lQU5.Position
local camPos = Camera.CFrame.Position
local _V2hTENbT9o = CFrame.new(camPos, _ZjcgWB9X8mbd9Oa)
Camera.CFrame = Camera.CFrame:Lerp(_V2hTENbT9o, 0.4)
end
end
end
end)
else
if _cV8tVoeEtcaOe63 then _cV8tVoeEtcaOe63:Disconnect() _cV8tVoeEtcaOe63 = nil end
_19ctnjid17HIR = nil
Notify("战斗", "自瞄已关闭", 3)
end
end,
})
local _eaa4vFUylEQ = nil
local _kALTNNrGcbYF4 = nil
local function _suaoaAihqrD(_vwrJJNATjr, endPos, color)
local beam = Instance.new("Part")
beam.Name = "BulletTracer"
beam.Anchored = true
beam.CanCollide = false
beam.CanQuery = false
beam.Material = Enum.Material.Neon
beam.Color = color or Color3.fromRGB(255, 200, 50)
beam.Transparency = 0.2
beam.Shape = Enum.PartType.Cylinder
beam.Parent = _kALTNNrGcbYF4
local _OIMY9NGWVl = (_vwrJJNATjr - endPos).Magnitude
local _x2evffUEVxZxh1gV = (_vwrJJNATjr + endPos) / 2
beam.Size = Vector3.new(_OIMY9NGWVl, 0.15, 0.15)
beam.CFrame = CFrame.new(_x2evffUEVxZxh1gV, endPos) * CFrame.Angles(0, math.rad(90), 0)
task.spawn(function()
local _PdlT59sfqB3M5M = 0.2
for i = 1, 20 do
_PdlT59sfqB3M5M = _PdlT59sfqB3M5M + 0.04
beam.Transparency = _PdlT59sfqB3M5M
beam.Size = Vector3.new(_OIMY9NGWVl, 0.15 * (1 - i / 20), 0.15 * (1 - i / 20))
task.wait(0.03)
end
beam:Destroy()
end)
end
_Awf7nFqxfjhCMd:Toggle({
Title = "子弹追踪 (Tracer)",
Default = false,
Callback = function(val)
State.BulletTracer = val
if val then
Notify("战斗", "子弹追踪已开启", 3)
_kALTNNrGcbYF4 = Workspace:FindFirstChild("BulletTracers")
if not _kALTNNrGcbYF4 then
_kALTNNrGcbYF4 = Instance.new("Folder")
_kALTNNrGcbYF4.Name = "BulletTracers"
_kALTNNrGcbYF4.Parent = Workspace
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local _qp0dokHQR0E9 = 0
_eaa4vFUylEQ = RunService.Heartbeat:Connect(function()
if not State.BulletTracer then return end
local char = GetChar()
if not char then return end
local now = tick()
if now - _qp0dokHQR0E9 < 0.05 then return end
local tool = char:FindFirstChildOfClass("Tool")
if tool then
local handle = tool:FindFirstChild("Handle")
local muzzle = tool:FindFirstChild("Muzzle") or handle
local root = char:FindFirstChild("HumanoidRootPart")
if muzzle and root then
local mouse = LocalPlayer:GetMouse()
local _FpbXt2HQka1rjDH = mouse.Hit.Position
if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
_qp0dokHQR0E9 = now
local _vwrJJNATjr = muzzle.Position
_suaoaAihqrD(_vwrJJNATjr, _FpbXt2HQka1rjDH)
end
end
end
pcall(function()
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local tool = plr.Character:FindFirstChildOfClass("Tool")
if tool then
local handle = tool:FindFirstChild("Handle")
local muzzle = tool:FindFirstChild("Muzzle") or handle
local head = plr.Character:FindFirstChild("Head")
if muzzle and head then
local acsMod = tool:FindFirstChild("ACS_Modulo")
if acsMod then
local vars = acsMod:FindFirstChild("Variaveis")
if vars then
local ammo = vars:FindFirstChild("Ammo")
if ammo then
local key = plr.Name .. "_ammo"
local _6JKEnSpQc5fR = _G[key] or ammo.Value
if ammo.Value < _6JKEnSpQc5fR then
_qp0dokHQR0E9 = now
local _vwrJJNATjr = muzzle.Position
local dir = head.CFrame.LookVector
local endPos = _vwrJJNATjr + dir * 300
_suaoaAihqrD(_vwrJJNATjr, endPos, Color3.fromRGB(255, 100, 100))
end
_G[key] = ammo.Value
end
end
end
end
end
end
end
end)
end)
else
if _eaa4vFUylEQ then _eaa4vFUylEQ:Disconnect() _eaa4vFUylEQ = nil end
if _kALTNNrGcbYF4 then
_kALTNNrGcbYF4:ClearAllChildren()
end
Notify("战斗", "子弹追踪已关闭", 3)
end
end,
})
local _UbUf6b0gHol = Window:Tab({
Title = "玩家",
Icon = "user",
})
_UbUf6b0gHol:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_UbUf6b0gHol:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
State.WalkSpeed = val
local h = GetHum()
if h then h.WalkSpeed = val end
end,
})
_UbUf6b0gHol:Slider({
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
_UbUf6b0gHol:Toggle({
Title = "秒互动",
Default = false,
Callback = function(val)
if val then
F.Enable()
Notify("玩家", "秒互动已开启", 3)
else
F.Disable()
Notify("玩家", "秒互动已关闭", 3)
end
end,
})
_UbUf6b0gHol:Divider()
_UbUf6b0gHol:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
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
_UbUf6b0gHol:Toggle({
Title = "穿墙 (NoClip)",
Default = false,
Callback = function(val)
State.NoClip = val
if val then
Connections.NoClip = RunService.Stepped:Connect(function()
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
_UbUf6b0gHol:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
State.GodMode = val
if val then
Notify("玩家", "已开启无敌", 3)
Connections.GodMode = RunService.Heartbeat:Connect(function()
local h = GetHum()
if h and h.Health < h.MaxHealth then
h.Health = h.MaxHealth
end
end)
else
if Connections.GodMode then Connections.GodMode:Disconnect() Connections.GodMode = nil end
Notify("玩家", "已关闭无敌", 3)
end
end,
})
_UbUf6b0gHol:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
State.NoFallDamage = val
if val then
Notify("玩家", "已开启摔落无伤害", 3)
local function _HrvQDugQfotE(h)
if not h then return end
local _H6KPlGMVWc8XG = h.Health
h.StateChanged:Connect(function(old, new)
if not State.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_H6KPlGMVWc8XG = h.Health
elseif old == Enum.HumanoidStateType.Freefall then
if h.Health < _H6KPlGMVWc8XG then
h.Health = _H6KPlGMVWc8XG
end
end
end)
end
local c = GetChar()
if c then _HrvQDugQfotE(c:FindFirstChildOfClass("Humanoid")) end
Connections.NoFallDamage = LocalPlayer.CharacterAdded:Connect(function(char)
task.wait(0.3)
if State.NoFallDamage then
_HrvQDugQfotE(char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid"))
end
end)
else
if Connections.NoFallDamage then Connections.NoFallDamage:Disconnect() Connections.NoFallDamage = nil end
Notify("玩家", "已关闭摔落无伤害", 3)
end
end,
})
_UbUf6b0gHol:Divider()
local _Jgb2xFJFpMf4 = false
_UbUf6b0gHol:Button({
Title = "飞行脚本 V3 (弹出独立面板)",
Callback = function()
if _Jgb2xFJFpMf4 then
Notify("飞行", "飞行面板已打开，请用面板上的按钮控制", 3)
return
end
_Jgb2xFJFpMf4 = true
local main = Instance.new("ScreenGui")
main.Name = "FlyV3GUI"
main.Parent = LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false
local Frame = Instance.new("Frame")
Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100, 0, 0.380, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)
Frame.Active = true
Frame.Draggable = true
local up = Instance.new("TextButton")
up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "up"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14
local down = Instance.new("TextButton")
down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "down"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14
local onof = Instance.new("TextButton")
onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.703, 0, 0.491, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14
local _KpEupuFTuP = Instance.new("_KpEupuFTuP")
_KpEupuFTuP.Parent = Frame
_KpEupuFTuP.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
_KpEupuFTuP.Position = UDim2.new(0.469, 0, 0, 0)
_KpEupuFTuP.Size = UDim2.new(0, 100, 0, 28)
_KpEupuFTuP.Font = Enum.Font.SourceSans
_KpEupuFTuP.Text = "Fly GUI V3"
_KpEupuFTuP.TextColor3 = Color3.fromRGB(0, 0, 0)
_KpEupuFTuP.TextScaled = true
_KpEupuFTuP.TextWrapped = true
local plus = Instance.new("TextButton")
plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.232, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextWrapped = true
local speed = Instance.new("_KpEupuFTuP")
speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468, 0, 0.491, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextWrapped = true
local mine = Instance.new("TextButton")
mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.232, 0, 0.491, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextWrapped = true
local _f2DUmXLZmWdTBm = Instance.new("TextButton")
_f2DUmXLZmWdTBm.Name = "Close"
_f2DUmXLZmWdTBm.Parent = Frame
_f2DUmXLZmWdTBm.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
_f2DUmXLZmWdTBm.Font = Enum.Font.SourceSans
_f2DUmXLZmWdTBm.Size = UDim2.new(0, 45, 0, 28)
_f2DUmXLZmWdTBm.Text = "X"
_f2DUmXLZmWdTBm.TextSize = 30
_f2DUmXLZmWdTBm.Position = UDim2.new(0, 0, -1, 27)
local mini = Instance.new("TextButton")
mini.Name = "minimize"
mini.Parent = Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = Enum.Font.SourceSans
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "T"
mini.TextSize = 30
mini.Position = UDim2.new(0, 44, -1, 27)
local mini2 = Instance.new("TextButton")
mini2.Name = "minimize2"
mini2.Parent = Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = Enum.Font.SourceSans
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "T"
mini2.TextSize = 30
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false
local speeds = 1
local speaker = LocalPlayer
local nowe = false
local _eAORVtgbwDM0y = false
Notify("飞行", "Fly GUI V3 已加载", 3)
onof.MouseButton1Down:Connect(function()
if nowe == true then
nowe = false
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
else
nowe = true
for i = 1, speeds do
task.spawn(function()
local hb = RunService.Heartbeat
_eAORVtgbwDM0y = true
local chr = speaker.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while _eAORVtgbwDM0y and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end
end)
end
speaker.Character.Animate.Disabled = true
local Char = speaker.Character
local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")
for _, v in next, Hum:GetPlayingAnimationTracks() do
v:AdjustSpeed(0)
end
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end
local rigType = speaker.Character:FindFirstChildOfClass("Humanoid").RigType
local isR6 = rigType == Enum.HumanoidRigType.R6
local torso = isR6 and speaker.Character.Torso or speaker.Character.UpperTorso
local _YDmr99x7 = 544
local flying = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local _XM5lBDjPbzj = {f = 0, b = 0, l = 0, r = 0}
local _D0XPJ7da4y = 50
local fspeed = 0
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0, 0.1, 0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == true then
speaker.Character.Humanoid.PlatformStand = true
end
task.spawn(function()
while nowe == true and speaker.Character and speaker.Character:FindFirstChildOfClass("Humanoid") and speaker.Character:FindFirstChildOfClass("Humanoid").Health > 0 do
RunService.RenderStepped:Wait()
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
fspeed = fspeed + 0.5 + (fspeed / _D0XPJ7da4y)
if fspeed > _D0XPJ7da4y then fspeed = _D0XPJ7da4y end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and fspeed ~= 0 then
fspeed = fspeed - 1
if fspeed < 0 then fspeed = 0 end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p) - Workspace.CurrentCamera.CoordinateFrame.p)) * fspeed
_XM5lBDjPbzj = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and fspeed ~= 0 then
bv.velocity = ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (_XM5lBDjPbzj.f + _XM5lBDjPbzj.b)) + ((Workspace.CurrentCamera.CoordinateFrame * CFrame.new(_XM5lBDjPbzj.l + _XM5lBDjPbzj.r, (_XM5lBDjPbzj.f + _XM5lBDjPbzj.b) * 0.2, 0).p) - Workspace.CurrentCamera.CoordinateFrame.p)) * fspeed
else
bv.velocity = Vector3.new(0, 0, 0)
end
bg.cframe = Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * fspeed / _D0XPJ7da4y), 0, 0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
_XM5lBDjPbzj = {f = 0, b = 0, l = 0, r = 0}
fspeed = 0
if bg then bg:Destroy() end
if bv then bv:Destroy() end
if speaker.Character and speaker.Character:FindFirstChildOfClass("Humanoid") then
speaker.Character.Humanoid.PlatformStand = false
end
if speaker.Character and speaker.Character:FindFirstChild("Animate") then
speaker.Character.Animate.Disabled = false
end
_eAORVtgbwDM0y = false
end)
end)
local tis
up.MouseButton1Down:Connect(function()
tis = up.MouseEnter:Connect(function()
while tis do
task.wait()
if speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
speaker.Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
end
end
end)
end)
up.MouseLeave:Connect(function()
if tis then tis:Disconnect() tis = nil end
end)
local dis
down.MouseButton1Down:Connect(function()
dis = down.MouseEnter:Connect(function()
while dis do
task.wait()
if speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
speaker.Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
end
end
end)
end)
down.MouseLeave:Connect(function()
if dis then dis:Disconnect() dis = nil end
end)
plus.MouseButton1Down:Connect(function()
speeds = speeds + 1
speed.Text = speeds
if nowe == true then
_eAORVtgbwDM0y = false
for i = 1, speeds do
task.spawn(function()
local hb = RunService.Heartbeat
_eAORVtgbwDM0y = true
local chr = speaker.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while _eAORVtgbwDM0y and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end
end)
end
end
end)
mine.MouseButton1Down:Connect(function()
if speeds == 1 then
speed.Text = 'flyno1'
task.wait(1)
speed.Text = speeds
else
speeds = speeds - 1
speed.Text = speeds
if nowe == true then
_eAORVtgbwDM0y = false
for i = 1, speeds do
task.spawn(function()
local hb = RunService.Heartbeat
_eAORVtgbwDM0y = true
local chr = speaker.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while _eAORVtgbwDM0y and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end
end)
end
end
end
end)
_f2DUmXLZmWdTBm.MouseButton1Click:Connect(function()
nowe = false
_eAORVtgbwDM0y = false
main:Destroy()
_Jgb2xFJFpMf4 = false
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
Frame.BackgroundTransparency = 1
_f2DUmXLZmWdTBm.Position = UDim2.new(0, 0, -1, 57)
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
Frame.BackgroundTransparency = 0
_f2DUmXLZmWdTBm.Position = UDim2.new(0, 0, -1, 27)
end)
speaker.CharacterAdded:Connect(function(char)
task.wait(0.7)
if char:FindFirstChildOfClass("Humanoid") then
char.Humanoid.PlatformStand = false
end
if char:FindFirstChild("Animate") then
char.Animate.Disabled = false
end
end)
end,
})
local _aCDnhCwzfSCoJmY = Window:Tab({
Title = "视觉",
Icon = "eye",
})
_aCDnhCwzfSCoJmY:Section({ Title = "ESP", TextXAlignment = "Left", TextSize = 17 })
local function _x8KVXXjkc1qYP5F(player)
if player == LocalPlayer then return end
if ESPObjects[player] then return end
local _MYpu2fXzI5nDoei = Instance.new("BillboardGui")
_MYpu2fXzI5nDoei.Name = "ESP_" .. player.Name
_MYpu2fXzI5nDoei.Size = UDim2.new(0, 200, 0, 50)
_MYpu2fXzI5nDoei.AlwaysOnTop = true
_MYpu2fXzI5nDoei.MaxDistance = 5000
local _GTw8UuuL8gBQ = Instance.new("_KpEupuFTuP")
_GTw8UuuL8gBQ.Size = UDim2.new(1, 0, 0, 20)
_GTw8UuuL8gBQ.BackgroundTransparency = 1
_GTw8UuuL8gBQ.Text = player.Name
_GTw8UuuL8gBQ.TextColor3 = Color3.fromRGB(255, 50, 50)
_GTw8UuuL8gBQ.TextSize = 14
_GTw8UuuL8gBQ.Font = Enum.Font.GothamBold
_GTw8UuuL8gBQ.Parent = _MYpu2fXzI5nDoei
local _o5Oj9YUk6PBKD = Instance.new("_KpEupuFTuP")
_o5Oj9YUk6PBKD.Size = UDim2.new(1, 0, 0, 15)
_o5Oj9YUk6PBKD.Position = UDim2.new(0, 0, 0, 25)
_o5Oj9YUk6PBKD.BackgroundTransparency = 1
_o5Oj9YUk6PBKD.Text = ""
_o5Oj9YUk6PBKD.TextColor3 = Color3.fromRGB(255, 255, 255)
_o5Oj9YUk6PBKD.TextSize = 12
_o5Oj9YUk6PBKD.Font = Enum.Font.Gotham
_o5Oj9YUk6PBKD.Parent = _MYpu2fXzI5nDoei
ESPObjects[player] = { _MYpu2fXzI5nDoei = _MYpu2fXzI5nDoei, _GTw8UuuL8gBQ = _GTw8UuuL8gBQ, _o5Oj9YUk6PBKD = _o5Oj9YUk6PBKD }
local function attach()
local char = player.Character
if not char then return end
local head = char:FindFirstChild("Head")
if head then
_MYpu2fXzI5nDoei.Adornee = head
_MYpu2fXzI5nDoei.Parent = head
end
end
player.CharacterAdded:Connect(attach)
if player.Character then attach() end
end
local function _2uaUyeohXSvhp0nU(player)
if ESPObjects[player] then
if ESPObjects[player]._MYpu2fXzI5nDoei then
ESPObjects[player]._MYpu2fXzI5nDoei:Destroy()
end
ESPObjects[player] = nil
end
end
_aCDnhCwzfSCoJmY:Toggle({
Title = "玩家 ESP (名字+距离)",
Default = false,
Callback = function(val)
State.ESPEnabled = val
if val then
Notify("视觉", "ESP 已开启", 3)
for _, plr in ipairs(Players:GetPlayers()) do
_x8KVXXjkc1qYP5F(plr)
end
Connections.ESPUpdate = RunService.Heartbeat:Connect(function()
local root = GetRoot()
for plr, data in pairs(ESPObjects) do
if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and root then
local dist = (plr.Character.HumanoidRootPart.Position - root.Position).Magnitude
data._o5Oj9YUk6PBKD.Text = math.floor(dist) .. " studs"
end
end
end)
Connections.PlayerAdded = Players.PlayerAdded:Connect(function(plr) _x8KVXXjkc1qYP5F(plr) end)
Connections.PlayerRemoving = Players.PlayerRemoving:Connect(function(plr) _2uaUyeohXSvhp0nU(plr) end)
else
if Connections.ESPUpdate then Connections.ESPUpdate:Disconnect() Connections.ESPUpdate = nil end
if Connections.PlayerAdded then Connections.PlayerAdded:Disconnect() Connections.PlayerAdded = nil end
if Connections.PlayerRemoving then Connections.PlayerRemoving:Disconnect() Connections.PlayerRemoving = nil end
for plr, _ in pairs(ESPObjects) do
_2uaUyeohXSvhp0nU(plr)
end
ESPObjects = {}
Notify("视觉", "ESP 已关闭", 3)
end
end,
})
_aCDnhCwzfSCoJmY:Divider()
_aCDnhCwzfSCoJmY:Toggle({
Title = "全亮 (FullBright)",
Default = false,
Callback = function(val)
if val then
Lighting.GlobalShadows = false
Lighting.Brightness = 2
Lighting.ClockTime = 12
Lighting.FogEnd = 1e9
Notify("视觉", "全亮已开启", 3)
else
Lighting.GlobalShadows = true
Lighting.Brightness = 1
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Notify("视觉", "全亮已关闭", 3)
end
end,
})
_aCDnhCwzfSCoJmY:Button({
Title = "FPS 优化",
Callback = function()
for _, v in ipairs(Workspace:GetDescendants()) do
if v:IsA("BasePart") then
v.Material = Enum.Material.Plastic
v.Reflectance = 0
elseif v:IsA("Decal") or v:IsA("Texture") then
v.Transparency = 1
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
v.Enabled = false
end
end
Lighting.GlobalShadows = false
Lighting.FogEnd = 1e9
pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
Notify("视觉", "FPS 已优化", 3)
end,
})
local TeleTab = Window:Tab({
Title = "传送",
Icon = "map-pin",
})
TeleTab:Section({ Title = "玩家传送", TextXAlignment = "Left", TextSize = 17 })
local _G8EdLlwAzrO1GVh = nil
local function _qjuSlhyZT8Ug()
local names = {}
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer then
table.insert(names, plr.Name)
end
end
return names
end
TeleTab:Dropdown({
Title = "选择目标",
Values = _qjuSlhyZT8Ug(),
Callback = function(val) _G8EdLlwAzrO1GVh = val end,
})
TeleTab:Button({
Title = "传送到玩家",
Callback = function()
if _G8EdLlwAzrO1GVh then
local target = Players:FindFirstChild(_G8EdLlwAzrO1GVh)
if target and target.Character then
local _0dT8AojvbL2M = target.Character:FindFirstChild("HumanoidRootPart")
local myRoot = GetRoot()
if _0dT8AojvbL2M and myRoot then
myRoot.CFrame = _0dT8AojvbL2M.CFrame * CFrame.new(0, 0, 5)
Notify("传送", "已传送到 " .. _G8EdLlwAzrO1GVh, 3)
end
else
Notify("传送", "目标不存在", 3)
end
else
Notify("传送", "请先选择目标", 3)
end
end,
})
TeleTab:Button({
Title = "刷新玩家列表",
Callback = function()
Notify("传送", "请重新打开下拉框", 3)
end,
})
TeleTab:Divider()
local tpX, tpY, tpZ = 0, 0, 0
TeleTab:Input({
Title = "X 坐标",
Placeholder = "输入 X",
Callback = function(val) tpX = tonumber(val) or 0 end,
})
TeleTab:Input({
Title = "Y 坐标",
Placeholder = "输入 Y",
Callback = function(val) tpY = tonumber(val) or 0 end,
})
TeleTab:Input({
Title = "Z 坐标",
Placeholder = "输入 Z",
Callback = function(val) tpZ = tonumber(val) or 0 end,
})
TeleTab:Button({
Title = "传送到坐标",
Callback = function()
local root = GetRoot()
if root then
root.CFrame = CFrame.new(tpX, tpY, tpZ)
Notify("传送", "已传送到 " .. tpX .. ", " .. tpY .. ", " .. tpZ, 3)
end
end,
})
local SetTab = Window:Tab({
Title = "设置",
Icon = "settings",
})
SetTab:Dropdown({
Title = "主题",
Values = { "Dark", "Light", "Pink", "Violet", "Ocean" },
Callback = function(val)
pcall(function() WindUI:SetTheme(val) end)
end,
})
SetTab:Divider()
SetTab:Button({
Title = "销毁脚本",
Callback = function()
for name, conn in pairs(Connections) do
if conn then pcall(function() conn:Disconnect() end) end
end
Connections = {}
for plr, _ in pairs(ESPObjects) do
_2uaUyeohXSvhp0nU(plr)
end
ESPObjects = {}
local flyGui = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("FlyV3GUI")
if flyGui then flyGui:Destroy() end
_Jgb2xFJFpMf4 = false
local h = GetHum()
if h then
h.WalkSpeed = 16
h.JumpPower = 50
h.PlatformStand = false
end
Workspace.Gravity = 196.2
Camera.FieldOfView = 70
local ui = game:GetService("CoreGui"):FindFirstChild("WindUI")
if ui then ui:Destroy() end
end,
})
Notify("欢迎使用", "战争大亨脚本已加载", 5)
task.wait(1)
Notify("战争大亨", "v1.0 加载完成", 3)