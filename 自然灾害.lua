local _W6XWZBjZ = 0
local _FhTWRZko = ""
local _UWql7B2k = nil
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
Title = "自然灾害",
Icon = "cloud-lightning",
Author = "自然灾害脚本",
Folder = "NaturalDisaster",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
HideSearchBar = false,
})
local _000f  _000e:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 255, 255)
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
_000e:Tag({ Title = "自然灾害", Color = Color3.fromHex("#FF6347") })
_000e:EditOpenButton({
Title = "自然灾害",
Icon = "cloud-lightning",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FF6347")),
Draggable = true,
})
local _0012  {
AutoSurvive = false,
AutoCollect = false,
AutoHeal = false,
AutoTeleportSafe = false,
AutoBoard = false,
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
local _0013  {}
local _0014  {}
local function GetChar()
return _000b.Character
end
local function GetRoot()
local _0015  GetChar()
return _0015 and _0015:FindFirstChild("HumanoidRootPart") or nil
end
local function GetHum()
local _0015  GetChar()
return _0015 and _0015:FindFirstChildOfClass("Humanoid") or nil
end
local function Notify(title, content, duration)
_0001:Notify({ Title = title, Content = content or "", Duration = duration or 3 })
end
local function GetScreenCenter()
local _0016  _000c.ViewportSize
return Vector2.new(_0016.X / 2, _0016.Y / 2)
end
local function WorldToScreen(pos)
local _0017  onScreen = _000c:WorldToViewportPoint(pos)
return Vector2.new(_0017.X, _0017.Y), onScreen
end
local function GetClosestPlayer(maxDist)
local _0018  nil
local _0019  maxDist or math.huge
local _001a  GetRoot()
if not _001a then return nil end
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000b and plr.Character then
local _001b  plr.Character:FindFirstChildOfClass("Humanoid")
local _001c  plr.Character:FindFirstChild("HumanoidRootPart")
if _001b and _001c and _001b.Health > 0 then
local _001d  (_001a.Position - _001c.Position).Magnitude
if _001d < _0019 then
_0019 = _001d
_0018 = plr
end
end
end
end
return _0018
end
local function GetCurrentDisaster()
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _001e  string.lower(obj.Name)
if string.find(_001e, "tornado") or string.find(_001e, "twister") then return "龙卷风" end
if string.find(_001e, "tsunami") or string.find(_001e, "flood") then return "海啸" end
if string.find(_001e, "earthquake") or string.find(_001e, "seismic") then return "地震" end
if string.find(_001e, "meteor") or string.find(_001e, "asteroid") then return "陨石" end
if string.find(_001e, "volcano") or string.find(_001e, "lava") then return "火山" end
if string.find(_001e, "lightning") or string.find(_001e, "thunder") then return "雷电" end
if string.find(_001e, "blizzard") or string.find(_001e, "snowstorm") then return "暴风雪" end
if string.find(_001e, "fire") or string.find(_001e, "wildfire") then return "火灾" end
end
end
return nil
end
local function FindSafeZone()
local _001f  {}
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _001e  string.lower(obj.Name)
if string.find(_001e, "safe") or string.find(_001e, "shelter") or string.find(_001e, "bunker")
or string.find(_001e, "roof") or string.find(_001e, "platform") or string.find(_001e, "tower") then
table.insert(_001f, obj)
end
end
end
if #_001f == 0 then
local _0020  nil
local _0021  -math.huge
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") and obj.Name ~= "Baseplate" then
if obj.Position.Y > _0021 then
_0021 = obj.Position.Y
_0020 = obj
end
end
end
if _0020 then table.insert(_001f, _0020) end
end
return _001f
end
local function FindVehicle()
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("Model") or obj:IsA("BasePart") then
local _001e  string.lower(obj.Name)
if string.find(_001e, "_002c") or string.find(_001e, "car") or string.find(_001e, "truck")
or string.find(_001e, "helicopter") or string.find(_001e, "heli") or string.find(_001e, "boat")
or string.find(_001e, "bus") or string.find(_001e, "plane") then
local _0022  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _0022 then return _0022 end
end
end
end
return nil
end
local _0023  _000e:Tab({
Title = "自动",
Icon = "play",
})
_0023:Section({ Title = "生存辅助", TextXAlignment = "Left", TextSize = 17 })
_0023:Toggle({
Title = "自动存活",
Default = false,
Callback = function(val)
_0012.AutoSurvive = val
if val then
Notify("自动", "自动存活已开启", 3)
local _0024  0
_0013.AutoSurvive = _0003.Heartbeat:Connect(function()
if not _0012.AutoSurvive then return end
local _0011  tick()
if _0011 - _0024 < math.random(2, 4) then return end
_0024 = _0011
local _0025  GetCurrentDisaster()
local _001a  GetRoot()
if not _001a then return end
if _0025 then
local _0026  FindSafeZone()
if #_0026 > 0 then
local _0018  nil
local _0019  math.huge
for _, zone in ipairs(_0026) do
local _001d  (_001a.Position - zone.Position).Magnitude
if _001d < _0019 then
_0019 = _001d
_0018 = zone
end
end
if _0018 then
_001a.CFrame = _0018.CFrame * CFrame.new(0, 5, 0)
Notify("自动", "检测到" .. _0025 .. "，已传送到安全区", 3)
end
end
end
end)
else
if _0013.AutoSurvive then _0013.AutoSurvive:Disconnect() _0013.AutoSurvive = nil end
Notify("自动", "自动存活已关闭", 3)
end
end,
})
_0023:Toggle({
Title = "自动避险",
Default = false,
Callback = function(val)
_0012.AutoTeleportSafe = val
if val then
Notify("自动", "自动避险已开启", 3)
local _0027  0
_0013.AutoSafe = _0003.Heartbeat:Connect(function()
if not _0012.AutoTeleportSafe then return end
local _0011  tick()
if _0011 - _0027 < math.random(3, 6) then return end
_0027 = _0011
local _001a  GetRoot()
if not _001a then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _001e  string.lower(obj.Name)
if string.find(_001e, "lava") or string.find(_001e, "fire") or string.find(_001e, "magma")
or string.find(_001e, "flood") or string.find(_001e, "water") and obj.Position.Y < _001a.Position.Y then
local _001d  (_001a.Position - obj.Position).Magnitude
if _001d < 30 then
local _0026  FindSafeZone()
if #_0026 > 0 then
_001a.CFrame = _0026[1].CFrame * CFrame.new(0, 10, 0)
Notify("自动", "检测到危险，已避险", 3)
break
end
end
end
end
end
end)
else
if _0013.AutoSafe then _0013.AutoSafe:Disconnect() _0013.AutoSafe = nil end
Notify("自动", "自动避险已关闭", 3)
end
end,
})
_0023:Divider()
_0023:Section({ Title = "收集与恢复", TextXAlignment = "Left", TextSize = 17 })
_0023:Toggle({
Title = "自动收集物资",
Default = false,
Callback = function(val)
_0012.AutoCollect = val
if val then
Notify("自动", "自动收集物资已开启", 3)
_0013.AutoCollect = _0003.Heartbeat:Connect(function()
if not _0012.AutoCollect then return end
local _001a  GetRoot()
if not _001a then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _001e  string.lower(obj.Name)
if string.find(_001e, "coin") or string.find(_001e, "cash") or string.find(_001e, "money")
or string.find(_001e, "supply") or string.find(_001e, "food") or string.find(_001e, "water")
or string.find(_001e, "medkit") or string.find(_001e, "health") or string.find(_001e, "pickup")
or string.find(_001e, "reward") or string.find(_001e, "token") then
local _001d  (_001a.Position - obj.Position).Magnitude
if _001d < 200 then
pcall(function() obj.CFrame = _001a.CFrame end)
end
end
end
end
end)
else
if _0013.AutoCollect then _0013.AutoCollect:Disconnect() _0013.AutoCollect = nil end
Notify("自动", "自动收集物资已关闭", 3)
end
end,
})
_0023:Toggle({
Title = "自动回血",
Default = false,
Callback = function(val)
_0012.AutoHeal = val
if val then
Notify("自动", "自动回血已开启", 3)
_0013.AutoHeal = _0003.Heartbeat:Connect(function()
if not _0012.AutoHeal then return end
local _0028  GetHum()
if not _0028 then return end
if _0028.Health < _0028.MaxHealth * 0.5 then
local _0029  GetChar()
if _0029 then
local _002a  _000b:FindFirstChild("Backpack")
if _002a then
for _, item in ipairs(_002a:GetChildren()) do
local _001e  string.lower(item.Name)
if string.find(_001e, "med") or string.find(_001e, "heal") or string.find(_001e, "bandage")
or string.find(_001e, "potion") or string.find(_001e, "health") then
if item:IsA("Tool") then
pcall(function()
_0029.Humanoid:EquipTool(item)
task.wait(0.1)
item:Activate()
end)
end
end
end
end
end
pcall(function()
for _, obj in ipairs(_0008:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _001e  string.lower(obj.Name)
if string.find(_001e, "heal") or string.find(_001e, "med") or string.find(_001e, "health") then
obj:FireServer()
end
end
end
end)
end
end)
else
if _0013.AutoHeal then _0013.AutoHeal:Disconnect() _0013.AutoHeal = nil end
Notify("自动", "自动回血已关闭", 3)
end
end,
})
_0023:Toggle({
Title = "自动上车",
Default = false,
Callback = function(val)
_0012.AutoBoard = val
if val then
Notify("自动", "自动上车已开启", 3)
local _002b  0
_0013.AutoBoard = _0003.Heartbeat:Connect(function()
if not _0012.AutoBoard then return end
local _0011  tick()
if _0011 - _002b < math.random(1, 3) then return end
_002b = _0011
local _002c  FindVehicle()
local _001a  GetRoot()
if _002c and _001a then
local _001d  (_001a.Position - _002c.Position).Magnitude
if _001d < 50 then
pcall(function()
for _, obj in ipairs(_0008:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _001e  string.lower(obj.Name)
if string.find(_001e, "enter") or string.find(_001e, "board")
or string.find(_001e, "_002c") or string.find(_001e, "sit") then
obj:FireServer(_002c)
end
end
end
end)
end
end
end)
else
if _0013.AutoBoard then _0013.AutoBoard:Disconnect() _0013.AutoBoard = nil end
Notify("自动", "自动上车已关闭", 3)
end
end,
})
_0023:Divider()
_0023:Button({
Title = "检测当前灾害",
Callback = function()
local _0025  GetCurrentDisaster()
if _0025 then
Notify("灾害检测", "当前灾害: " .. _0025, 5)
else
Notify("灾害检测", "未检测到灾害", 3)
end
end,
})
_0023:Button({
Title = "扫描安全区域",
Callback = function()
local _002d  FindSafeZone()
if #_002d > 0 then
Notify("安全区域", "找到 " .. #_002d .. " 个安全区域", 3)
else
Notify("安全区域", "未找到安全区域", 3)
end
end,
})
local _002e  _000e:Tab({
Title = "玩家",
Icon = "user",
})
_002e:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_002e:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
_0012.WalkSpeed = val
local _0028  GetHum()
if _0028 then _0028.WalkSpeed = val end
end,
})
_002e:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(val)
_0012.JumpPower = val
local _0028  GetHum()
if _0028 then
if _0028.UseJumpPower then _0028.JumpPower = val
else _0028.JumpHeight = val / 10 end
end
end,
})
_002e:Divider()
_002e:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
_0012.InfJump = val
if val then
_0013.InfJump = _0004.JumpRequest:Connect(function()
local _0028  GetHum()
if _0028 then _0028:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _0013.InfJump then _0013.InfJump:Disconnect() _0013.InfJump = nil end
end
end,
})
_002e:Toggle({
Title = "穿墙",
Default = false,
Callback = function(val)
_0012.Noclip = val
if val then
_0013.NoClip = _0003.Stepped:Connect(function()
if not _0012.Noclip then return end
local _0015  GetChar()
if _0015 then
for _, p in ipairs(_0015:GetDescendants()) do
if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
end
end
end)
else
if _0013.NoClip then _0013.NoClip:Disconnect() _0013.NoClip = nil end
end
end,
})
_002e:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
_0012.GodMode = val
if val then
Notify("玩家", "无敌已开启", 3)
_0013.GodMode = _0003.Heartbeat:Connect(function()
local _0028  GetHum()
if _0028 and _0028.Health < _0028.MaxHealth then _0028.Health = _0028.MaxHealth end
end)
else
if _0013.GodMode then _0013.GodMode:Disconnect() _0013.GodMode = nil end
Notify("玩家", "无敌已关闭", 3)
end
end,
})
_002e:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
_0012.NoFallDamage = val
if val then
Notify("玩家", "摔落无伤害已开启", 3)
local function setupFall(_0028)
if not _0028 then return end
local _002f  _0028.Health
_0028.StateChanged:Connect(function(old, new)
if not _0012.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_002f = _0028.Health
elseif old == Enum.HumanoidStateType.Freefall then
if _0028.Health < _002f then _0028.Health = _002f end
end
end)
end
local _0015  GetChar()
if _0015 then setupFall(_0015:FindFirstChildOfClass("Humanoid")) end
_0013.NoFall = _000b.CharacterAdded:Connect(function(_0029)
task.wait(0.3)
if _0012.NoFallDamage then setupFall(_0029:FindFirstChildOfClass("Humanoid")) end
end)
else
if _0013.NoFall then _0013.NoFall:Disconnect() _0013.NoFall = nil end
Notify("玩家", "摔落无伤害已关闭", 3)
end
end,
})
_002e:Divider()
local _0030  false
_002e:Button({
Title = "飞行 (手机版)",
Callback = function()
if _0030 then
Notify("飞行", "飞行面板已打开", 3)
return
end
_0030 = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
end,
})
local _0031  _000e:Tab({
Title = "视觉",
Icon = "eye",
})
_0031:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })
local function createESP(player)
if player == _000b then return end
if _0014[player] then return end
local _0032  Instance.new("BillboardGui")
_0032.Name = "ND_ESP_" .. player.Name
_0032.Size = UDim2.new(0, 200, 0, 50)
_0032.StudsOffset = Vector3.new(0, 3, 0)
_0032.AlwaysOnTop = true
local _0033  Instance.new("TextLabel")
_0033.Size = UDim2.new(1, 0, 0, 20)
_0033.BackgroundTransparency = 1
_0033.TextColor3 = Color3.fromRGB(255, 100, 70)
_0033.TextSize = 14
_0033.Font = Enum.Font.SourceSansBold
_0033.TextStrokeTransparency = 0.5
_0033.Text = player.Name
_0033.Parent = _0032
local _0034  Instance.new("TextLabel")
_0034.Size = UDim2.new(1, 0, 0, 18)
_0034.Position = UDim2.new(0, 0, 0, 22)
_0034.BackgroundTransparency = 1
_0034.TextColor3 = Color3.fromRGB(200, 200, 200)
_0034.TextSize = 12
_0034.Text = ""
_0034.Parent = _0032
_0014[player] = { _0032 = _0032, _0033 = _0033, _0034 = _0034 }
end
local function removeESP(player)
if _0014[player] then
if _0014[player]._0032 then _0014[player]._0032:Destroy() end
_0014[player] = nil
end
end
_0031:Toggle({
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
local _0029  plr.Character
if _0029 then
local _0035  _0029:FindFirstChild("Head")
local _001c  _0029:FindFirstChild("HumanoidRootPart")
if _0035 or _001c then
data._0032.Adornee = _0035 or _001c
data._0033.Visible = _0012.ESPNames
data._0034.Visible = _0012.ESPDistance
if _0012.ESPDistance then
local _001a  GetRoot()
if _001a and _001c then
data._0034.Text = math.floor((_001a.Position - _001c.Position).Magnitude) .. " 米"
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
_0031:Toggle({
Title = "显示名字",
Default = true,
Callback = function(val) _0012.ESPNames = val end,
})
_0031:Toggle({
Title = "显示距离",
Default = true,
Callback = function(val) _0012.ESPDistance = val end,
})
_0031:Toggle({
Title = "物品透视 (物资/金币)",
Default = false,
Callback = function(val)
_0012.ESPItems = val
if val then
Notify("视觉", "物品透视已开启", 3)
_0013.Items = _0003.Heartbeat:Connect(function()
if not _0012.ESPItems then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _001e  string.lower(obj.Name)
if string.find(_001e, "coin") or string.find(_001e, "cash") or string.find(_001e, "supply")
or string.find(_001e, "food") or string.find(_001e, "water") or string.find(_001e, "medkit")
or string.find(_001e, "pickup") or string.find(_001e, "reward") or string.find(_001e, "token") then
if not obj:FindFirstChild("ND_ItemESP") then
local _0036  Instance.new("Highlight")
_0036.Name = "ND_ItemESP"
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
if _0013.Items then _0013.Items:Disconnect() _0013.Items = nil end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:FindFirstChild("ND_ItemESP") then obj.ND_ItemESP:Destroy() end
end
Notify("视觉", "物品透视已关闭", 3)
end
end,
})
_0031:Toggle({
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
local _0037  _000e:Tab({
Title = "传送",
Icon = "map-pin",
})
_0037:Section({ Title = "地点", TextXAlignment = "Left", TextSize = 17 })
local _0038  {
{ name = "安全区", keywords = {"safe", "shelter", "bunker"} },
{ name = "高处平台", keywords = {"roof", "platform", "tower", "high"} },
{ name = "商店", keywords = {"shop", "store", "market"} },
{ name = "医疗站", keywords = {"med", "hospital", "clinic"} },
{ name = "载具", keywords = {"_002c", "car", "truck", "heli"} },
{ name = "出生点", keywords = {"spawn", "lobby", "start"} },
{ name = "避难所", keywords = {"shelter", "refuge", "bunker"} },
}
for _, loc in ipairs(_0038) do
_0037:Button({
Title = "传送到" .. loc.name,
Callback = function()
local _0039  false
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _001e  string.lower(obj.Name)
for _, kw in ipairs(loc.keywords) do
if string.find(_001e, kw) then
local _0022  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _0022 then
local _001a  GetRoot()
if _001a then
_001a.CFrame = _0022.CFrame * CFrame.new(0, 5, 0)
Notify("传送", "已传送到" .. loc.name, 3)
_0039 = true
end
break
end
end
end
if _0039 then break end
end
end
if not _0039 then Notify("传送", "未找到" .. loc.name, 3) end
end,
})
end
_0037:Divider()
_0037:Button({
Title = "传送到最高点",
Callback = function()
local _0020  nil
local _0021  -math.huge
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") and obj.Name ~= "Baseplate" then
if obj.Position.Y > _0021 then
_0021 = obj.Position.Y
_0020 = obj
end
end
end
if _0020 then
local _001a  GetRoot()
if _001a then
_001a.CFrame = _0020.CFrame * CFrame.new(0, 10, 0)
Notify("传送", "已传送到最高点 (Y:" .. math.floor(_0021) .. ")", 3)
end
else
Notify("传送", "未找到高点", 3)
end
end,
})
_0037:Button({
Title = "传送到最近玩家",
Callback = function()
local _0018  GetClosestPlayer(9999)
if _0018 and _0018.Character then
local _001a  GetRoot()
local _003a  _0018.Character:FindFirstChild("HumanoidRootPart")
if _001a and _003a then
_001a.CFrame = _003a.CFrame * CFrame.new(0, 0, -3)
Notify("传送", "已传送到 " .. _0018.Name, 3)
end
else
Notify("传送", "未找到玩家", 3)
end
end,
})
_0037:Divider()
local _003b  nil
_0037:Toggle({
Title = "长按传送",
Default = false,
Callback = function(val)
if val then
Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
_0013.TpBegin = _0004.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_003b = tick()
end
end)
_0013.TpHold = _0003.Heartbeat:Connect(function()
if not _003b then return end
if tick() - _003b >= 0.5 then
local _001a  GetRoot()
if _001a then _001a.CFrame = _000d.Hit end
_003b = nil
end
end)
_0013.TpEnd = _0004.InputEnded:Connect(function() _003b = nil end)
else
if _0013.TpBegin then _0013.TpBegin:Disconnect() _0013.TpBegin = nil end
if _0013.TpHold then _0013.TpHold:Disconnect() _0013.TpHold = nil end
if _0013.TpEnd then _0013.TpEnd:Disconnect() _0013.TpEnd = nil end
Notify("传送", "长按传送已关闭", 3)
end
end,
})
local _003c  _000e:Tab({
Title = "实用",
Icon = "settings",
})
_003c:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })
_003c:Toggle({
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
_003c:Toggle({
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
_003c:Divider()
_003c:Button({
Title = "换服",
Callback = function()
Notify("实用", "正在跳转服务器...", 3)
_0009:Teleport(game.PlaceId, _000b)
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
local _0029  GetChar()
if not _0029 then Notify("实用", "无角色", 3) return end
local _003e  {}
local _0028  GetHum()
if _0028 then
table.insert(_003e, "血量: " .. math.floor(_0028.Health) .. "/" .. math.floor(_0028.MaxHealth))
table.insert(_003e, "速度: " .. _0028.WalkSpeed)
end
local _001a  GetRoot()
if _001a then table.insert(_003e, "位置: " .. tostring(_001a.Position)) end
local _003f  _000b:FindFirstChild("leaderstats")
if _003f then
for _, v in ipairs(_003f:GetChildren()) do
table.insert(_003e, v.Name .. ": " .. tostring(v.Value))
end
end
Notify("角色信息", table.concat(_003e, "\n"), 10)
end,
})
_003c:Divider()
_003c:Button({
Title = "清理特效",
Callback = function()
local _0040  0
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false; _0040 = _0040 + 1 end)
end
end
Notify("实用", "已清理 " .. _0040 .. " 个特效", 3)
end,
})
_003c:Button({
Title = "卸载脚本",
Callback = function()
for _, conn in pairs(_0013) do
if conn then pcall(function() conn:Disconnect() end) end
end
_0013 = {}
for p, _ in pairs(_0014) do removeESP(p) end
_0014 = {}
Notify("实用", "脚本已卸载", 3)
end,
})
Notify("自然灾害", "脚本已加载!", 5)
_000b.CharacterAdded:Connect(function(_0029)
task.wait(0.5)
local _0028  _0029:FindFirstChildOfClass("Humanoid")
if _0028 then
if _0012.WalkSpeed ~= 16 then _0028.WalkSpeed = _0012.WalkSpeed end
if _0012.JumpPower ~= 50 then
if _0028.UseJumpPower then _0028.JumpPower = _0012.JumpPower
else _0028.JumpHeight = _0012.JumpPower / 10 end
end
end
end)