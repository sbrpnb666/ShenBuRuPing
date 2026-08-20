local _vHf7A4MZ = 0
local _BHl2CVqX = ""
local _aThfpvv8 = nil
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
Title = "蜂群模拟器",
Icon = "bug",
Author = "蜂群模拟器脚本",
Folder = "BeeSwarm",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
HideSearchBar = false,
})
local _000f  _000e:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 200, 50)
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
_000e:Tag({ Title = "蜂群", Color = Color3.fromHex("#FFD700") })
_000e:EditOpenButton({
Title = "蜂群模拟器",
Icon = "bug",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FFD700")),
Draggable = true,
})
local _0012  {
AutoPollen = false,
AutoConvert = false,
AutoQuest = false,
AutoCoins = false,
AutoMobs = false,
AutoTreats = false,
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
Tracers = false,
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
local function GetPlayers()
local _0016  {}
for _, p in ipairs(_0002:GetPlayers()) do
if p ~= _000b then table.insert(_0016, p.Name) end
end
return _0016
end
local _0017  _000e:Tab({
Title = "自动",
Icon = "play",
})
_0017:Section({ Title = "采集", TextXAlignment = "Left", TextSize = 17 })
_0017:Toggle({
Title = "自动采花粉",
Default = false,
Callback = function(val)
_0012.AutoPollen = val
if val then
Notify("自动", "自动采花粉已开启", 3)
local _0018  0
_0013.AutoPollen = _0003.Heartbeat:Connect(function()
if not _0012.AutoPollen then return end
local _0011  tick()
if _0011 - _0018 < 0.1 then return end
_0018 = _0011
pcall(function()
_0009:SendMouseButtonEvent(_000d.X, _000d.Y, 0, true, game, 1)
task.wait(0.02)
_0009:SendMouseButtonEvent(_000d.X, _000d.Y, 0, false, game, 1)
end)
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "pollen") or string.find(_0019, "collect") or string.find(_0019, "gather") then
obj:FireServer()
end
end
end
end)
pcall(function()
local _001a  GetRoot()
if _001a then
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "pollen") or string.find(_0019, "flake") then
obj.CFrame = _001a.CFrame
end
end
end
end
end)
end)
else
if _0013.AutoPollen then _0013.AutoPollen:Disconnect() _0013.AutoPollen = nil end
Notify("自动", "自动采花粉已关闭", 3)
end
end,
})
_0017:Toggle({
Title = "自动转化蜂蜜",
Default = false,
Callback = function(val)
_0012.AutoConvert = val
if val then
Notify("自动", "自动转化蜂蜜已开启", 3)
_0013.AutoConvert = _0003.Heartbeat:Connect(function()
if not _0012.AutoConvert then return end
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "convert") or string.find(_0019, "honey") or string.find(_0019, "hive") then
obj:FireServer()
end
end
end
end)
pcall(function()
local _001a  GetRoot()
if _001a then
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "converter") or string.find(_0019, "honey") or string.find(_0019, "hive") then
local _001b  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _001b then
_001a.CFrame = _001b.CFrame
end
end
end
end
end
end)
end)
else
if _0013.AutoConvert then _0013.AutoConvert:Disconnect() _0013.AutoConvert = nil end
Notify("自动", "自动转化蜂蜜已关闭", 3)
end
end,
})
_0017:Divider()
_0017:Section({ Title = "收集", TextXAlignment = "Left", TextSize = 17 })
_0017:Toggle({
Title = "自动收集金币",
Default = false,
Callback = function(val)
_0012.AutoCoins = val
if val then
Notify("自动", "自动收集金币已开启", 3)
_0013.AutoCoins = _0003.Heartbeat:Connect(function()
if not _0012.AutoCoins then return end
local _001a  GetRoot()
if not _001a then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "coin") or string.find(_0019, "cash") or string.find(_0019, "money") or string.find(_0019, "token") then
pcall(function() obj.CFrame = _001a.CFrame end)
end
end
end
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "collect") or string.find(_0019, "coin") or string.find(_0019, "token") then
obj:FireServer()
end
end
end
end)
end)
else
if _0013.AutoCoins then _0013.AutoCoins:Disconnect() _0013.AutoCoins = nil end
Notify("自动", "自动收集金币已关闭", 3)
end
end,
})
_0017:Toggle({
Title = "自动收集零食",
Default = false,
Callback = function(val)
_0012.AutoTreats = val
if val then
Notify("自动", "自动收集零食已开启", 3)
_0013.AutoTreats = _0003.Heartbeat:Connect(function()
if not _0012.AutoTreats then return end
local _001a  GetRoot()
if not _001a then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "treat") or string.find(_0019, "snack") or string.find(_0019, "berry") or string.find(_0019, "fruit") then
pcall(function() obj.CFrame = _001a.CFrame end)
end
end
end
end)
else
if _0013.AutoTreats then _0013.AutoTreats:Disconnect() _0013.AutoTreats = nil end
Notify("自动", "自动收集零食已关闭", 3)
end
end,
})
_0017:Divider()
_0017:Section({ Title = "战斗与任务", TextXAlignment = "Left", TextSize = 17 })
_0017:Toggle({
Title = "自动打怪",
Default = false,
Callback = function(val)
_0012.AutoMobs = val
if val then
Notify("自动", "自动打怪已开启", 3)
local _001c  {"mob", "bug", "monster", "spider", "wolf", "scorpion", "mantis", "wasp", "ladybug"}
_0013.AutoMobs = _0003.Heartbeat:Connect(function()
if not _0012.AutoMobs then return end
local _001a  GetRoot()
if not _001a then return end
local _001d  nil
local _001e  math.huge
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("Model") and obj ~= GetChar() then
local _0019  string.lower(obj.Name)
local _001f  false
for _, kw in ipairs(_001c) do
if string.find(_0019, kw) then _001f = true break end
end
if _001f then
local _0020  obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")
local _0021  obj:FindFirstChildOfClass("Humanoid")
if _0020 and (not _0021 or _0021.Health > 0) then
local _0022  (_001a.Position - _0020.Position).Magnitude
if _0022 < _001e and _0022 < 200 then
_001e = _0022
_001d = _0020
end
end
end
end
end
if _001d then
_001a.CFrame = _001d.CFrame * CFrame.new(0, 0, 5)
pcall(function()
_0009:SendMouseButtonEvent(_000d.X, _000d.Y, 0, true, game, 1)
task.wait(0.05)
_0009:SendMouseButtonEvent(_000d.X, _000d.Y, 0, false, game, 1)
end)
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "attack") or string.find(_0019, "damage") or string.find(_0019, "hit") then
obj:FireServer()
end
end
end
end)
end
end)
else
if _0013.AutoMobs then _0013.AutoMobs:Disconnect() _0013.AutoMobs = nil end
Notify("自动", "自动打怪已关闭", 3)
end
end,
})
_0017:Toggle({
Title = "自动做任务",
Default = false,
Callback = function(val)
_0012.AutoQuest = val
if val then
Notify("自动", "自动做任务已开启", 3)
_0013.AutoQuest = _0003.Heartbeat:Connect(function()
if not _0012.AutoQuest then return end
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "quest") or string.find(_0019, "mission") or string.find(_0019, "task") then
obj:FireServer()
end
end
if obj:IsA("RemoteFunction") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "quest") or string.find(_0019, "mission") then
pcall(function() obj:InvokeServer() end)
end
end
end
end)
end)
else
if _0013.AutoQuest then _0013.AutoQuest:Disconnect() _0013.AutoQuest = nil end
Notify("自动", "自动做任务已关闭", 3)
end
end,
})
_0017:Button({
Title = "扫描游戏 Remote",
Callback = function()
local _0023  {}
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
table.insert(_0023, obj:GetFullName())
end
end
local _0024  #_0023 > 0 and table.concat(_0023, "\n") or "未找到 Remote"
Notify("扫描结果", _0024, 10)
end,
})
local _0025  _000e:Tab({
Title = "玩家",
Icon = "user",
})
_0025:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_0025:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
_0012.WalkSpeed = val
local _0026  GetHum()
if _0026 then _0026.WalkSpeed = val end
end,
})
_0025:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(val)
_0012.JumpPower = val
local _0026  GetHum()
if _0026 then
if _0026.UseJumpPower then _0026.JumpPower = val
else _0026.JumpHeight = val / 10 end
end
end,
})
_0025:Divider()
_0025:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
_0012.InfJump = val
if val then
_0013.InfJump = _0004.JumpRequest:Connect(function()
local _0026  GetHum()
if _0026 then _0026:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _0013.InfJump then _0013.InfJump:Disconnect() _0013.InfJump = nil end
end
end,
})
_0025:Toggle({
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
_0025:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
_0012.GodMode = val
if val then
Notify("玩家", "无敌已开启", 3)
_0013.GodMode = _0003.Heartbeat:Connect(function()
local _0026  GetHum()
if _0026 and _0026.Health < _0026.MaxHealth then _0026.Health = _0026.MaxHealth end
end)
else
if _0013.GodMode then _0013.GodMode:Disconnect() _0013.GodMode = nil end
Notify("玩家", "无敌已关闭", 3)
end
end,
})
_0025:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
_0012.NoFallDamage = val
if val then
Notify("玩家", "摔落无伤害已开启", 3)
local function setupFall(_0026)
if not _0026 then return end
local _0027  _0026.Health
_0026.StateChanged:Connect(function(old, new)
if not _0012.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_0027 = _0026.Health
elseif old == Enum.HumanoidStateType.Freefall then
if _0026.Health < _0027 then _0026.Health = _0027 end
end
end)
end
local _0015  GetChar()
if _0015 then setupFall(_0015:FindFirstChildOfClass("Humanoid")) end
_0013.NoFall = _000b.CharacterAdded:Connect(function(_002d)
task.wait(0.3)
if _0012.NoFallDamage then setupFall(_002d:FindFirstChildOfClass("Humanoid")) end
end)
else
if _0013.NoFall then _0013.NoFall:Disconnect() _0013.NoFall = nil end
Notify("玩家", "摔落无伤害已关闭", 3)
end
end,
})
_0025:Divider()
local _0028  false
_0025:Button({
Title = "飞行 (手机版)",
Callback = function()
if _0028 then
Notify("飞行", "飞行面板已打开", 3)
return
end
_0028 = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/飞行脚本V3(全游戏通用).txt"))()
end,
})
local _0029  _000e:Tab({
Title = "视觉",
Icon = "eye",
})
_0029:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })
local function createESP(player)
if player == _000b then return end
if _0014[player] then return end
local _002a  Instance.new("BillboardGui")
_002a.Name = "BeeESP_" .. player.Name
_002a.Size = UDim2.new(0, 200, 0, 50)
_002a.StudsOffset = Vector3.new(0, 3, 0)
_002a.AlwaysOnTop = true
local _002b  Instance.new("TextLabel")
_002b.Size = UDim2.new(1, 0, 0, 20)
_002b.BackgroundTransparency = 1
_002b.TextColor3 = Color3.fromRGB(255, 215, 0)
_002b.TextSize = 14
_002b.Font = Enum.Font.SourceSansBold
_002b.TextStrokeTransparency = 0.5
_002b.Text = player.Name
_002b.Parent = _002a
local _002c  Instance.new("TextLabel")
_002c.Size = UDim2.new(1, 0, 0, 18)
_002c.Position = UDim2.new(0, 0, 0, 22)
_002c.BackgroundTransparency = 1
_002c.TextColor3 = Color3.fromRGB(200, 200, 200)
_002c.TextSize = 12
_002c.Text = ""
_002c.Parent = _002a
_0014[player] = { _002a = _002a, _002b = _002b, _002c = _002c }
end
local function removeESP(player)
if _0014[player] then
if _0014[player]._002a then _0014[player]._002a:Destroy() end
_0014[player] = nil
end
end
_0029:Toggle({
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
local _002d  plr.Character
if _002d then
local _002e  _002d:FindFirstChild("Head")
local _0020  _002d:FindFirstChild("HumanoidRootPart")
if _002e or _0020 then
data._002a.Adornee = _002e or _0020
data._002b.Visible = _0012.ESPNames
data._002c.Visible = _0012.ESPDistance
if _0012.ESPDistance then
local _001a  GetRoot()
local _002f  _0020 or _002e
if _001a and _002f then
data._002c.Text = math.floor((_001a.Position - _002f.Position).Magnitude) .. " 米"
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
_0029:Toggle({
Title = "显示名字",
Default = true,
Callback = function(val) _0012.ESPNames = val end,
})
_0029:Toggle({
Title = "显示距离",
Default = true,
Callback = function(val) _0012.ESPDistance = val end,
})
_0029:Toggle({
Title = "物品透视 (金币/零食)",
Default = false,
Callback = function(val)
_0012.ESPItems = val
if val then
Notify("视觉", "物品透视已开启", 3)
_0013.Items = _0003.Heartbeat:Connect(function()
if not _0012.ESPItems then return end
local _001a  GetRoot()
if not _001a then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "coin") or string.find(_0019, "treat") or string.find(_0019, "token") or string.find(_0019, "berry") then
if not obj:FindFirstChild("BeeItemESP") then
local _0030  Instance.new("Highlight")
_0030.Name = "BeeItemESP"
_0030.FillColor = Color3.fromRGB(255, 215, 0)
_0030.FillTransparency = 0.3
_0030.OutlineColor = Color3.fromRGB(255, 255, 255)
_0030.Parent = obj
end
end
end
end
end)
else
if _0013.Items then _0013.Items:Disconnect() _0013.Items = nil end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:FindFirstChild("BeeItemESP") then obj.BeeItemESP:Destroy() end
end
Notify("视觉", "物品透视已关闭", 3)
end
end,
})
_0029:Toggle({
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
local _0031  _000e:Tab({
Title = "传送",
Icon = "map-pin",
})
_0031:Section({ Title = "花田", TextXAlignment = "Left", TextSize = 17 })
local _0032  {
{ name = "基础花田", keywords = {"basic", "starter"} },
{ name = "向日葵田", keywords = {"sunflower"} },
{ name = "蘑菇田", keywords = {"mushroom"} },
{ name = "草莓田", keywords = {"strawberry", "berry"} },
{ name = "蓝莓田", keywords = {"blueberry"} },
{ name = "菠萝田", keywords = {"pineapple"} },
{ name = "梅花田", keywords = {"clover", "plum"} },
{ name = "蜘蛛田", keywords = {"spider"} },
{ name = "玫瑰田", keywords = {"rose", "flower"} },
{ name = "南瓜田", keywords = {"pumpkin", "pumpkin"} },
{ name = "粘液田", keywords = {"slime", "gumdrop"} },
{ name = "仙人掌田", keywords = {"cactus", "pepper"} },
{ name = "毒蘑菇田", keywords = {"toxic", "fungus"} },
{ name = "樱花田", keywords = {"pepper", "stump"} },
{ name = "椰子田", keywords = {"coconut", "stump"} },
{ name = "西瓜田", keywords = {"watermelon", "melon"} },
{ name = "蒲公英田", keywords = {"dandelion", "puff"} },
{ name = "薄荷田", keywords = {"mint", "peppermint"} },
{ name = "泡泡田", keywords = {"bubble", "bub"} },
}
for _, field in ipairs(_0032) do
_0031:Button({
Title = "传送到" .. field.name,
Callback = function()
local _0033  false
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _0019  string.lower(obj.Name)
for _, kw in ipairs(field.keywords) do
if string.find(_0019, kw) then
local _001b  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _001b then
local _001a  GetRoot()
if _001a then
_001a.CFrame = _001b.CFrame * CFrame.new(0, 5, 0)
Notify("传送", "已传送到" .. field.name, 3)
_0033 = true
end
break
end
end
end
if _0033 then break end
end
end
if not _0033 then Notify("传送", "未找到" .. field.name, 3) end
end,
})
end
_0031:Divider()
_0031:Section({ Title = "地点", TextXAlignment = "Left", TextSize = 17 })
local _0034  {
{ name = "蜂巢", keywords = {"hive"} },
{ name = "商店", keywords = {"shop", "store"} },
{ name = "商店区", keywords = {"shopzone", "zone"} },
{ name = "母蜂", keywords = {"queen", "mother"} },
{ name = "熊", keywords = {"bear", "panda", "onett"} },
{ name = "传送门", keywords = {"portal", "teleport"} },
{ name = "兑换", keywords = {"converter", "convert"} },
{ name = "花田入口", keywords = {"field", "entrance"} },
}
for _, loc in ipairs(_0034) do
_0031:Button({
Title = "传送到" .. loc.name,
Callback = function()
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _0019  string.lower(obj.Name)
for _, kw in ipairs(loc.keywords) do
if string.find(_0019, kw) then
local _001b  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _001b then
local _001a  GetRoot()
if _001a then
_001a.CFrame = _001b.CFrame * CFrame.new(0, 5, 0)
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
_0031:Divider()
local _0035  nil
_0031:Toggle({
Title = "长按传送",
Default = false,
Callback = function(val)
if val then
Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
_0013.TpBegin = _0004.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_0035 = tick()
end
end)
_0013.TpHold = _0003.Heartbeat:Connect(function()
if not _0035 then return end
if tick() - _0035 >= 0.5 then
local _001a  GetRoot()
if _001a then _001a.CFrame = _000d.Hit end
_0035 = nil
end
end)
_0013.TpEnd = _0004.InputEnded:Connect(function() _0035 = nil end)
else
if _0013.TpBegin then _0013.TpBegin:Disconnect() _0013.TpBegin = nil end
if _0013.TpHold then _0013.TpHold:Disconnect() _0013.TpHold = nil end
if _0013.TpEnd then _0013.TpEnd:Disconnect() _0013.TpEnd = nil end
Notify("传送", "长按传送已关闭", 3)
end
end,
})
local _0036  _000e:Tab({
Title = "实用",
Icon = "settings",
})
_0036:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })
_0036:Toggle({
Title = "防挂机",
Default = false,
Callback = function(val)
_0012.AntiAFK = val
if val then
_0013.AntiAFK = _000b.Idled:Connect(function()
_0009:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
_0009:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
Notify("实用", "防挂机已开启", 3)
else
if _0013.AntiAFK then _0013.AntiAFK:Disconnect() _0013.AntiAFK = nil end
Notify("实用", "防挂机已关闭", 3)
end
end,
})
_0036:Toggle({
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
_0036:Divider()
_0036:Button({
Title = "换服",
Callback = function()
Notify("实用", "正在跳转服务器...", 3)
_0008:Teleport(game.PlaceId, _000b)
end,
})
_0036:Button({
Title = "复制服务器号",
Callback = function()
local _0037  game.JobId
if setclipboard then
setclipboard(_0037)
Notify("实用", "已复制: " .. _0037, 3)
else
Notify("实用", "JobId: " .. _0037, 5)
end
end,
})
_0036:Button({
Title = "输出角色信息",
Callback = function()
local _002d  GetChar()
if not _002d then Notify("实用", "无角色", 3) return end
local _0038  {}
local _0026  GetHum()
if _0026 then
table.insert(_0038, "血量: " .. math.floor(_0026.Health) .. "/" .. math.floor(_0026.MaxHealth))
table.insert(_0038, "速度: " .. _0026.WalkSpeed)
end
local _001a  GetRoot()
if _001a then table.insert(_0038, "位置: " .. tostring(_001a.Position)) end
local _0039  _002d:FindFirstChildOfClass("Tool")
if _0039 then table.insert(_0038, "手持: " .. _0039.Name) end
Notify("角色信息", table.concat(_0038, "\n"), 10)
end,
})
_0036:Divider()
_0036:Button({
Title = "清理特效",
Callback = function()
local _003a  0
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false; _003a = _003a + 1 end)
end
end
Notify("实用", "已清理 " .. _003a .. " 个特效", 3)
end,
})
_0036:Button({
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
Notify("蜂群模拟器", "脚本已加载!", 5)
_000b.CharacterAdded:Connect(function(_002d)
task.wait(0.5)
local _0026  _002d:FindFirstChildOfClass("Humanoid")
if _0026 then
if _0012.WalkSpeed ~= 16 then _0026.WalkSpeed = _0012.WalkSpeed end
if _0012.JumpPower ~= 50 then
if _0026.UseJumpPower then _0026.JumpPower = _0012.JumpPower
else _0026.JumpHeight = _0012.JumpPower / 10 end
end
end
end)