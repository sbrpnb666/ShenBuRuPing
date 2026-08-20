local _obNbqj5D = 0
local _n2LllCHP = ""
local _Sed19UVt = nil
local _0001 local _0002  uiErr = pcall(function()
_0001 = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
end)
if not _0002 or not _0001 then
warn("_0001 加载失败: " .. tostring(uiErr))
return
end
local _0003  game:GetService("_0003")
local _0004  game:GetService("_0004")
local _0005  game:GetService("_0005")
local _0006  game:GetService("_0006")
local _0007  game:GetService("_0007")
local _0008  game:GetService("_0008")
local _0009  game:GetService("_0009")
local _000a  game:GetService("_000a")
local _000b  game:GetService("_000b")
local _000c  _0003._000c
local _000d  _0006.CurrentCamera
local _000e  _000c:GetMouse()
local _000f  {
AutoSwing = false,
AutoRebirth = false,
AutoBuySword = false,
AutoBuyBelt = false,
AutoSell = false,
AutoBuyPet = false,
AutoHatch = false,
AutoCollectCoins = false,
AutoCollectSouls = false,
WalkSpeed = 16,
JumpPower = 50,
InfiniteJump = false,
NoCollision = false,
GodMode = false,
NoFallDamage = false,
PlayerESP = false,
ShowName = true,
ShowDistance = true,
ItemESP = false,
FullHighlight = false,
LongPressTP = false,
TPHoldStart = 0,
AntiAFK = false,
QualityBoost = false,
IsFalling = false,
OriginalQualityLevel = nil,
OriginalLighting = nil,
}
local _0010  {}
local _0011  {}
local function StopConnection(_0014)
if _0010[_0014] then
local _0012  _0010[_0014]
if type(_0012) == "thread" then
pcall(function()
task.cancel(_0012)
end)
elseif typeof(_0012) == "RBXScriptConnection" then
_0012:Disconnect()
end
_0010[_0014] = nil
end
end
local function StartLoop(_0014, func)
StopConnection(_0014)
_0010[_0014] = task.spawn(func)
end
local function GetChar()
return _000c.Character
end
local function GetRoot()
local _0013  GetChar()
if _0013 then
return _0013:FindFirstChild("HumanoidRootPart") or _0013:FindFirstChild("Torso") or _0013:FindFirstChild("UpperTorso")
end
return nil
end
local function GetHum()
local _0013  GetChar()
if _0013 then
return _0013:FindFirstChildOfClass("Humanoid")
end
return nil
end
local function Notify(title, content, duration)
_0001:Notify({
Title = title,
Content = content,
Duration = duration or 3
})
end
local function FindRemote(_0022)
for _, obj in ipairs(_0009:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local _0014  string.lower(obj.Name)
for _, kw in ipairs(_0022) do
if string.find(_0014, kw) then
return obj
end
end
end
end
return nil
end
local function FindBuyRemote(itemKeywords)
for _, obj in ipairs(_0009:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
local _0014  string.lower(obj.Name)
if string.find(_0014, "buy") then
for _, kw in ipairs(itemKeywords) do
if string.find(_0014, kw) then
return obj
end
end
end
end
end
return nil
end
local function CallRemote(_002e, ...)
if not _002e then return end
local _0015  {...}
pcall(function()
if _002e:IsA("RemoteEvent") then
_002e:FireServer(unpack(_0015))
elseif _002e:IsA("RemoteFunction") then
_002e:InvokeServer(unpack(_0015))
end
end)
end
local function FindPartsInWorkspace(_0022)
local _0016  {}
for _, obj in ipairs(_0006:GetDescendants()) do
if obj:IsA("BasePart") then
local _0014  string.lower(obj.Name)
for _, kw in ipairs(_0022) do
if string.find(_0014, kw) then
table.insert(_0016, obj)
break
end
end
end
end
return _0016
end
local _0017 local function GetESPParent()
if _0017 then return _0017 end
local _0018  hui = pcall(function()
if gethui then return gethui() end
end)
if _0018 and hui then _0017 = hui return hui end
local _0019  cg = pcall(function()
return game:GetService("CoreGui")
end)
if _0019 and cg then _0017 = cg return cg end
_0017 = _000c:FindFirstChildOfClass("PlayerGui")
return _0017
end
local function CopyToClipboard(text)
if setclipboard then
pcall(setclipboard, text)
return true
elseif toclipboard then
pcall(toclipboard, text)
return true
elseif writeclipboard then
pcall(writeclipboard, text)
return true
end
return false
end
local function TeleportToLocation(_0022, locationName)
local _001a  GetRoot()
if not _001a then
Notify("忍者传奇", "未找到角色!", 3)
return
end
for _, obj in ipairs(_0006:GetDescendants()) do
local _0014  string.lower(obj.Name)
for _, kw in ipairs(_0022) do
if string.find(_0014, kw) then
local _001b  obj
if obj:IsA("Model") then
_001b = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
end
if _001b and _001b:IsA("BasePart") then
_001a.CFrame = _001b.CFrame * CFrame.new(0, 5, 0)
Notify("忍者传奇", "已传送到 " .. (locationName or obj.Name), 3)
return
end
end
end
end
Notify("忍者传奇", "未找到 " .. (locationName or "传送地点") .. "!", 3)
end
local function UpdatePlayerESP()
for _, plr in ipairs(_0003:GetPlayers()) do
if plr ~= _000c then
local _0013  plr.Character
if _0013 then
local _001a  _0013:FindFirstChild("HumanoidRootPart") or _0013:FindFirstChild("Torso")
local _001c  GetRoot()
if _001a and _001c then
local _001d  math.floor((_001a.Position - _001c.Position).Magnitude)
if not _0011[plr] then
local _001e  Instance.new("BillboardGui")
_001e.Name = "ESP_" .. plr.Name
_001e.AlwaysOnTop = true
_001e.Size = UDim2.new(0, 200, 0, 50)
_001e.StudsOffset = Vector3.new(0, 3, 0)
_001e.Parent = GetESPParent()
local _001f  Instance.new("TextLabel")
_001f.Size = UDim2.new(1, 0, 0.5, 0)
_001f.BackgroundTransparency = 1
_001f.TextColor3 = Color3.new(1, 1, 1)
_001f.TextScaled = true
_001f.Font = Enum.Font.SourceSansBold
_001f.TextStrokeTransparency = 0
_001f.Parent = _001e
local _0020  Instance.new("TextLabel")
_0020.Size = UDim2.new(1, 0, 0.5, 0)
_0020.Position = UDim2.new(0, 0, 0.5, 0)
_0020.BackgroundTransparency = 1
_0020.TextColor3 = Color3.fromRGB(255, 255, 0)
_0020.TextScaled = true
_0020.Font = Enum.Font.SourceSansBold
_0020.TextStrokeTransparency = 0
_0020.Parent = _001e
_0011[plr] = {
Billboard = _001e,
NameLabel = _001f,
DistLabel = _0020
}
end
local _0021  _0011[plr]
if _0021 then
_0021.Billboard.Adornee = _001a
_0021.NameLabel.Visible = _000f.ShowName
_0021.NameLabel.Text = plr.Name
_0021.DistLabel.Visible = _000f.ShowDistance
_0021.DistLabel.Text = _001d .. "m"
end
else
if _0011[plr] then
_0011[plr].Billboard.Adornee = nil
end
end
else
if _0011[plr] then
_0011[plr].Billboard.Adornee = nil
end
end
end
end
for plr, _0021 in pairs(_0011) do
if typeof(plr) == "Instance" and plr:IsA("Player") and not plr.Parent then
pcall(function()
_0021.Billboard:Destroy()
end)
_0011[plr] = nil
end
end
end
local function UpdateItemESP()
for _0024, _0025 in pairs(_0011) do
if type(_0024) == "string" and string.sub(_0024, 1, 5) == "item_" then
if not _0025.Parent or (_0025.Adornee and not _0025.Adornee.Parent) then
pcall(function() _0025:Destroy() end)
_0011[_0024] = nil
end
end
end
local _0022  {"coin", "soul", "sword", "belt"}
for _, obj in ipairs(_0006:GetDescendants()) do
if obj:IsA("BasePart") then
local _0014  string.lower(obj.Name)
local _0023  false
for _, kw in ipairs(_0022) do
if string.find(_0014, kw) then
_0023 = true
break
end
end
if _0023 then
local _0024  "item_" .. obj:GetDebugId()
if not _0011[_0024] then
local _0025  Instance.new("Highlight")
_0025.Adornee = obj
_0025.FillColor = Color3.fromRGB(255, 255, 0)
_0025.FillTransparency = 0.5
_0025.OutlineColor = Color3.fromRGB(255, 0, 0)
_0025.Parent = GetESPParent()
_0011[_0024] = _0025
end
end
end
end
end
local function SetupNoFallDamage()
if not _000f.NoFallDamage then return end
local _0026  GetHum()
if not _0026 then return end
StopConnection("NoFallDamage")
_0010["NoFallDamage"] = _0026.StateChanged:Connect(function(old, new)
if new == Enum.HumanoidStateType.Freefall then
_000f.IsFalling = true
elseif new == Enum.HumanoidStateType.Landed then
if _000f.IsFalling then
_0026.Health = _0026.MaxHealth
_000f.IsFalling = false
end
end
end)
end
local _0027  _0001:CreateWindow({
Title = "忍者传奇",
Icon = "sword",
Author = "忍者传奇脚本",
Folder = "NinjaLegend",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark"
})
local _0028  _0027:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 255, 255)
})
task.spawn(function()
local _0029  0
while true do
_0029 = _0029 + 0.01
if _0029 > 1 then _0029 = 0 end
local _002a  Color3.fromHSV(_0029, 1, 1)
local _002b  os.date("%H:%M")
if _0028 then
pcall(function()
_0028.Color = _002a
_0028.Title = _002b
end)
end
task.wait(0.06)
end
end)
_0027:Tag({
Title = "忍者传奇",
Color = Color3.fromHex("#9B30FF")
})
_0027:EditOpenButton({
Title = "忍者传奇",
Icon = "sword",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("9B30FF")),
Draggable = true
})
local _002c  _0027:Tab({
Title = "自动",
Icon = "play"
})
local _002d  _002c:Section({ Title = "训练" })
_002c:Toggle({
Title = "自动挥刀训练",
Default = false,
Callback = function(state)
_000f.AutoSwing = state
if state then
Notify("忍者传奇", "自动挥刀训练已开启!", 3)
StartLoop("AutoSwing", function()
while _000f.AutoSwing do
local _002e  FindRemote({"train", "swing", "slash", "ninja", "sword"})
CallRemote(_002e)
task.wait(0.1 + math.random() * 0.3)
end
end)
else
StopConnection("AutoSwing")
Notify("忍者传奇", "自动挥刀训练已关闭!", 3)
end
end
})
_002c:Toggle({
Title = "自动转生",
Default = false,
Callback = function(state)
_000f.AutoRebirth = state
if state then
Notify("忍者传奇", "自动转生已开启!", 3)
StartLoop("AutoRebirth", function()
while _000f.AutoRebirth do
local _002e  FindRemote({"rebirth", "prestige", "ascend"})
CallRemote(_002e)
task.wait(1 + math.random() * 2)
end
end)
else
StopConnection("AutoRebirth")
Notify("忍者传奇", "自动转生已关闭!", 3)
end
end
})
_002c:Section({ Title = "商店" })
_002c:Toggle({
Title = "自动买剑",
Default = false,
Callback = function(state)
_000f.AutoBuySword = state
if state then
Notify("忍者传奇", "自动买剑已开启!", 3)
StartLoop("AutoBuySword", function()
while _000f.AutoBuySword do
local _002e  FindBuyRemote({"sword", "blade"})
CallRemote(_002e)
task.wait(0.5 + math.random() * 1)
end
end)
else
StopConnection("AutoBuySword")
Notify("忍者传奇", "自动买剑已关闭!", 3)
end
end
})
_002c:Toggle({
Title = "自动买腰带",
Default = false,
Callback = function(state)
_000f.AutoBuyBelt = state
if state then
Notify("忍者传奇", "自动买腰带已开启!", 3)
StartLoop("AutoBuyBelt", function()
while _000f.AutoBuyBelt do
local _002e  FindBuyRemote({"belt"})
CallRemote(_002e)
task.wait(0.5 + math.random() * 1)
end
end)
else
StopConnection("AutoBuyBelt")
Notify("忍者传奇", "自动买腰带已关闭!", 3)
end
end
})
_002c:Toggle({
Title = "自动卖",
Default = false,
Callback = function(state)
_000f.AutoSell = state
if state then
Notify("忍者传奇", "自动卖已开启!", 3)
StartLoop("AutoSell", function()
while _000f.AutoSell do
local _002e  FindRemote({"sell"})
CallRemote(_002e)
task.wait(0.5 + math.random() * 1)
end
end)
else
StopConnection("AutoSell")
Notify("忍者传奇", "自动卖已关闭!", 3)
end
end
})
_002c:Toggle({
Title = "自动买宠物",
Default = false,
Callback = function(state)
_000f.AutoBuyPet = state
if state then
Notify("忍者传奇", "自动买宠物已开启!", 3)
StartLoop("AutoBuyPet", function()
while _000f.AutoBuyPet do
local _002e  FindBuyRemote({"pet", "egg"})
CallRemote(_002e)
task.wait(0.5 + math.random() * 1.5)
end
end)
else
StopConnection("AutoBuyPet")
Notify("忍者传奇", "自动买宠物已关闭!", 3)
end
end
})
_002c:Toggle({
Title = "自动孵化",
Default = false,
Callback = function(state)
_000f.AutoHatch = state
if state then
Notify("忍者传奇", "自动孵化已开启!", 3)
StartLoop("AutoHatch", function()
while _000f.AutoHatch do
local _002e  FindRemote({"hatch", "egg", "open"})
CallRemote(_002e)
task.wait(0.5 + math.random() * 1)
end
end)
else
StopConnection("AutoHatch")
Notify("忍者传奇", "自动孵化已关闭!", 3)
end
end
})
_002c:Section({ Title = "收集" })
_002c:Toggle({
Title = "自动收集金币",
Default = false,
Callback = function(state)
_000f.AutoCollectCoins = state
if state then
Notify("忍者传奇", "自动收集金币已开启!", 3)
StartLoop("AutoCollectCoins", function()
while _000f.AutoCollectCoins do
local _001a  GetRoot()
if _001a then
local _002f  FindPartsInWorkspace({"coin", "cash", "money"})
for _, _001b in ipairs(_002f) do
pcall(function()
_001b.CFrame = _001a.CFrame
end)
end
end
task.wait(0.1 + math.random() * 0.2)
end
end)
else
StopConnection("AutoCollectCoins")
Notify("忍者传奇", "自动收集金币已关闭!", 3)
end
end
})
_002c:Toggle({
Title = "自动收集灵魂",
Default = false,
Callback = function(state)
_000f.AutoCollectSouls = state
if state then
Notify("忍者传奇", "自动收集灵魂已开启!", 3)
StartLoop("AutoCollectSouls", function()
while _000f.AutoCollectSouls do
local _001a  GetRoot()
if _001a then
local _002f  FindPartsInWorkspace({"soul", "spirit", "essence"})
for _, _001b in ipairs(_002f) do
pcall(function()
_001b.CFrame = _001a.CFrame
end)
end
end
task.wait(0.1 + math.random() * 0.2)
end
end)
else
StopConnection("AutoCollectSouls")
Notify("忍者传奇", "自动收集灵魂已关闭!", 3)
end
end
})
local _0030  _0027:Tab({
Title = "玩家",
Icon = "user"
})
_0030:Section({ Title = "移动" })
_0030:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(value)
_000f.WalkSpeed = value
local _0026  GetHum()
if _0026 then
_0026.WalkSpeed = value
end
end
})
_0030:Slider({
Title = "跳跃力",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(value)
_000f.JumpPower = value
local _0026  GetHum()
if _0026 then
_0026.UseJumpPower = true
_0026.JumpPower = value
end
end
})
_0030:Divider()
_0030:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(state)
_000f.InfiniteJump = state
if state then
Notify("忍者传奇", "无限跳跃已开启!", 3)
_0010["InfiniteJump"] = _0005.JumpRequest:Connect(function()
local _0026  GetHum()
if _0026 then
_0026:ChangeState(Enum.HumanoidStateType.Jumping)
end
end)
else
StopConnection("InfiniteJump")
Notify("忍者传奇", "无限跳跃已关闭!", 3)
end
end
})
_0030:Toggle({
Title = "穿墙",
Default = false,
Callback = function(state)
_000f.NoCollision = state
if state then
Notify("忍者传奇", "穿墙已开启!", 3)
_0010["NoCollision"] = _0004.Stepped:Connect(function()
local _0013  GetChar()
if _0013 then
for _, _001b in ipairs(_0013:GetDescendants()) do
if _001b:IsA("BasePart") and _001b.Name ~= "HumanoidRootPart" then
_001b.CanCollide = false
end
end
end
end)
else
StopConnection("NoCollision")
Notify("忍者传奇", "穿墙已关闭!", 3)
end
end
})
_0030:Toggle({
Title = "无敌",
Default = false,
Callback = function(state)
_000f.GodMode = state
if state then
Notify("忍者传奇", "无敌已开启!", 3)
_0010["GodMode"] = _0004.Heartbeat:Connect(function()
local _0026  GetHum()
if _0026 then
_0026.Health = _0026.MaxHealth
end
end)
else
StopConnection("GodMode")
Notify("忍者传奇", "无敌已关闭!", 3)
end
end
})
_0030:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(state)
_000f.NoFallDamage = state
if state then
Notify("忍者传奇", "摔落无伤害已开启!", 3)
SetupNoFallDamage()
else
StopConnection("NoFallDamage")
Notify("忍者传奇", "摔落无伤害已关闭!", 3)
end
end
})
_0030:Divider()
_0030:Button({
Title = "飞行手机版",
Callback = function()
Notify("忍者传奇", "正在加载飞行脚本...", 3)
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"))()
end)
end
})
local _0031  _0027:Tab({
Title = "视觉",
Icon = "eye"
})
_0031:Section({ Title = "透视" })
_0031:Toggle({
Title = "人物透视",
Default = false,
Callback = function(state)
_000f.PlayerESP = state
if state then
Notify("忍者传奇", "人物透视已开启!", 3)
_000f.ShowName = true
_000f.ShowDistance = true
StartLoop("PlayerESP", function()
while _000f.PlayerESP do
UpdatePlayerESP()
task.wait(0.1)
end
end)
else
StopConnection("PlayerESP")
for _0024, obj in pairs(_0011) do
if typeof(_0024) == "Instance" and _0024:IsA("Player") then
pcall(function()
obj.Billboard:Destroy()
end)
_0011[_0024] = nil
end
end
Notify("忍者传奇", "人物透视已关闭!", 3)
end
end
})
_0031:Toggle({
Title = "显示名字",
Default = true,
Callback = function(state)
_000f.ShowName = state
if state then
Notify("忍者传奇", "显示名字已开启!", 3)
else
Notify("忍者传奇", "显示名字已关闭!", 3)
end
end
})
_0031:Toggle({
Title = "显示距离",
Default = true,
Callback = function(state)
_000f.ShowDistance = state
if state then
Notify("忍者传奇", "显示距离已开启!", 3)
else
Notify("忍者传奇", "显示距离已关闭!", 3)
end
end
})
_0031:Toggle({
Title = "物品透视",
Default = false,
Callback = function(state)
_000f.ItemESP = state
if state then
Notify("忍者传奇", "物品透视已开启!", 3)
StartLoop("ItemESP", function()
while _000f.ItemESP do
UpdateItemESP()
task.wait(1)
end
end)
else
StopConnection("ItemESP")
for _0024, obj in pairs(_0011) do
if type(_0024) == "string" and string.sub(_0024, 1, 5) == "item_" then
pcall(function()
obj:Destroy()
end)
_0011[_0024] = nil
end
end
Notify("忍者传奇", "物品透视已关闭!", 3)
end
end
})
_0031:Toggle({
Title = "全图高亮",
Default = false,
Callback = function(state)
_000f.FullHighlight = state
if state then
Notify("忍者传奇", "全图高亮已开启!", 3)
_000f.OriginalLighting = {
Brightness = _0007.Brightness,
Ambient = _0007.Ambient,
OutdoorAmbient = _0007.OutdoorAmbient,
GlobalShadows = _0007.GlobalShadows,
ClockTime = _0007.ClockTime,
}
_0007.Brightness = 5
_0007.Ambient = Color3.new(1, 1, 1)
_0007.OutdoorAmbient = Color3.new(1, 1, 1)
_0007.GlobalShadows = false
_0007.ClockTime = 14
else
Notify("忍者传奇", "全图高亮已关闭!", 3)
if _000f.OriginalLighting then
_0007.Brightness = _000f.OriginalLighting.Brightness
_0007.Ambient = _000f.OriginalLighting.Ambient
_0007.OutdoorAmbient = _000f.OriginalLighting.OutdoorAmbient
_0007.GlobalShadows = _000f.OriginalLighting.GlobalShadows
_0007.ClockTime = _000f.OriginalLighting.ClockTime
end
end
end
})
local _0032  _0027:Tab({
Title = "传送",
Icon = "map-pin"
})
_0032:Section({ Title = "地点" })
_0032:Button({
Title = "训练区",
Callback = function()
TeleportToLocation({"train", "training", "practice"}, "训练区")
end
})
_0032:Button({
Title = "商店",
Callback = function()
TeleportToLocation({"shop", "store", "buy"}, "商店")
end
})
_0032:Button({
Title = "武器店",
Callback = function()
TeleportToLocation({"weapon", "sword", "blade"}, "武器店")
end
})
_0032:Button({
Title = "腰带店",
Callback = function()
TeleportToLocation({"belt"}, "腰带店")
end
})
_0032:Button({
Title = "宠物店",
Callback = function()
TeleportToLocation({"pet", "egg"}, "宠物店")
end
})
_0032:Button({
Title = "转生区",
Callback = function()
TeleportToLocation({"rebirth", "prestige", "ascend"}, "转生区")
end
})
_0032:Button({
Title = "出生点",
Callback = function()
TeleportToLocation({"spawn", "lobby", "start"}, "出生点")
end
})
_0032:Button({
Title = "岛屿",
Callback = function()
TeleportToLocation({"island", "zone", "area"}, "岛屿")
end
})
_0032:Divider()
_0032:Toggle({
Title = "长按传送",
Default = false,
Callback = function(state)
_000f.LongPressTP = state
_000f.TPHoldStart = 0
if state then
Notify("忍者传奇", "长按传送已开启! (长按0.5秒传送到鼠标位置)", 3)
_0010["LongPressTP_Input"] = _0005.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_000f.TPHoldStart = tick()
end
end)
_0010["LongPressTP_InputEnd"] = _0005.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_000f.TPHoldStart = 0
end
end)
_0010["LongPressTP_Heartbeat"] = _0004.Heartbeat:Connect(function()
if _000f.TPHoldStart > 0 and tick() - _000f.TPHoldStart >= 0.5 then
local _001a  GetRoot()
if _001a and _000e.Hit then
_001a.CFrame = CFrame.new(_000e.Hit.Position)
_000f.TPHoldStart = 0
end
end
end)
else
StopConnection("LongPressTP_Input")
StopConnection("LongPressTP_InputEnd")
StopConnection("LongPressTP_Heartbeat")
Notify("忍者传奇", "长按传送已关闭!", 3)
end
end
})
local _0033  _0027:Tab({
Title = "实用",
Icon = "settings"
})
_0033:Section({ Title = "工具" })
_0033:Toggle({
Title = "防挂机",
Default = false,
Callback = function(state)
_000f.AntiAFK = state
if state then
Notify("忍者传奇", "防挂机已开启!", 3)
_0010["AntiAFK"] = _000c.Idled:Connect(function()
pcall(function()
_000b:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
_000b:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
end)
else
StopConnection("AntiAFK")
Notify("忍者传奇", "防挂机已关闭!", 3)
end
end
})
_0033:Toggle({
Title = "画质提速",
Default = false,
Callback = function(state)
_000f.QualityBoost = state
if state then
Notify("忍者传奇", "画质提速已开启!", 3)
_000f.OriginalQualityLevel = settings().Rendering.QualityLevel
pcall(function()
settings().Rendering.QualityLevel = 1
end)
_0007.GlobalShadows = false
for _, obj in ipairs(_0006:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
obj.Enabled = false
end
end
else
Notify("忍者传奇", "画质提速已关闭!", 3)
if _000f.OriginalQualityLevel then
pcall(function()
settings().Rendering.QualityLevel = _000f.OriginalQualityLevel
end)
end
_0007.GlobalShadows = true
for _, obj in ipairs(_0006:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
obj.Enabled = true
end
end
end
end
})
_0033:Divider()
_0033:Button({
Title = "换服",
Callback = function()
Notify("忍者传奇", "正在换服...", 3)
pcall(function()
_000a:Teleport(game.PlaceId, _000c)
end)
end
})
_0033:Button({
Title = "复制服务器号",
Callback = function()
local _0034  game.JobId
if CopyToClipboard(_0034) then
Notify("忍者传奇", "服务器号已复制: " .. _0034, 5)
else
Notify("忍者传奇", "服务器号: " .. _0034, 7)
end
end
})
_0033:Button({
Title = "角色信息",
Callback = function()
local _0026  GetHum()
local _001a  GetRoot()
local _0035  _000c:FindFirstChild("_0035")
local _0036  "血量: " .. (_0026 and math.floor(_0026.Health) or 0) .. "/" .. (_0026 and math.floor(_0026.MaxHealth) or 0)
_0036 = _0036 .. "\n速度: " .. (_0026 and math.floor(_0026.WalkSpeed) or 0)
_0036 = _0036 .. "\n位置: " .. (_001a and tostring(_001a.Position) or "未知")
if _0035 then
for _, stat in ipairs(_0035:GetChildren()) do
_0036 = _0036 .. "\n" .. stat.Name .. ": " .. tostring(stat.Value)
end
end
Notify("忍者传奇", _0036, 7)
end
})
_0033:Button({
Title = "清理特效",
Callback = function()
local _0037  0
for _, obj in ipairs(_0006:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Explosion") then
obj:Destroy()
_0037 = _0037 + 1
end
end
Notify("忍者传奇", "已清理 " .. _0037 .. " 个特效!", 3)
end
})
_0033:Button({
Title = "卸载脚本",
Callback = function()
Notify("忍者传奇", "正在卸载脚本...", 3)
task.wait(0.5)
for _0014, _0012 in pairs(_0010) do
if type(_0012) == "thread" then
pcall(task.cancel, _0012)
elseif typeof(_0012) == "RBXScriptConnection" then
_0012:Disconnect()
end
end
table.clear(_0010)
for _0024, obj in pairs(_0011) do
pcall(function()
if obj.Billboard then obj.Billboard:Destroy() end
if obj.Highlight then obj.Highlight:Destroy() end
if typeof(obj) == "Instance" then obj:Destroy() end
end)
end
table.clear(_0011)
pcall(function()
if _000f.OriginalQualityLevel then
settings().Rendering.QualityLevel = _000f.OriginalQualityLevel
end
end)
if _000f.OriginalLighting then
pcall(function()
_0007.Brightness = _000f.OriginalLighting.Brightness
_0007.Ambient = _000f.OriginalLighting.Ambient
_0007.OutdoorAmbient = _000f.OriginalLighting.OutdoorAmbient
_0007.GlobalShadows = _000f.OriginalLighting.GlobalShadows
_0007.ClockTime = _000f.OriginalLighting.ClockTime
end)
end
pcall(function()
if _0027 and _0027.ScreenGui then
_0027.ScreenGui:Destroy()
end
end)
pcall(function()
if _0027 and _0027.Destroy then
_0027:Destroy()
end
end)
end
})
_0003.PlayerRemoving:Connect(function(plr)
if _0011[plr] then
pcall(function()
_0011[plr].Billboard:Destroy()
end)
_0011[plr] = nil
end
end)
_000c.CharacterAdded:Connect(function(_0013)
_0013:WaitForChild("Humanoid")
task.wait(0.3)
if _000f.WalkSpeed and _000f.WalkSpeed ~= 16 then
local _0026  GetHum()
if _0026 then
_0026.WalkSpeed = _000f.WalkSpeed
end
end
if _000f.JumpPower and _000f.JumpPower ~= 50 then
local _0026  GetHum()
if _0026 then
_0026.UseJumpPower = true
_0026.JumpPower = _000f.JumpPower
end
end
if _000f.NoFallDamage then
SetupNoFallDamage()
end
for _0024, obj in pairs(_0011) do
if type(_0024) == "string" and string.sub(_0024, 1, 5) == "item_" then
pcall(function()
if not obj.Parent or (obj.Adornee and not obj.Adornee.Parent) then
obj:Destroy()
_0011[_0024] = nil
end
end)
end
end
end)
Notify("忍者传奇", "脚本已加载!", 5)