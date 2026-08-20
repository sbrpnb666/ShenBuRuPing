print("[死铁轨] 脚本开始加载 v2.1")
local WindUI
local uiOk, uiErr = pcall(function()
WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
end)
if not uiOk or not WindUI then
pcall(function()
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "死铁轨 - WindUI加载失败",
Text = tostring(uiErr),
Duration = 10,
})
end)
return
end
local function _D0JwKucfvyqVK(hex)
return ColorSequence.new(Color3.fromHex("#" .. tostring(hex)))
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local _DbLdDx1t = 6756
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local State = {
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
local Connections = {}
local ESPObjects = {}
local function GetChar()
return LocalPlayer.Character
end
local function GetRoot()
local char = GetChar()
if char then
return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
end
return nil
end
local function GetHum()
local char = GetChar()
if char then
return char:FindFirstChildOfClass("Humanoid")
end
return nil
end
local function Notify(title, content, duration)
WindUI:Notify({
Title = title,
Content = content,
Duration = duration or 3,
})
end
local function _pMitQdN6BLTAH(name, conn)
if Connections[name] then
Connections[name]:Disconnect()
end
Connections[name] = conn
end
local function _re6aARWAqHyoE4c(name)
if Connections[name] then
Connections[name]:Disconnect()
Connections[name] = nil
end
end
local function _fFTu6VJY7UcP07yc()
for key, obj in pairs(ESPObjects) do
pcall(function()
if type(obj) == "table" then
if obj.Billboard then obj.Billboard:Destroy() end
if obj.Highlight then obj.Highlight:Destroy() end
elseif obj and obj.Destroy then
obj:Destroy()
end
end)
end
ESPObjects = {}
end
local function _vbzGyZ3b0INw(parent, text, color, studOffset)
if not parent or not parent:IsA("Instance") then return nil end
local _Zvuv7Q2yOX = Instance.new("BillboardGui")
_Zvuv7Q2yOX.Name = "DeadRailsESP"
_Zvuv7Q2yOX.AlwaysOnTop = true
_Zvuv7Q2yOX.Size = UDim2.new(0, 200, 0, 50)
_Zvuv7Q2yOX.StudsOffset = studOffset or Vector3.new(0, 3, 0)
_Zvuv7Q2yOX.Adornee = parent
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = text
label.TextColor3 = color or Color3.new(1, 1, 1)
label.TextScaled = true
label.Font = Enum.Font.SourceSansBold
label.TextStrokeColor3 = Color3.new(0, 0, 0)
label.TextStrokeTransparency = 0
label.Parent = _Zvuv7Q2yOX
_Zvuv7Q2yOX.Parent = parent
return _Zvuv7Q2yOX
end
local function _wCW2vz64dJ(parent, color)
if not parent or not parent:IsA("Instance") then return nil end
local _qimlQTNiafpz3c = Instance.new("Highlight")
_qimlQTNiafpz3c.Name = "DeadRailsHighlight"
_qimlQTNiafpz3c.Adornee = parent
_qimlQTNiafpz3c.FillColor3 = color or Color3.new(1, 0, 0)
_qimlQTNiafpz3c.FillTransparency = 0.5
_qimlQTNiafpz3c.OutlineColor3 = Color3.new(1, 1, 1)
_qimlQTNiafpz3c.Parent = parent
return _qimlQTNiafpz3c
end
local function _Mt3XSv6fvfCr(obj)
if obj:IsA("BasePart") then
return obj.Position
elseif obj:IsA("Attachment") then
return obj.WorldPosition
else
return obj:GetPivot().Position
end
end
local function _sBfro0HCqGNh(cframe)
local root = GetRoot()
if root then
pcall(function()
root.CFrame = cframe
end)
end
end
local function _yhhi7vq8J2WQ(_g9icIcvKCubkwoT, searchIn)
searchIn = searchIn or Workspace
for _, obj in pairs(searchIn:GetDescendants()) do
local name = string.lower(obj.Name)
for _, kw in pairs(_g9icIcvKCubkwoT) do
if string.find(name, string.lower(kw)) then
return obj
end
end
end
return nil
end
local function _ogp70DNkUZ(_g9icIcvKCubkwoT, searchIn)
searchIn = searchIn or Workspace
local results = {}
for _, obj in pairs(searchIn:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local name = string.lower(obj.Name)
for _, kw in pairs(_g9icIcvKCubkwoT) do
if string.find(name, string.lower(kw)) then
table.insert(results, obj)
break
end
end
end
end
return results
end
local function _Md2wUZiUaskrGi(maxDist)
local _GG9FdEmh = 2263
local root = GetRoot()
if not root then return {} end
local npcs = {}
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("Model") then
local hum = obj:FindFirstChildOfClass("Humanoid")
local hrp = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso")
if hum and hrp and hum.Health > 0 then
local _zsJxtbQsU411hnN = false
for _, player in pairs(Players:GetPlayers()) do
if player.Character == obj then
_zsJxtbQsU411hnN = true
break
end
end
if not _zsJxtbQsU411hnN then
local name = string.lower(obj.Name)
if string.find(name, "zombie") or string.find(name, "enemy")
or string.find(name, "npc") or string.find(name, "skeleton")
or string.find(name, "bandit") or string.find(name, "monster") then
local dist = (root.Position - hrp.Position).Magnitude
if dist <= (maxDist or 150) then
table.insert(npcs, {
Model = obj,
Humanoid = hum,
Root = hrp,
Distance = dist
})
end
end
end
end
end
end
table.sort(npcs, function(a, b) return a.Distance < b.Distance end)
return npcs
end
local function _GHvmrp82GGugWipM()
local char = GetChar()
if not char then return end
local tool = char:FindFirstChildOfClass("Tool")
if not tool then
local _f83MJwQdAcRLpVjI = LocalPlayer:FindFirstChild("Backpack")
if _f83MJwQdAcRLpVjI then
tool = _f83MJwQdAcRLpVjI:FindFirstChildOfClass("Tool")
if tool then
local hum = GetHum()
if hum then
pcall(function() hum:EquipTool(tool) end)
end
end
end
end
if tool then
pcall(function() tool:Activate() end)
end
end
print("[死铁轨] 正在创建窗口...")
local Window = WindUI:CreateWindow({
Title   = "死铁轨",
Icon    = "train",
Author  = "死铁轨脚本",
Folder  = "DeadRails",
Size    = UDim2.fromOffset(500, 520),
Theme   = "Dark",
})
local TimeTag = Window:Tag({
Title  = "死铁轨",
Color  = Color3.fromHex("#8B0000"),
})
task.spawn(function()
local hue = 0
local tagBg = nil
task.wait(1)
local function _xwQLxXGetGOQUKm(gui)
for _, v in pairs(gui:GetDescendants()) do
if v:IsA("TextLabel") and v.Text == "死铁轨" then
local parent = v.Parent
if parent and (parent:IsA("Frame") or parent:IsA("TextLabel")) then
tagBg = parent
return true
end
end
end
return false
end
pcall(function()
local _0I6dt2ey5LEAA = LocalPlayer:FindFirstChild("PlayerGui")
if _0I6dt2ey5LEAA then
_xwQLxXGetGOQUKm(_0I6dt2ey5LEAA)
end
if not tagBg then
local coreGui = game:GetService("CoreGui")
_xwQLxXGetGOQUKm(coreGui)
end
end)
while true do
task.wait(0.06)
hue = (hue + 0.02) % 1
local color = Color3.fromHSV(hue, 1, 1)
if tagBg then
pcall(function()
tagBg.BackgroundColor3 = color
end)
end
end
end)
Window:EditOpenButton({
Title          = "死铁轨",
Icon           = "train",
CornerRadius   = UDim.new(0, 16),
StrokeThickness = 2,
Color          = _D0JwKucfvyqVK("8B0000"),
Draggable      = true,
})
local AutoTab = Window:Tab({ Title = "自动", Icon = "bot" })
local _kpXTKfAxJnhgmy = Window:Tab({ Title = "玩家", Icon = "user" })
local _EtF2l57lILs = Window:Tab({ Title = "视觉", Icon = "eye" })
local _Lel4450wSt0HbK = Window:Tab({ Title = "传送", Icon = "map-pin" })
local _MgamQAMYsYJz = Window:Tab({ Title = "实用", Icon = "wrench" })
local _dQgfdNC7 = 6812
print("[死铁轨] 窗口和标签页创建完成, 开始添加功能...")
AutoTab:Toggle({
Title = "自动收集物资",
Desc  = "自动捡取附近物资 (金币/弹药/燃油/木材/铁矿/煤炭等)",
Value = false,
Callback = function(state)
State.AutoCollect = state
if state then
Notify("死铁轨", "自动收集物资 已开启!", 3)
task.spawn(function()
while State.AutoCollect do
local root = GetRoot()
if root then
local _g9icIcvKCubkwoT = {
"coin", "cash", "money", "supply", "supplies", "loot",
"ammo", "ammunition", "fuel", "gasoline", "wood", "log",
"iron", "coal", "gold", "scrap", "metal", "bandage",
"medkit", "med", "water", "food", "rifle", "pistol",
"shotgun", "bullet", "shell", "barrel", "crate", "box",
"treasure", "gem", "ruby", "diamond"
}
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
local _uOzO2Y5zRgSwG = string.lower(obj.Name)
local matched = false
for _, kw in pairs(_g9icIcvKCubkwoT) do
if string.find(_uOzO2Y5zRgSwG, kw) then
matched = true
break
end
end
if matched then
local dist = (obj.Position - root.Position).Magnitude
if dist < 300 then
pcall(function()
obj.CFrame = root.CFrame * CFrame.new(0, 0, -3)
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
AutoTab:Toggle({
Title = "自动加油",
Desc  = "自动捡取燃油并送到列车加油口",
Value = false,
Callback = function(state)
State.AutoFuel = state
if state then
Notify("死铁轨", "自动加油 已开启!", 3)
task.spawn(function()
while State.AutoFuel do
local root = GetRoot()
if root then
local _1HoGN4sds6U74Hku = {"fuel", "gasoline", "gascan", "fuelcan", "oildrum", "petrol"}
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local _uOzO2Y5zRgSwG = string.lower(obj.Name)
local matched = false
for _, kw in pairs(_1HoGN4sds6U74Hku) do
if string.find(_uOzO2Y5zRgSwG, kw) then
matched = true
break
end
end
if matched then
local dist = (obj.Position - root.Position).Magnitude
if dist < 500 then
pcall(function()
obj.CFrame = root.CFrame * CFrame.new(0, 0, -3)
end)
end
end
end
end
local train = _yhhi7vq8J2WQ({"train", "locomotive", "engine", "cabin", "cart"})
if train then
local _bQ5Amrlkr1aM0S8 = _Mt3XSv6fvfCr(train)
local _0GJ2gqnIdM = _ogp70DNkUZ({"fuel", "gascan", "fuelcan"})
for _, fuelPart in pairs(_0GJ2gqnIdM) do
if fuelPart:IsA("BasePart") then
pcall(function()
fuelPart.CFrame = CFrame.new(_bQ5Amrlkr1aM0S8 + Vector3.new(0, 5, 0))
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
AutoTab:Toggle({
Title = "自动修理",
Desc  = "自动捡取修理材料并送到列车",
Value = false,
Callback = function(state)
State.AutoRepair = state
if state then
Notify("死铁轨", "自动修理 已开启!", 3)
task.spawn(function()
while State.AutoRepair do
local root = GetRoot()
if root then
local _WWSx3SZhbZ = {"wood", "plank", "board", "metal", "scrap", "nail", "hammer", "wrench", "repair", "tool"}
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local _uOzO2Y5zRgSwG = string.lower(obj.Name)
local _pS3sLVTz = 8566
local matched = false
for _, kw in pairs(_WWSx3SZhbZ) do
if string.find(_uOzO2Y5zRgSwG, kw) then
matched = true
break
end
end
if matched then
local dist = (obj.Position - root.Position).Magnitude
if dist < 500 then
pcall(function()
obj.CFrame = root.CFrame * CFrame.new(0, 0, -3)
end)
end
end
end
end
local train = _yhhi7vq8J2WQ({"train", "locomotive", "engine", "cabin", "cart"})
if train then
local _bQ5Amrlkr1aM0S8 = _Mt3XSv6fvfCr(train)
local _Q4mhwMncHfC = _ogp70DNkUZ({"wood", "plank", "metal", "repair", "tool"})
for _, repairPart in pairs(_Q4mhwMncHfC) do
if repairPart:IsA("BasePart") then
pcall(function()
repairPart.CFrame = CFrame.new(_bQ5Amrlkr1aM0S8 + Vector3.new(0, 5, 0))
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
AutoTab:Toggle({
Title = "自动打僵尸",
Desc  = "自动检测附近僵尸/敌人NPC并攻击",
Value = false,
Callback = function(state)
State.AutoZombie = state
if state then
Notify("死铁轨", "自动打僵尸 已开启!", 3)
task.spawn(function()
while State.AutoZombie do
local root = GetRoot()
local hum = GetHum()
if root and hum then
local npcs = _Md2wUZiUaskrGi(200)
if #npcs > 0 then
local target = npcs[1]
pcall(function()
root.CFrame = target.Root.CFrame * CFrame.new(0, 0, 3)
end)
_GHvmrp82GGugWipM()
pcall(function()
target.Humanoid:TakeDamage(50)
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
AutoTab:Toggle({
Title = "自动做任务",
Desc  = "自动寻找任务NPC并交互",
Value = false,
Callback = function(state)
State.AutoQuest = state
if state then
Notify("死铁轨", "自动做任务 已开启!", 3)
task.spawn(function()
while State.AutoQuest do
local root = GetRoot()
if root then
local _2qdvmMTl562zBHe = {"quest", "mission", "task", "objective", "npc", "merchant", "trader", "questgiver"}
local _zB3Hi85bmH1ItSA = _yhhi7vq8J2WQ(_2qdvmMTl562zBHe)
if _zB3Hi85bmH1ItSA then
local _pumif6fDuhP3 = _Mt3XSv6fvfCr(_zB3Hi85bmH1ItSA)
pcall(function()
root.CFrame = CFrame.new(_pumif6fDuhP3 + Vector3.new(0, 5, 5))
end)
for _, v in pairs(Workspace:GetDescendants()) do
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
_GHvmrp82GGugWipM()
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
AutoTab:Toggle({
Title = "刷债券",
Desc  = "自动搜索并触发债券相关接口",
Value = false,
Callback = function(state)
State.AutoBond = state
if state then
Notify("死铁轨", "刷债券 已开启!", 3)
task.spawn(function()
while State.AutoBond do
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "bond") or string.find(ln, "bonds")
or string.find(ln, "coupon") or string.find(ln, "treasury")
or string.find(ln, "reward") or string.find(ln, "claim") then
obj:FireServer()
end
end
if obj:IsA("RemoteFunction") then
local ln = string.lower(obj.Name)
if string.find(ln, "bond") or string.find(ln, "bonds")
or string.find(ln, "coupon") or string.find(ln, "claim") then
pcall(function() obj:InvokeServer() end)
end
end
end
end)
pcall(function()
local root = GetRoot()
if root then
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local ln = string.lower(obj.Name)
if string.find(ln, "bond") or string.find(ln, "bonds")
or string.find(ln, "coupon") or string.find(ln, "treasure") then
local dist = (root.Position - obj.Position).Magnitude
if dist < 500 then
obj.CFrame = root.CFrame
end
end
end
end
end
end)
pcall(function()
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("ProximityPrompt") then
local ln = string.lower(obj.Name)
local _oUz63k5SfBVS70c = obj.Parent and string.lower(obj.Parent.Name) or ""
if string.find(ln, "bond") or string.find(ln, "claim")
or string.find(_oUz63k5SfBVS70c, "bond") or string.find(_oUz63k5SfBVS70c, "treasure") then
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
_kpXTKfAxJnhgmy:Slider({
Title = "行走速度",
Desc  = "调整角色移动速度 (16-500)",
Value = { Min = 16, Max = 500, Default = 16 },
Step  = 1,
Callback = function(value)
State.WalkSpeed = value
local hum = GetHum()
if hum then
hum.WalkSpeed = value
end
end,
})
_kpXTKfAxJnhgmy:Slider({
Title = "跳跃力",
Desc  = "调整角色跳跃力 (50-500)",
Value = { Min = 50, Max = 500, Default = 50 },
Step  = 1,
Callback = function(value)
State.JumpPower = value
local hum = GetHum()
if hum then
if hum.UseJumpPower then
hum.JumpPower = value
else
hum.JumpHeight = value / 10
end
end
end,
})
_kpXTKfAxJnhgmy:Space()
_kpXTKfAxJnhgmy:Toggle({
Title = "无限跳跃",
Desc  = "可在空中连续跳跃",
Value = false,
Callback = function(state)
State.InfiniteJump = state
if state then
Notify("死铁轨", "无限跳跃 已开启!", 3)
_pMitQdN6BLTAH("InfiniteJump", UserInputService.JumpRequest:Connect(function()
local hum = GetHum()
if hum then
pcall(function()
hum:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end
end))
else
_re6aARWAqHyoE4c("InfiniteJump")
Notify("死铁轨", "无限跳跃 已关闭!", 3)
end
end,
})
_kpXTKfAxJnhgmy:Toggle({
Title = "穿墙",
Desc  = "角色可穿过墙壁和障碍物",
Value = false,
Callback = function(state)
State.NoClip = state
if state then
Notify("死铁轨", "穿墙 已开启!", 3)
_pMitQdN6BLTAH("NoClip", RunService.Stepped:Connect(function()
local char = GetChar()
if char then
for _, v in pairs(char:GetDescendants()) do
if v:IsA("BasePart") and v.CanCollide then
v.CanCollide = false
end
end
end
end))
else
_re6aARWAqHyoE4c("NoClip")
local char = GetChar()
if char then
for _, v in pairs(char:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = true
end
end
end
Notify("死铁轨", "穿墙 已关闭!", 3)
end
end,
})
_kpXTKfAxJnhgmy:Toggle({
Title = "无敌",
Desc  = "角色不会受到伤害",
Value = false,
Callback = function(state)
State.GodMode = state
if state then
Notify("死铁轨", "无敌 已开启!", 3)
_pMitQdN6BLTAH("GodMode", RunService.Heartbeat:Connect(function()
local hum = GetHum()
if hum then
pcall(function()
hum.MaxHealth = math.huge
hum.Health = math.huge
end)
end
end))
else
_re6aARWAqHyoE4c("GodMode")
local hum = GetHum()
if hum then
pcall(function()
hum.MaxHealth = 100
hum.Health = 100
end)
end
Notify("死铁轨", "无敌 已关闭!", 3)
end
end,
})
_kpXTKfAxJnhgmy:Toggle({
Title = "摔落无伤害",
Desc  = "高空坠落不扣血",
Value = false,
Callback = function(state)
State.NoFallDamage = state
if state then
Notify("死铁轨", "摔落无伤害 已开启!", 3)
_pMitQdN6BLTAH("NoFallDamage", RunService.Heartbeat:Connect(function()
local hum = GetHum()
if hum then
pcall(function()
hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
if hum:GetState() == Enum.HumanoidStateType.FallingDown then
hum:ChangeState(Enum.HumanoidStateType.GettingUp)
end
end)
end
end))
else
_re6aARWAqHyoE4c("NoFallDamage")
local hum = GetHum()
if hum then
pcall(function()
hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
hum:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
end)
end
Notify("死铁轨", "摔落无伤害 已关闭!", 3)
end
end,
})
_kpXTKfAxJnhgmy:Space()
_kpXTKfAxJnhgmy:Toggle({
Title = "飞行不拉回",
Desc  = "飞行V3方式飞行, 防止被服务端拉回",
Value = false,
Callback = function(state)
State.AntiFlyTP = state
if state then
Notify("死铁轨", "飞行不拉回 已开启! 用面板按钮控制飞行", 3)
local flyGui = Instance.new("ScreenGui")
flyGui.Name = "FlyV3Panel"
flyGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
flyGui.ResetOnSpawn = false
local frame = Instance.new("Frame")
frame.Parent = flyGui
frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
frame.Position = UDim2.new(0.10, 0, 0.38, 0)
frame.Size = UDim2.new(0, 190, 0, 57)
frame.Active = true
frame.Draggable = true
local title = Instance.new("TextLabel")
title.Parent = frame
title.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
title.Position = UDim2.new(0.47, 0, 0, 0)
title.Size = UDim2.new(0, 100, 0, 28)
title.Font = Enum.Font.SourceSans
title.Text = "飞行不拉回"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextScaled = true
local upBtn = Instance.new("TextButton")
local _fluqiKqp = 226
upBtn.Name = "up"
upBtn.Parent = frame
upBtn.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
upBtn.Size = UDim2.new(0, 44, 0, 28)
upBtn.Font = Enum.Font.SourceSans
upBtn.Text = "上升"
upBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
upBtn.TextSize = 14
local downBtn = Instance.new("TextButton")
downBtn.Name = "down"
downBtn.Parent = frame
downBtn.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
downBtn.Position = UDim2.new(0, 0, 0.49, 0)
downBtn.Size = UDim2.new(0, 44, 0, 28)
downBtn.Font = Enum.Font.SourceSans
downBtn.Text = "下降"
downBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
downBtn.TextSize = 14
local flyBtn = Instance.new("TextButton")
flyBtn.Name = "fly"
flyBtn.Parent = frame
flyBtn.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
flyBtn.Position = UDim2.new(0.70, 0, 0.49, 0)
flyBtn.Size = UDim2.new(0, 56, 0, 28)
flyBtn.Font = Enum.Font.SourceSans
flyBtn.Text = "飞行"
flyBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
flyBtn.TextSize = 14
local plusBtn = Instance.new("TextButton")
plusBtn.Name = "plus"
plusBtn.Parent = frame
plusBtn.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plusBtn.Position = UDim2.new(0.23, 0, 0, 0)
plusBtn.Size = UDim2.new(0, 45, 0, 28)
plusBtn.Font = Enum.Font.SourceSans
plusBtn.Text = "+"
plusBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
plusBtn.TextScaled = true
local _GF69FXMuNOQr = Instance.new("TextLabel")
_GF69FXMuNOQr.Name = "speed"
_GF69FXMuNOQr.Parent = frame
_GF69FXMuNOQr.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
_GF69FXMuNOQr.Position = UDim2.new(0.47, 0, 0.49, 0)
_GF69FXMuNOQr.Size = UDim2.new(0, 44, 0, 28)
_GF69FXMuNOQr.Font = Enum.Font.SourceSans
_GF69FXMuNOQr.Text = "1"
_GF69FXMuNOQr.TextColor3 = Color3.fromRGB(0, 0, 0)
_GF69FXMuNOQr.TextScaled = true
local mineBtn = Instance.new("TextButton")
mineBtn.Name = "mine"
mineBtn.Parent = frame
mineBtn.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mineBtn.Position = UDim2.new(0.23, 0, 0.49, 0)
mineBtn.Size = UDim2.new(0, 45, 0, 29)
mineBtn.Font = Enum.Font.SourceSans
mineBtn.Text = "-"
mineBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
mineBtn.TextScaled = true
local _k4GA6uX7WPA = Instance.new("TextButton")
_k4GA6uX7WPA.Name = "close"
_k4GA6uX7WPA.Parent = frame
_k4GA6uX7WPA.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
_k4GA6uX7WPA.Font = Enum.Font.SourceSans
_k4GA6uX7WPA.Size = UDim2.new(0, 45, 0, 28)
_k4GA6uX7WPA.Text = "X"
_k4GA6uX7WPA.TextSize = 30
_k4GA6uX7WPA.Position = UDim2.new(0, 0, -1, 27)
local miniBtn = Instance.new("TextButton")
miniBtn.Name = "mini"
miniBtn.Parent = frame
miniBtn.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
miniBtn.Font = Enum.Font.SourceSans
miniBtn.Size = UDim2.new(0, 45, 0, 28)
miniBtn.Text = "T"
miniBtn.TextSize = 30
miniBtn.Position = UDim2.new(0, 44, -1, 27)
local _A9hk9lVVIuuM = Instance.new("TextButton")
_A9hk9lVVIuuM.Name = "mini2"
_A9hk9lVVIuuM.Parent = frame
_A9hk9lVVIuuM.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
_A9hk9lVVIuuM.Font = Enum.Font.SourceSans
_A9hk9lVVIuuM.Size = UDim2.new(0, 45, 0, 28)
_A9hk9lVVIuuM.Text = "T"
_A9hk9lVVIuuM.TextSize = 30
_A9hk9lVVIuuM.Position = UDim2.new(0, 44, -1, 57)
_A9hk9lVVIuuM.Visible = false
local _bU0pyksL1KJWw2b = 1
local _tmjNsBAqs5 = false
local _ZX8u7pgOikDANwP = false
local flyConn = nil
local upHold = nil
local _Rtgd3Epb4dXi5b = nil
local lastPos = nil
local _x9KXjWWHx9kW = tick()
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local keyConn
keyConn = UserInputService.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.W then ctrl.f = 1 end
if input.KeyCode == Enum.KeyCode.S then ctrl.b = -1 end
if input.KeyCode == Enum.KeyCode.A then ctrl.l = -1 end
if input.KeyCode == Enum.KeyCode.D then ctrl.r = 1 end
end)
local _743Y1KwPw68M
_743Y1KwPw68M = UserInputService.InputEnded:Connect(function(input)
if input.KeyCode == Enum.KeyCode.W then ctrl.f = 0 end
if input.KeyCode == Enum.KeyCode.S then ctrl.b = 0 end
if input.KeyCode == Enum.KeyCode.A then ctrl.l = 0 end
if input.KeyCode == Enum.KeyCode.D then ctrl.r = 0 end
end)
_pMitQdN6BLTAH("FlyKeyBind", keyConn)
_pMitQdN6BLTAH("FlyKeyRelease", _743Y1KwPw68M)
local function _wGBO4xgx5SKR6O2()
_tmjNsBAqs5 = true
flyBtn.Text = "停止"
flyBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
local char = GetChar()
if not char then return end
local hum = GetHum()
if not hum then return end
_ZX8u7pgOikDANwP = false
for i = 1, _bU0pyksL1KJWw2b do
task.spawn(function()
local hb = RunService.Heartbeat
_ZX8u7pgOikDANwP = true
local c = GetChar()
local h = c and c:FindFirstChildWhichIsA("Humanoid")
while _ZX8u7pgOikDANwP and hb:Wait() and c and h and h.Parent do
if h.MoveDirection.Magnitude > 0 then
c:TranslateBy(h.MoveDirection)
end
end
end)
end
pcall(function() char.Animate.Disabled = true end)
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
pcall(function() hum:SetStateEnabled(st, false) end)
end
hum:ChangeState(Enum.HumanoidStateType.Swimming)
hum.PlatformStand = true
local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
if not torso then return end
local bg = Instance.new("BodyGyro")
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.CFrame = torso.CFrame
bg.Parent = torso
local bv = Instance.new("BodyVelocity")
bv.Velocity = Vector3.new(0, 0.1, 0)
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
bv.Parent = torso
local _getO0bzkuW4FyRE = 50
local speed = 0
local _LuMl7t1Bi4m = {f = 0, b = 0, l = 0, r = 0}
flyConn = RunService.RenderStepped:Connect(function()
if not _tmjNsBAqs5 then return end
local c = GetChar()
if not c then return end
local h = c:FindFirstChildWhichIsA("Humanoid")
if not h or h.Health == 0 then return end
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed + 0.5 + (speed / _getO0bzkuW4FyRE)
if speed > _getO0bzkuW4FyRE then speed = _getO0bzkuW4FyRE end
elseif speed ~= 0 then
speed = speed - 1
if speed < 0 then speed = 0 end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.Velocity = ((Camera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b))
+ ((Camera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p)
- Camera.CoordinateFrame.p)) * speed
_LuMl7t1Bi4m = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif speed ~= 0 then
bv.Velocity = ((Camera.CoordinateFrame.lookVector * (_LuMl7t1Bi4m.f + _LuMl7t1Bi4m.b))
+ ((Camera.CoordinateFrame * CFrame.new(_LuMl7t1Bi4m.l + _LuMl7t1Bi4m.r, (_LuMl7t1Bi4m.f + _LuMl7t1Bi4m.b) * 0.2, 0).p)
- Camera.CoordinateFrame.p)) * speed
else
bv.Velocity = Vector3.new(0, 0, 0)
end
bg.CFrame = Camera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / _getO0bzkuW4FyRE), 0, 0)
local root = GetRoot()
if root then
pcall(function()
local vel = root.AssemblyLinearVelocity
if vel.Y >= -50 then
lastPos = root.Position
_x9KXjWWHx9kW = tick()
end
if lastPos then
local now = tick()
local dt = now - _x9KXjWWHx9kW
if dt > 0 and dt < 0.5 then
local deltaY = root.Position.Y - lastPos.Y
if deltaY < -30 then
root.CFrame = CFrame.new(lastPos.X, lastPos.Y, lastPos.Z)
* CFrame.Angles(0, math.rad(root.Orientation.Y), 0)
end
end
end
if vel.Y < -50 then
root.AssemblyLinearVelocity = Vector3.new(vel.X, 0, vel.Z)
end
for _, part in ipairs(c:GetDescendants()) do
if part:IsA("BasePart") then
pcall(function() part:SetNetworkOwner(LocalPlayer) end)
end
end
end)
end
end)
flyGui:SetAttribute("bg", bg)
flyGui:SetAttribute("bv", bv)
end
local function stopFly()
_tmjNsBAqs5 = false
_ZX8u7pgOikDANwP = false
flyBtn.Text = "飞行"
flyBtn.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
if flyConn then
flyConn:Disconnect()
flyConn = nil
end
local char = GetChar()
if char then
local hum = GetHum()
local _lqPM9MxO = 823
local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
if torso then
local bg = torso:FindFirstChildOfClass("BodyGyro")
local bv = torso:FindFirstChildOfClass("BodyVelocity")
if bg then bg:Destroy() end
if bv then bv:Destroy() end
end
if hum then
pcall(function()
hum.PlatformStand = false
char.Animate.Disabled = false
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
hum:SetStateEnabled(st, true)
end
hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
end)
end
end
end
flyBtn.MouseButton1Down:Connect(function()
if _tmjNsBAqs5 then
stopFly()
else
_wGBO4xgx5SKR6O2()
end
end)
upBtn.MouseButton1Down:Connect(function()
upHold = RunService.Heartbeat:Connect(function()
local root = GetRoot()
if root then
root.CFrame = root.CFrame * CFrame.new(0, 1, 0)
end
end)
end)
upBtn.MouseButton1Up:Connect(function()
if upHold then upHold:Disconnect() upHold = nil end
end)
upBtn.MouseLeave:Connect(function()
if upHold then upHold:Disconnect() upHold = nil end
end)
downBtn.MouseButton1Down:Connect(function()
_Rtgd3Epb4dXi5b = RunService.Heartbeat:Connect(function()
local root = GetRoot()
if root then
root.CFrame = root.CFrame * CFrame.new(0, -1, 0)
end
end)
end)
downBtn.MouseButton1Up:Connect(function()
if _Rtgd3Epb4dXi5b then _Rtgd3Epb4dXi5b:Disconnect() _Rtgd3Epb4dXi5b = nil end
end)
downBtn.MouseLeave:Connect(function()
if _Rtgd3Epb4dXi5b then _Rtgd3Epb4dXi5b:Disconnect() _Rtgd3Epb4dXi5b = nil end
end)
plusBtn.MouseButton1Down:Connect(function()
_bU0pyksL1KJWw2b = _bU0pyksL1KJWw2b + 1
_GF69FXMuNOQr.Text = tostring(_bU0pyksL1KJWw2b)
if _tmjNsBAqs5 then
_ZX8u7pgOikDANwP = false
task.wait(0.1)
for i = 1, _bU0pyksL1KJWw2b do
task.spawn(function()
local hb = RunService.Heartbeat
_ZX8u7pgOikDANwP = true
local c = GetChar()
local h = c and c:FindFirstChildWhichIsA("Humanoid")
while _ZX8u7pgOikDANwP and hb:Wait() and c and h and h.Parent do
if h.MoveDirection.Magnitude > 0 then
c:TranslateBy(h.MoveDirection)
end
end
end)
end
end
end)
mineBtn.MouseButton1Down:Connect(function()
if _bU0pyksL1KJWw2b > 1 then
_bU0pyksL1KJWw2b = _bU0pyksL1KJWw2b - 1
_GF69FXMuNOQr.Text = tostring(_bU0pyksL1KJWw2b)
if _tmjNsBAqs5 then
_ZX8u7pgOikDANwP = false
task.wait(0.1)
for i = 1, _bU0pyksL1KJWw2b do
task.spawn(function()
local hb = RunService.Heartbeat
_ZX8u7pgOikDANwP = true
local c = GetChar()
local h = c and c:FindFirstChildWhichIsA("Humanoid")
while _ZX8u7pgOikDANwP and hb:Wait() and c and h and h.Parent do
if h.MoveDirection.Magnitude > 0 then
c:TranslateBy(h.MoveDirection)
end
end
end)
end
end
end
end)
_k4GA6uX7WPA.MouseButton1Click:Connect(function()
stopFly()
flyGui:Destroy()
State.AntiFlyTP = false
end)
miniBtn.MouseButton1Click:Connect(function()
upBtn.Visible = false
downBtn.Visible = false
flyBtn.Visible = false
plusBtn.Visible = false
_GF69FXMuNOQr.Visible = false
mineBtn.Visible = false
miniBtn.Visible = false
_A9hk9lVVIuuM.Visible = true
frame.BackgroundTransparency = 1
_k4GA6uX7WPA.Position = UDim2.new(0, 0, -1, 57)
end)
_A9hk9lVVIuuM.MouseButton1Click:Connect(function()
upBtn.Visible = true
downBtn.Visible = true
flyBtn.Visible = true
plusBtn.Visible = true
_GF69FXMuNOQr.Visible = true
mineBtn.Visible = true
miniBtn.Visible = true
_A9hk9lVVIuuM.Visible = false
frame.BackgroundTransparency = 0
_k4GA6uX7WPA.Position = UDim2.new(0, 0, -1, 27)
end)
task.spawn(function()
while State.AntiFlyTP do
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "teleport") or string.find(ln, "tpback")
or string.find(ln, "respawn") or string.find(ln, "antifly")
or string.find(ln, "anti_fly") or string.find(ln, "anti-fly")
or string.find(ln, "noclip") or string.find(ln, "hack") then
pcall(function() obj.FireServer = function() end end)
end
end
end
end)
task.wait(2)
end
end)
local _XGTTYjoxpXvan3kT
_XGTTYjoxpXvan3kT = LocalPlayer.CharacterAdded:Connect(function(char)
task.wait(0.7)
pcall(function()
local hum = char:FindFirstChildWhichIsA("Humanoid")
if hum then
hum.PlatformStand = false
end
char.Animate.Disabled = false
end)
if _tmjNsBAqs5 then
stopFly()
task.wait(0.5)
_wGBO4xgx5SKR6O2()
end
end)
_pMitQdN6BLTAH("FlyRespawn", _XGTTYjoxpXvan3kT)
else
_re6aARWAqHyoE4c("AntiFlyTP")
_re6aARWAqHyoE4c("FlyKeyBind")
_re6aARWAqHyoE4c("FlyKeyRelease")
_re6aARWAqHyoE4c("FlyRespawn")
local gui = LocalPlayer:FindFirstChild("PlayerGui")
if gui then
local panel = gui:FindFirstChild("FlyV3Panel")
if panel then panel:Destroy() end
end
Notify("死铁轨", "飞行不拉回 已关闭!", 3)
end
end,
})
_EtF2l57lILs:Toggle({
Title = "人物透视",
Desc  = "显示其他玩家名字和距离",
Value = false,
Callback = function(state)
State.PlayerESP = state
if state then
Notify("死铁轨", "人物透视 已开启!", 3)
_pMitQdN6BLTAH("PlayerESP", RunService.RenderStepped:Connect(function()
local root = GetRoot()
if not root then return end
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
local hrp = player.Character:FindFirstChild("HumanoidRootPart")
if hrp then
local key = "Player_" .. player.Name
if not ESPObjects[key] then
local bb = _vbzGyZ3b0INw(hrp, player.Name, Color3.new(1, 0.3, 0.3), 3)
ESPObjects[key] = bb
end
local dist = (root.Position - hrp.Position).Magnitude
local label = ESPObjects[key]:FindFirstChildOfClass("TextLabel")
if label then
label.Text = player.Name .. "\n" .. math.floor(dist) .. "m"
end
end
end
end
for key, obj in pairs(ESPObjects) do
if string.find(key, "Player_") then
local _nb2ZkbjYCPbf = key:sub(8)
local player = Players:FindFirstChild(_nb2ZkbjYCPbf)
if not player or not player.Character
or not player.Character:FindFirstChild("HumanoidRootPart") then
pcall(function() obj:Destroy() end)
ESPObjects[key] = nil
end
end
end
end))
else
_re6aARWAqHyoE4c("PlayerESP")
for key, obj in pairs(ESPObjects) do
if string.find(key, "Player_") then
pcall(function() obj:Destroy() end)
ESPObjects[key] = nil
end
end
Notify("死铁轨", "人物透视 已关闭!", 3)
end
end,
})
_EtF2l57lILs:Toggle({
Title = "物品透视",
Desc  = "高亮物资/燃油/弹药等物品",
Value = false,
Callback = function(state)
State.ItemESP = state
if state then
Notify("死铁轨", "物品透视 已开启!", 3)
task.spawn(function()
while State.ItemESP do
local root = GetRoot()
if root then
local _ztb7bQ1HYtmU1np = {
{_g9icIcvKCubkwoT = {"fuel", "gasoline", "gascan", "petrol"}, color = Color3.new(1, 0.5, 0), label = "燃油"},
{_g9icIcvKCubkwoT = {"ammo", "ammunition", "bullet", "shell"}, color = Color3.new(1, 1, 0), label = "弹药"},
{_g9icIcvKCubkwoT = {"coin", "cash", "gold", "money", "treasure"}, color = Color3.new(0.2, 1, 0.2), label = "金币"},
{_g9icIcvKCubkwoT = {"wood", "plank", "log"}, color = Color3.new(0.6, 0.4, 0.2), label = "木材"},
{_g9icIcvKCubkwoT = {"iron", "metal", "scrap", "steel"}, color = Color3.new(0.5, 0.5, 1), label = "金属"},
{_g9icIcvKCubkwoT = {"coal"}, color = Color3.new(0.3, 0.3, 0.3), label = "煤炭"},
{_g9icIcvKCubkwoT = {"bandage", "medkit", "med"}, color = Color3.new(1, 0.3, 0.3), label = "医疗"},
{_g9icIcvKCubkwoT = {"supply", "supplies", "loot", "crate", "box"}, color = Color3.new(0.8, 0.8, 0.8), label = "物资"},
}
for _, category in pairs(_ztb7bQ1HYtmU1np) do
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
local _uOzO2Y5zRgSwG = string.lower(obj.Name)
local matched = false
for _, kw in pairs(category._g9icIcvKCubkwoT) do
if string.find(_uOzO2Y5zRgSwG, kw) then
matched = true
break
end
end
if matched then
local key = "Item_" .. obj.Name .. "_" .. tostring(obj)
if not ESPObjects[key] then
local dist = (obj.Position - root.Position).Magnitude
if dist < 1000 then
local bb = _vbzGyZ3b0INw(obj, category.label .. "\n" .. math.floor(dist) .. "m", category.color, 2)
ESPObjects[key] = bb
end
else
local dist = (obj.Position - root.Position).Magnitude
local label = ESPObjects[key]:FindFirstChildOfClass("TextLabel")
if label then
label.Text = category.label .. "\n" .. math.floor(dist) .. "m"
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
for key, obj in pairs(ESPObjects) do
if string.find(key, "Item_") then
pcall(function() obj:Destroy() end)
ESPObjects[key] = nil
end
end
Notify("死铁轨", "物品透视 已关闭!", 3)
end
end,
})
_EtF2l57lILs:Toggle({
Title = "全图高亮",
Desc  = "高亮所有玩家和NPC",
Value = false,
Callback = function(state)
State.FullHighlight = state
if state then
Notify("死铁轨", "全图高亮 已开启!", 3)
task.spawn(function()
while State.FullHighlight do
for _, player in pairs(Players:GetPlayers()) do
if player ~= LocalPlayer and player.Character then
local key = "HL_Player_" .. player.Name
if not ESPObjects[key] then
local hl = _wCW2vz64dJ(player.Character, Color3.new(0, 1, 0))
ESPObjects[key] = { Highlight = hl }
end
end
end
for _, obj in pairs(Workspace:GetDescendants()) do
if obj:IsA("Model") then
local hum = obj:FindFirstChildOfClass("Humanoid")
if hum and hum.Health > 0 then
local _zsJxtbQsU411hnN = false
for _, player in pairs(Players:GetPlayers()) do
if player.Character == obj then
_zsJxtbQsU411hnN = true
break
end
end
if not _zsJxtbQsU411hnN then
local key = "HL_NPC_" .. obj.Name
if not ESPObjects[key] then
local hl = _wCW2vz64dJ(obj, Color3.new(1, 0, 0))
ESPObjects[key] = { Highlight = hl }
end
end
end
end
end
task.wait(math.random(50, 100) / 100)
end
end)
else
for key, obj in pairs(ESPObjects) do
if string.find(key, "HL_") then
pcall(function()
if obj.Highlight then obj.Highlight:Destroy() end
end)
ESPObjects[key] = nil
end
end
Notify("死铁轨", "全图高亮 已关闭!", 3)
end
end,
})
local function _n5YcB2DQLYGA(_g9icIcvKCubkwoT, displayName)
local target = _yhhi7vq8J2WQ(_g9icIcvKCubkwoT)
if target then
local pos = _Mt3XSv6fvfCr(target)
_sBfro0HCqGNh(CFrame.new(pos + Vector3.new(0, 5, 0)))
Notify("死铁轨", "已传送到" .. displayName .. "!", 3)
else
Notify("死铁轨", "未找到" .. displayName .. "!", 3)
end
end
_Lel4450wSt0HbK:Button({
Title = "传送到列车",
Desc  = "传送到列车/火车位置",
Icon  = "train-front",
Callback = function()
_n5YcB2DQLYGA({"train", "locomotive", "engine", "cabin", "cart", "railcar"}, "列车")
end,
})
_Lel4450wSt0HbK:Button({
Title = "传送到加油站",
Desc  = "传送到加油站/燃料站位置",
Icon  = "fuel",
Callback = function()
_n5YcB2DQLYGA({"gasstation", "gas_station", "fuelstation", "fuel_station", "gasoline", "fuelstation", "petrol", "gasstation"}, "加油站")
end,
})
_Lel4450wSt0HbK:Button({
Title = "传送到商店",
Desc  = "传送到商店/商人位置",
Icon  = "shopping-cart",
Callback = function()
_n5YcB2DQLYGA({"shop", "store", "merchant", "trader", "generalstore", "general_store"}, "商店")
end,
})
_Lel4450wSt0HbK:Button({
Title = "传送到营地",
Desc  = "传送到营地/帐篷位置",
Icon  = "tent",
Callback = function()
_n5YcB2DQLYGA({"camp", "tent", "base", "campsite", "camp_site", "outpost"}, "营地")
end,
})
_Lel4450wSt0HbK:Button({
Title = "传送到墓地",
Desc  = "传送到墓地/坟场位置",
Icon  = "cross",
Callback = function()
_n5YcB2DQLYGA({"cemetery", "graveyard", "grave", "tomb", "crypt", "burial"}, "墓地")
end,
})
_Lel4450wSt0HbK:Button({
Title = "传送到矿场",
Desc  = "传送到矿场/矿洞位置",
Icon  = "mountain",
Callback = function()
_n5YcB2DQLYGA({"mine", "quarry", "cave", "mineshaft", "ore", "tunnel"}, "矿场")
end,
})
_Lel4450wSt0HbK:Button({
Title = "传送到出生点",
Desc  = "传送到初始出生位置",
Icon  = "home",
Callback = function()
local spawn = _yhhi7vq8J2WQ({"spawn", "spawnpoint", "spawn_point", "lobby", "start"})
if spawn then
local pos = _Mt3XSv6fvfCr(spawn)
_sBfro0HCqGNh(CFrame.new(pos + Vector3.new(0, 5, 0)))
Notify("死铁轨", "已传送到出生点!", 3)
else
_sBfro0HCqGNh(CFrame.new(0, 50, 0))
Notify("死铁轨", "已传送到出生区域!", 3)
end
end,
})
_Lel4450wSt0HbK:Space()
local _iMNjS9DpSg0s8hpi = false
local _Gi1lw8wwi8p2oUu2 = 0
_Lel4450wSt0HbK:Toggle({
Title = "长按传送",
Desc  = "长按屏幕/鼠标传送到指定位置",
Value = false,
Callback = function(state)
State.LongPressTP = state
if state then
Notify("死铁轨", "长按传送 已开启! 长按屏幕传送", 3)
_pMitQdN6BLTAH("LongPressTP_Begin", UserInputService.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then
_iMNjS9DpSg0s8hpi = true
_Gi1lw8wwi8p2oUu2 = tick()
end
end))
_pMitQdN6BLTAH("LongPressTP_End", UserInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.Touch
or input.UserInputType == Enum.UserInputType.MouseButton1 then
_iMNjS9DpSg0s8hpi = false
end
end))
task.spawn(function()
while State.LongPressTP do
if _iMNjS9DpSg0s8hpi and (tick() - _Gi1lw8wwi8p2oUu2) > 0.3 then
local root = GetRoot()
if root and Mouse.Hit then
pcall(function()
root.CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 5, 0))
end)
end
end
task.wait(0.05)
end
end)
else
_re6aARWAqHyoE4c("LongPressTP_Begin")
_re6aARWAqHyoE4c("LongPressTP_End")
_iMNjS9DpSg0s8hpi = false
Notify("死铁轨", "长按传送 已关闭!", 3)
end
end,
})
_MgamQAMYsYJz:Toggle({
Title = "防挂机",
Desc  = "防止被系统判定为挂机",
Value = false,
Callback = function(state)
State.AntiAfk = state
if state then
Notify("死铁轨", "防挂机 已开启!", 3)
_pMitQdN6BLTAH("AntiAfk_Idle", Players.Idled:Connect(function()
pcall(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
end))
task.spawn(function()
while State.AntiAfk do
pcall(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.W, false, game)
task.wait(0.1)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.W, false, game)
end)
task.wait(math.random(120, 240))
end
end)
else
_re6aARWAqHyoE4c("AntiAfk_Idle")
Notify("死铁轨", "防挂机 已关闭!", 3)
end
end,
})
_MgamQAMYsYJz:Toggle({
Title = "画质提速",
Desc  = "降低画质特效提升FPS",
Value = false,
Callback = function(state)
State.GraphicsBoost = state
if state then
Notify("死铁轨", "画质提速 已开启!", 3)
pcall(function()
Lighting.GlobalShadows = false
Lighting.FogEnd = 1e9
Lighting.Brightness = 2
Lighting.ClockTime = 12
Lighting.Ambient = Color3.new(1, 1, 1)
Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
for _, v in pairs(Lighting:GetChildren()) do
if v:IsA("PostEffect") or v:IsA("BlurEffect")
or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect")
or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
v.Enabled = false
end
end
for _, v in pairs(Workspace:GetDescendants()) do
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
Lighting.GlobalShadows = true
Lighting.Brightness = 1
Lighting.FogEnd = 100000
for _, v in pairs(Lighting:GetChildren()) do
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
_MgamQAMYsYJz:Space()
_MgamQAMYsYJz:Button({
Title = "换服",
Desc  = "传送到其他服务器",
Icon  = "refresh-cw",
Callback = function()
Notify("死铁轨", "正在搜索可用服务器...", 3)
local jobId = game.JobId
local servers = {}
local result = nil
pcall(function()
result = game:GetService("HttpService"):JSONDecode(game:HttpGet(
"https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"
))
end)
if result and result.data then
for _, server in pairs(result.data) do
if server.id ~= jobId and server.playing < server.maxPlayers then
table.insert(servers, server.id)
end
end
end
if #servers > 0 then
local target = servers[math.random(1, #servers)]
Notify("死铁轨", "正在换服中...", 3)
pcall(function()
TeleportService:TeleportToPlaceInstance(game.PlaceId, target, LocalPlayer)
end)
else
Notify("死铁轨", "未找到可用服务器!", 3)
end
end,
})
_MgamQAMYsYJz:Button({
Title = "复制服务器号",
Desc  = "复制当前服务器JobId到剪贴板",
Icon  = "copy",
Callback = function()
local jobId = game.JobId
if setclipboard then
pcall(function()
setclipboard(jobId)
end)
Notify("死铁轨", "服务器号已复制: " .. jobId, 5)
else
Notify("死铁轨", "当前服务器号: " .. jobId, 8)
end
end,
})
_MgamQAMYsYJz:Button({
Title = "角色信息",
Desc  = "显示当前角色详细信息",
Icon  = "info",
Callback = function()
local char = GetChar()
local hum = GetHum()
local root = GetRoot()
if char and hum and root then
local health = math.floor(hum.Health)
local _P8JWZ9s4uamxz = math.floor(hum.MaxHealth)
local _5On8SUHFdU = hum.WalkSpeed
local _mtNcUkNLLGjURG = hum.UseJumpPower and ("JumpPower: " .. math.floor(hum.JumpPower)) or ("JumpHeight: " .. math.floor(hum.JumpHeight))
local pos = root.Position
local info = string.format(
"角色名: %s\n血量: %d/%d\n速度: %d\n%s\n位置: %.1f, %.1f, %.1f\n工具数: %d",
char.Name,
health, _P8JWZ9s4uamxz,
_5On8SUHFdU,
_mtNcUkNLLGjURG,
pos.X, pos.Y, pos.Z,
#char:GetChildren()
)
Notify("角色信息", info, 10)
else
Notify("死铁轨", "未找到角色!", 3)
end
end,
})
_MgamQAMYsYJz:Button({
Title = "清理特效",
Desc  = "清理所有ESP和特效对象",
Icon  = "trash-2",
Callback = function()
_fFTu6VJY7UcP07yc()
pcall(function()
for _, v in pairs(Workspace:GetDescendants()) do
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
_MgamQAMYsYJz:Button({
Title = "卸载脚本",
Desc  = "关闭所有功能并卸载脚本",
Icon  = "x-circle",
Color = Color3.fromHex("#e53935"),
Callback = function()
for k, v in pairs(State) do
if type(v) == "boolean" then
State[k] = false
end
end
for name, conn in pairs(Connections) do
pcall(function() conn:Disconnect() end)
end
Connections = {}
_fFTu6VJY7UcP07yc()
pcall(function()
for _, v in pairs(Workspace:GetDescendants()) do
if v:IsA("Highlight") and v.Name == "DeadRailsHighlight" then
v:Destroy()
end
if v:IsA("BillboardGui") and string.find(v.Name, "DeadRailsESP") then
v:Destroy()
end
end
end)
local hum = GetHum()
if hum then
pcall(function()
hum.WalkSpeed = 16
if hum.UseJumpPower then
hum.JumpPower = 50
else
hum.JumpHeight = 5
end
hum.MaxHealth = 100
end)
end
local char = GetChar()
if char then
for _, v in pairs(char:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = true
end
end
end
pcall(function()
Lighting.GlobalShadows = true
Lighting.Brightness = 1
Lighting.FogEnd = 100000
for _, v in pairs(Lighting:GetChildren()) do
if v:IsA("PostEffect") or v:IsA("BlurEffect")
or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect")
or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
v.Enabled = true
end
end
end)
pcall(function()
Window:Destroy()
end)
Notify("死铁轨", "脚本已卸载! 感谢使用!", 5)
end,
})
LocalPlayer.CharacterAdded:Connect(function(char)
char:WaitForChild("Humanoid")
task.wait(0.5)
local hum = char:FindFirstChildOfClass("Humanoid")
if hum then
pcall(function()
hum.WalkSpeed = State.WalkSpeed
if hum.UseJumpPower then
hum.JumpPower = State.JumpPower
else
hum.JumpHeight = State.JumpPower / 10
end
end)
end
if State.GodMode then
_pMitQdN6BLTAH("GodMode", RunService.Heartbeat:Connect(function()
local h = GetHum()
if h then
pcall(function()
h.MaxHealth = math.huge
h.Health = math.huge
end)
end
end))
end
if State.NoClip then
_pMitQdN6BLTAH("NoClip", RunService.Stepped:Connect(function()
local c = GetChar()
if c then
for _, v in pairs(c:GetDescendants()) do
if v:IsA("BasePart") and v.CanCollide then
v.CanCollide = false
end
end
end
end))
end
if State.NoFallDamage then
_pMitQdN6BLTAH("NoFallDamage", RunService.Heartbeat:Connect(function()
local h = GetHum()
if h then
pcall(function()
h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
h:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
end)
end
end))
end
if State.InfiniteJump then
_pMitQdN6BLTAH("InfiniteJump", UserInputService.JumpRequest:Connect(function()
local h = GetHum()
if h then
pcall(function()
h:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end
end))
end
for key, obj in pairs(ESPObjects) do
if string.find(key, "Player_") then
pcall(function() obj:Destroy() end)
ESPObjects[key] = nil
end
end
end)
print("[死铁轨] 脚本加载完成!")
Notify("死铁轨", "脚本已加载!", 5)