local _9Qo6vYGO = 0
local _ThGcHHvP = ""
local _Ul3nS9c0 = nil
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
Title = "力量传奇",
Icon = "dumbbell",
Author = "力量传奇脚本",
Folder = "StrengthLegends",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
HideSearchBar = false,
})
local _000e  _000d:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 100, 100)
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
_000d:Tag({ Title = "力量", Color = Color3.fromHex("#FF6464") })
_000d:EditOpenButton({
Title = "力量传奇",
Icon = "dumbbell",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FF6464")),
Draggable = true,
})
local _0011  {
AutoTrain = false,
AutoRebirth = false,
AutoPunch = false,
AutoQuest = false,
AutoCollectCoins = false,
AutoCollectGems = false,
AutoBuyWeights = false,
AutoBuyPets = false,
AutoHatch = false,
FastPunch = false,
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
local function GetStat(statName)
local _0015  _000a:FindFirstChild("leaderstats")
if _0015 then
local _0016  _0015:FindFirstChild(statName)
if _0016 then return _0016.Value end
end
return nil
end
local _0017  _000d:Tab({
Title = "自动",
Icon = "play",
})
_0017:Section({ Title = "训练", TextXAlignment = "Left", TextSize = 17 })
_0017:Toggle({
Title = "自动训练力量",
Default = false,
Callback = function(val)
_0011.AutoTrain = val
if val then
Notify("自动", "自动训练已开启", 3)
local _0018  0
_0012.AutoTrain = _0003.Heartbeat:Connect(function()
if not _0011.AutoTrain then return end
local _0010  tick()
if _0010 - _0018 < math.random(0.3, 0.6) then return end
_0018 = _0010
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "train") or string.find(_0019, "lift") or string.find(_0019, "weight")
or string.find(_0019, "strength") or string.find(_0019, "power") or string.find(_0019, "exercise") then
obj:FireServer()
end
end
if obj:IsA("RemoteFunction") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "train") or string.find(_0019, "lift") or string.find(_0019, "strength") then
pcall(function() obj:InvokeServer() end)
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
if string.find(_0019, "weight") or string.find(_0019, "gym") or string.find(_0019, "dumbbell")
or string.find(_0019, "barbell") or string.find(_0019, "train") or string.find(_0019, "lift") then
local _001b  obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if _001b then
local _001c  (_001a.Position - _001b.Position).Magnitude
if _001c < 50 then
_0009:SendMouseButtonEvent(_000c.X, _000c.Y, 0, true, game, 1)
task.wait(0.02)
_0009:SendMouseButtonEvent(_000c.X, _000c.Y, 0, false, game, 1)
end
end
end
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
if string.find(_0019, "weight") or string.find(_0019, "gym") or string.find(_0019, "dumbbell")
or string.find(_0019, "barbell") or string.find(_0019, "train") then
local _001c  (_001a.Position - obj.Position).Magnitude
if _001c < 30 then
obj.CFrame = _001a.CFrame
end
end
end
end
end
end)
end)
else
if _0012.AutoTrain then _0012.AutoTrain:Disconnect() _0012.AutoTrain = nil end
Notify("自动", "自动训练已关闭", 3)
end
end,
})
_0017:Toggle({
Title = "自动转生",
Default = false,
Callback = function(val)
_0011.AutoRebirth = val
if val then
Notify("自动", "自动转生已开启", 3)
local _001d  0
_0012.AutoRebirth = _0003.Heartbeat:Connect(function()
if not _0011.AutoRebirth then return end
local _0010  tick()
if _0010 - _001d < math.random(3, 6) then return end
_001d = _0010
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "rebirth") or string.find(_0019, "prestige") or string.find(_0019, "ascend") then
obj:FireServer()
end
end
if obj:IsA("RemoteFunction") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "rebirth") or string.find(_0019, "prestige") then
pcall(function() obj:InvokeServer() end)
end
end
end
end)
end)
else
if _0012.AutoRebirth then _0012.AutoRebirth:Disconnect() _0012.AutoRebirth = nil end
Notify("自动", "自动转生已关闭", 3)
end
end,
})
_0017:Divider()
_0017:Section({ Title = "战斗", TextXAlignment = "Left", TextSize = 17 })
_0017:Toggle({
Title = "自动打拳",
Default = false,
Callback = function(val)
_0011.AutoPunch = val
if val then
Notify("自动", "自动打拳已开启", 3)
local _001e  0
_0012.AutoPunch = _0003.Heartbeat:Connect(function()
if not _0011.AutoPunch then return end
local _0010  tick()
if _0010 - _001e < math.random(0.4, 0.8) then return end
_001e = _0010
pcall(function()
local _001f  GetChar()
if _001f then
local _0020  _001f:FindFirstChildOfClass("Tool")
if _0020 then
_0020:Activate()
else
_0009:SendMouseButtonEvent(_000c.X, _000c.Y, 0, true, game, 1)
task.wait(0.02)
_0009:SendMouseButtonEvent(_000c.X, _000c.Y, 0, false, game, 1)
end
end
end)
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "punch") or string.find(_0019, "hit") or string.find(_0019, "attack")
or string.find(_0019, "fight") or string.find(_0019, "power") then
obj:FireServer()
end
end
end
end)
end)
else
if _0012.AutoPunch then _0012.AutoPunch:Disconnect() _0012.AutoPunch = nil end
Notify("自动", "自动打拳已关闭", 3)
end
end,
})
_0017:Toggle({
Title = "快速出拳",
Default = false,
Callback = function(val)
_0011.FastPunch = val
if val then
Notify("自动", "快速出拳已开启", 3)
_0012.FastPunch = _0003.Heartbeat:Connect(function()
if not _0011.FastPunch then return end
if _0004:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
or _0004:IsMouseButtonPressed(Enum.UserInputType.Touch) then
local _001f  GetChar()
if _001f then
local _0020  _001f:FindFirstChildOfClass("Tool")
if _0020 then
pcall(function() _0020:Activate() end)
end
end
end
end)
else
if _0012.FastPunch then _0012.FastPunch:Disconnect() _0012.FastPunch = nil end
Notify("自动", "快速出拳已关闭", 3)
end
end,
})
_0017:Toggle({
Title = "自动做任务",
Default = false,
Callback = function(val)
_0011.AutoQuest = val
if val then
Notify("自动", "自动做任务已开启", 3)
local _0021  0
_0012.AutoQuest = _0003.Heartbeat:Connect(function()
if not _0011.AutoQuest then return end
local _0010  tick()
if _0010 - _0021 < math.random(2, 4) then return end
_0021 = _0010
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
if _0012.AutoQuest then _0012.AutoQuest:Disconnect() _0012.AutoQuest = nil end
Notify("自动", "自动做任务已关闭", 3)
end
end,
})
_0017:Divider()
_0017:Section({ Title = "收集", TextXAlignment = "Left", TextSize = 17 })
_0017:Toggle({
Title = "自动收集金币",
Default = false,
Callback = function(val)
_0011.AutoCollectCoins = val
if val then
Notify("自动", "自动收集金币已开启", 3)
_0012.AutoCoins = _0003.Heartbeat:Connect(function()
if not _0011.AutoCollectCoins then return end
local _001a  GetRoot()
if not _001a then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "coin") or string.find(_0019, "cash") or string.find(_0019, "money")
or string.find(_0019, "pickup") or string.find(_0019, "reward") then
pcall(function() obj.CFrame = _001a.CFrame end)
end
end
end
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "collect") or string.find(_0019, "coin") or string.find(_0019, "reward") then
obj:FireServer()
end
end
end
end)
end)
else
if _0012.AutoCoins then _0012.AutoCoins:Disconnect() _0012.AutoCoins = nil end
Notify("自动", "自动收集金币已关闭", 3)
end
end,
})
_0017:Toggle({
Title = "自动收集宝石",
Default = false,
Callback = function(val)
_0011.AutoCollectGems = val
if val then
Notify("自动", "自动收集宝石已开启", 3)
_0012.AutoGems = _0003.Heartbeat:Connect(function()
if not _0011.AutoCollectGems then return end
local _001a  GetRoot()
if not _001a then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "gem") or string.find(_0019, "crystal") or string.find(_0019, "diamond") or string.find(_0019, "jewel") then
pcall(function() obj.CFrame = _001a.CFrame end)
end
end
end
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "gem") or string.find(_0019, "crystal") then
obj:FireServer()
end
end
end
end)
end)
else
if _0012.AutoGems then _0012.AutoGems:Disconnect() _0012.AutoGems = nil end
Notify("自动", "自动收集宝石已关闭", 3)
end
end,
})
_0017:Divider()
_0017:Section({ Title = "商店与孵化", TextXAlignment = "Left", TextSize = 17 })
_0017:Toggle({
Title = "自动买哑铃",
Default = false,
Callback = function(val)
_0011.AutoBuyWeights = val
if val then
Notify("自动", "自动买哑铃已开启", 3)
local _0022  0
_0012.AutoBuyW = _0003.Heartbeat:Connect(function()
if not _0011.AutoBuyWeights then return end
local _0010  tick()
if _0010 - _0022 < math.random(1, 3) then return end
_0022 = _0010
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "buy") and (string.find(_0019, "weight") or string.find(_0019, "dumbbell") or string.find(_0019, "barbell")) then
obj:FireServer()
end
end
if obj:IsA("RemoteFunction") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "buy") and (string.find(_0019, "weight") or string.find(_0019, "dumbbell")) then
pcall(function() obj:InvokeServer() end)
end
end
end
end)
end)
else
if _0012.AutoBuyW then _0012.AutoBuyW:Disconnect() _0012.AutoBuyW = nil end
Notify("自动", "自动买哑铃已关闭", 3)
end
end,
})
_0017:Toggle({
Title = "自动买宠物",
Default = false,
Callback = function(val)
_0011.AutoBuyPets = val
if val then
Notify("自动", "自动买宠物已开启", 3)
local _0023  0
_0012.AutoBuyP = _0003.Heartbeat:Connect(function()
if not _0011.AutoBuyPets then return end
local _0010  tick()
if _0010 - _0023 < math.random(2, 5) then return end
_0023 = _0010
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "buy") and (string.find(_0019, "pet") or string.find(_0019, "egg")) then
obj:FireServer()
end
end
if obj:IsA("RemoteFunction") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "buy") and string.find(_0019, "pet") then
pcall(function() obj:InvokeServer() end)
end
end
end
end)
end)
else
if _0012.AutoBuyP then _0012.AutoBuyP:Disconnect() _0012.AutoBuyP = nil end
Notify("自动", "自动买宠物已关闭", 3)
end
end,
})
_0017:Toggle({
Title = "自动孵化宠物蛋",
Default = false,
Callback = function(val)
_0011.AutoHatch = val
if val then
Notify("自动", "自动孵化已开启", 3)
local _0024  0
_0012.AutoHatch = _0003.Heartbeat:Connect(function()
if not _0011.AutoHatch then return end
local _0010  tick()
if _0010 - _0024 < math.random(1, 3) then return end
_0024 = _0010
pcall(function()
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "hatch") or string.find(_0019, "open") or string.find(_0019, "egg") then
obj:FireServer()
end
end
if obj:IsA("RemoteFunction") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "hatch") or string.find(_0019, "egg") then
pcall(function() obj:InvokeServer() end)
end
end
end
end)
end)
else
if _0012.AutoHatch then _0012.AutoHatch:Disconnect() _0012.AutoHatch = nil end
Notify("自动", "自动孵化已关闭", 3)
end
end,
})
_0017:Button({
Title = "扫描游戏接口",
Callback = function()
local _0025  {}
for _, obj in ipairs(_0007:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
table.insert(_0025, obj:GetFullName())
end
end
local _0026  #_0025 > 0 and table.concat(_0025, "\n") or "未找到接口"
Notify("扫描结果", _0026, 10)
end,
})
local _0027  _000d:Tab({
Title = "玩家",
Icon = "user",
})
_0027:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_0027:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
_0011.WalkSpeed = val
local _0028  GetHum()
if _0028 then _0028.WalkSpeed = val end
end,
})
_0027:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(val)
_0011.JumpPower = val
local _0028  GetHum()
if _0028 then
if _0028.UseJumpPower then _0028.JumpPower = val
else _0028.JumpHeight = val / 10 end
end
end,
})
_0027:Divider()
_0027:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
_0011.InfJump = val
if val then
_0012.InfJump = _0004.JumpRequest:Connect(function()
local _0028  GetHum()
if _0028 then _0028:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _0012.InfJump then _0012.InfJump:Disconnect() _0012.InfJump = nil end
end
end,
})
_0027:Toggle({
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
_0027:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
_0011.GodMode = val
if val then
Notify("玩家", "无敌已开启", 3)
_0012.GodMode = _0003.Heartbeat:Connect(function()
local _0028  GetHum()
if _0028 and _0028.Health < _0028.MaxHealth then _0028.Health = _0028.MaxHealth end
end)
else
if _0012.GodMode then _0012.GodMode:Disconnect() _0012.GodMode = nil end
Notify("玩家", "无敌已关闭", 3)
end
end,
})
_0027:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
_0011.NoFallDamage = val
if val then
Notify("玩家", "摔落无伤害已开启", 3)
local function setupFall(_0028)
if not _0028 then return end
local _0029  _0028.Health
_0028.StateChanged:Connect(function(old, new)
if not _0011.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_0029 = _0028.Health
elseif old == Enum.HumanoidStateType.Freefall then
if _0028.Health < _0029 then _0028.Health = _0029 end
end
end)
end
local _0014  GetChar()
if _0014 then setupFall(_0014:FindFirstChildOfClass("Humanoid")) end
_0012.NoFall = _000a.CharacterAdded:Connect(function(_001f)
task.wait(0.3)
if _0011.NoFallDamage then setupFall(_001f:FindFirstChildOfClass("Humanoid")) end
end)
else
if _0012.NoFall then _0012.NoFall:Disconnect() _0012.NoFall = nil end
Notify("玩家", "摔落无伤害已关闭", 3)
end
end,
})
_0027:Divider()
local _002a  false
_0027:Button({
Title = "飞行 (手机版)",
Callback = function()
if _002a then
Notify("飞行", "飞行面板已打开", 3)
return
end
_002a = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/飞行脚本V3(全游戏通用).txt"))()
end,
})
local _002b  _000d:Tab({
Title = "视觉",
Icon = "eye",
})
_002b:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })
local function createESP(player)
if player == _000a then return end
if _0013[player] then return end
local _002c  Instance.new("BillboardGui")
_002c.Name = "PowerESP_" .. player.Name
_002c.Size = UDim2.new(0, 200, 0, 50)
_002c.StudsOffset = Vector3.new(0, 3, 0)
_002c.AlwaysOnTop = true
local _002d  Instance.new("TextLabel")
_002d.Size = UDim2.new(1, 0, 0, 20)
_002d.BackgroundTransparency = 1
_002d.TextColor3 = Color3.fromRGB(255, 100, 100)
_002d.TextSize = 14
_002d.Font = Enum.Font.SourceSansBold
_002d.TextStrokeTransparency = 0.5
_002d.Text = player.Name
_002d.Parent = _002c
local _002e  Instance.new("TextLabel")
_002e.Size = UDim2.new(1, 0, 0, 18)
_002e.Position = UDim2.new(0, 0, 0, 22)
_002e.BackgroundTransparency = 1
_002e.TextColor3 = Color3.fromRGB(200, 200, 200)
_002e.TextSize = 12
_002e.Text = ""
_002e.Parent = _002c
_0013[player] = { _002c = _002c, _002d = _002d, _002e = _002e }
end
local function removeESP(player)
if _0013[player] then
if _0013[player]._002c then _0013[player]._002c:Destroy() end
_0013[player] = nil
end
end
_002b:Toggle({
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
local _001f  plr.Character
if _001f then
local _002f  _001f:FindFirstChild("Head")
local _0030  _001f:FindFirstChild("HumanoidRootPart")
if _002f or _0030 then
data._002c.Adornee = _002f or _0030
data._002d.Visible = _0011.ESPNames
data._002e.Visible = _0011.ESPDistance
if _0011.ESPDistance then
local _001a  GetRoot()
local _0031  _0030 or _002f
if _001a and _0031 then
data._002e.Text = math.floor((_001a.Position - _0031.Position).Magnitude) .. " 米"
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
_002b:Toggle({
Title = "显示名字",
Default = true,
Callback = function(val) _0011.ESPNames = val end,
})
_002b:Toggle({
Title = "显示距离",
Default = true,
Callback = function(val) _0011.ESPDistance = val end,
})
_002b:Toggle({
Title = "物品透视 (金币/宝石)",
Default = false,
Callback = function(val)
_0011.ESPItems = val
if val then
Notify("视觉", "物品透视已开启", 3)
_0012.Items = _0003.Heartbeat:Connect(function()
if not _0011.ESPItems then return end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:IsA("BasePart") then
local _0019  string.lower(obj.Name)
if string.find(_0019, "coin") or string.find(_0019, "gem") or string.find(_0019, "crystal")
or string.find(_0019, "diamond") or string.find(_0019, "pickup") or string.find(_0019, "reward") then
if not obj:FindFirstChild("PowerItemESP") then
local _0032  Instance.new("Highlight")
_0032.Name = "PowerItemESP"
_0032.FillColor = Color3.fromRGB(255, 200, 0)
_0032.FillTransparency = 0.3
_0032.OutlineColor = Color3.fromRGB(255, 255, 255)
_0032.Parent = obj
end
end
end
end
end)
else
if _0012.Items then _0012.Items:Disconnect() _0012.Items = nil end
for _, obj in ipairs(_0005:GetDescendants()) do
if obj:FindFirstChild("PowerItemESP") then obj.PowerItemESP:Destroy() end
end
Notify("视觉", "物品透视已关闭", 3)
end
end,
})
_002b:Toggle({
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
local _0033  _000d:Tab({
Title = "传送",
Icon = "map-pin",
})
_0033:Section({ Title = "地点", TextXAlignment = "Left", TextSize = 17 })
local _0034  {
{ name = "健身房", keywords = {"gym", "weight", "train", "lift"} },
{ name = "训练区", keywords = {"training", "area", "zone", "practice"} },
{ name = "商店", keywords = {"shop", "store", "market"} },
{ name = "宠物店", keywords = {"pet", "egg", "hatch"} },
{ name = "哑铃店", keywords = {"dumbbell", "barbell", "weight"} },
{ name = "转生区", keywords = {"rebirth", "prestige", "ascend"} },
{ name = "任务NPC", keywords = {"quest", "mission", "npc"} },
{ name = "竞技场", keywords = {"arena", "pvp", "fight"} },
{ name = "出生点", keywords = {"spawn", "lobby", "start"} },
{ name = "金币区", keywords = {"coin", "money", "cash"} },
{ name = "宝石区", keywords = {"gem", "crystal", "diamond"} },
{ name = "Boss区", keywords = {"boss", "raid"} },
}
for _, loc in ipairs(_0034) do
_0033:Button({
Title = "传送到" .. loc.name,
Callback = function()
local _0035  false
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
_0035 = true
end
break
end
end
end
if _0035 then break end
end
end
if not _0035 then Notify("传送", "未找到" .. loc.name, 3) end
end,
})
end
_0033:Divider()
local _0036  nil
_0033:Toggle({
Title = "长按传送",
Default = false,
Callback = function(val)
if val then
Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
_0012.TpBegin = _0004.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_0036 = tick()
end
end)
_0012.TpHold = _0003.Heartbeat:Connect(function()
if not _0036 then return end
if tick() - _0036 >= 0.5 then
local _001a  GetRoot()
if _001a then _001a.CFrame = _000c.Hit end
_0036 = nil
end
end)
_0012.TpEnd = _0004.InputEnded:Connect(function() _0036 = nil end)
else
if _0012.TpBegin then _0012.TpBegin:Disconnect() _0012.TpBegin = nil end
if _0012.TpHold then _0012.TpHold:Disconnect() _0012.TpHold = nil end
if _0012.TpEnd then _0012.TpEnd:Disconnect() _0012.TpEnd = nil end
Notify("传送", "长按传送已关闭", 3)
end
end,
})
local _0037  _000d:Tab({
Title = "实用",
Icon = "settings",
})
_0037:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })
_0037:Toggle({
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
_0037:Toggle({
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
_0037:Divider()
_0037:Button({
Title = "换服",
Callback = function()
Notify("实用", "正在跳转服务器...", 3)
_0008:Teleport(game.PlaceId, _000a)
end,
})
_0037:Button({
Title = "复制服务器号",
Callback = function()
local _0038  game.JobId
if setclipboard then
setclipboard(_0038)
Notify("实用", "已复制: " .. _0038, 3)
else
Notify("实用", "JobId: " .. _0038, 5)
end
end,
})
_0037:Button({
Title = "输出角色信息",
Callback = function()
local _001f  GetChar()
if not _001f then Notify("实用", "无角色", 3) return end
local _0039  {}
local _0028  GetHum()
if _0028 then
table.insert(_0039, "血量: " .. math.floor(_0028.Health) .. "/" .. math.floor(_0028.MaxHealth))
table.insert(_0039, "速度: " .. _0028.WalkSpeed)
end
local _001a  GetRoot()
if _001a then table.insert(_0039, "位置: " .. tostring(_001a.Position)) end
local _0015  _000a:FindFirstChild("leaderstats")
if _0015 then
for _, v in ipairs(_0015:GetChildren()) do
table.insert(_0039, v.Name .. ": " .. tostring(v.Value))
end
end
Notify("角色信息", table.concat(_0039, "\n"), 10)
end,
})
_0037:Divider()
_0037:Button({
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
_0037:Button({
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
Notify("力量传奇", "脚本已加载!", 5)
_000a.CharacterAdded:Connect(function(_001f)
task.wait(0.5)
local _0028  _001f:FindFirstChildOfClass("Humanoid")
if _0028 then
if _0011.WalkSpeed ~= 16 then _0028.WalkSpeed = _0011.WalkSpeed end
if _0011.JumpPower ~= 50 then
if _0028.UseJumpPower then _0028.JumpPower = _0011.JumpPower
else _0028.JumpHeight = _0011.JumpPower / 10 end
end
end
end)