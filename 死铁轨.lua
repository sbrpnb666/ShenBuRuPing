local _IcS6UZzf = 0
local _9V29jyxF = ""
local _yZ4tUAub = nil
print("[死铁轨] 脚本开始加载 v2.1")
local _0001 local _0002  uiErr = pcall(function()
_0001 = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
end)
if not _0002 or not _0001 then
pcall(function()
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "死铁轨 - WindUI加载失败",
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
AutoFuel       = false,
AutoRepair     = false,
AutoZombie     = false,
AutoQuest      = false,
AutoBond       = false,
WalkSpeed      = 16,
JumpPower      = 50,
InfiniteJump   = false,
NoClip         = false,
GodMode        = false,
NoFallDamage   = false,
Flying         = false,
AntiFlyTP      = false,
PlayerESP      = false,
ItemESP        = false,
FullHighlight  = false,
LongPressTP    = false,
AntiAfk        = false,
GraphicsBoost  = false,
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
local function Notify(_003e, content, duration)
_0001:Notify({
Title = _003e,
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
for _0063, obj in pairs(_0011) do
pcall(function()
if type(obj) == "table" then
if obj.Billboard then obj.Billboard:Destroy() end
if obj.Highlight then obj.Highlight:Destroy() end
elseif obj and obj.Destroy then
obj:Destroy()
end
end)
end
_0011 = {}
end
local function CreateESP(_0024, text, _0027, studOffset)
if not _0024 or not _0024:IsA("Instance") then return nil end
local _0013  Instance.new("BillboardGui")
_0013.Name = "DeadRailsESP"
_0013.AlwaysOnTop = true
_0013.Size = UDim2.new(0, 200, 0, 50)
_0013.StudsOffset = studOffset or Vector3.new(0, 3, 0)
_0013.Adornee = _0024
local _0014  Instance.new("TextLabel")
_0014.Size = UDim2.new(1, 0, 1, 0)
_0014.BackgroundTransparency = 1
_0014.Text = text
_0014.TextColor3 = _0027 or Color3.new(1, 1, 1)
_0014.TextScaled = true
_0014.Font = Enum.Font.SourceSansBold
_0014.TextStrokeColor3 = Color3.new(0, 0, 0)
_0014.TextStrokeTransparency = 0
_0014.Parent = _0013
_0013.Parent = _0024
return _0013
end
local function CreateHighlight(_0024, _0027)
if not _0024 or not _0024:IsA("Instance") then return nil end
local _0015  Instance.new("Highlight")
_0015.Name = "DeadRailsHighlight"
_0015.Adornee = _0024
_0015.FillColor3 = _0027 or Color3.new(1, 0, 0)
_0015.FillTransparency = 0.5
_0015.OutlineColor3 = Color3.new(1, 1, 1)
_0015.Parent = _0024
return _0015
end
local function GetObjectPosition(obj)
if obj:IsA("BasePart") then
return obj.Position
elseif obj:IsA("Attachment") then
return obj.WorldPosition
else
return obj:GetPivot().Position
end
end
local function TeleportTo(cframe)
local _0016  GetRoot()
if _0016 then
pcall(function()
_0016.CFrame = cframe
end)
end
end
local function FindByKeywords(_002d, searchIn)
searchIn = searchIn or _0006
for _, obj in pairs(searchIn:GetDescendants()) do
local _0017  string.lower(obj.Name)
for _, kw in pairs(_002d) do
if string.find(_0017, string.lower(kw)) then
return obj
end
end
end
return nil
end
local function FindAllByKeywords(_002d, searchIn)
searchIn = searchIn or _0006
local _0018  {}
for _, obj in pairs(searchIn:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local _0017  string.lower(obj.Name)
for _, kw in pairs(_002d) do
if string.find(_0017, string.lower(kw)) then
table.insert(_0018, obj)
break
end
end
end
end
return _0018
end
local function FindNearbyNPCs(maxDist)
local _0016  GetRoot()
if not _0016 then return {} end
local _0019  {}
for _, obj in pairs(_0006:GetDescendants()) do
if obj:IsA("Model") then
local _001a  obj:FindFirstChildOfClass("Humanoid")
local _001b  obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso")
if _001a and _001b and _001a.Health > 0 then
local _001c  false
for _, _0066 in pairs(_0003:GetPlayers()) do
if _0066.Character == obj then
_001c = true
break
end
end
if not _001c then
local _0017  string.lower(obj.Name)
if string.find(_0017, "zombie") or string.find(_0017, "enemy")
or string.find(_0017, "npc") or string.find(_0017, "skeleton")
or string.find(_0017, "bandit") or string.find(_0017, "monster") then
local _001d  (_0016.Position - _001b.Position).Magnitude
if _001d <= (maxDist or 150) then
table.insert(_0019, {
Model = obj,
Humanoid = _001a,
Root = _001b,
Distance = _001d
})
end
end
end
end
end
end
table.sort(_0019, function(a, b) return a.Distance < b.Distance end)
return _0019
end
local function AttackWithTool()
local _0012  GetChar()
if not _0012 then return end
local _001e  _0012:FindFirstChildOfClass("Tool")
if not _001e then
local _001f  _000c:FindFirstChild("Backpack")
if _001f then
_001e = _001f:FindFirstChildOfClass("Tool")
if _001e then
local _001a  GetHum()
if _001a then
pcall(function() _001a:EquipTool(_001e) end)
end
end
end
end
if _001e then
pcall(function() _001e:Activate() end)
end
end
print("[死铁轨] 正在创建窗口...")
local _0020  _0001:CreateWindow({
Title   = "死铁轨",
Icon    = "_0031",
Author  = "死铁轨脚本",
Folder  = "DeadRails",
Size    = UDim2.fromOffset(500, 520),
Theme   = "Dark",
})
local _0021  _0020:Tag({
Title  = "死铁轨",
Color  = Color3.fromHex("#8B0000"),
})
task._006a(function()
local _0022  0
local _0023  nil
task.wait(1)
local function searchForTag(_0061)
for _, v in pairs(_0061:GetDescendants()) do
if v:IsA("TextLabel") and v.Text == "死铁轨" then
local _0024  v.Parent
if _0024 and (_0024:IsA("Frame") or _0024:IsA("TextLabel")) then
_0023 = _0024
return true
end
end
end
return false
end
pcall(function()
local _0025  _000c:FindFirstChild("PlayerGui")
if _0025 then
searchForTag(_0025)
end
if not _0023 then
local _0026  game:GetService("CoreGui")
searchForTag(_0026)
end
end)
while true do
task.wait(0.06)
_0022 = (_0022 + 0.02) % 1
local _0027  Color3.fromHSV(_0022, 1, 1)
if _0023 then
pcall(function()
_0023.BackgroundColor3 = _0027
end)
end
end
end)
_0020:EditOpenButton({
Title          = "死铁轨",
Icon           = "_0031",
CornerRadius   = UDim.new(0, 16),
StrokeThickness = 2,
Color          = CSFromHex("8B0000"),
Draggable      = true,
})
local _0028  _0020:Tab({ Title = "自动", Icon = "bot" })
local _0029  _0020:Tab({ Title = "玩家", Icon = "user" })
local _002a  _0020:Tab({ Title = "视觉", Icon = "eye" })
local _002b  _0020:Tab({ Title = "传送", Icon = "map-pin" })
local _002c  _0020:Tab({ Title = "实用", Icon = "wrench" })
print("[死铁轨] 窗口和标签页创建完成, 开始添加功能...")
_0028:Toggle({
Title = "自动收集物资",
Desc  = "自动捡取附近物资 (金币/弹药/燃油/木材/铁矿/煤炭等)",
Value = false,
Callback = function(state)
_000f.AutoCollect = state
if state then
Notify("死铁轨", "自动收集物资 已开启!", 3)
task._006a(function()
while _000f.AutoCollect do
local _0016  GetRoot()
if _0016 then
local _002d  {
"coin", "cash", "money", "supply", "supplies", "loot",
"ammo", "ammunition", "fuel", "gasoline", "wood", "log",
"iron", "coal", "gold", "scrap", "metal", "bandage",
"medkit", "med", "water", "food", "rifle", "pistol",
"shotgun", "bullet", "shell", "barrel", "crate", "box",
"treasure", "gem", "ruby", "diamond"
}
for _, obj in pairs(_0006:GetDescendants()) do
if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
local _002e  string.lower(obj.Name)
local _002f  false
for _, kw in pairs(_002d) do
if string.find(_002e, kw) then
_002f = true
break
end
end
if _002f then
local _001d  (obj.Position - _0016.Position).Magnitude
if _001d < 300 then
pcall(function()
obj.CFrame = _0016.CFrame * CFrame.new(0, 0, -3)
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
Notify("死铁轨", "自动收集物资 已关闭!", 3)
end
end,
})
_0028:Toggle({
Title = "自动加油",
Desc  = "自动捡取燃油并送到列车加油口",
Value = false,
Callback = function(state)
_000f.AutoFuel = state
if state then
Notify("死铁轨", "自动加油 已开启!", 3)
task._006a(function()
while _000f.AutoFuel do
local _0016  GetRoot()
if _0016 then
local _0030  {"fuel", "gasoline", "gascan", "fuelcan", "oildrum", "petrol"}
for _, obj in pairs(_0006:GetDescendants()) do
if obj:IsA("BasePart") then
local _002e  string.lower(obj.Name)
local _002f  false
for _, kw in pairs(_0030) do
if string.find(_002e, kw) then
_002f = true
break
end
end
if _002f then
local _001d  (obj.Position - _0016.Position).Magnitude
if _001d < 500 then
pcall(function()
obj.CFrame = _0016.CFrame * CFrame.new(0, 0, -3)
end)
end
end
end
end
local _0031  FindByKeywords({"_0031", "locomotive", "engine", "cabin", "cart"})
if _0031 then
local _0032  GetObjectPosition(_0031)
local _0033  FindAllByKeywords({"fuel", "gascan", "fuelcan"})
for _, fuelPart in pairs(_0033) do
if fuelPart:IsA("BasePart") then
pcall(function()
fuelPart.CFrame = CFrame.new(_0032 + Vector3.new(0, 5, 0))
end)
end
end
end
end
task.wait(math.random(50, 120) / 100)
end
end)
else
Notify("死铁轨", "自动加油 已关闭!", 3)
end
end,
})
_0028:Toggle({
Title = "自动修理",
Desc  = "自动捡取修理材料并送到列车",
Value = false,
Callback = function(state)
_000f.AutoRepair = state
if state then
Notify("死铁轨", "自动修理 已开启!", 3)
task._006a(function()
while _000f.AutoRepair do
local _0016  GetRoot()
if _0016 then
local _0034  {"wood", "plank", "board", "metal", "scrap", "nail", "hammer", "wrench", "repair", "_001e"}
for _, obj in pairs(_0006:GetDescendants()) do
if obj:IsA("BasePart") then
local _002e  string.lower(obj.Name)
local _002f  false
for _, kw in pairs(_0034) do
if string.find(_002e, kw) then
_002f = true
break
end
end
if _002f then
local _001d  (obj.Position - _0016.Position).Magnitude
if _001d < 500 then
pcall(function()
obj.CFrame = _0016.CFrame * CFrame.new(0, 0, -3)
end)
end
end
end
end
local _0031  FindByKeywords({"_0031", "locomotive", "engine", "cabin", "cart"})
if _0031 then
local _0032  GetObjectPosition(_0031)
local _0035  FindAllByKeywords({"wood", "plank", "metal", "repair", "_001e"})
for _, repairPart in pairs(_0035) do
if repairPart:IsA("BasePart") then
pcall(function()
repairPart.CFrame = CFrame.new(_0032 + Vector3.new(0, 5, 0))
end)
end
end
end
end
task.wait(math.random(50, 120) / 100)
end
end)
else
Notify("死铁轨", "自动修理 已关闭!", 3)
end
end,
})
_0028:Toggle({
Title = "自动打僵尸",
Desc  = "自动检测附近僵尸/敌人NPC并攻击",
Value = false,
Callback = function(state)
_000f.AutoZombie = state
if state then
Notify("死铁轨", "自动打僵尸 已开启!", 3)
task._006a(function()
while _000f.AutoZombie do
local _0016  GetRoot()
local _001a  GetHum()
if _0016 and _001a then
local _0019  FindNearbyNPCs(200)
if #_0019 > 0 then
local _0036  _0019[1]
pcall(function()
_0016.CFrame = _0036.Root.CFrame * CFrame.new(0, 0, 3)
end)
AttackWithTool()
pcall(function()
_0036.Humanoid:TakeDamage(50)
end)
end
end
task.wait(math.random(20, 60) / 100)
end
end)
else
Notify("死铁轨", "自动打僵尸 已关闭!", 3)
end
end,
})
_0028:Toggle({
Title = "自动做任务",
Desc  = "自动寻找任务NPC并交互",
Value = false,
Callback = function(state)
_000f.AutoQuest = state
if state then
Notify("死铁轨", "自动做任务 已开启!", 3)
task._006a(function()
while _000f.AutoQuest do
local _0016  GetRoot()
if _0016 then
local _0037  {"quest", "mission", "task", "objective", "npc", "merchant", "trader", "questgiver"}
local _0038  FindByKeywords(_0037)
if _0038 then
local _0039  GetObjectPosition(_0038)
pcall(function()
_0016.CFrame = CFrame.new(_0039 + Vector3.new(0, 5, 5))
end)
for _, v in pairs(_0006:GetDescendants()) do
if v:IsA("ProximityPrompt") then
pcall(function()
v:InputHoldBegin()
end)
task.wait(0.1)
pcall(function()
v:InputHoldEnd()
end)
end
end
AttackWithTool()
end
end
task.wait(math.random(100, 250) / 100)
end
end)
else
Notify("死铁轨", "自动做任务 已关闭!", 3)
end
end,
})
_0028:Toggle({
Title = "刷债券",
Desc  = "自动搜索并触发债券相关接口",
Value = false,
Callback = function(state)
_000f.AutoBond = state
if state then
Notify("死铁轨", "刷债券 已开启!", 3)
task._006a(function()
while _000f.AutoBond do
pcall(function()
for _, obj in ipairs(_0009:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "bond") or string.find(_003a, "bonds")
or string.find(_003a, "coupon") or string.find(_003a, "treasury")
or string.find(_003a, "reward") or string.find(_003a, "claim") then
obj:FireServer()
end
end
if obj:IsA("RemoteFunction") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "bond") or string.find(_003a, "bonds")
or string.find(_003a, "coupon") or string.find(_003a, "claim") then
pcall(function() obj:InvokeServer() end)
end
end
end
end)
pcall(function()
local _0016  GetRoot()
if _0016 then
for _, obj in ipairs(_0006:GetDescendants()) do
if obj:IsA("BasePart") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "bond") or string.find(_003a, "bonds")
or string.find(_003a, "coupon") or string.find(_003a, "treasure") then
local _001d  (_0016.Position - obj.Position).Magnitude
if _001d < 500 then
obj.CFrame = _0016.CFrame
end
end
end
end
end
end)
pcall(function()
for _, obj in ipairs(_0006:GetDescendants()) do
if obj:IsA("ProximityPrompt") then
local _003a  string.lower(obj.Name)
local _003b  obj.Parent and string.lower(obj.Parent.Name) or ""
if string.find(_003a, "bond") or string.find(_003a, "claim")
or string.find(_003b, "bond") or string.find(_003b, "treasure") then
obj.HoldDuration = 0.01
pcall(function() obj:InputHoldBegin() end)
task.wait(0.05)
pcall(function() obj:InputHoldEnd() end)
end
end
end
end)
task.wait(math.random(50, 120) / 100)
end
end)
else
Notify("死铁轨", "刷债券 已关闭!", 3)
end
end,
})
_0029:Slider({
Title = "行走速度",
Desc  = "调整角色移动速度 (16-500)",
Value = { Min = 16, Max = 500, Default = 16 },
Step  = 1,
Callback = function(value)
_000f.WalkSpeed = value
local _001a  GetHum()
if _001a then
_001a.WalkSpeed = value
end
end,
})
_0029:Slider({
Title = "跳跃力",
Desc  = "调整角色跳跃力 (50-500)",
Value = { Min = 50, Max = 500, Default = 50 },
Step  = 1,
Callback = function(value)
_000f.JumpPower = value
local _001a  GetHum()
if _001a then
if _001a.UseJumpPower then
_001a.JumpPower = value
else
_001a.JumpHeight = value / 10
end
end
end,
})
_0029:Space()
_0029:Toggle({
Title = "无限跳跃",
Desc  = "可在空中连续跳跃",
Value = false,
Callback = function(state)
_000f.InfiniteJump = state
if state then
Notify("死铁轨", "无限跳跃 已开启!", 3)
AddConnection("InfiniteJump", _0005.JumpRequest:Connect(function()
local _001a  GetHum()
if _001a then
pcall(function()
_001a:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end
end))
else
RemoveConnection("InfiniteJump")
Notify("死铁轨", "无限跳跃 已关闭!", 3)
end
end,
})
_0029:Toggle({
Title = "穿墙",
Desc  = "角色可穿过墙壁和障碍物",
Value = false,
Callback = function(state)
_000f.NoClip = state
if state then
Notify("死铁轨", "穿墙 已开启!", 3)
AddConnection("NoClip", _0004.Stepped:Connect(function()
local _0012  GetChar()
if _0012 then
for _, v in pairs(_0012:GetDescendants()) do
if v:IsA("BasePart") and v.CanCollide then
v.CanCollide = false
end
end
end
end))
else
RemoveConnection("NoClip")
local _0012  GetChar()
if _0012 then
for _, v in pairs(_0012:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = true
end
end
end
Notify("死铁轨", "穿墙 已关闭!", 3)
end
end,
})
_0029:Toggle({
Title = "无敌",
Desc  = "角色不会受到伤害",
Value = false,
Callback = function(state)
_000f.GodMode = state
if state then
Notify("死铁轨", "无敌 已开启!", 3)
AddConnection("GodMode", _0004.Heartbeat:Connect(function()
local _001a  GetHum()
if _001a then
pcall(function()
_001a.MaxHealth = math.huge
_001a.Health = math.huge
end)
end
end))
else
RemoveConnection("GodMode")
local _001a  GetHum()
if _001a then
pcall(function()
_001a.MaxHealth = 100
_001a.Health = 100
end)
end
Notify("死铁轨", "无敌 已关闭!", 3)
end
end,
})
_0029:Toggle({
Title = "摔落无伤害",
Desc  = "高空坠落不扣血",
Value = false,
Callback = function(state)
_000f.NoFallDamage = state
if state then
Notify("死铁轨", "摔落无伤害 已开启!", 3)
AddConnection("NoFallDamage", _0004.Heartbeat:Connect(function()
local _001a  GetHum()
if _001a then
pcall(function()
_001a:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
_001a:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
if _001a:GetState() == Enum.HumanoidStateType.FallingDown then
_001a:ChangeState(Enum.HumanoidStateType.GettingUp)
end
end)
end
end))
else
RemoveConnection("NoFallDamage")
local _001a  GetHum()
if _001a then
pcall(function()
_001a:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
_001a:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
end)
end
Notify("死铁轨", "摔落无伤害 已关闭!", 3)
end
end,
})
_0029:Space()
_0029:Toggle({
Title = "飞行不拉回",
Desc  = "飞行V3方式飞行, 防止被服务端拉回",
Value = false,
Callback = function(state)
_000f.AntiFlyTP = state
if state then
Notify("死铁轨", "飞行不拉回 已开启! 用面板按钮控制飞行", 3)
local _003c  Instance.new("ScreenGui")
_003c.Name = "FlyV3Panel"
_003c.Parent = _000c:WaitForChild("PlayerGui")
_003c.ResetOnSpawn = false
local _003d  Instance.new("Frame")
_003d.Parent = _003c
_003d.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
_003d.BorderColor3 = Color3.fromRGB(103, 221, 213)
_003d.Position = UDim2.new(0.10, 0, 0.38, 0)
_003d.Size = UDim2.new(0, 190, 0, 57)
_003d.Active = true
_003d.Draggable = true
local _003e  Instance.new("TextLabel")
_003e.Parent = _003d
_003e.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
_003e.Position = UDim2.new(0.47, 0, 0, 0)
_003e.Size = UDim2.new(0, 100, 0, 28)
_003e.Font = Enum.Font.SourceSans
_003e.Text = "飞行不拉回"
_003e.TextColor3 = Color3.fromRGB(0, 0, 0)
_003e.TextScaled = true
local _003f  Instance.new("TextButton")
_003f.Name = "up"
_003f.Parent = _003d
_003f.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
_003f.Size = UDim2.new(0, 44, 0, 28)
_003f.Font = Enum.Font.SourceSans
_003f.Text = "上升"
_003f.TextColor3 = Color3.fromRGB(0, 0, 0)
_003f.TextSize = 14
local _0040  Instance.new("TextButton")
_0040.Name = "down"
_0040.Parent = _003d
_0040.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
_0040.Position = UDim2.new(0, 0, 0.49, 0)
_0040.Size = UDim2.new(0, 44, 0, 28)
_0040.Font = Enum.Font.SourceSans
_0040.Text = "下降"
_0040.TextColor3 = Color3.fromRGB(0, 0, 0)
_0040.TextSize = 14
local _0041  Instance.new("TextButton")
_0041.Name = "fly"
_0041.Parent = _003d
_0041.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
_0041.Position = UDim2.new(0.70, 0, 0.49, 0)
_0041.Size = UDim2.new(0, 56, 0, 28)
_0041.Font = Enum.Font.SourceSans
_0041.Text = "飞行"
_0041.TextColor3 = Color3.fromRGB(0, 0, 0)
_0041.TextSize = 14
local _0042  Instance.new("TextButton")
_0042.Name = "plus"
_0042.Parent = _003d
_0042.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
_0042.Position = UDim2.new(0.23, 0, 0, 0)
_0042.Size = UDim2.new(0, 45, 0, 28)
_0042.Font = Enum.Font.SourceSans
_0042.Text = "+"
_0042.TextColor3 = Color3.fromRGB(0, 0, 0)
_0042.TextScaled = true
local _0043  Instance.new("TextLabel")
_0043.Name = "_005a"
_0043.Parent = _003d
_0043.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
_0043.Position = UDim2.new(0.47, 0, 0.49, 0)
_0043.Size = UDim2.new(0, 44, 0, 28)
_0043.Font = Enum.Font.SourceSans
_0043.Text = "1"
_0043.TextColor3 = Color3.fromRGB(0, 0, 0)
_0043.TextScaled = true
local _0044  Instance.new("TextButton")
_0044.Name = "mine"
_0044.Parent = _003d
_0044.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
_0044.Position = UDim2.new(0.23, 0, 0.49, 0)
_0044.Size = UDim2.new(0, 45, 0, 29)
_0044.Font = Enum.Font.SourceSans
_0044.Text = "-"
_0044.TextColor3 = Color3.fromRGB(0, 0, 0)
_0044.TextScaled = true
local _0045  Instance.new("TextButton")
_0045.Name = "close"
_0045.Parent = _003d
_0045.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
_0045.Font = Enum.Font.SourceSans
_0045.Size = UDim2.new(0, 45, 0, 28)
_0045.Text = "X"
_0045.TextSize = 30
_0045.Position = UDim2.new(0, 0, -1, 27)
local _0046  Instance.new("TextButton")
_0046.Name = "mini"
_0046.Parent = _003d
_0046.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
_0046.Font = Enum.Font.SourceSans
_0046.Size = UDim2.new(0, 45, 0, 28)
_0046.Text = "T"
_0046.TextSize = 30
_0046.Position = UDim2.new(0, 44, -1, 27)
local _0047  Instance.new("TextButton")
_0047.Name = "mini2"
_0047.Parent = _003d
_0047.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
_0047.Font = Enum.Font.SourceSans
_0047.Size = UDim2.new(0, 45, 0, 28)
_0047.Text = "T"
_0047.TextSize = 30
_0047.Position = UDim2.new(0, 44, -1, 57)
_0047.Visible = false
local _0048  1
local _0049  false
local _004a  false
local _004b  nil
local _004c  nil
local _004d  nil
local _004e  nil
local _004f  tick()
local _0050  {f = 0, b = 0, l = 0, r = 0}
local _0051 _0051 = _0005.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.W then _0050.f = 1 end
if input.KeyCode == Enum.KeyCode.S then _0050.b = -1 end
if input.KeyCode == Enum.KeyCode.A then _0050.l = -1 end
if input.KeyCode == Enum.KeyCode.D then _0050.r = 1 end
end)
local _0052 _0052 = _0005.InputEnded:Connect(function(input)
if input.KeyCode == Enum.KeyCode.W then _0050.f = 0 end
if input.KeyCode == Enum.KeyCode.S then _0050.b = 0 end
if input.KeyCode == Enum.KeyCode.A then _0050.l = 0 end
if input.KeyCode == Enum.KeyCode.D then _0050.r = 0 end
end)
AddConnection("FlyKeyBind", _0051)
AddConnection("FlyKeyRelease", _0052)
local function startFly()
_0049 = true
_0041.Text = "停止"
_0041.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
local _0012  GetChar()
if not _0012 then return end
local _001a  GetHum()
if not _001a then return end
_004a = false
for i = 1, _0048 do
task._006a(function()
local _0053  _0004.Heartbeat
_004a = true
local _0054  GetChar()
local _0055  _0054 and _0054:FindFirstChildWhichIsA("Humanoid")
while _004a and _0053:Wait() and _0054 and _0055 and _0055.Parent do
if _0055.MoveDirection.Magnitude > 0 then
_0054:TranslateBy(_0055.MoveDirection)
end
end
end)
end
pcall(function() _0012.Animate.Disabled = true end)
for _, st in ipairs({
Enum.HumanoidStateType.Climbing,
Enum.HumanoidStateType.FallingDown,
Enum.HumanoidStateType.Flying,
Enum.HumanoidStateType.Freefall,
Enum.HumanoidStateType.GettingUp,
Enum.HumanoidStateType.Jumping,
Enum.HumanoidStateType.Landed,
Enum.HumanoidStateType.Physics,
Enum.HumanoidStateType.PlatformStanding,
Enum.HumanoidStateType.Ragdoll,
Enum.HumanoidStateType.Running,
Enum.HumanoidStateType.RunningNoPhysics,
Enum.HumanoidStateType.Seated,
Enum.HumanoidStateType.StrafingNoPhysics,
Enum.HumanoidStateType.Swimming,
}) do
pcall(function() _001a:SetStateEnabled(st, false) end)
end
_001a:ChangeState(Enum.HumanoidStateType.Swimming)
_001a.PlatformStand = true
local _0056  _0012:FindFirstChild("Torso") or _0012:FindFirstChild("UpperTorso") or _0012:FindFirstChild("HumanoidRootPart")
if not _0056 then return end
local _0057  Instance.new("BodyGyro")
_0057.P = 9e4
_0057.maxTorque = Vector3.new(9e9, 9e9, 9e9)
_0057.CFrame = _0056.CFrame
_0057.Parent = _0056
local _0058  Instance.new("BodyVelocity")
_0058.Velocity = Vector3.new(0, 0.1, 0)
_0058.MaxForce = Vector3.new(9e9, 9e9, 9e9)
_0058.Parent = _0056
local _0059  50
local _005a  0
local _005b  {f = 0, b = 0, l = 0, r = 0}
_004b = _0004.RenderStepped:Connect(function()
if not _0049 then return end
local _0054  GetChar()
if not _0054 then return end
local _0055  _0054:FindFirstChildWhichIsA("Humanoid")
if not _0055 or _0055.Health == 0 then return end
if _0050.l + _0050.r ~= 0 or _0050.f + _0050.b ~= 0 then
_005a = _005a + 0.5 + (_005a / _0059)
if _005a > _0059 then _005a = _0059 end
elseif _005a ~= 0 then
_005a = _005a - 1
if _005a < 0 then _005a = 0 end
end
if (_0050.l + _0050.r) ~= 0 or (_0050.f + _0050.b) ~= 0 then
_0058.Velocity = ((_000d.CoordinateFrame.lookVector * (_0050.f + _0050.b))
+ ((_000d.CoordinateFrame * CFrame.new(_0050.l + _0050.r, (_0050.f + _0050.b) * 0.2, 0).p)
- _000d.CoordinateFrame.p)) * _005a
_005b = {f = _0050.f, b = _0050.b, l = _0050.l, r = _0050.r}
elseif _005a ~= 0 then
_0058.Velocity = ((_000d.CoordinateFrame.lookVector * (_005b.f + _005b.b))
+ ((_000d.CoordinateFrame * CFrame.new(_005b.l + _005b.r, (_005b.f + _005b.b) * 0.2, 0).p)
- _000d.CoordinateFrame.p)) * _005a
else
_0058.Velocity = Vector3.new(0, 0, 0)
end
_0057.CFrame = _000d.CoordinateFrame * CFrame.Angles(-math.rad((_0050.f + _0050.b) * 50 * _005a / _0059), 0, 0)
local _0016  GetRoot()
if _0016 then
pcall(function()
local _005c  _0016.AssemblyLinearVelocity
if _005c.Y >= -50 then
_004e = _0016.Position
_004f = tick()
end
if _004e then
local _005d  tick()
local _005e  _005d - _004f
if _005e > 0 and _005e < 0.5 then
local _005f  _0016.Position.Y - _004e.Y
if _005f < -30 then
_0016.CFrame = CFrame.new(_004e.X, _004e.Y, _004e.Z)
* CFrame.Angles(0, math.rad(_0016.Orientation.Y), 0)
end
end
end
if _005c.Y < -50 then
_0016.AssemblyLinearVelocity = Vector3.new(_005c.X, 0, _005c.Z)
end
for _, part in ipairs(_0054:GetDescendants()) do
if part:IsA("BasePart") then
pcall(function() part:SetNetworkOwner(_000c) end)
end
end
end)
end
end)
_003c:SetAttribute("_0057", _0057)
_003c:SetAttribute("_0058", _0058)
end
local function stopFly()
_0049 = false
_004a = false
_0041.Text = "飞行"
_0041.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
if _004b then
_004b:Disconnect()
_004b = nil
end
local _0012  GetChar()
if _0012 then
local _001a  GetHum()
local _0056  _0012:FindFirstChild("Torso") or _0012:FindFirstChild("UpperTorso") or _0012:FindFirstChild("HumanoidRootPart")
if _0056 then
local _0057  _0056:FindFirstChildOfClass("BodyGyro")
local _0058  _0056:FindFirstChildOfClass("BodyVelocity")
if _0057 then _0057:Destroy() end
if _0058 then _0058:Destroy() end
end
if _001a then
pcall(function()
_001a.PlatformStand = false
_0012.Animate.Disabled = false
for _, st in ipairs({
Enum.HumanoidStateType.Climbing,
Enum.HumanoidStateType.FallingDown,
Enum.HumanoidStateType.Flying,
Enum.HumanoidStateType.Freefall,
Enum.HumanoidStateType.GettingUp,
Enum.HumanoidStateType.Jumping,
Enum.HumanoidStateType.Landed,
Enum.HumanoidStateType.Physics,
Enum.HumanoidStateType.PlatformStanding,
Enum.HumanoidStateType.Ragdoll,
Enum.HumanoidStateType.Running,
Enum.HumanoidStateType.RunningNoPhysics,
Enum.HumanoidStateType.Seated,
Enum.HumanoidStateType.StrafingNoPhysics,
Enum.HumanoidStateType.Swimming,
}) do
_001a:SetStateEnabled(st, true)
end
_001a:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
end)
end
end
end
_0041.MouseButton1Down:Connect(function()
if _0049 then
stopFly()
else
startFly()
end
end)
_003f.MouseButton1Down:Connect(function()
_004c = _0004.Heartbeat:Connect(function()
local _0016  GetRoot()
if _0016 then
_0016.CFrame = _0016.CFrame * CFrame.new(0, 1, 0)
end
end)
end)
_003f.MouseButton1Up:Connect(function()
if _004c then _004c:Disconnect() _004c = nil end
end)
_003f.MouseLeave:Connect(function()
if _004c then _004c:Disconnect() _004c = nil end
end)
_0040.MouseButton1Down:Connect(function()
_004d = _0004.Heartbeat:Connect(function()
local _0016  GetRoot()
if _0016 then
_0016.CFrame = _0016.CFrame * CFrame.new(0, -1, 0)
end
end)
end)
_0040.MouseButton1Up:Connect(function()
if _004d then _004d:Disconnect() _004d = nil end
end)
_0040.MouseLeave:Connect(function()
if _004d then _004d:Disconnect() _004d = nil end
end)
_0042.MouseButton1Down:Connect(function()
_0048 = _0048 + 1
_0043.Text = tostring(_0048)
if _0049 then
_004a = false
task.wait(0.1)
for i = 1, _0048 do
task._006a(function()
local _0053  _0004.Heartbeat
_004a = true
local _0054  GetChar()
local _0055  _0054 and _0054:FindFirstChildWhichIsA("Humanoid")
while _004a and _0053:Wait() and _0054 and _0055 and _0055.Parent do
if _0055.MoveDirection.Magnitude > 0 then
_0054:TranslateBy(_0055.MoveDirection)
end
end
end)
end
end
end)
_0044.MouseButton1Down:Connect(function()
if _0048 > 1 then
_0048 = _0048 - 1
_0043.Text = tostring(_0048)
if _0049 then
_004a = false
task.wait(0.1)
for i = 1, _0048 do
task._006a(function()
local _0053  _0004.Heartbeat
_004a = true
local _0054  GetChar()
local _0055  _0054 and _0054:FindFirstChildWhichIsA("Humanoid")
while _004a and _0053:Wait() and _0054 and _0055 and _0055.Parent do
if _0055.MoveDirection.Magnitude > 0 then
_0054:TranslateBy(_0055.MoveDirection)
end
end
end)
end
end
end
end)
_0045.MouseButton1Click:Connect(function()
stopFly()
_003c:Destroy()
_000f.AntiFlyTP = false
end)
_0046.MouseButton1Click:Connect(function()
_003f.Visible = false
_0040.Visible = false
_0041.Visible = false
_0042.Visible = false
_0043.Visible = false
_0044.Visible = false
_0046.Visible = false
_0047.Visible = true
_003d.BackgroundTransparency = 1
_0045.Position = UDim2.new(0, 0, -1, 57)
end)
_0047.MouseButton1Click:Connect(function()
_003f.Visible = true
_0040.Visible = true
_0041.Visible = true
_0042.Visible = true
_0043.Visible = true
_0044.Visible = true
_0046.Visible = true
_0047.Visible = false
_003d.BackgroundTransparency = 0
_0045.Position = UDim2.new(0, 0, -1, 27)
end)
task._006a(function()
while _000f.AntiFlyTP do
pcall(function()
for _, obj in ipairs(_0009:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local _003a  string.lower(obj.Name)
if string.find(_003a, "teleport") or string.find(_003a, "tpback")
or string.find(_003a, "respawn") or string.find(_003a, "antifly")
or string.find(_003a, "anti_fly") or string.find(_003a, "anti-fly")
or string.find(_003a, "noclip") or string.find(_003a, "hack") then
pcall(function() obj.FireServer = function() end end)
end
end
end
end)
task.wait(2)
end
end)
local _0060 _0060 = _000c.CharacterAdded:Connect(function(_0012)
task.wait(0.7)
pcall(function()
local _001a  _0012:FindFirstChildWhichIsA("Humanoid")
if _001a then
_001a.PlatformStand = false
end
_0012.Animate.Disabled = false
end)
if _0049 then
stopFly()
task.wait(0.5)
startFly()
end
end)
AddConnection("FlyRespawn", _0060)
else
RemoveConnection("AntiFlyTP")
RemoveConnection("FlyKeyBind")
RemoveConnection("FlyKeyRelease")
RemoveConnection("FlyRespawn")
local _0061  _000c:FindFirstChild("PlayerGui")
if _0061 then
local _0062  _0061:FindFirstChild("FlyV3Panel")
if _0062 then _0062:Destroy() end
end
Notify("死铁轨", "飞行不拉回 已关闭!", 3)
end
end,
})
_002a:Toggle({
Title = "人物透视",
Desc  = "显示其他玩家名字和距离",
Value = false,
Callback = function(state)
_000f.PlayerESP = state
if state then
Notify("死铁轨", "人物透视 已开启!", 3)
AddConnection("PlayerESP", _0004.RenderStepped:Connect(function()
local _0016  GetRoot()
if not _0016 then return end
for _, _0066 in pairs(_0003:GetPlayers()) do
if _0066 ~= _000c and _0066.Character then
local _001b  _0066.Character:FindFirstChild("HumanoidRootPart")
if _001b then
local _0063  "Player_" .. _0066.Name
if not _0011[_0063] then
local _0064  CreateESP(_001b, _0066.Name, Color3.new(1, 0.3, 0.3), 3)
_0011[_0063] = _0064
end
local _001d  (_0016.Position - _001b.Position).Magnitude
local _0014  _0011[_0063]:FindFirstChildOfClass("TextLabel")
if _0014 then
_0014.Text = _0066.Name .. "\n" .. math.floor(_001d) .. "m"
end
end
end
end
for _0063, obj in pairs(_0011) do
if string.find(_0063, "Player_") then
local _0065  _0063:sub(8)
local _0066  _0003:FindFirstChild(_0065)
if not _0066 or not _0066.Character
or not _0066.Character:FindFirstChild("HumanoidRootPart") then
pcall(function() obj:Destroy() end)
_0011[_0063] = nil
end
end
end
end))
else
RemoveConnection("PlayerESP")
for _0063, obj in pairs(_0011) do
if string.find(_0063, "Player_") then
pcall(function() obj:Destroy() end)
_0011[_0063] = nil
end
end
Notify("死铁轨", "人物透视 已关闭!", 3)
end
end,
})
_002a:Toggle({
Title = "物品透视",
Desc  = "高亮物资/燃油/弹药等物品",
Value = false,
Callback = function(state)
_000f.ItemESP = state
if state then
Notify("死铁轨", "物品透视 已开启!", 3)
task._006a(function()
while _000f.ItemESP do
local _0016  GetRoot()
if _0016 then
local _0067  {
{_002d = {"fuel", "gasoline", "gascan", "petrol"}, _0027 = Color3.new(1, 0.5, 0), _0014 = "燃油"},
{_002d = {"ammo", "ammunition", "bullet", "shell"}, _0027 = Color3.new(1, 1, 0), _0014 = "弹药"},
{_002d = {"coin", "cash", "gold", "money", "treasure"}, _0027 = Color3.new(0.2, 1, 0.2), _0014 = "金币"},
{_002d = {"wood", "plank", "log"}, _0027 = Color3.new(0.6, 0.4, 0.2), _0014 = "木材"},
{_002d = {"iron", "metal", "scrap", "steel"}, _0027 = Color3.new(0.5, 0.5, 1), _0014 = "金属"},
{_002d = {"coal"}, _0027 = Color3.new(0.3, 0.3, 0.3), _0014 = "煤炭"},
{_002d = {"bandage", "medkit", "med"}, _0027 = Color3.new(1, 0.3, 0.3), _0014 = "医疗"},
{_002d = {"supply", "supplies", "loot", "crate", "box"}, _0027 = Color3.new(0.8, 0.8, 0.8), _0014 = "物资"},
}
for _, category in pairs(_0067) do
for _, obj in pairs(_0006:GetDescendants()) do
if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
local _002e  string.lower(obj.Name)
local _002f  false
for _, kw in pairs(category._002d) do
if string.find(_002e, kw) then
_002f = true
break
end
end
if _002f then
local _0063  "Item_" .. obj.Name .. "_" .. tostring(obj)
if not _0011[_0063] then
local _001d  (obj.Position - _0016.Position).Magnitude
if _001d < 1000 then
local _0064  CreateESP(obj, category._0014 .. "\n" .. math.floor(_001d) .. "m", category._0027, 2)
_0011[_0063] = _0064
end
else
local _001d  (obj.Position - _0016.Position).Magnitude
local _0014  _0011[_0063]:FindFirstChildOfClass("TextLabel")
if _0014 then
_0014.Text = category._0014 .. "\n" .. math.floor(_001d) .. "m"
end
end
end
end
end
end
end
task.wait(math.random(30, 80) / 100)
end
end)
else
for _0063, obj in pairs(_0011) do
if string.find(_0063, "Item_") then
pcall(function() obj:Destroy() end)
_0011[_0063] = nil
end
end
Notify("死铁轨", "物品透视 已关闭!", 3)
end
end,
})
_002a:Toggle({
Title = "全图高亮",
Desc  = "高亮所有玩家和NPC",
Value = false,
Callback = function(state)
_000f.FullHighlight = state
if state then
Notify("死铁轨", "全图高亮 已开启!", 3)
task._006a(function()
while _000f.FullHighlight do
for _, _0066 in pairs(_0003:GetPlayers()) do
if _0066 ~= _000c and _0066.Character then
local _0063  "HL_Player_" .. _0066.Name
if not _0011[_0063] then
local _0068  CreateHighlight(_0066.Character, Color3.new(0, 1, 0))
_0011[_0063] = { Highlight = _0068 }
end
end
end
for _, obj in pairs(_0006:GetDescendants()) do
if obj:IsA("Model") then
local _001a  obj:FindFirstChildOfClass("Humanoid")
if _001a and _001a.Health > 0 then
local _001c  false
for _, _0066 in pairs(_0003:GetPlayers()) do
if _0066.Character == obj then
_001c = true
break
end
end
if not _001c then
local _0063  "HL_NPC_" .. obj.Name
if not _0011[_0063] then
local _0068  CreateHighlight(obj, Color3.new(1, 0, 0))
_0011[_0063] = { Highlight = _0068 }
end
end
end
end
end
task.wait(math.random(50, 100) / 100)
end
end)
else
for _0063, obj in pairs(_0011) do
if string.find(_0063, "HL_") then
pcall(function()
if obj.Highlight then obj.Highlight:Destroy() end
end)
_0011[_0063] = nil
end
end
Notify("死铁轨", "全图高亮 已关闭!", 3)
end
end,
})
local function TeleportToLocation(_002d, displayName)
local _0036  FindByKeywords(_002d)
if _0036 then
local _0069  GetObjectPosition(_0036)
TeleportTo(CFrame.new(_0069 + Vector3.new(0, 5, 0)))
Notify("死铁轨", "已传送到" .. displayName .. "!", 3)
else
Notify("死铁轨", "未找到" .. displayName .. "!", 3)
end
end
_002b:Button({
Title = "传送到列车",
Desc  = "传送到列车/火车位置",
Icon  = "_0031-front",
Callback = function()
TeleportToLocation({"_0031", "locomotive", "engine", "cabin", "cart", "railcar"}, "列车")
end,
})
_002b:Button({
Title = "传送到加油站",
Desc  = "传送到加油站/燃料站位置",
Icon  = "fuel",
Callback = function()
TeleportToLocation({"gasstation", "gas_station", "fuelstation", "fuel_station", "gasoline", "fuelstation", "petrol", "gasstation"}, "加油站")
end,
})
_002b:Button({
Title = "传送到商店",
Desc  = "传送到商店/商人位置",
Icon  = "shopping-cart",
Callback = function()
TeleportToLocation({"shop", "store", "merchant", "trader", "generalstore", "general_store"}, "商店")
end,
})
_002b:Button({
Title = "传送到营地",
Desc  = "传送到营地/帐篷位置",
Icon  = "tent",
Callback = function()
TeleportToLocation({"camp", "tent", "base", "campsite", "camp_site", "outpost"}, "营地")
end,
})
_002b:Button({
Title = "传送到墓地",
Desc  = "传送到墓地/坟场位置",
Icon  = "cross",
Callback = function()
TeleportToLocation({"cemetery", "graveyard", "grave", "tomb", "crypt", "burial"}, "墓地")
end,
})
_002b:Button({
Title = "传送到矿场",
Desc  = "传送到矿场/矿洞位置",
Icon  = "mountain",
Callback = function()
TeleportToLocation({"mine", "quarry", "cave", "mineshaft", "ore", "tunnel"}, "矿场")
end,
})
_002b:Button({
Title = "传送到出生点",
Desc  = "传送到初始出生位置",
Icon  = "home",
Callback = function()
local _006a  FindByKeywords({"_006a", "spawnpoint", "spawn_point", "lobby", "start"})
if _006a then
local _0069  GetObjectPosition(_006a)
TeleportTo(CFrame.new(_0069 + Vector3.new(0, 5, 0)))
Notify("死铁轨", "已传送到出生点!", 3)
else
TeleportTo(CFrame.new(0, 50, 0))
Notify("死铁轨", "已传送到出生区域!", 3)
end
end,
})
_002b:Space()
local _006b  false
local _006c  0
_002b:Toggle({
Title = "长按传送",
Desc  = "长按屏幕/鼠标传送到指定位置",
Value = false,
Callback = function(state)
_000f.LongPressTP = state
if state then
Notify("死铁轨", "长按传送 已开启! 长按屏幕传送", 3)
AddConnection("LongPressTP_Begin", _0005.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then
_006b = true
_006c = tick()
end
end))
AddConnection("LongPressTP_End", _0005.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then
_006b = false
end
end))
task._006a(function()
while _000f.LongPressTP do
if _006b and (tick() - _006c) > 0.3 then
local _0016  GetRoot()
if _0016 and _000e.Hit then
pcall(function()
_0016.CFrame = CFrame.new(_000e.Hit.Position + Vector3.new(0, 5, 0))
end)
end
end
task.wait(0.05)
end
end)
else
RemoveConnection("LongPressTP_Begin")
RemoveConnection("LongPressTP_End")
_006b = false
Notify("死铁轨", "长按传送 已关闭!", 3)
end
end,
})
_002c:Toggle({
Title = "防挂机",
Desc  = "防止被系统判定为挂机",
Value = false,
Callback = function(state)
_000f.AntiAfk = state
if state then
Notify("死铁轨", "防挂机 已开启!", 3)
AddConnection("AntiAfk_Idle", _0003.Idled:Connect(function()
pcall(function()
_000b:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
_000b:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
end))
task._006a(function()
while _000f.AntiAfk do
pcall(function()
_000b:SendKeyEvent(true, Enum.KeyCode.W, false, game)
task.wait(0.1)
_000b:SendKeyEvent(false, Enum.KeyCode.W, false, game)
end)
task.wait(math.random(120, 240))
end
end)
else
RemoveConnection("AntiAfk_Idle")
Notify("死铁轨", "防挂机 已关闭!", 3)
end
end,
})
_002c:Toggle({
Title = "画质提速",
Desc  = "降低画质特效提升FPS",
Value = false,
Callback = function(state)
_000f.GraphicsBoost = state
if state then
Notify("死铁轨", "画质提速 已开启!", 3)
pcall(function()
_0007.GlobalShadows = false
_0007.FogEnd = 1e9
_0007.Brightness = 2
_0007.ClockTime = 12
_0007.Ambient = Color3.new(1, 1, 1)
_0007.OutdoorAmbient = Color3.new(1, 1, 1)
for _, v in pairs(_0007:GetChildren()) do
if v:IsA("PostEffect") or v:IsA("BlurEffect")
or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect")
or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
v.Enabled = false
end
end
for _, v in pairs(_0006:GetDescendants()) do
if v:IsA("BasePart") then
v.Material = Enum.Material.SmoothPlastic
if v:IsA("MeshPart") then
v.RenderFidelity = Enum.RenderFidelity.Automatic
end
end
end
end)
else
pcall(function()
_0007.GlobalShadows = true
_0007.Brightness = 1
_0007.FogEnd = 100000
for _, v in pairs(_0007:GetChildren()) do
if v:IsA("PostEffect") or v:IsA("BlurEffect")
or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect")
or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
v.Enabled = true
end
end
end)
Notify("死铁轨", "画质提速 已关闭!", 3)
end
end,
})
_002c:Space()
_002c:Button({
Title = "换服",
Desc  = "传送到其他服务器",
Icon  = "refresh-cw",
Callback = function()
Notify("死铁轨", "正在搜索可用服务器...", 3)
local _006d  game.JobId
local _006e  {}
local _006f  nil
pcall(function()
_006f = game:GetService("HttpService"):JSONDecode(game:HttpGet(
"https://games.roblox.com/v1/games/" .. game.PlaceId .. "/_006e/Public?limit=100"
))
end)
if _006f and _006f.data then
for _, server in pairs(_006f.data) do
if server.id ~= _006d and server.playing < server.maxPlayers then
table.insert(_006e, server.id)
end
end
end
if #_006e > 0 then
local _0036  _006e[math.random(1, #_006e)]
Notify("死铁轨", "正在换服中...", 3)
pcall(function()
_000a:TeleportToPlaceInstance(game.PlaceId, _0036, _000c)
end)
else
Notify("死铁轨", "未找到可用服务器!", 3)
end
end,
})
_002c:Button({
Title = "复制服务器号",
Desc  = "复制当前服务器JobId到剪贴板",
Icon  = "copy",
Callback = function()
local _006d  game.JobId
if setclipboard then
pcall(function()
setclipboard(_006d)
end)
Notify("死铁轨", "服务器号已复制: " .. _006d, 5)
else
Notify("死铁轨", "当前服务器号: " .. _006d, 8)
end
end,
})
_002c:Button({
Title = "角色信息",
Desc  = "显示当前角色详细信息",
Icon  = "_0074",
Callback = function()
local _0012  GetChar()
local _001a  GetHum()
local _0016  GetRoot()
if _0012 and _001a and _0016 then
local _0070  math.floor(_001a.Health)
local _0071  math.floor(_001a.MaxHealth)
local _0072  _001a.WalkSpeed
local _0073  _001a.UseJumpPower and ("JumpPower: " .. math.floor(_001a.JumpPower)) or ("JumpHeight: " .. math.floor(_001a.JumpHeight))
local _0069  _0016.Position
local _0074  string.format(
"角色名: %s\n血量: %d/%d\n速度: %d\n%s\n位置: %.1f, %.1f, %.1f\n工具数: %d",
_0012.Name,
_0070, _0071,
_0072,
_0073,
_0069.X, _0069.Y, _0069.Z,
#_0012:GetChildren()
)
Notify("角色信息", _0074, 10)
else
Notify("死铁轨", "未找到角色!", 3)
end
end,
})
_002c:Button({
Title = "清理特效",
Desc  = "清理所有ESP和特效对象",
Icon  = "trash-2",
Callback = function()
ClearAllESP()
pcall(function()
for _, v in pairs(_0006:GetDescendants()) do
if v:IsA("Highlight") and v.Name == "DeadRailsHighlight" then
v:Destroy()
end
if v:IsA("BillboardGui") and string.find(v.Name, "DeadRailsESP") then
v:Destroy()
end
end
end)
Notify("死铁轨", "所有特效已清理!", 3)
end,
})
_002c:Button({
Title = "卸载脚本",
Desc  = "关闭所有功能并卸载脚本",
Icon  = "x-circle",
Color = Color3.fromHex("#e53935"),
Callback = function()
for k, v in pairs(_000f) do
if type(v) == "boolean" then
_000f[k] = false
end
end
for _0017, conn in pairs(_0010) do
pcall(function() conn:Disconnect() end)
end
_0010 = {}
ClearAllESP()
pcall(function()
for _, v in pairs(_0006:GetDescendants()) do
if v:IsA("Highlight") and v.Name == "DeadRailsHighlight" then
v:Destroy()
end
if v:IsA("BillboardGui") and string.find(v.Name, "DeadRailsESP") then
v:Destroy()
end
end
end)
local _001a  GetHum()
if _001a then
pcall(function()
_001a.WalkSpeed = 16
if _001a.UseJumpPower then
_001a.JumpPower = 50
else
_001a.JumpHeight = 5
end
_001a.MaxHealth = 100
end)
end
local _0012  GetChar()
if _0012 then
for _, v in pairs(_0012:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = true
end
end
end
pcall(function()
_0007.GlobalShadows = true
_0007.Brightness = 1
_0007.FogEnd = 100000
for _, v in pairs(_0007:GetChildren()) do
if v:IsA("PostEffect") or v:IsA("BlurEffect")
or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect")
or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
v.Enabled = true
end
end
end)
pcall(function()
_0020:Destroy()
end)
Notify("死铁轨", "脚本已卸载! 感谢使用!", 5)
end,
})
_000c.CharacterAdded:Connect(function(_0012)
_0012:WaitForChild("Humanoid")
task.wait(0.5)
local _001a  _0012:FindFirstChildOfClass("Humanoid")
if _001a then
pcall(function()
_001a.WalkSpeed = _000f.WalkSpeed
if _001a.UseJumpPower then
_001a.JumpPower = _000f.JumpPower
else
_001a.JumpHeight = _000f.JumpPower / 10
end
end)
end
if _000f.GodMode then
AddConnection("GodMode", _0004.Heartbeat:Connect(function()
local _0055  GetHum()
if _0055 then
pcall(function()
_0055.MaxHealth = math.huge
_0055.Health = math.huge
end)
end
end))
end
if _000f.NoClip then
AddConnection("NoClip", _0004.Stepped:Connect(function()
local _0054  GetChar()
if _0054 then
for _, v in pairs(_0054:GetDescendants()) do
if v:IsA("BasePart") and v.CanCollide then
v.CanCollide = false
end
end
end
end))
end
if _000f.NoFallDamage then
AddConnection("NoFallDamage", _0004.Heartbeat:Connect(function()
local _0055  GetHum()
if _0055 then
pcall(function()
_0055:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
_0055:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
end)
end
end))
end
if _000f.InfiniteJump then
AddConnection("InfiniteJump", _0005.JumpRequest:Connect(function()
local _0055  GetHum()
if _0055 then
pcall(function()
_0055:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end
end))
end
for _0063, obj in pairs(_0011) do
if string.find(_0063, "Player_") then
pcall(function() obj:Destroy() end)
_0011[_0063] = nil
end
end
end)
print("[死铁轨] 脚本加载完成!")
Notify("死铁轨", "脚本已加载!", 5)