local _yLF5SZEa = 0
local _cMAbVdhF = ""
local _zPCLncIo = nil
print("[99夜] 脚本开始加载 v1.0")
local _0001 local _0002  uiErr = pcall(function()
_0001 = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
end)
if not _0002 or not _0001 then
pcall(function()
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "99夜 - WindUI加载失败",
Text = tostring(uiErr),
Duration = 10,
})
end)
return
end
local function CSFromHex(hex)
return ColorSequence.new(Color3.fromHex("#" .. tostring(hex)))
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
AutoCollect   = false,
AutoChop      = false,
AutoCampfire  = false,
AutoHeal      = false,
AutoFood      = false,
WalkSpeed     = 16,
JumpPower     = 50,
InfiniteJump  = false,
NoClip        = false,
GodMode       = false,
NoFallDamage  = false,
Flying        = false,
FlySpeed      = 50,
PlayerESP     = false,
ItemESP       = false,
EnemyESP      = false,
FullHighlight = false,
Fullbright    = false,
LongPressTP   = false,
AntiAfk       = false,
NoClip        = false,
}
local _0010  {}
local _0011  {}
local function GetChar()
return _000c.Character
end
local function GetRoot()
local _0012  GetChar()
if _0012 then
return _0012:FindFirstChild("HumanoidRootPart") or _0012:FindFirstChild("Torso")
end
return nil
end
local function GetHum()
local _0012  GetChar()
if _0012 then
return _0012:FindFirstChildOfClass("Humanoid")
end
return nil
end
local function Notify(title, content, duration)
_0001:Notify({
Title = title,
Content = content,
Duration = duration or 3,
})
end
local function AddConnection(_0017, conn)
if _0010[_0017] then
_0010[_0017]:Disconnect()
end
_0010[_0017] = conn
end
local function RemoveConnection(_0017)
if _0010[_0017] then
_0010[_0017]:Disconnect()
_0010[_0017] = nil
end
end
local function ClearAllESP()
for key, _0035 in pairs(_0011) do
pcall(function()
if type(_0035) == "table" then
if _0035.Billboard then _0035.Billboard:Destroy() end
if _0035.Highlight then _0035.Highlight:Destroy() end
elseif _0035 and _0035.Destroy then
_0035:Destroy()
end
end)
end
_0011 = {}
end
local function CreateESP(parent, text, _0038, studOffset)
if not parent or not parent:IsA("Instance") then return nil end
local _0013  Instance.new("BillboardGui")
_0013.Name = "Night99ESP"
_0013.AlwaysOnTop = true
_0013.Size = UDim2.new(0, 200, 0, 50)
_0013.StudsOffset = studOffset or Vector3.new(0, 3, 0)
_0013.Adornee = parent
local _0014  Instance.new("TextLabel")
_0014.Size = UDim2.new(1, 0, 1, 0)
_0014.BackgroundTransparency = 1
_0014.Text = text
_0014.TextColor3 = _0038 or Color3.new(1, 1, 1)
_0014.TextScaled = true
_0014.Font = Enum.Font.SourceSansBold
_0014.TextStrokeColor3 = Color3.new(0, 0, 0)
_0014.TextStrokeTransparency = 0
_0014.Parent = _0013
_0013.Parent = parent
return _0013
end
local function CreateHighlight(parent, _0038)
if not parent or not parent:IsA("Instance") then return nil end
local _0015  Instance.new("Highlight")
_0015.Name = "Night99Highlight"
_0015.Adornee = parent
_0015.FillColor3 = _0038 or Color3.new(1, 0, 0)
_0015.FillTransparency = 0.5
_0015.OutlineColor3 = Color3.new(1, 1, 1)
_0015.Parent = parent
return _0015
end
local function TeleportTo(cframe)
local _0016  GetRoot()
if _0016 then
pcall(function()
_0016.CFrame = cframe
end)
end
end
local function FindByKeywords(_001f, searchIn)
searchIn = searchIn or _0006
for _, _0035 in pairs(searchIn:GetDescendants()) do
local _0017  string.lower(_0035.Name)
for _, kw in pairs(_001f) do
if string.find(_0017, string.lower(kw)) then
return _0035
end
end
end
return nil
end
local function FindAllByKeywords(_001f, searchIn)
searchIn = searchIn or _0006
local _0018  {}
for _, _0035 in pairs(searchIn:GetDescendants()) do
if _0035:IsA("BasePart") or _0035:IsA("Model") then
local _0017  string.lower(_0035.Name)
for _, kw in pairs(_001f) do
if string.find(_0017, string.lower(kw)) then
table.insert(_0018, _0035)
break
end
end
end
end
return _0018
end
print("[99夜] 正在创建窗口...")
local _0019  _0001:CreateWindow({
Title   = "99夜",
Icon    = "moon",
Author  = "99夜脚本",
Folder  = "99Nights",
Size    = UDim2.fromOffset(500, 520),
Theme   = "Dark",
})
_0019:Tag({
Title  = "99夜",
Color  = Color3.fromHex("#4169E1"),
})
_0019:EditOpenButton({
Title          = "99夜",
Icon           = "moon",
CornerRadius   = UDim.new(0, 16),
StrokeThickness = 2,
Color          = CSFromHex("4169E1"),
Draggable      = true,
})
local _001a  _0019:Tab({ Title = "自动", Icon = "bot" })
local _001b  _0019:Tab({ Title = "玩家", Icon = "user" })
local _001c  _0019:Tab({ Title = "视觉", Icon = "eye" })
local _001d  _0019:Tab({ Title = "传送", Icon = "map-pin" })
local _001e  _0019:Tab({ Title = "实用", Icon = "wrench" })
_001a:Toggle({
Title = "自动收集物资",
Desc  = "自动吸附附近的物资到身边",
Value = false,
Callback = function(state)
_000f.AutoCollect = state
if state then
Notify("99夜", "自动收集物资 已开启!", 3)
task.spawn(function()
while _000f.AutoCollect do
local _0016  GetRoot()
if _0016 then
local _001f  {
"wood", "log", "stick", "tree",
"meat", "food", "apple", "berry", "mushroom",
"water", "bottle", "canteen",
"bandage", "medkit", "med", "heal",
"stone", "rock", "iron", "ore",
"cloth", "rope", "string",
"coin", "gold", "gem", "diamond",
"can", "soda", "soup",
}
for _, _0035 in pairs(_0006:GetDescendants()) do
if _0035:IsA("BasePart") and _0035.Name ~= "HumanoidRootPart" then
local _0020  string.lower(_0035.Name)
local _0021  false
for _, kw in pairs(_001f) do
if string.find(_0020, kw) then
_0021 = true
break
end
end
if _0021 then
local _0022  (_0035.Position - _0016.Position).Magnitude
if _0022 < 200 and _0022 > 2 then
pcall(function()
_0035.CFrame = _0016.CFrame * CFrame.new(0, 0, -3)
end)
end
end
end
end
end
task.wait(math.random(15, 50) / 100)
end
end)
else
Notify("99夜", "自动收集物资 已关闭!", 3)
end
end,
})
_001a:Toggle({
Title = "自动砍树",
Desc  = "自动攻击附近的树木获取木材",
Value = false,
Callback = function(state)
_000f.AutoChop = state
if state then
Notify("99夜", "自动砍树 已开启!", 3)
task.spawn(function()
while _000f.AutoChop do
local _0016  GetRoot()
local _0023  GetHum()
if _0016 and _0023 then
local _0024  nil
local _0025  math.huge
for _, _0035 in pairs(_0006:GetDescendants()) do
if _0035:IsA("Model") or _0035:IsA("BasePart") then
local _0020  string.lower(_0035.Name)
if string.find(_0020, "tree") or string.find(_0020, "wood") then
local _0026  _0035:IsA("BasePart") and _0035.Position or _0035:GetPivot().Position
local _0022  (_0026 - _0016.Position).Magnitude
if _0022 < _0025 and _0022 < 100 then
_0025 = _0022
_0024 = _0035
end
end
end
end
if _0024 then
local _0027  _0024:IsA("BasePart") and _0024.Position or _0024:GetPivot().Position
TeleportTo(CFrame.new(_0027 + Vector3.new(3, 0, 3)))
task.wait(math.random(20, 40) / 100)
pcall(function()
_000b:SendKeyEvent(true, Enum.KeyCode.E, false, game)
task.wait(0.1)
_000b:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end)
end
end
task.wait(math.random(30, 60) / 100)
end
end)
else
Notify("99夜", "自动砍树 已关闭!", 3)
end
end,
})
_001a:Toggle({
Title = "自动维持篝火",
Desc  = "自动给附近篝火添加燃料",
Value = false,
Callback = function(state)
_000f.AutoCampfire = state
if state then
Notify("99夜", "自动维持篝火 已开启!", 3)
task.spawn(function()
while _000f.AutoCampfire do
local _0028  FindAllByKeywords({"campfire", "_0029", "篝火"})
if #_0028 > 0 then
for _, cf in pairs(_0028) do
pcall(function()
local _0029  cf:FindFirstChildWhichIsA("Fire")
if not _0029 then
local _0026  cf:IsA("BasePart") and cf.Position or cf:GetPivot().Position
TeleportTo(CFrame.new(_0026 + Vector3.new(2, 0, 2)))
task.wait(0.3)
_000b:SendKeyEvent(true, Enum.KeyCode.E, false, game)
task.wait(0.1)
_000b:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end
end)
end
end
task.wait(3)
end
end)
else
Notify("99夜", "自动维持篝火 已关闭!", 3)
end
end,
})
_001a:Toggle({
Title = "自动治疗",
Desc  = "血量低时自动使用绷带/医疗包",
Value = false,
Callback = function(state)
_000f.AutoHeal = state
if state then
Notify("99夜", "自动治疗 已开启!", 3)
task.spawn(function()
while _000f.AutoHeal do
local _0023  GetHum()
if _0023 and _0023.Health < _0023.MaxHealth * 0.5 then
pcall(function()
_000b:SendKeyEvent(true, Enum.KeyCode.H, false, game)
task.wait(0.1)
_000b:SendKeyEvent(false, Enum.KeyCode.H, false, game)
end)
task.wait(2)
end
task.wait(1)
end
end)
else
Notify("99夜", "自动治疗 已关闭!", 3)
end
end,
})
_001a:Toggle({
Title = "自动进食",
Desc  = "自动吃食物补充饥饿值",
Value = false,
Callback = function(state)
_000f.AutoFood = state
if state then
Notify("99夜", "自动进食 已开启!", 3)
task.spawn(function()
while _000f.AutoFood do
pcall(function()
_000b:SendKeyEvent(true, Enum.KeyCode.F, false, game)
task.wait(0.1)
_000b:SendKeyEvent(false, Enum.KeyCode.F, false, game)
end)
task.wait(math.random(5, 10))
end
end)
else
Notify("99夜", "自动进食 已关闭!", 3)
end
end,
})
_001b:Slider({
Title = "移动速度",
Min = 16,
Max = 200,
Default = 16,
Callback = function(val)
_000f.WalkSpeed = val
local _0023  GetHum()
if _0023 then
_0023.WalkSpeed = val
end
end,
})
_001b:Slider({
Title = "跳跃力",
Min = 50,
Max = 300,
Default = 50,
Callback = function(val)
_000f.JumpPower = val
local _0023  GetHum()
if _0023 then
_0023.UseJumpPower = true
_0023.JumpPower = val
end
end,
})
_001b:Slider({
Title = "飞行速度",
Min = 10,
Max = 200,
Default = 50,
Callback = function(val)
_000f.FlySpeed = val
end,
})
_001b:Toggle({
Title = "无限跳跃",
Desc  = "在空中也可以跳跃",
Value = false,
Callback = function(state)
_000f.InfiniteJump = state
if state then
Notify("99夜", "无限跳跃 已开启!", 3)
else
Notify("99夜", "无限跳跃 已关闭!", 3)
end
end,
})
_0005.JumpRequest:Connect(function()
if _000f.InfiniteJump then
local _0023  GetHum()
if _0023 then
_0023:ChangeState(Enum.HumanoidStateType.Jumping)
end
end
end)
_001b:Toggle({
Title = "飞行",
Desc  = "WASD控制方向 空格上升 Shift下降",
Value = false,
Callback = function(state)
_000f.Flying = state
if state then
Notify("99夜", "飞行 已开启!", 3)
task.spawn(function()
local _0023  GetHum()
local _0016  GetRoot()
if not _0023 or not _0016 then return end
local _002a  Instance.new("BodyVelocity")
_002a.Name = "FlyVelocity"
_002a.MaxForce = Vector3.new(9e9, 9e9, 9e9)
_002a.Velocity = Vector3.new(0, 0, 0)
_002a.Parent = _0016
local _002b  Instance.new("BodyGyro")
_002b.Name = "FlyGyro"
_002b.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
_002b.CFrame = _0016.CFrame
_002b.Parent = _0016
_0023.PlatformStand = true
AddConnection("FlyLoop", _0004.RenderStepped:Connect(function()
if not _000f.Flying then return end
local _002c  GetRoot()
local _002d  GetChar()
if not _002c or not _002d then return end
local _002e  _0006.CurrentCamera
local _002f  Vector3.new(0, 0, 0)
if _0005:IsKeyDown(Enum.KeyCode.W) then
_002f = _002f + _002e.CFrame.LookVector
end
if _0005:IsKeyDown(Enum.KeyCode.S) then
_002f = _002f - _002e.CFrame.LookVector
end
if _0005:IsKeyDown(Enum.KeyCode.A) then
_002f = _002f - _002e.CFrame.RightVector
end
if _0005:IsKeyDown(Enum.KeyCode.D) then
_002f = _002f + _002e.CFrame.RightVector
end
if _0005:IsKeyDown(Enum.KeyCode.Space) then
_002f = _002f + Vector3.new(0, 1, 0)
end
if _0005:IsKeyDown(Enum.KeyCode.LeftShift) then
_002f = _002f - Vector3.new(0, 1, 0)
end
if _002f.Magnitude > 0 then
_002f = _002f.Unit
end
_002a.Velocity = _002f * _000f.FlySpeed
_002b.CFrame = _002e.CFrame
end))
while _000f.Flying do
task.wait(0.1)
end
RemoveConnection("FlyLoop")
local _002c  GetRoot()
local _0030  GetHum()
if _002c then
local _0031  _002c:FindFirstChild("FlyVelocity")
if _0031 then _0031:Destroy() end
local _0032  _002c:FindFirstChild("FlyGyro")
if _0032 then _0032:Destroy() end
end
if _0030 then
_0030.PlatformStand = false
end
end)
else
Notify("99夜", "飞行 已关闭!", 3)
RemoveConnection("FlyLoop")
local _002c  GetRoot()
local _0030  GetHum()
if _002c then
local _0031  _002c:FindFirstChild("FlyVelocity")
if _0031 then _0031:Destroy() end
local _0032  _002c:FindFirstChild("FlyGyro")
if _0032 then _0032:Destroy() end
end
if _0030 then
_0030.PlatformStand = false
end
end
end,
})
_001b:Toggle({
Title = "穿墙",
Desc  = "穿过所有障碍物",
Value = false,
Callback = function(state)
_000f.NoClip = state
if state then
Notify("99夜", "穿墙 已开启!", 3)
AddConnection("NoClip", _0004.Stepped:Connect(function()
local _0012  GetChar()
if _0012 then
for _, part in pairs(_0012:GetDescendants()) do
if part:IsA("BasePart") and part.CanCollide then
part.CanCollide = false
end
end
end
end))
else
Notify("99夜", "穿墙 已关闭!", 3)
RemoveConnection("NoClip")
end
end,
})
_001b:Toggle({
Title = "摔落无伤害",
Desc  = "从高处掉下来不会扣血",
Value = false,
Callback = function(state)
_000f.NoFallDamage = state
if state then
Notify("99夜", "摔落无伤害 已开启!", 3)
AddConnection("NoFall", _000c.CharacterAdded:Connect(function(_0012)
task.wait(1)
local _0023  _0012:FindFirstChildOfClass("Humanoid")
if _0023 then
_0023.Freefalling:Connect(function()
if _000f.NoFallDamage then
pcall(function()
_0023.Health = _0023.MaxHealth
end)
end
end)
end
end))
local _0023  GetHum()
if _0023 then
_0023.Freefalling:Connect(function()
if _000f.NoFallDamage then
pcall(function()
_0023.Health = _0023.MaxHealth
end)
end
end)
end
else
Notify("99夜", "摔落无伤害 已关闭!", 3)
RemoveConnection("NoFall")
end
end,
})
_001b:Toggle({
Title = "无敌模式",
Desc  = "血量一直保持满血",
Value = false,
Callback = function(state)
_000f.GodMode = state
if state then
Notify("99夜", "无敌模式 已开启!", 3)
AddConnection("GodMode", _0004.RenderStepped:Connect(function()
local _0023  GetHum()
if _0023 and _0023.Health < _0023.MaxHealth then
_0023.Health = _0023.MaxHealth
end
end))
else
Notify("99夜", "无敌模式 已关闭!", 3)
RemoveConnection("GodMode")
end
end,
})
_001c:Toggle({
Title = "玩家ESP",
Desc  = "透视显示所有玩家位置",
Value = false,
Callback = function(state)
_000f.PlayerESP = state
if state then
Notify("99夜", "玩家ESP 已开启!", 3)
task.spawn(function()
while _000f.PlayerESP do
for _, player in pairs(_0003:GetPlayers()) do
if player ~= _000c and player.Character then
local _0012  player.Character
if not _0011["player_" .. player.Name] then
local _0033  CreateHighlight(_0012, Color3.new(0, 1, 0))
local _0034  CreateESP(_0012:FindFirstChild("Head") or _0012, player.Name, Color3.new(0, 1, 0), Vector3.new(0, 3, 0))
_0011["player_" .. player.Name] = { Highlight = _0033, Billboard = _0034 }
end
else
if _0011["player_" .. player.Name] then
local _0035  _0011["player_" .. player.Name]
if _0035.Highlight then _0035.Highlight:Destroy() end
if _0035.Billboard then _0035.Billboard:Destroy() end
_0011["player_" .. player.Name] = nil
end
end
end
task.wait(0.5)
end
for _0017, _0035 in pairs(_0011) do
if string.find(_0017, "player_") then
if _0035.Highlight then _0035.Highlight:Destroy() end
if _0035.Billboard then _0035.Billboard:Destroy() end
_0011[_0017] = nil
end
end
end)
else
Notify("99夜", "玩家ESP 已关闭!", 3)
end
end,
})
_001c:Toggle({
Title = "敌人ESP",
Desc  = "透视显示所有敌人/怪物位置",
Value = false,
Callback = function(state)
_000f.EnemyESP = state
if state then
Notify("99夜", "敌人ESP 已开启!", 3)
task.spawn(function()
while _000f.EnemyESP do
for _, _0035 in pairs(_0006:GetDescendants()) do
if _0035:IsA("Model") then
local _0023  _0035:FindFirstChildOfClass("Humanoid")
local _0036  _0035:FindFirstChild("HumanoidRootPart")
if _0023 and _0036 and _0023.Health > 0 then
local _0037  false
for _, player in pairs(_0003:GetPlayers()) do
if player.Character == _0035 then
_0037 = true
break
end
end
if not _0037 and not _0011["enemy_" .. _0035:GetFullName()] then
local _0020  string.lower(_0035.Name)
local _0038  Color3.new(1, 0, 0)
if string.find(_0020, "boss") then
_0038 = Color3.new(1, 0, 1)
elseif string.find(_0020, "cult") or string.find(_0020, "ram") or string.find(_0020, "owl") then
_0038 = Color3.new(1, 0.5, 0)
end
local _0033  CreateHighlight(_0035, _0038)
local _0034  CreateESP(_0036, _0035.Name, _0038, Vector3.new(0, 3, 0))
_0011["enemy_" .. _0035:GetFullName()] = { Highlight = _0033, Billboard = _0034 }
end
end
end
end
task.wait(1)
end
for _0017, _0035 in pairs(_0011) do
if string.find(_0017, "enemy_") then
if _0035.Highlight then _0035.Highlight:Destroy() end
if _0035.Billboard then _0035.Billboard:Destroy() end
_0011[_0017] = nil
end
end
end)
else
Notify("99夜", "敌人ESP 已关闭!", 3)
end
end,
})
_001c:Toggle({
Title = "物品ESP",
Desc  = "透视显示所有可拾取物品",
Value = false,
Callback = function(state)
_000f.ItemESP = state
if state then
Notify("99夜", "物品ESP 已开启!", 3)
task.spawn(function()
while _000f.ItemESP do
local _001f  {
"wood", "log", "stick",
"meat", "food", "apple", "berry",
"water", "bottle",
"bandage", "medkit",
"stone", "rock", "iron", "ore",
"coin", "gold", "gem",
"can", "soda",
}
for _, _0035 in pairs(_0006:GetDescendants()) do
if _0035:IsA("BasePart") and _0035.Name ~= "HumanoidRootPart" then
local _0020  string.lower(_0035.Name)
for _, kw in pairs(_001f) do
if string.find(_0020, kw) and not _0011["item_" .. _0035:GetFullName()] then
local _0038  Color3.new(1, 1, 0)
if string.find(_0020, "gold") or string.find(_0020, "gem") or string.find(_0020, "diamond") then
_0038 = Color3.new(1, 0.84, 0)
elseif string.find(_0020, "med") or string.find(_0020, "bandage") then
_0038 = Color3.new(1, 0.2, 0.2)
elseif string.find(_0020, "food") or string.find(_0020, "meat") or string.find(_0020, "apple") then
_0038 = Color3.new(0.5, 1, 0)
end
local _0034  CreateESP(_0035, _0035.Name, _0038, Vector3.new(0, 2, 0))
_0011["item_" .. _0035:GetFullName()] = { Billboard = _0034 }
break
end
end
end
end
task.wait(2)
end
for _0017, _0035 in pairs(_0011) do
if string.find(_0017, "item_") then
if _0035.Billboard then _0035.Billboard:Destroy() end
_0011[_0017] = nil
end
end
end)
else
Notify("99夜", "物品ESP 已关闭!", 3)
end
end,
})
_001c:Toggle({
Title = "全屏高亮",
Desc  = "所有物体高亮显示",
Value = false,
Callback = function(state)
_000f.FullHighlight = state
if state then
Notify("99夜", "全屏高亮 已开启!", 3)
local _0033  Instance.new("Highlight")
_0033.Name = "FullHighlight99"
_0033.Adornee = _0006
_0033.FillColor3 = Color3.new(1, 1, 1)
_0033.FillTransparency = 0.9
_0033.OutlineColor3 = Color3.new(1, 1, 1)
_0033.OutlineTransparency = 0
_0033.Parent = game:GetService("CoreGui")
_0011["fullhighlight"] = _0033
else
Notify("99夜", "全屏高亮 已关闭!", 3)
if _0011["fullhighlight"] then
_0011["fullhighlight"]:Destroy()
_0011["fullhighlight"] = nil
end
end
end,
})
_001c:Toggle({
Title = "全屏提亮",
Desc  = "夜晚也能看清楚",
Value = false,
Callback = function(state)
_000f.Fullbright = state
if state then
Notify("99夜", "全屏提亮 已开启!", 3)
_0007.Brightness = 3
_0007.ClockTime = 12
_0007.FogEnd = 100000
_0007.GlobalShadows = false
_0007.Ambient = Color3.new(1, 1, 1)
_0007.OutdoorAmbient = Color3.new(1, 1, 1)
else
Notify("99夜", "全屏提亮 已关闭!", 3)
_0007.Brightness = 1
_0007.ClockTime = 12
_0007.GlobalShadows = true
_0007.Ambient = Color3.new(0.5, 0.5, 0.5)
_0007.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
end
end,
})
_001d:Button({
Title = "传送到最近玩家",
Callback = function()
local _0016  GetRoot()
if not _0016 then
Notify("99夜", "找不到角色!", 3)
return
end
local _0039  nil
local _0025  math.huge
for _, player in pairs(_0003:GetPlayers()) do
if player ~= _000c and player.Character then
local _003a  player.Character:FindFirstChild("HumanoidRootPart")
if _003a then
local _0022  (_003a.Position - _0016.Position).Magnitude
if _0022 < _0025 then
_0025 = _0022
_0039 = player
end
end
end
end
if _0039 then
local _003a  _0039.Character:FindFirstChild("HumanoidRootPart")
if _003a then
TeleportTo(_003a.CFrame * CFrame.new(0, 0, 3))
Notify("99夜", "已传送到 " .. _0039.Name, 3)
end
else
Notify("99夜", "附近没有其他玩家!", 3)
end
end,
})
_001d:Button({
Title = "传送到营地",
Callback = function()
local _003b  FindByKeywords({"_003b", "base", "tent", "campfire", "spawn"})
if _003b then
local _0026  _003b:IsA("BasePart") and _003b.Position or _003b:GetPivot().Position
TeleportTo(CFrame.new(_0026 + Vector3.new(0, 3, 0)))
Notify("99夜", "已传送到营地!", 3)
else
Notify("99夜", "找不到营地!", 3)
end
end,
})
_001d:Button({
Title = "传送到最近树木",
Callback = function()
local _0016  GetRoot()
if not _0016 then return end
local _0024  nil
local _0025  math.huge
for _, _0035 in pairs(_0006:GetDescendants()) do
if _0035:IsA("Model") or _0035:IsA("BasePart") then
local _0020  string.lower(_0035.Name)
if string.find(_0020, "tree") or string.find(_0020, "log") then
local _0026  _0035:IsA("BasePart") and _0035.Position or _0035:GetPivot().Position
local _0022  (_0026 - _0016.Position).Magnitude
if _0022 < _0025 and _0022 > 5 then
_0025 = _0022
_0024 = _0035
end
end
end
end
if _0024 then
local _0026  _0024:IsA("BasePart") and _0024.Position or _0024:GetPivot().Position
TeleportTo(CFrame.new(_0026 + Vector3.new(2, 0, 2)))
Notify("99夜", "已传送到树木!", 3)
else
Notify("99夜", "附近没有树!", 3)
end
end,
})
_001d:Button({
Title = "传送到高处(升天)",
Callback = function()
local _0016  GetRoot()
if _0016 then
TeleportTo(_0016.CFrame * CFrame.new(0, 500, 0))
Notify("99夜", "已传送到高空!", 3)
end
end,
})
_001d:Toggle({
Title = "长按鼠标传送",
Desc  = "长按鼠标左键传送到准星位置",
Value = false,
Callback = function(state)
_000f.LongPressTP = state
if state then
Notify("99夜", "长按传送 已开启!", 3)
local _003c  0
local _003d  false
AddConnection("LongPressDown", _0005.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.MouseButton1 then
_003d = true
_003c = tick()
task.spawn(function()
while _003d and _000f.LongPressTP do
if tick() - _003c >= 0.5 then
local _0016  GetRoot()
if _0016 then
local _003e  _000e.Hit
if _003e then
TeleportTo(_003e + Vector3.new(0, 3, 0))
end
end
break
end
task.wait(0.1)
end
end)
end
end))
AddConnection("LongPressUp", _0005.InputEnded:Connect(function(input, gpe)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
_003d = false
end
end))
else
Notify("99夜", "长按传送 已关闭!", 3)
RemoveConnection("LongPressDown")
RemoveConnection("LongPressUp")
end
end,
})
_001e:Toggle({
Title = "防挂机",
Desc  = "防止因挂机被踢出游戏",
Value = false,
Callback = function(state)
_000f.AntiAfk = state
if state then
Notify("99夜", "防挂机 已开启!", 3)
local _003f  game:GetService("VirtualUser")
AddConnection("AntiAfk", _000c.Idled:Connect(function()
_003f:CaptureController()
_003f:ClickButton2(Vector2.new())
end))
else
Notify("99夜", "防挂机 已关闭!", 3)
RemoveConnection("AntiAfk")
end
end,
})
_001e:Button({
Title = "重新加入",
Callback = function()
Notify("99夜", "正在重新加入...", 3)
_000a:Teleport(game.PlaceId, _000c)
end,
})
_001e:Button({
Title = "复制服务器ID",
Callback = function()
if setclipboard then
setclipboard(game.JobId)
Notify("99夜", "JobId已复制到剪贴板!", 3)
else
Notify("99夜", "当前执行器不支持剪贴板!", 3)
end
end,
})
_001e:Button({
Title = "查看角色信息",
Callback = function()
local _0023  GetHum()
local _0016  GetRoot()
if _0023 and _0016 then
Notify("角色信息",
"血量: " .. math.floor(_0023.Health) .. "/" .. math.floor(_0023.MaxHealth) ..
"\n速度: " .. math.floor(_0023.WalkSpeed) ..
"\n位置: " .. tostring(_0016.Position),
8
)
else
Notify("99夜", "找不到角色!", 3)
end
end,
})
_001e:Button({
Title = "复制当前坐标",
Callback = function()
local _0016  GetRoot()
if _0016 and setclipboard then
local _0026  _0016.Position
local _0040  string.format("%.1f, %.1f, %.1f", _0026.X, _0026.Y, _0026.Z)
setclipboard(_0040)
Notify("99夜", "坐标已复制: " .. _0040, 5)
end
end,
})
_000c.CharacterAdded:Connect(function(_0012)
task.wait(1)
local _0023  _0012:FindFirstChildOfClass("Humanoid")
if _0023 then
if _000f.WalkSpeed ~= 16 then
_0023.WalkSpeed = _000f.WalkSpeed
end
if _000f.JumpPower ~= 50 then
_0023.UseJumpPower = true
_0023.JumpPower = _000f.JumpPower
end
end
end)
print("[99夜] 脚本加载完成 v1.0")
Notify("99夜", "脚本加载成功! 祝您游戏愉快~", 5)