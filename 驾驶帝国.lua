local _nK2um4Y6 = 0
local _3kb03aXL = ""
local _kVV3LwXx = nil
local _0001  loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
local _0002  game:GetService("_0002")
local _0003  game:GetService("_0003")
local _0004  game:GetService("_0004")
local _0005  game:GetService("_0005")
local _0006  game:GetService("_0006")
local _0007  game:GetService("_0007")
local _0008  game:GetService("_0008")
local _0009  game:GetService("_0009")
local _000a  _0002._000a
local _000b  _0005.CurrentCamera
local _000c  _000a:GetMouse()
local _000d  _0001:CreateWindow({
Title = "驾驶帝国",
Icon = "car",
Author = "驾驶帝国脚本",
Folder = "DrivingEmpire",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
HideSearchBar = false,
})
local _000e  _000d:Tag({
Title = "00:00",
Color = Color3.fromRGB(0, 200, 255)
})
local _000f  0
task.spawn(function()
while true do
local _0010  os.date("*t")
_000f = (_000f + 0.01) % 1
_000e:SetTitle(string.format("%02d:%02d", _0010.hour, _0010.min))
_000e:SetColor(Color3.fromHSV(_000f, 1, 1))
task.wait(0.06)
end
end)
_000d:Tag({ Title = "驾驶", Color = Color3.fromHex("#00C8FF") })
_000d:EditOpenButton({
Title = "驾驶帝国",
Icon = "car",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("00C8FF")),
Draggable = true,
})
local _0011  {
AutoRace = false,
AutoCoins = false,
SpeedBoost = false,
SpeedMultiplier = 3,
InfiniteNitro = false,
WalkSpeed = 16,
JumpPower = 50,
InfJump = false,
Noclip = false,
GodMode = false,
NoFallDamage = false,
ESPEnabled = false,
ESPNames = true,
ESPDistance = true,
ESPItems = false,
Fullbright = false,
AntiAFK = false,
FPSBoost = false,
}
local _0012  {}
local _0013  {}
local function GetChar()
return _000a.Character
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
local function GetVehicle()
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("Model") then
local _0015  obj:FindFirstChild("Driver") or obj:FindFirstChild("Seat") or obj:FindFirstChild("VehicleSeat")
if _0015 and _0015:IsA("VehicleSeat") and _0015.Occupant then
local _0016  _0015.Occupant
local _0017  GetChar()
if _0016 and _0016.Parent and _0016.Parent.Parent == _0017 then
return obj
end
end
local _0018  obj:FindFirstChildWhichIsA("VehicleSeat")
if _0018 and _0018.Occupant then
local _0017  GetChar()
if _0018.Occupant.Parent and _0018.Occupant.Parent.Parent == _0017 then
return obj, _0018
end
end
end
end
return nil
end
local function GetCheckpoints()
local _0019  {}
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _001a  string.lower(obj.Name)
if string.find(_001a, "checkpoint") or string.find(_001a, "check") or string.find(_001a, "ring") or string.find(_001a, "cp") then
local _001b  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _001b then table.insert(_0019, _001b) end
end
end
end
table.sort(_0019, function(a, b)
local _001c  tonumber(string.match(a.Name, "%d+")) or 0
local _001d  tonumber(string.match(b.Name, "%d+")) or 0
return _001c < _001d
end)
return _0019
end
local _001e  _000d:Tab({
Title = "赛车",
Icon = "flag",
})
_001e:Section({ Title = "自动比赛", TextXAlignment = "Left", TextSize = 17 })
_001e:Toggle({
Title = "自动跑赛",
Default = false,
Callback = function(val)
_0011.AutoRace = val
if val then
Notify("赛车", "自动跑赛已开启", 3)
local _001f  1
_0012.AutoRace = _0003.Heartbeat:Connect(function()
if not _0011.AutoRace then return end
local _0020  GetRoot()
if not _0020 then return end
local _0021  GetCheckpoints()
if #_0021 == 0 then return end
if _001f > #_0021 then _001f = 1 end
local _0022  _0021[_001f]
if _0022 then
_0020.CFrame = _0022.CFrame * CFrame.new(0, 3, 0)
task.wait(0.3)
_001f = _001f + 1
end
end)
else
if _0012.AutoRace then _0012.AutoRace:Disconnect() _0012.AutoRace = nil end
Notify("赛车", "自动跑赛已关闭", 3)
end
end,
})
_001e:Button({
Title = "传送到起跑线",
Callback = function()
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _001a  string.lower(obj.Name)
if string.find(_001a, "start") or string.find(_001a, "finish") or string.find(_001a, "line") then
local _001b  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _001b then
local _0020  GetRoot()
if _0020 then
_0020.CFrame = _001b.CFrame * CFrame.new(0, 5, 0)
Notify("赛车", "已传送到起跑线", 3)
return
end
end
end
end
end
Notify("赛车", "未找到起跑线", 3)
end,
})
_001e:Divider()
_001e:Section({ Title = "车辆加速", TextXAlignment = "Left", TextSize = 17 })
_001e:Toggle({
Title = "车辆加速",
Default = false,
Callback = function(val)
_0011.SpeedBoost = val
if val then
Notify("赛车", "车辆加速已开启", 3)
_0012.SpeedBoost = _0003.Heartbeat:Connect(function()
if not _0011.SpeedBoost then return end
local _0023  _0018 = GetVehicle()
if _0023 then
pcall(function()
for _, desc in ipairs(_0023:GetDescendants()) do
if desc:IsA("ValueBase") then
local _001a  string.lower(desc.Name)
if string.find(_001a, "speed") or string.find(_001a, "maxspeed") or string.find(_001a, "velocity") or string.find(_001a, "power") then
if desc:IsA("NumberValue") or desc:IsA("IntValue") then
desc.Value = desc.Value * _0011.SpeedMultiplier
end
end
end
end
local _0024  _0023:FindFirstChildWhichIsA("VehicleSeat")
if _0024 then
_0024.MaxSpeed = _0024.MaxSpeed * _0011.SpeedMultiplier
end
local _0025  _0023:FindFirstChild("Engine") or _0023:FindFirstChild("Motor")
if _0025 then
for _, desc in ipairs(_0025:GetDescendants()) do
if desc:IsA("ValueBase") then
local _001a  string.lower(desc.Name)
if string.find(_001a, "speed") or string.find(_001a, "power") or string.find(_001a, "torque") then
if desc:IsA("NumberValue") or desc:IsA("IntValue") then
desc.Value = desc.Value * _0011.SpeedMultiplier
end
end
end
end
end
end)
end
end)
else
if _0012.SpeedBoost then _0012.SpeedBoost:Disconnect() _0012.SpeedBoost = nil end
Notify("赛车", "车辆加速已关闭", 3)
end
end,
})
_001e:Slider({
Title = "加速倍数",
Value = { Min = 2, Max = 50, Default = 3 },
Increment = 1,
Callback = function(val)
_0011.SpeedMultiplier = val
end,
})
_001e:Toggle({
Title = "无限氮气",
Default = false,
Callback = function(val)
_0011.InfiniteNitro = val
if val then
Notify("赛车", "无限氮气已开启", 3)
_0012.Nitro = _0003.Heartbeat:Connect(function()
if not _0011.InfiniteNitro then return end
local _0023  GetVehicle()
if _0023 then
pcall(function()
for _, desc in ipairs(_0023:GetDescendants()) do
if desc:IsA("ValueBase") then
local _001a  string.lower(desc.Name)
if string.find(_001a, "nitro") or string.find(_001a, "boost") or string.find(_001a, "turbo") or string.find(_001a, "nitrous") then
if desc:IsA("NumberValue") or desc:IsA("IntValue") then
desc.Value = 100
end
end
end
end
end)
end
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _001a  string.lower(obj.Name)
if string.find(_001a, "nitro") or string.find(_001a, "boost") or string.find(_001a, "turbo") then
obj:FireServer()
end
end
end
end)
end)
else
if _0012.Nitro then _0012.Nitro:Disconnect() _0012.Nitro = nil end
Notify("赛车", "无限氮气已关闭", 3)
end
end,
})
_001e:Divider()
_001e:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })
_001e:Button({
Title = "传送到最近检查点",
Callback = function()
local _0020  GetRoot()
if not _0020 then return end
local _0021  GetCheckpoints()
if #_0021 == 0 then
Notify("赛车", "未找到检查点", 3)
return
end
local _0026  nil
local _0027  math.huge
for _, cp in ipairs(_0021) do
local _0028  (_0020.Position - cp.Position).Magnitude
if _0028 < _0027 then
_0027 = _0028
_0026 = cp
end
end
if _0026 then
_0020.CFrame = _0026.CFrame * CFrame.new(0, 3, 0)
Notify("赛车", "已传送到最近检查点", 3)
end
end,
})
_001e:Button({
Title = "扫描车辆信息",
Callback = function()
local _0029  {}
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("Model") then
local _0018  obj:FindFirstChildWhichIsA("VehicleSeat")
if _0018 then
table.insert(_0029, "车辆: " .. obj.Name)
for _, desc in ipairs(obj:GetDescendants()) do
if desc:IsA("ValueBase") then
table.insert(_0029, "  " .. desc.Name .. " = " .. tostring(desc.Value))
end
end
end
end
end
local _002a  #_0029 > 0 and table.concat(_0029, "\n") or "未找到车辆"
Notify("扫描结果", _002a, 10)
end,
})
local _002b  _000d:Tab({
Title = "玩家",
Icon = "user",
})
_002b:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_002b:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
_0011.WalkSpeed = val
local _002c  GetHum()
if _002c then _002c.WalkSpeed = val end
end,
})
_002b:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(val)
_0011.JumpPower = val
local _002c  GetHum()
if _002c then
if _002c.UseJumpPower then _002c.JumpPower = val
else _002c.JumpHeight = val / 10 end
end
end,
})
_002b:Divider()
_002b:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
_0011.InfJump = val
if val then
_0012.InfJump = _0004.JumpRequest:Connect(function()
local _002c  GetHum()
if _002c then _002c:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _0012.InfJump then _0012.InfJump:Disconnect() _0012.InfJump = nil end
end
end,
})
_002b:Toggle({
Title = "穿墙",
Default = false,
Callback = function(val)
_0011.Noclip = val
if val then
_0012.NoClip = _0003.Stepped:Connect(function()
if not _0011.Noclip then return end
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
_002b:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
_0011.GodMode = val
if val then
Notify("玩家", "无敌已开启", 3)
_0012.GodMode = _0003.Heartbeat:Connect(function()
local _002c  GetHum()
if _002c and _002c.Health < _002c.MaxHealth then _002c.Health = _002c.MaxHealth end
end)
else
if _0012.GodMode then _0012.GodMode:Disconnect() _0012.GodMode = nil end
Notify("玩家", "无敌已关闭", 3)
end
end,
})
_002b:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
_0011.NoFallDamage = val
if val then
Notify("玩家", "摔落无伤害已开启", 3)
local function setupFall(_002c)
if not _002c then return end
local _002d  _002c.Health
_002c.StateChanged:Connect(function(old, new)
if not _0011.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_002d = _002c.Health
elseif old == Enum.HumanoidStateType.Freefall then
if _002c.Health < _002d then _002c.Health = _002d end
end
end)
end
local _0014  GetChar()
if _0014 then setupFall(_0014:FindFirstChildOfClass("Humanoid")) end
_0012.NoFall = _000a.CharacterAdded:Connect(function(_0017)
task.wait(0.3)
if _0011.NoFallDamage then setupFall(_0017:FindFirstChildOfClass("Humanoid")) end
end)
else
if _0012.NoFall then _0012.NoFall:Disconnect() _0012.NoFall = nil end
Notify("玩家", "摔落无伤害已关闭", 3)
end
end,
})
_002b:Divider()
local _002e  false
_002b:Button({
Title = "飞行 (手机版)",
Callback = function()
if _002e then
Notify("飞行", "飞行面板已打开", 3)
return
end
_002e = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/飞行脚本V3(全游戏通用).txt"))()
end,
})
local _002f  _000d:Tab({
Title = "视觉",
Icon = "eye",
})
_002f:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })
local function createESP(player)
if player == _000a then return end
if _0013[player] then return end
local _0030  Instance.new("BillboardGui")
_0030.Name = "DriveESP_" .. player.Name
_0030.Size = UDim2.new(0, 200, 0, 50)
_0030.StudsOffset = Vector3.new(0, 3, 0)
_0030.AlwaysOnTop = true
local _0031  Instance.new("TextLabel")
_0031.Size = UDim2.new(1, 0, 0, 20)
_0031.BackgroundTransparency = 1
_0031.TextColor3 = Color3.fromRGB(0, 200, 255)
_0031.TextSize = 14
_0031.Font = Enum.Font.SourceSansBold
_0031.TextStrokeTransparency = 0.5
_0031.Text = player.Name
_0031.Parent = _0030
local _0032  Instance.new("TextLabel")
_0032.Size = UDim2.new(1, 0, 0, 18)
_0032.Position = UDim2.new(0, 0, 0, 22)
_0032.BackgroundTransparency = 1
_0032.TextColor3 = Color3.fromRGB(200, 200, 200)
_0032.TextSize = 12
_0032.Text = ""
_0032.Parent = _0030
_0013[player] = { _0030 = _0030, _0031 = _0031, _0032 = _0032 }
end
local function removeESP(player)
if _0013[player] then
if _0013[player]._0030 then _0013[player]._0030:Destroy() end
_0013[player] = nil
end
end
_002f:Toggle({
Title = "人物透视",
Default = false,
Callback = function(val)
_0011.ESPEnabled = val
if val then
Notify("视觉", "透视已开启", 3)
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000a then createESP(plr) end
end
_0012.ESP = _0003.Heartbeat:Connect(function()
for plr, data in pairs(_0013) do
local _0017  plr.Character
if _0017 then
local _0033  _0017:FindFirstChild("Head")
local _0034  _0017:FindFirstChild("HumanoidRootPart")
if _0033 or _0034 then
data._0030.Adornee = _0033 or _0034
data._0031.Visible = _0011.ESPNames
data._0032.Visible = _0011.ESPDistance
if _0011.ESPDistance then
local _0020  GetRoot()
local _0035  _0034 or _0033
if _0020 and _0035 then
data._0032.Text = math.floor((_0020.Position - _0035.Position).Magnitude) .. " 米"
end
end
end
end
end
end)
_0012.PAdd = _0002.PlayerAdded:Connect(function(p) createESP(p) end)
_0012.PRem = _0002.PlayerRemoving:Connect(function(p) removeESP(p) end)
else
if _0012.ESP then _0012.ESP:Disconnect() _0012.ESP = nil end
if _0012.PAdd then _0012.PAdd:Disconnect() _0012.PAdd = nil end
if _0012.PRem then _0012.PRem:Disconnect() _0012.PRem = nil end
for p, _ in pairs(_0013) do removeESP(p) end
_0013 = {}
Notify("视觉", "透视已关闭", 3)
end
end,
})
_002f:Toggle({
Title = "显示名字",
Default = true,
Callback = function(val) _0011.ESPNames = val end,
})
_002f:Toggle({
Title = "显示距离",
Default = true,
Callback = function(val) _0011.ESPDistance = val end,
})
_002f:Toggle({
Title = "金币透视",
Default = false,
Callback = function(val)
_0011.ESPItems = val
if val then
Notify("视觉", "金币透视已开启", 3)
_0012.Items = _0003.Heartbeat:Connect(function()
if not _0011.ESPItems then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _001a  string.lower(obj.Name)
if string.find(_001a, "coin") or string.find(_001a, "cash") or string.find(_001a, "money") or string.find(_001a, "pickup") then
if not obj:FindFirstChild("DriveItemESP") then
local _0036  Instance.new("Highlight")
_0036.Name = "DriveItemESP"
_0036.FillColor = Color3.fromRGB(255, 200, 0)
_0036.FillTransparency = 0.3
_0036.OutlineColor = Color3.fromRGB(255, 255, 255)
_0036.Parent = obj
end
end
end
end
end)
else
if _0012.Items then _0012.Items:Disconnect() _0012.Items = nil end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:FindFirstChild("DriveItemESP") then obj.DriveItemESP:Destroy() end
end
Notify("视觉", "金币透视已关闭", 3)
end
end,
})
_002f:Toggle({
Title = "全图高亮",
Default = false,
Callback = function(val)
_0011.Fullbright = val
if val then
_0006.Brightness = 3
_0006.ClockTime = 14
_0006.FogEnd = 100000
_0006.GlobalShadows = false
_0012.FB = _0003.Heartbeat:Connect(function()
_0006.Brightness = 3
_0006.ClockTime = 14
_0006.FogEnd = 100000
_0006.GlobalShadows = false
end)
else
if _0012.FB then _0012.FB:Disconnect() _0012.FB = nil end
_0006.Brightness = 1
_0006.ClockTime = 12
_0006.GlobalShadows = true
Notify("视觉", "全图高亮已关闭", 3)
end
end,
})
local _0037  _000d:Tab({
Title = "经济",
Icon = "dollar-sign",
})
_0037:Section({ Title = "收集", TextXAlignment = "Left", TextSize = 17 })
_0037:Toggle({
Title = "自动收集金币",
Default = false,
Callback = function(val)
_0011.AutoCoins = val
if val then
Notify("经济", "自动收集金币已开启", 3)
_0012.AutoCoins = _0003.Heartbeat:Connect(function()
if not _0011.AutoCoins then return end
local _0020  GetRoot()
if not _0020 then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _001a  string.lower(obj.Name)
if string.find(_001a, "coin") or string.find(_001a, "cash") or string.find(_001a, "money") or string.find(_001a, "pickup") or string.find(_001a, "reward") then
pcall(function() obj.CFrame = _0020.CFrame end)
end
end
end
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _001a  string.lower(obj.Name)
if string.find(_001a, "coin") or string.find(_001a, "cash") or string.find(_001a, "money") or string.find(_001a, "collect") or string.find(_001a, "reward") then
obj:FireServer()
end
end
end
end)
end)
else
if _0012.AutoCoins then _0012.AutoCoins:Disconnect() _0012.AutoCoins = nil end
Notify("经济", "自动收集金币已关闭", 3)
end
end,
})
_0037:Divider()
_0037:Section({ Title = "刷钱", TextXAlignment = "Left", TextSize = 17 })
_0037:Button({
Title = "扫描给钱接口",
Callback = function()
local _0029  {}
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local _001a  string.lower(obj.Name)
if string.find(_001a, "cash") or string.find(_001a, "money") or string.find(_001a, "buy")
or string.find(_001a, "reward") or string.find(_001a, "give") or string.find(_001a, "collect") then
table.insert(_0029, obj:GetFullName())
end
end
end
local _002a  #_0029 > 0 and table.concat(_0029, "\n") or "未找到给钱接口"
Notify("扫描结果", _002a, 10)
end,
})
_0037:Button({
Title = "尝试刷钱",
Callback = function()
local _0038  0
for _, obj in ipairs(_0007:GetDescendants()) do
pcall(function()
if obj:IsA("RemoteEvent") then
local _001a  string.lower(obj.Name)
if string.find(_001a, "cash") or string.find(_001a, "money") or string.find(_001a, "give")
or string.find(_001a, "reward") or string.find(_001a, "collect") then
obj:FireServer()
_0038 = _0038 + 1
end
elseif obj:IsA("RemoteFunction") then
local _001a  string.lower(obj.Name)
if string.find(_001a, "cash") or string.find(_001a, "money") or string.find(_001a, "give") then
obj:InvokeServer()
_0038 = _0038 + 1
end
end
end)
end
Notify("经济", "尝试触发了 " .. _0038 .. " 个接口", 5)
end,
})
local _0039  _000d:Tab({
Title = "传送",
Icon = "map-pin",
})
_0039:Section({ Title = "地点", TextXAlignment = "Left", TextSize = 17 })
local _003a  {
{ name = "车行", keywords = {"dealership", "carshop", "showroom"} },
{ name = "加油站", keywords = {"gas", "fuel", "station"} },
{ name = "赛车起点", keywords = {"race", "start", "finish"} },
{ name = "商店", keywords = {"shop", "store", "market"} },
{ name = "银行", keywords = {"bank"} },
{ name = "停车场", keywords = {"parking", "garage", "lot"} },
{ name = "改车店", keywords = {"upgrade", "custom", "tune", "mod"} },
{ name = "出生点", keywords = {"spawn", "lobby"} },
}
for _, loc in ipairs(_003a) do
_0039:Button({
Title = "传送到" .. loc.name,
Callback = function()
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _001a  string.lower(obj.Name)
for _, kw in ipairs(loc.keywords) do
if string.find(_001a, kw) then
local _001b  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _001b then
local _0020  GetRoot()
if _0020 then
_0020.CFrame = _001b.CFrame * CFrame.new(0, 5, 0)
Notify("传送", "已传送到" .. loc.name, 3)
return
end
end
end
end
end
end
Notify("传送", "未找到" .. loc.name, 3)
end,
})
end
_0039:Divider()
local _003b  nil
_0039:Toggle({
Title = "长按传送",
Default = false,
Callback = function(val)
if val then
Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
_0012.TpBegin = _0004.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_003b = tick()
end
end)
_0012.TpHold = _0003.Heartbeat:Connect(function()
if not _003b then return end
if tick() - _003b >= 0.5 then
local _0020  GetRoot()
if _0020 then _0020.CFrame = _000c.Hit end
_003b = nil
end
end)
_0012.TpEnd = _0004.InputEnded:Connect(function() _003b = nil end)
else
if _0012.TpBegin then _0012.TpBegin:Disconnect() _0012.TpBegin = nil end
if _0012.TpHold then _0012.TpHold:Disconnect() _0012.TpHold = nil end
if _0012.TpEnd then _0012.TpEnd:Disconnect() _0012.TpEnd = nil end
Notify("传送", "长按传送已关闭", 3)
end
end,
})
local _003c  _000d:Tab({
Title = "实用",
Icon = "settings",
})
_003c:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })
_003c:Toggle({
Title = "防挂机",
Default = false,
Callback = function(val)
_0011.AntiAFK = val
if val then
_0012.AntiAFK = _000a.Idled:Connect(function()
_0009:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
_0009:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
Notify("实用", "防挂机已开启", 3)
else
if _0012.AntiAFK then _0012.AntiAFK:Disconnect() _0012.AntiAFK = nil end
Notify("实用", "防挂机已关闭", 3)
end
end,
})
_003c:Toggle({
Title = "画质提速",
Default = false,
Callback = function(val)
_0011.FPSBoost = val
if val then
settings().Rendering.QualityLevel = 1
_0006.GlobalShadows = false
_0006.FogEnd = 9e9
_0012.FPS = _0003.Heartbeat:Connect(function()
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false end)
end
end
end)
Notify("实用", "画质提速已开启", 3)
else
if _0012.FPS then _0012.FPS:Disconnect() _0012.FPS = nil end
settings().Rendering.QualityLevel = Enum.RenderingQuality.Automatic
_0006.FogEnd = 100000
Notify("实用", "画质提速已关闭", 3)
end
end,
})
_003c:Divider()
_003c:Button({
Title = "换服",
Callback = function()
Notify("实用", "正在跳转服务器...", 3)
_0008:Teleport(game.PlaceId, _000a)
end,
})
_003c:Button({
Title = "复制服务器号",
Callback = function()
local _003d  game.JobId
if setclipboard then
setclipboard(_003d)
Notify("实用", "已复制: " .. _003d, 3)
else
Notify("实用", "JobId: " .. _003d, 5)
end
end,
})
_003c:Button({
Title = "输出角色信息",
Callback = function()
local _0017  GetChar()
if not _0017 then Notify("实用", "无角色", 3) return end
local _003e  {}
local _002c  GetHum()
if _002c then
table.insert(_003e, "血量: " .. math.floor(_002c.Health) .. "/" .. math.floor(_002c.MaxHealth))
table.insert(_003e, "速度: " .. _002c.WalkSpeed)
end
local _0020  GetRoot()
if _0020 then table.insert(_003e, "位置: " .. tostring(_0020.Position)) end
Notify("角色信息", table.concat(_003e, "\n"), 10)
end,
})
_003c:Divider()
_003c:Button({
Title = "清理特效",
Callback = function()
local _0038  0
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false; _0038 = _0038 + 1 end)
end
end
Notify("实用", "已清理 " .. _0038 .. " 个特效", 3)
end,
})
_003c:Button({
Title = "卸载脚本",
Callback = function()
for _, conn in pairs(_0012) do
if conn then pcall(function() conn:Disconnect() end) end
end
_0012 = {}
for p, _ in pairs(_0013) do removeESP(p) end
_0013 = {}
Notify("实用", "脚本已卸载", 3)
end,
})
Notify("驾驶帝国", "脚本已加载!", 5)
_000a.CharacterAdded:Connect(function(_0017)
task.wait(0.5)
local _002c  _0017:FindFirstChildOfClass("Humanoid")
if _002c then
if _0011.WalkSpeed ~= 16 then _002c.WalkSpeed = _0011.WalkSpeed end
if _0011.JumpPower ~= 50 then
if _002c.UseJumpPower then _002c.JumpPower = _0011.JumpPower
else _002c.JumpHeight = _0011.JumpPower / 10 end
end
end
end)