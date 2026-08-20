local _u2NEkxs9 = 0
local _u4pK7bwW = ""
local _PdVMVZyL = nil
local _0001  loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/_0067/WINDUI.lua"))()
local _0002  game:GetService("_0002")
local _0003  game:GetService("_0003")
local _0004  game:GetService("_0004")
local _0005  game:GetService("_0005")
local _0006  game:GetService("_0006")
local _0007  game:GetService("_0007")
local _0008  _0002._0008
local _0009  _0005.CurrentCamera
local _000a  _0001:CreateWindow({
Title = "战争大亨",
Icon = "swords",
Author = "战争大亨脚本",
Folder = "WarTycoon",
Size = UDim2.fromOffset(450, 450),
Theme = "Dark",
HideSearchBar = false,
})
local _000b  _000a:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 255, 255)
})
local _000c  0
task.spawn(function()
while true do
local _000d  os.date("*t")
local _000e  string.format("%02d", _000d.hour)
local _000f  string.format("%02d", _000d.min)
_000c = (_000c + 0.01) % 1
local _0010  Color3.fromHSV(_000c, 1, 1)
_000b:SetTitle(_000e .. ":" .. _000f)
_000b:SetColor(_0010)
task.wait(0.06)
end
end)
_000a:Tag({
Title = "战争大亨",
Color = Color3.fromHex("#FF6B6B")
})
_000a:EditOpenButton({
Title = "战争大亨",
Icon = "swords",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
Draggable = true,
})
local _0011  {
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
local _0012  {}
local _0013  {}
local function GetChar()
return _0008.Character
end
local function GetRoot()
local _0014  GetChar()
return _0014 and _0014:FindFirstChild("HumanoidRootPart") or nil
end
local function GetHum()
local _0014  GetChar()
return _0014 and _0014:FindFirstChildOfClass("Humanoid") or nil
end
local function Notify(title, content, duration)
_0001:Notify({ Title = title, Content = content or "", Duration = duration or 3 })
end
local function SetPromptHoldDuration(parent, duration)
for _, desc in ipairs(parent:GetDescendants()) do
if desc:IsA("ProximityPrompt") then
desc.HoldDuration = duration
end
end
end
local _0015  {
Active = false,
Connection = nil,
Bind = nil,
Enable = function()
_0015.Active = true
local _0016  game:GetService("ProximityPromptService")
_0015.Bind = _0016.PromptButtonHoldBegan:Connect(function(prompt)
prompt.HoldDuration = 0.01
end)
SetPromptHoldDuration(_0005, 0.01)
_0015.Connection = _0005.DescendantAdded:Connect(function(desc)
if desc:IsA("ProximityPrompt") and _0015.Active then
desc.HoldDuration = 0.01
end
end)
end,
Disable = function()
_0015.Active = false
if _0015.Bind then _0015.Bind:Disconnect(); _0015.Bind = nil end
if _0015.Connection then _0015.Connection:Disconnect(); _0015.Connection = nil end
SetPromptHoldDuration(_0005, 0.5)
end
}
local function findCashRemotes()
local _0017  {}
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local _0018  string.lower(obj.Name)
if string.find(_0018, "cash") or string.find(_0018, "money") or string.find(_0018, "collect") or string.find(_0018, "reward") then
table.insert(_0017, obj)
end
end
end
return _0017
end
local function findCashParts()
local _0019  {}
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _0018  string.lower(obj.Name)
if string.find(_0018, "cash") or string.find(_0018, "money") or string.find(_0018, "collect") then
table.insert(_0019, obj)
end
end
end
return _0019
end
local _001a  _000a:Tab({
Title = "大亨",
Icon = "factory",
})
_001a:Section({ Title = "自动收集", TextXAlignment = "Left", TextSize = 17 })
_001a:Toggle({
Title = "自动收集现金",
Default = false,
Callback = function(val)
_0011.AutoCash = val
if val then
Notify("自动收集", "已开启自动收集现金", 3)
_0012.AutoCash = _0003.Heartbeat:Connect(function()
local _001b  GetRoot()
if not _001b then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0018  string.lower(obj.Name)
if (string.find(_0018, "cash") or string.find(_0018, "money") or string.find(_0018, "collect")) and obj:IsA("BasePart") then
local _001c  (obj.Position - _001b.Position).Magnitude
if _001c < 200 then
obj.Position = _001b.Position + Vector3.new(0, 5, 0)
end
end
end
end
end)
else
if _0012.AutoCash then _0012.AutoCash:Disconnect() _0012.AutoCash = nil end
Notify("自动收集", "已关闭自动收集现金", 3)
end
end,
})
_001a:Divider()
local _001d  {}
_001a:Button({
Title = "扫描金钱 RemoteEvent",
Callback = function()
_001d = findCashRemotes()
Notify("扫描完成", "找到 " .. #_001d .. " 个相关 RemoteEvent", 5)
end,
})
_001a:Button({
Title = "尝试 +$100000",
Callback = function()
local _001e  false
for _, remote in ipairs(_001d) do
pcall(function()
if remote:IsA("RemoteEvent") then
remote:FireServer(100000)
elseif remote:IsA("RemoteFunction") then
remote:InvokeServer(100000)
end
_001e = true
end)
end
if _001e then
Notify("发送请求", "已尝试发送金钱请求", 3)
else
Notify("提示", "请先扫描 RemoteEvent", 3)
end
end,
})
_001a:Divider()
_001a:Toggle({
Title = "自动触碰收集板",
Default = false,
Callback = function(val)
if val then
_0012.TouchCollect = _0003.Heartbeat:Connect(function()
local _001b  GetRoot()
if not _001b then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0018  string.lower(obj.Name)
if string.find(_0018, "collect") or string.find(_0018, "pad") or string.find(_0018, "button") then
local _001c  (obj.Position - _001b.Position).Magnitude
if _001c < 50 then
firetouchinterest(_001b, obj, 0)
end
end
end
end
end)
else
if _0012.TouchCollect then _0012.TouchCollect:Disconnect() _0012.TouchCollect = nil end
end
end,
})
local _001f  _000a:Tab({
Title = "战斗",
Icon = "swords",
})
_001f:Section({ Title = "武器功能", TextXAlignment = "Left", TextSize = 17 })
_001f:Button({
Title = "扫描武器信息 (输出到通知)",
Callback = function()
local _0020  game:GetService("_0020")
local _0021  {}
local _0022  GetChar()
if _0022 then
for _, _002b in ipairs(_0022:GetChildren()) do
if _002b:IsA("Tool") then
table.insert(_0021, "Tool: " .. _002b.Name)
for _, d in ipairs(_002b:GetDescendants()) do
if d:IsA("RemoteEvent") or d:IsA("RemoteFunction") then
table.insert(_0021, "  Remote: " .. d:GetFullName())
elseif d:IsA("ValueBase") then
table.insert(_0021, "  Value: " .. d.Name .. " = " .. tostring(d.Value))
end
end
end
end
end
local _0023  _0008:FindFirstChild("Backpack")
if _0023 then
for _, _002b in ipairs(_0023:GetChildren()) do
if _002b:IsA("Tool") then
table.insert(_0021, "Backpack Tool: " .. _002b.Name)
end
end
end
for _, d in ipairs(_0020:GetDescendants()) do
if d:IsA("RemoteEvent") or d:IsA("RemoteFunction") then
local _0024  string.lower(d.Name)
if string.find(_0024, "fire") or string.find(_0024, "shoot") or string.find(_0024, "weapon") or string.find(_0024, "gun") or string.find(_0024, "_0032") then
table.insert(_0021, "RS Remote: " .. d:GetFullName())
end
end
end
local _0025  _0008:FindFirstChild("leaderstats")
if _0025 then
for _, v in ipairs(_0025:GetChildren()) do
table.insert(_0021, "Stat: " .. v.Name .. " = " .. tostring(v.Value))
end
end
local _0026  table.concat(_0021, "\n")
if _0026 == "" then _0026 = "未找到任何武器相关信息" end
Notify("扫描结果", _0026, 10)
end,
})
_001f:Divider()
local _0027  nil
_001f:Toggle({
Title = "自动射击 (全兼容)",
Default = false,
Callback = function(val)
_0011.AutoFire = val
if val then
Notify("战斗", "自动射击已开启", 3)
local _0020  game:GetService("_0020")
local _0028  game:GetService("_0028")
local _0029  {"fire", "shoot", "attack", "click", "gun", "weapon"}
local _002a  0
_0027 = _0003.Heartbeat:Connect(function()
local _000d  tick()
if _000d - _002a < 0.1 then return end
_002a = _000d
local _0022  GetChar()
if not _0022 then return end
local _002b  _0022:FindFirstChildOfClass("Tool")
if _002b then
pcall(function() _002b:Activate() end)
end
pcall(function()
local _002c  _0008:GetMouse()
if _002b and _002c then
_0028:SendMouseButtonEvent(_002c.X, _002c.Y, 0, true, game, 1)
_0028:SendMouseButtonEvent(_002c.X, _002c.Y, 0, false, game, 1)
end
end)
if _002b then
for _, desc in ipairs(_002b:GetDescendants()) do
pcall(function()
if desc:IsA("RemoteEvent") then
local _0024  string.lower(desc.Name)
for _, kw in ipairs(_0029) do
if string.find(_0024, kw) then
desc:FireServer()
break
end
end
elseif desc:IsA("RemoteFunction") then
local _0024  string.lower(desc.Name)
for _, kw in ipairs(_0029) do
if string.find(_0024, kw) then
desc:InvokeServer()
break
end
end
end
end)
end
end
pcall(function()
for _, desc in ipairs(_0020:GetDescendants()) do
if desc:IsA("RemoteEvent") then
local _0024  string.lower(desc.Name)
for _, kw in ipairs(_0029) do
if string.find(_0024, kw) then
desc:FireServer()
break
end
end
end
end
end)
end)
else
if _0027 then _0027:Disconnect() _0027 = nil end
Notify("战斗", "自动射击已关闭", 3)
end
end,
})
local _002d  nil
_001f:Toggle({
Title = "无限弹药",
Default = false,
Callback = function(val)
_0011.InfiniteAmmo = val
if val then
Notify("战斗", "无限弹药已开启", 3)
local _0020  game:GetService("_0020")
pcall(function()
local _002e  _0020:FindFirstChild("BulletFireSystem")
and _0020.BulletFireSystem:FindFirstChild("GunReload")
if _002e then
_002e:Destroy()
local _002f  Instance.new("Part")
_002f.Name = "GunReload"
_002f.Parent = _0020.BulletFireSystem
end
end)
_002d = _0003.Heartbeat:Connect(function()
local _0022  GetChar()
if not _0022 then return end
for _, _002b in ipairs(_0022:GetChildren()) do
if _002b:IsA("Tool") then
pcall(function()
local _0030  _002b:FindFirstChild("ACS_Modulo")
if _0030 then
local _0031  _0030:FindFirstChild("Variaveis")
if _0031 then
local _0032  _0031:FindFirstChild("Ammo")
if _0032 then _0032.Value = 9999 end
local _0033  _0031:FindFirstChild("MaxAmmo")
if _0033 then _0033.Value = 9999 end
local _0034  _0031:FindFirstChild("ReserveAmmo")
if _0034 then _0034.Value = 9999 end
end
end
for _, desc in ipairs(_002b:GetDescendants()) do
if desc:IsA("ValueBase") then
local _0024  string.lower(desc.Name)
if string.find(_0024, "_0032") or string.find(_0024, "mag") or string.find(_0024, "clip") or string.find(_0024, "bullet") then
desc.Value = 9999
end
end
end
local _0035  _002b:GetAttributes()
for k, v in pairs(_0035) do
local _0036  string.lower(k)
if string.find(_0036, "_0032") or string.find(_0036, "mag") or string.find(_0036, "clip") then
_002b:SetAttribute(k, 9999)
end
end
end)
end
end
local _0023  _0008:FindFirstChild("Backpack")
if _0023 then
for _, _002b in ipairs(_0023:GetChildren()) do
if _002b:IsA("Tool") then
pcall(function()
local _0030  _002b:FindFirstChild("ACS_Modulo")
if _0030 then
local _0031  _0030:FindFirstChild("Variaveis")
if _0031 then
local _0032  _0031:FindFirstChild("Ammo")
if _0032 then _0032.Value = 9999 end
end
end
end)
end
end
end
end)
else
if _002d then _002d:Disconnect() _002d = nil end
Notify("战斗", "无限弹药已关闭", 3)
end
end,
})
local _0037  nil
_001f:Toggle({
Title = "无后坐力",
Default = false,
Callback = function(val)
_0011.NoRecoil = val
if val then
Notify("战斗", "无后坐力已开启", 3)
_0037 = _0003.Heartbeat:Connect(function()
local _0022  GetChar()
if not _0022 then return end
for _, _002b in ipairs(_0022:GetChildren()) do
if _002b:IsA("Tool") then
pcall(function()
local _0030  _002b:FindFirstChild("ACS_Modulo")
if _0030 then
local _0031  _0030:FindFirstChild("Variaveis")
if _0031 then
local _0038  _0031:FindFirstChild("Recoil")
if _0038 then _0038.Value = 0 end
local _0039  _0031:FindFirstChild("Kick")
if _0039 then _0039.Value = 0 end
local _003a  _0031:FindFirstChild("Spread")
if _003a then _003a.Value = 0 end
local _003b  _0031:FindFirstChild("HipFireSpread")
if _003b then _003b.Value = 0 end
local _003c  _0031:FindFirstChild("Bloom")
if _003c then _003c.Value = 0 end
local _003d  _0031:FindFirstChild("CameraShake")
if _003d then _003d.Value = 0 end
local _003e  _0031:FindFirstChild("Deviation")
if _003e then _003e.Value = 0 end
local _003f  _0031:FindFirstChild("Sway")
if _003f then _003f.Value = 0 end
local _0040  _0031:FindFirstChild("Accuracy")
if _0040 then _0040.Value = 100 end
local _0041  _0031:FindFirstChild("Range")
if _0041 then _0041.Value = 9999 end
local _0042  _0031:FindFirstChild("FireRate")
if _0042 then _0042.Value = 9999 end
local _0043  _0031:FindFirstChild("Cooldown")
if _0043 then _0043.Value = 0 end
end
end
for _, desc in ipairs(_002b:GetDescendants()) do
if desc:IsA("ValueBase") then
local _0024  string.lower(desc.Name)
if string.find(_0024, "_0038") or string.find(_0024, "_0039")
or string.find(_0024, "_003a") or string.find(_0024, "_003c")
or string.find(_0024, "shake") or string.find(_0024, "_003e")
or string.find(_0024, "_003f") then
desc.Value = 0
end
end
end
local _0035  _002b:GetAttributes()
for k, v in pairs(_0035) do
local _0036  string.lower(k)
if string.find(_0036, "_0038") or string.find(_0036, "_0039")
or string.find(_0036, "_003a") or string.find(_0036, "_003c")
or string.find(_0036, "shake") or string.find(_0036, "_003e") then
_002b:SetAttribute(k, 0)
end
end
end)
end
end
end)
else
if _0037 then _0037:Disconnect() _0037 = nil end
Notify("战斗", "无后坐力已关闭", 3)
end
end,
})
_001f:Divider()
_001f:Toggle({
Title = "Hitbox 扩大",
Default = false,
Callback = function(val)
if val then
Notify("战斗", "已开启 Hitbox 扩大", 3)
_0012.Hitbox = _0003.Heartbeat:Connect(function()
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _0008 and plr.Character then
local _0044  plr.Character:FindFirstChild("HumanoidRootPart")
if _0044 then
_0044.Size = Vector3.new(8, 8, 8)
_0044.Transparency = 0.5
_0044.CanCollide = false
end
end
end
end)
else
if _0012.Hitbox then _0012.Hitbox:Disconnect() _0012.Hitbox = nil end
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _0008 and plr.Character then
local _0044  plr.Character:FindFirstChild("HumanoidRootPart")
if _0044 then
_0044.Size = Vector3.new(2, 2, 1)
_0044.Transparency = 0
_0044.CanCollide = true
end
end
end
end
end,
})
local _0045  nil
local _0046  nil
local function getClosestPlayerToFov()
local _0047  nil
local _0048  math.huge
local _0049  _0004:GetMouseLocation()
local _004a  _0009.ViewportSize
local _004b  Vector2.new(_004a.X / 2, _004a.Y / 2)
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _0008 and plr.Character then
local _004c  plr.Character:FindFirstChild("Head")
local _0044  plr.Character:FindFirstChild("HumanoidRootPart")
local _004d  plr.Character:FindFirstChildOfClass("Humanoid")
if (_004c or _0044) and _004d and _004d.Health > 0 then
local _004e  _004c or _0044
local _004f  onScreen = _0009:WorldToViewportPoint(_004e.Position)
if onScreen then
local _001c  (Vector2.new(_004f.X, _004f.Y) - _004b).Magnitude
if _001c < _0048 and _001c <= 150 then
_0048 = _001c
_0047 = plr
end
end
end
end
end
return _0047
end
_001f:Toggle({
Title = "自瞄 (Aimbot)",
Default = false,
Callback = function(val)
_0011.AimbotEnabled = val
if val then
Notify("战斗", "自瞄已开启 (按住右键激活)", 3)
_0045 = _0003.RenderStepped:Connect(function()
if not _0011.AimbotEnabled then return end
if not _0004:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
local _0050  getClosestPlayerToFov()
if _0050 and _0050.Character then
local _004c  _0050.Character:FindFirstChild("Head")
local _0044  _0050.Character:FindFirstChild("HumanoidRootPart")
local _004d  _0050.Character:FindFirstChildOfClass("Humanoid")
if (_004c or _0044) and _004d and _004d.Health > 0 then
local _004e  _004c or _0044
local _001b  GetRoot()
if _001b then
local _0051  _004e.Position
local _0052  _0009.CFrame.Position
local _0053  CFrame.new(_0052, _0051)
_0009.CFrame = _0009.CFrame:Lerp(_0053, 0.4)
end
end
end
end)
else
if _0045 then _0045:Disconnect() _0045 = nil end
_0046 = nil
Notify("战斗", "自瞄已关闭", 3)
end
end,
})
local _0054  nil
local _0055  nil
local function createTracer(_005e, _0062, color)
local _0056  Instance.new("Part")
_0056.Name = "BulletTracer"
_0056.Anchored = true
_0056.CanCollide = false
_0056.CanQuery = false
_0056.Material = Enum.Material.Neon
_0056.Color = color or Color3.fromRGB(255, 200, 50)
_0056.Transparency = 0.2
_0056.Shape = Enum.PartType.Cylinder
_0056.Parent = _0055
local _0057  (_005e - _0062).Magnitude
local _0058  (_005e + _0062) / 2
_0056.Size = Vector3.new(_0057, 0.15, 0.15)
_0056.CFrame = CFrame.new(_0058, _0062) * CFrame.Angles(0, math.rad(90), 0)
task.spawn(function()
local _0059  0.2
for i = 1, 20 do
_0059 = _0059 + 0.04
_0056.Transparency = _0059
_0056.Size = Vector3.new(_0057, 0.15 * (1 - i / 20), 0.15 * (1 - i / 20))
task.wait(0.03)
end
_0056:Destroy()
end)
end
_001f:Toggle({
Title = "子弹追踪 (Tracer)",
Default = false,
Callback = function(val)
_0011.BulletTracer = val
if val then
Notify("战斗", "子弹追踪已开启", 3)
_0055 = _0005:FindFirstChild("BulletTracers")
if not _0055 then
_0055 = Instance.new("Folder")
_0055.Name = "BulletTracers"
_0055.Parent = _0005
end
local _0020  game:GetService("_0020")
local _005a  0
_0054 = _0003.Heartbeat:Connect(function()
if not _0011.BulletTracer then return end
local _0022  GetChar()
if not _0022 then return end
local _000d  tick()
if _000d - _005a < 0.05 then return end
local _002b  _0022:FindFirstChildOfClass("Tool")
if _002b then
local _005b  _002b:FindFirstChild("Handle")
local _005c  _002b:FindFirstChild("Muzzle") or _005b
local _001b  _0022:FindFirstChild("HumanoidRootPart")
if _005c and _001b then
local _002c  _0008:GetMouse()
local _005d  _002c.Hit.Position
if _0004:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
_005a = _000d
local _005e  _005c.Position
createTracer(_005e, _005d)
end
end
end
pcall(function()
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _0008 and plr.Character then
local _002b  plr.Character:FindFirstChildOfClass("Tool")
if _002b then
local _005b  _002b:FindFirstChild("Handle")
local _005c  _002b:FindFirstChild("Muzzle") or _005b
local _004c  plr.Character:FindFirstChild("Head")
if _005c and _004c then
local _0030  _002b:FindFirstChild("ACS_Modulo")
if _0030 then
local _0031  _0030:FindFirstChild("Variaveis")
if _0031 then
local _0032  _0031:FindFirstChild("Ammo")
if _0032 then
local _005f  plr.Name .. "_ammo"
local _0060  _G[_005f] or _0032.Value
if _0032.Value < _0060 then
_005a = _000d
local _005e  _005c.Position
local _0061  _004c.CFrame.LookVector
local _0062  _005e + _0061 * 300
createTracer(_005e, _0062, Color3.fromRGB(255, 100, 100))
end
_G[_005f] = _0032.Value
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
if _0054 then _0054:Disconnect() _0054 = nil end
if _0055 then
_0055:ClearAllChildren()
end
Notify("战斗", "子弹追踪已关闭", 3)
end
end,
})
local _0063  _000a:Tab({
Title = "玩家",
Icon = "user",
})
_0063:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_0063:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
_0011.WalkSpeed = val
local _0064  GetHum()
if _0064 then _0064.WalkSpeed = val end
end,
})
_0063:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(val)
_0011.JumpPower = val
local _0064  GetHum()
if _0064 then
if _0064.UseJumpPower then _0064.JumpPower = val
else _0064.JumpHeight = val / 10 end
end
end,
})
_0063:Toggle({
Title = "秒互动",
Default = false,
Callback = function(val)
if val then
_0015.Enable()
Notify("玩家", "秒互动已开启", 3)
else
_0015.Disable()
Notify("玩家", "秒互动已关闭", 3)
end
end,
})
_0063:Divider()
_0063:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
if val then
_0012.InfJump = _0004.JumpRequest:Connect(function()
local _0064  GetHum()
if _0064 then _0064:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _0012.InfJump then _0012.InfJump:Disconnect() _0012.InfJump = nil end
end
end,
})
_0063:Toggle({
Title = "穿墙 (NoClip)",
Default = false,
Callback = function(val)
_0011.NoClip = val
if val then
_0012.NoClip = _0003.Stepped:Connect(function()
local _0014  GetChar()
if _0014 then
for _, p in ipairs(_0014:GetDescendants()) do
if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
end
end
end)
else
if _0012.NoClip then _0012.NoClip:Disconnect() _0012.NoClip = nil end
end
end,
})
_0063:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
_0011.GodMode = val
if val then
Notify("玩家", "已开启无敌", 3)
_0012.GodMode = _0003.Heartbeat:Connect(function()
local _0064  GetHum()
if _0064 and _0064.Health < _0064.MaxHealth then
_0064.Health = _0064.MaxHealth
end
end)
else
if _0012.GodMode then _0012.GodMode:Disconnect() _0012.GodMode = nil end
Notify("玩家", "已关闭无敌", 3)
end
end,
})
_0063:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
_0011.NoFallDamage = val
if val then
Notify("玩家", "已开启摔落无伤害", 3)
local function setupFall(_0064)
if not _0064 then return end
local _0065  _0064.Health
_0064.StateChanged:Connect(function(old, new)
if not _0011.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_0065 = _0064.Health
elseif old == Enum.HumanoidStateType.Freefall then
if _0064.Health < _0065 then
_0064.Health = _0065
end
end
end)
end
local _0014  GetChar()
if _0014 then setupFall(_0014:FindFirstChildOfClass("Humanoid")) end
_0012.NoFallDamage = _0008.CharacterAdded:Connect(function(_0022)
task.wait(0.3)
if _0011.NoFallDamage then
setupFall(_0022:FindFirstChildOfClass("Humanoid") or _0022:WaitForChild("Humanoid"))
end
end)
else
if _0012.NoFallDamage then _0012.NoFallDamage:Disconnect() _0012.NoFallDamage = nil end
Notify("玩家", "已关闭摔落无伤害", 3)
end
end,
})
_0063:Divider()
local _0066  false
_0063:Button({
Title = "飞行脚本 V3 (弹出独立面板)",
Callback = function()
if _0066 then
Notify("飞行", "飞行面板已打开，请用面板上的按钮控制", 3)
return
end
_0066 = true
local _0067  Instance.new("ScreenGui")
_0067.Name = "FlyV3GUI"
_0067.Parent = _0008:WaitForChild("PlayerGui")
_0067.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_0067.ResetOnSpawn = false
local _0068  Instance.new("_0068")
_0068.Parent = _0067
_0068.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
_0068.BorderColor3 = Color3.fromRGB(103, 221, 213)
_0068.Position = UDim2.new(0.100, 0, 0.380, 0)
_0068.Size = UDim2.new(0, 190, 0, 57)
_0068.Active = true
_0068.Draggable = true
local _0069  Instance.new("TextButton")
_0069.Name = "_0069"
_0069.Parent = _0068
_0069.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
_0069.Size = UDim2.new(0, 44, 0, 28)
_0069.Font = Enum.Font.SourceSans
_0069.Text = "_0069"
_0069.TextColor3 = Color3.fromRGB(0, 0, 0)
_0069.TextSize = 14
local _006a  Instance.new("TextButton")
_006a.Name = "_006a"
_006a.Parent = _0068
_006a.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
_006a.Position = UDim2.new(0, 0, 0.491, 0)
_006a.Size = UDim2.new(0, 44, 0, 28)
_006a.Font = Enum.Font.SourceSans
_006a.Text = "_006a"
_006a.TextColor3 = Color3.fromRGB(0, 0, 0)
_006a.TextSize = 14
local _006b  Instance.new("TextButton")
_006b.Name = "_006b"
_006b.Parent = _0068
_006b.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
_006b.Position = UDim2.new(0.703, 0, 0.491, 0)
_006b.Size = UDim2.new(0, 56, 0, 28)
_006b.Font = Enum.Font.SourceSans
_006b.Text = "fly"
_006b.TextColor3 = Color3.fromRGB(0, 0, 0)
_006b.TextSize = 14
local _006c  Instance.new("_006c")
_006c.Parent = _0068
_006c.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
_006c.Position = UDim2.new(0.469, 0, 0, 0)
_006c.Size = UDim2.new(0, 100, 0, 28)
_006c.Font = Enum.Font.SourceSans
_006c.Text = "Fly GUI V3"
_006c.TextColor3 = Color3.fromRGB(0, 0, 0)
_006c.TextScaled = true
_006c.TextWrapped = true
local _006d  Instance.new("TextButton")
_006d.Name = "_006d"
_006d.Parent = _0068
_006d.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
_006d.Position = UDim2.new(0.232, 0, 0, 0)
_006d.Size = UDim2.new(0, 45, 0, 28)
_006d.Font = Enum.Font.SourceSans
_006d.Text = "+"
_006d.TextColor3 = Color3.fromRGB(0, 0, 0)
_006d.TextScaled = true
_006d.TextWrapped = true
local _006e  Instance.new("_006c")
_006e.Name = "_006e"
_006e.Parent = _0068
_006e.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
_006e.Position = UDim2.new(0.468, 0, 0.491, 0)
_006e.Size = UDim2.new(0, 44, 0, 28)
_006e.Font = Enum.Font.SourceSans
_006e.Text = "1"
_006e.TextColor3 = Color3.fromRGB(0, 0, 0)
_006e.TextScaled = true
_006e.TextWrapped = true
local _006f  Instance.new("TextButton")
_006f.Name = "_006f"
_006f.Parent = _0068
_006f.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
_006f.Position = UDim2.new(0.232, 0, 0.491, 0)
_006f.Size = UDim2.new(0, 45, 0, 29)
_006f.Font = Enum.Font.SourceSans
_006f.Text = "-"
_006f.TextColor3 = Color3.fromRGB(0, 0, 0)
_006f.TextScaled = true
_006f.TextWrapped = true
local _0070  Instance.new("TextButton")
_0070.Name = "Close"
_0070.Parent = _0068
_0070.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
_0070.Font = Enum.Font.SourceSans
_0070.Size = UDim2.new(0, 45, 0, 28)
_0070.Text = "X"
_0070.TextSize = 30
_0070.Position = UDim2.new(0, 0, -1, 27)
local _0071  Instance.new("TextButton")
_0071.Name = "minimize"
_0071.Parent = _0068
_0071.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
_0071.Font = Enum.Font.SourceSans
_0071.Size = UDim2.new(0, 45, 0, 28)
_0071.Text = "T"
_0071.TextSize = 30
_0071.Position = UDim2.new(0, 44, -1, 27)
local _0072  Instance.new("TextButton")
_0072.Name = "minimize2"
_0072.Parent = _0068
_0072.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
_0072.Font = Enum.Font.SourceSans
_0072.Size = UDim2.new(0, 45, 0, 28)
_0072.Text = "T"
_0072.TextSize = 30
_0072.Position = UDim2.new(0, 44, -1, 57)
_0072.Visible = false
local _0073  1
local _0074  _0008
local _0075  false
local _0076  false
Notify("飞行", "Fly GUI V3 已加载", 3)
_006b.MouseButton1Down:Connect(function()
if _0075 == true then
_0075 = false
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
_0074.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
else
_0075 = true
for i = 1, _0073 do
task.spawn(function()
local _0077  _0003.Heartbeat
_0076 = true
local _0078  _0074.Character
local _004d  _0078 and _0078:FindFirstChildWhichIsA("Humanoid")
while _0076 and _0077:Wait() and _0078 and _004d and _004d.Parent do
if _004d.MoveDirection.Magnitude > 0 then
_0078:TranslateBy(_004d.MoveDirection)
end
end
end)
end
_0074.Character.Animate.Disabled = true
local _0079  _0074.Character
local _007a  _0079:FindFirstChildOfClass("Humanoid") or _0079:FindFirstChildOfClass("AnimationController")
for _, v in next, _007a:GetPlayingAnimationTracks() do
v:AdjustSpeed(0)
end
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
_0074.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
_0074.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end
local _007b  _0074.Character:FindFirstChildOfClass("Humanoid").RigType
local _007c  _007b == Enum.HumanoidRigType.R6
local _007d  _007c and _0074.Character.Torso or _0074.Character.UpperTorso
local _007e  true
local _007f  {f = 0, b = 0, l = 0, r = 0}
local _0080  {f = 0, b = 0, l = 0, r = 0}
local _0081  50
local _0082  0
local _0083  Instance.new("BodyGyro", _007d)
_0083.P = 9e4
_0083.maxTorque = Vector3.new(9e9, 9e9, 9e9)
_0083.cframe = _007d.CFrame
local _0084  Instance.new("BodyVelocity", _007d)
_0084.velocity = Vector3.new(0, 0.1, 0)
_0084.maxForce = Vector3.new(9e9, 9e9, 9e9)
if _0075 == true then
_0074.Character.Humanoid.PlatformStand = true
end
task.spawn(function()
while _0075 == true and _0074.Character and _0074.Character:FindFirstChildOfClass("Humanoid") and _0074.Character:FindFirstChildOfClass("Humanoid").Health > 0 do
_0003.RenderStepped:Wait()
if _007f.l + _007f.r ~= 0 or _007f.f + _007f.b ~= 0 then
_0082 = _0082 + 0.5 + (_0082 / _0081)
if _0082 > _0081 then _0082 = _0081 end
elseif not (_007f.l + _007f.r ~= 0 or _007f.f + _007f.b ~= 0) and _0082 ~= 0 then
_0082 = _0082 - 1
if _0082 < 0 then _0082 = 0 end
end
if (_007f.l + _007f.r) ~= 0 or (_007f.f + _007f.b) ~= 0 then
_0084.velocity = ((_0005.CurrentCamera.CoordinateFrame.lookVector * (_007f.f + _007f.b)) + ((_0005.CurrentCamera.CoordinateFrame * CFrame.new(_007f.l + _007f.r, (_007f.f + _007f.b) * 0.2, 0).p) - _0005.CurrentCamera.CoordinateFrame.p)) * _0082
_0080 = {f = _007f.f, b = _007f.b, l = _007f.l, r = _007f.r}
elseif (_007f.l + _007f.r) == 0 and (_007f.f + _007f.b) == 0 and _0082 ~= 0 then
_0084.velocity = ((_0005.CurrentCamera.CoordinateFrame.lookVector * (_0080.f + _0080.b)) + ((_0005.CurrentCamera.CoordinateFrame * CFrame.new(_0080.l + _0080.r, (_0080.f + _0080.b) * 0.2, 0).p) - _0005.CurrentCamera.CoordinateFrame.p)) * _0082
else
_0084.velocity = Vector3.new(0, 0, 0)
end
_0083.cframe = _0005.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((_007f.f + _007f.b) * 50 * _0082 / _0081), 0, 0)
end
_007f = {f = 0, b = 0, l = 0, r = 0}
_0080 = {f = 0, b = 0, l = 0, r = 0}
_0082 = 0
if _0083 then _0083:Destroy() end
if _0084 then _0084:Destroy() end
if _0074.Character and _0074.Character:FindFirstChildOfClass("Humanoid") then
_0074.Character.Humanoid.PlatformStand = false
end
if _0074.Character and _0074.Character:FindFirstChild("Animate") then
_0074.Character.Animate.Disabled = false
end
_0076 = false
end)
end)
local _0085 _0069.MouseButton1Down:Connect(function()
_0085 = _0069.MouseEnter:Connect(function()
while _0085 do
task.wait()
if _0074.Character and _0074.Character:FindFirstChild("HumanoidRootPart") then
_0074.Character.HumanoidRootPart.CFrame = _0074.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
end
end
end)
end)
_0069.MouseLeave:Connect(function()
if _0085 then _0085:Disconnect() _0085 = nil end
end)
local _0086 _006a.MouseButton1Down:Connect(function()
_0086 = _006a.MouseEnter:Connect(function()
while _0086 do
task.wait()
if _0074.Character and _0074.Character:FindFirstChild("HumanoidRootPart") then
_0074.Character.HumanoidRootPart.CFrame = _0074.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
end
end
end)
end)
_006a.MouseLeave:Connect(function()
if _0086 then _0086:Disconnect() _0086 = nil end
end)
_006d.MouseButton1Down:Connect(function()
_0073 = _0073 + 1
_006e.Text = _0073
if _0075 == true then
_0076 = false
for i = 1, _0073 do
task.spawn(function()
local _0077  _0003.Heartbeat
_0076 = true
local _0078  _0074.Character
local _004d  _0078 and _0078:FindFirstChildWhichIsA("Humanoid")
while _0076 and _0077:Wait() and _0078 and _004d and _004d.Parent do
if _004d.MoveDirection.Magnitude > 0 then
_0078:TranslateBy(_004d.MoveDirection)
end
end
end)
end
end
end)
_006f.MouseButton1Down:Connect(function()
if _0073 == 1 then
_006e.Text = 'flyno1'
task.wait(1)
_006e.Text = _0073
else
_0073 = _0073 - 1
_006e.Text = _0073
if _0075 == true then
_0076 = false
for i = 1, _0073 do
task.spawn(function()
local _0077  _0003.Heartbeat
_0076 = true
local _0078  _0074.Character
local _004d  _0078 and _0078:FindFirstChildWhichIsA("Humanoid")
while _0076 and _0077:Wait() and _0078 and _004d and _004d.Parent do
if _004d.MoveDirection.Magnitude > 0 then
_0078:TranslateBy(_004d.MoveDirection)
end
end
end)
end
end
end
end)
_0070.MouseButton1Click:Connect(function()
_0075 = false
_0076 = false
_0067:Destroy()
_0066 = false
end)
_0071.MouseButton1Click:Connect(function()
_0069.Visible = false
_006a.Visible = false
_006b.Visible = false
_006d.Visible = false
_006e.Visible = false
_006f.Visible = false
_0071.Visible = false
_0072.Visible = true
_0068.BackgroundTransparency = 1
_0070.Position = UDim2.new(0, 0, -1, 57)
end)
_0072.MouseButton1Click:Connect(function()
_0069.Visible = true
_006a.Visible = true
_006b.Visible = true
_006d.Visible = true
_006e.Visible = true
_006f.Visible = true
_0071.Visible = true
_0072.Visible = false
_0068.BackgroundTransparency = 0
_0070.Position = UDim2.new(0, 0, -1, 27)
end)
_0074.CharacterAdded:Connect(function(_0022)
task.wait(0.7)
if _0022:FindFirstChildOfClass("Humanoid") then
_0022.Humanoid.PlatformStand = false
end
if _0022:FindFirstChild("Animate") then
_0022.Animate.Disabled = false
end
end)
end,
})
local _0087  _000a:Tab({
Title = "视觉",
Icon = "eye",
})
_0087:Section({ Title = "ESP", TextXAlignment = "Left", TextSize = 17 })
local function createESP(player)
if player == _0008 then return end
if _0013[player] then return end
local _0088  Instance.new("BillboardGui")
_0088.Name = "ESP_" .. player.Name
_0088.Size = UDim2.new(0, 200, 0, 50)
_0088.AlwaysOnTop = true
_0088.MaxDistance = 5000
local _0089  Instance.new("_006c")
_0089.Size = UDim2.new(1, 0, 0, 20)
_0089.BackgroundTransparency = 1
_0089.Text = player.Name
_0089.TextColor3 = Color3.fromRGB(255, 50, 50)
_0089.TextSize = 14
_0089.Font = Enum.Font.GothamBold
_0089.Parent = _0088
local _008a  Instance.new("_006c")
_008a.Size = UDim2.new(1, 0, 0, 15)
_008a.Position = UDim2.new(0, 0, 0, 25)
_008a.BackgroundTransparency = 1
_008a.Text = ""
_008a.TextColor3 = Color3.fromRGB(255, 255, 255)
_008a.TextSize = 12
_008a.Font = Enum.Font.Gotham
_008a.Parent = _0088
_0013[player] = { _0088 = _0088, _0089 = _0089, _008a = _008a }
local function attach()
local _0022  player.Character
if not _0022 then return end
local _004c  _0022:FindFirstChild("Head")
if _004c then
_0088.Adornee = _004c
_0088.Parent = _004c
end
end
player.CharacterAdded:Connect(attach)
if player.Character then attach() end
end
local function removeESP(player)
if _0013[player] then
if _0013[player]._0088 then
_0013[player]._0088:Destroy()
end
_0013[player] = nil
end
end
_0087:Toggle({
Title = "玩家 ESP (名字+距离)",
Default = false,
Callback = function(val)
_0011.ESPEnabled = val
if val then
Notify("视觉", "ESP 已开启", 3)
for _, plr in ipairs(_0002:GetPlayers()) do
createESP(plr)
end
_0012.ESPUpdate = _0003.Heartbeat:Connect(function()
local _001b  GetRoot()
for plr, data in pairs(_0013) do
if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and _001b then
local _001c  (plr.Character.HumanoidRootPart.Position - _001b.Position).Magnitude
data._008a.Text = math.floor(_001c) .. " studs"
end
end
end)
_0012.PlayerAdded = _0002.PlayerAdded:Connect(function(plr) createESP(plr) end)
_0012.PlayerRemoving = _0002.PlayerRemoving:Connect(function(plr) removeESP(plr) end)
else
if _0012.ESPUpdate then _0012.ESPUpdate:Disconnect() _0012.ESPUpdate = nil end
if _0012.PlayerAdded then _0012.PlayerAdded:Disconnect() _0012.PlayerAdded = nil end
if _0012.PlayerRemoving then _0012.PlayerRemoving:Disconnect() _0012.PlayerRemoving = nil end
for plr, _ in pairs(_0013) do
removeESP(plr)
end
_0013 = {}
Notify("视觉", "ESP 已关闭", 3)
end
end,
})
_0087:Divider()
_0087:Toggle({
Title = "全亮 (FullBright)",
Default = false,
Callback = function(val)
if val then
_0006.GlobalShadows = false
_0006.Brightness = 2
_0006.ClockTime = 12
_0006.FogEnd = 1e9
Notify("视觉", "全亮已开启", 3)
else
_0006.GlobalShadows = true
_0006.Brightness = 1
_0006.ClockTime = 14
_0006.FogEnd = 100000
Notify("视觉", "全亮已关闭", 3)
end
end,
})
_0087:Button({
Title = "FPS 优化",
Callback = function()
for _, v in ipairs(_0005:GetDescendants()) do
if v:IsA("BasePart") then
v.Material = Enum.Material.Plastic
v.Reflectance = 0
elseif v:IsA("Decal") or v:IsA("Texture") then
v.Transparency = 1
elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
v.Enabled = false
end
end
_0006.GlobalShadows = false
_0006.FogEnd = 1e9
pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
Notify("视觉", "FPS 已优化", 3)
end,
})
local _008b  _000a:Tab({
Title = "传送",
Icon = "map-pin",
})
_008b:Section({ Title = "玩家传送", TextXAlignment = "Left", TextSize = 17 })
local _008c  nil
local function getPlayerNames()
local _008d  {}
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _0008 then
table.insert(_008d, plr.Name)
end
end
return _008d
end
_008b:Dropdown({
Title = "选择目标",
Values = getPlayerNames(),
Callback = function(val) _008c = val end,
})
_008b:Button({
Title = "传送到玩家",
Callback = function()
if _008c then
local _0050  _0002:FindFirstChild(_008c)
if _0050 and _0050.Character then
local _008e  _0050.Character:FindFirstChild("HumanoidRootPart")
local _008f  GetRoot()
if _008e and _008f then
_008f.CFrame = _008e.CFrame * CFrame.new(0, 0, 5)
Notify("传送", "已传送到 " .. _008c, 3)
end
else
Notify("传送", "目标不存在", 3)
end
else
Notify("传送", "请先选择目标", 3)
end
end,
})
_008b:Button({
Title = "刷新玩家列表",
Callback = function()
Notify("传送", "请重新打开下拉框", 3)
end,
})
_008b:Divider()
local _0090  tpY, tpZ = 0, 0, 0
_008b:Input({
Title = "X 坐标",
Placeholder = "输入 X",
Callback = function(val) _0090 = tonumber(val) or 0 end,
})
_008b:Input({
Title = "Y 坐标",
Placeholder = "输入 Y",
Callback = function(val) tpY = tonumber(val) or 0 end,
})
_008b:Input({
Title = "Z 坐标",
Placeholder = "输入 Z",
Callback = function(val) tpZ = tonumber(val) or 0 end,
})
_008b:Button({
Title = "传送到坐标",
Callback = function()
local _001b  GetRoot()
if _001b then
_001b.CFrame = CFrame.new(_0090, tpY, tpZ)
Notify("传送", "已传送到 " .. _0090 .. ", " .. tpY .. ", " .. tpZ, 3)
end
end,
})
local _0091  _000a:Tab({
Title = "设置",
Icon = "settings",
})
_0091:Dropdown({
Title = "主题",
Values = { "Dark", "Light", "Pink", "Violet", "Ocean" },
Callback = function(val)
pcall(function() _0001:SetTheme(val) end)
end,
})
_0091:Divider()
_0091:Button({
Title = "销毁脚本",
Callback = function()
for _0018, conn in pairs(_0012) do
if conn then pcall(function() conn:Disconnect() end) end
end
_0012 = {}
for plr, _ in pairs(_0013) do
removeESP(plr)
end
_0013 = {}
local _0092  _0008:FindFirstChild("PlayerGui") and _0008.PlayerGui:FindFirstChild("FlyV3GUI")
if _0092 then _0092:Destroy() end
_0066 = false
local _0064  GetHum()
if _0064 then
_0064.WalkSpeed = 16
_0064.JumpPower = 50
_0064.PlatformStand = false
end
_0005.Gravity = 196.2
_0009.FieldOfView = 70
local _0093  game:GetService("CoreGui"):FindFirstChild("_0001")
if _0093 then _0093:Destroy() end
end,
})
Notify("欢迎使用", "战争大亨脚本已加载", 5)
task.wait(1)
Notify("战争大亨", "v1.0 加载完成", 3)