local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local _Isjs5r8X4iol7R3Z = game:GetService("_Isjs5r8X4iol7R3Z")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local Window = WindUI:CreateWindow({
Title = "蜂群模拟器",
Icon = "bug",
Author = "蜂群模拟器脚本",
Folder = "BeeSwarm",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
HideSearchBar = false,
})
local TimeTag = Window:Tag({
Title = "00:00",
Color = Color3.fromRGB(255, 200, 50)
})
local hue = 0
task.spawn(function()
while true do
local now = os.date("*t")
hue = (hue + 0.01) % 1
TimeTag:SetTitle(string.format("%02d:%02d", now.hour, now.min))
TimeTag:SetColor(Color3.fromHSV(hue, 1, 1))
task.wait(0.06)
end
end)
Window:Tag({ Title = "蜂群", Color = Color3.fromHex("#FFD700") })
Window:EditOpenButton({
Title = "蜂群模拟器",
Icon = "bug",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FFD700")),
Draggable = true,
})
local State = {
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
local function _A2mYyYT14W6AeF()
local list = {}
for _, p in ipairs(Players:_A2mYyYT14W6AeF()) do
if p ~= LocalPlayer then table.insert(list, p.Name) end
end
return list
end
local AutoTab = Window:Tab({
Title = "自动",
Icon = "play",
})
AutoTab:Section({ Title = "采集", TextXAlignment = "Left", TextSize = 17 })
AutoTab:Toggle({
Title = "自动采花粉",
Default = false,
Callback = function(val)
State.AutoPollen = val
if val then
Notify("自动", "自动采花粉已开启", 3)
local _VFPXkuq7mD = 0
Connections.AutoPollen = RunService.Heartbeat:Connect(function()
if not State.AutoPollen then return end
local now = tick()
if now - _VFPXkuq7mD < 0.1 then return end
_VFPXkuq7mD = now
pcall(function()
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
task.wait(0.02)
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
end)
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "pollen") or string.find(ln, "collect") or string.find(ln, "gather") then
obj:FireServer()
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
if string.find(ln, "pollen") or string.find(ln, "flake") then
obj.CFrame = root.CFrame
end
end
end
end
end)
end)
else
if Connections.AutoPollen then Connections.AutoPollen:Disconnect() Connections.AutoPollen = nil end
Notify("自动", "自动采花粉已关闭", 3)
end
end,
})
AutoTab:Toggle({
Title = "自动转化蜂蜜",
Default = false,
Callback = function(val)
State.AutoConvert = val
if val then
Notify("自动", "自动转化蜂蜜已开启", 3)
Connections.AutoConvert = RunService.Heartbeat:Connect(function()
if not State.AutoConvert then return end
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "convert") or string.find(ln, "honey") or string.find(ln, "hive") then
obj:FireServer()
end
end
end
end)
pcall(function()
local root = GetRoot()
if root then
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local ln = string.lower(obj.Name)
if string.find(ln, "converter") or string.find(ln, "honey") or string.find(ln, "hive") then
local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if part then
root.CFrame = part.CFrame
end
end
end
end
end
end)
end)
else
if Connections.AutoConvert then Connections.AutoConvert:Disconnect() Connections.AutoConvert = nil end
Notify("自动", "自动转化蜂蜜已关闭", 3)
end
end,
})
AutoTab:Divider()
AutoTab:Section({ Title = "收集", TextXAlignment = "Left", TextSize = 17 })
AutoTab:Toggle({
Title = "自动收集金币",
Default = false,
Callback = function(val)
State.AutoCoins = val
if val then
Notify("自动", "自动收集金币已开启", 3)
Connections.AutoCoins = RunService.Heartbeat:Connect(function()
if not State.AutoCoins then return end
local root = GetRoot()
if not root then return end
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local ln = string.lower(obj.Name)
if string.find(ln, "coin") or string.find(ln, "cash") or string.find(ln, "money") or string.find(ln, "token") then
pcall(function() obj.CFrame = root.CFrame end)
end
end
end
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "collect") or string.find(ln, "coin") or string.find(ln, "token") then
obj:FireServer()
end
end
end
end)
end)
else
if Connections.AutoCoins then Connections.AutoCoins:Disconnect() Connections.AutoCoins = nil end
Notify("自动", "自动收集金币已关闭", 3)
end
end,
})
AutoTab:Toggle({
Title = "自动收集零食",
Default = false,
Callback = function(val)
State.AutoTreats = val
if val then
Notify("自动", "自动收集零食已开启", 3)
Connections.AutoTreats = RunService.Heartbeat:Connect(function()
if not State.AutoTreats then return end
local root = GetRoot()
if not root then return end
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local ln = string.lower(obj.Name)
if string.find(ln, "treat") or string.find(ln, "snack") or string.find(ln, "berry") or string.find(ln, "fruit") then
pcall(function() obj.CFrame = root.CFrame end)
end
end
end
end)
else
if Connections.AutoTreats then Connections.AutoTreats:Disconnect() Connections.AutoTreats = nil end
Notify("自动", "自动收集零食已关闭", 3)
end
end,
})
AutoTab:Divider()
AutoTab:Section({ Title = "战斗与任务", TextXAlignment = "Left", TextSize = 17 })
AutoTab:Toggle({
Title = "自动打怪",
Default = false,
Callback = function(val)
State.AutoMobs = val
if val then
Notify("自动", "自动打怪已开启", 3)
local _qWFE4YsQS1 = {"mob", "bug", "monster", "spider", "wolf", "scorpion", "mantis", "wasp", "ladybug"}
Connections.AutoMobs = RunService.Heartbeat:Connect(function()
if not State.AutoMobs then return end
local root = GetRoot()
if not root then return end
local _TXYr1UgRqYQ9sH = nil
local _06lSlJYnbnJoM6d = math.huge
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("Model") and obj ~= GetChar() then
local ln = string.lower(obj.Name)
local isMob = false
for _, kw in ipairs(_qWFE4YsQS1) do
if string.find(ln, kw) then isMob = true break end
end
if isMob then
local hrp = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChildWhichIsA("BasePart")
local hum = obj:FindFirstChildOfClass("Humanoid")
if hrp and (not hum or hum.Health > 0) then
local dist = (root.Position - hrp.Position).Magnitude
if dist < _06lSlJYnbnJoM6d and dist < 200 then
_06lSlJYnbnJoM6d = dist
_TXYr1UgRqYQ9sH = hrp
end
end
end
end
end
if _TXYr1UgRqYQ9sH then
root.CFrame = _TXYr1UgRqYQ9sH.CFrame * CFrame.new(0, 0, 5)
pcall(function()
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
task.wait(0.05)
VirtualInputManager:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
end)
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "attack") or string.find(ln, "damage") or string.find(ln, "hit") then
obj:FireServer()
end
end
end
end)
end
end)
else
if Connections.AutoMobs then Connections.AutoMobs:Disconnect() Connections.AutoMobs = nil end
Notify("自动", "自动打怪已关闭", 3)
end
end,
})
AutoTab:Toggle({
Title = "自动做任务",
Default = false,
Callback = function(val)
State.AutoQuest = val
if val then
Notify("自动", "自动做任务已开启", 3)
Connections.AutoQuest = RunService.Heartbeat:Connect(function()
if not State.AutoQuest then return end
pcall(function()
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") then
local ln = string.lower(obj.Name)
if string.find(ln, "quest") or string.find(ln, "mission") or string.find(ln, "task") then
obj:FireServer()
end
end
if obj:IsA("RemoteFunction") then
local ln = string.lower(obj.Name)
if string.find(ln, "quest") or string.find(ln, "mission") then
pcall(function() obj:InvokeServer() end)
end
end
end
end)
end)
else
if Connections.AutoQuest then Connections.AutoQuest:Disconnect() Connections.AutoQuest = nil end
Notify("自动", "自动做任务已关闭", 3)
end
end,
})
AutoTab:Button({
Title = "扫描游戏 Remote",
Callback = function()
local results = {}
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
table.insert(results, obj:GetFullName())
end
end
local msg = #results > 0 and table.concat(results, "\n") or "未找到 Remote"
Notify("扫描结果", msg, 10)
end,
})
local _UstxduBZSa = Window:Tab({
Title = "玩家",
Icon = "user",
})
_UstxduBZSa:Section({ Title = "移动", TextXAlignment = "Left", TextSize = 17 })
_UstxduBZSa:Slider({
Title = "行走速度",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(val)
State.WalkSpeed = val
local h = GetHum()
if h then h.WalkSpeed = val end
end,
})
_UstxduBZSa:Slider({
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
_UstxduBZSa:Divider()
_UstxduBZSa:Toggle({
Title = "无限跳跃",
Default = false,
Callback = function(val)
State.InfJump = val
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
_UstxduBZSa:Toggle({
Title = "穿墙",
Default = false,
Callback = function(val)
State.Noclip = val
if val then
Connections.NoClip = RunService.Stepped:Connect(function()
if not State.Noclip then return end
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
_UstxduBZSa:Toggle({
Title = "无敌",
Default = false,
Callback = function(val)
State.GodMode = val
if val then
Notify("玩家", "无敌已开启", 3)
Connections.GodMode = RunService.Heartbeat:Connect(function()
local h = GetHum()
if h and h.Health < h.MaxHealth then h.Health = h.MaxHealth end
end)
else
if Connections.GodMode then Connections.GodMode:Disconnect() Connections.GodMode = nil end
Notify("玩家", "无敌已关闭", 3)
end
end,
})
_UstxduBZSa:Toggle({
Title = "摔落无伤害",
Default = false,
Callback = function(val)
State.NoFallDamage = val
if val then
Notify("玩家", "摔落无伤害已开启", 3)
local function _eKgTqJr66ndbI0a(h)
if not h then return end
local saved = h.Health
h.StateChanged:Connect(function(old, new)
if not State.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
saved = h.Health
elseif old == Enum.HumanoidStateType.Freefall then
if h.Health < saved then h.Health = saved end
end
end)
end
local c = GetChar()
if c then _eKgTqJr66ndbI0a(c:FindFirstChildOfClass("Humanoid")) end
Connections.NoFall = LocalPlayer.CharacterAdded:Connect(function(char)
task.wait(0.3)
if State.NoFallDamage then _eKgTqJr66ndbI0a(char:FindFirstChildOfClass("Humanoid")) end
end)
else
if Connections.NoFall then Connections.NoFall:Disconnect() Connections.NoFall = nil end
Notify("玩家", "摔落无伤害已关闭", 3)
end
end,
})
_UstxduBZSa:Divider()
local _kBaq42wGMV = false
_UstxduBZSa:Button({
Title = "飞行 (手机版)",
Callback = function()
if _kBaq42wGMV then
Notify("飞行", "飞行面板已打开", 3)
return
end
_kBaq42wGMV = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/飞行脚本V3(全游戏通用).txt"))()
end,
})
local _yrhqEoQGYU8 = Window:Tab({
Title = "视觉",
Icon = "eye",
})
_yrhqEoQGYU8:Section({ Title = "透视", TextXAlignment = "Left", TextSize = 17 })
local function _eee0z95DyfDD69bY(player)
if player == LocalPlayer then return end
if ESPObjects[player] then return end
local _JWnEMD4krR = Instance.new("BillboardGui")
_JWnEMD4krR.Name = "BeeESP_" .. player.Name
_JWnEMD4krR.Size = UDim2.new(0, 200, 0, 50)
_JWnEMD4krR.StudsOffset = Vector3.new(0, 3, 0)
_JWnEMD4krR.AlwaysOnTop = true
local _0YzV00OUGL49T7tz = Instance.new("TextLabel")
_0YzV00OUGL49T7tz.Size = UDim2.new(1, 0, 0, 20)
_0YzV00OUGL49T7tz.BackgroundTransparency = 1
_0YzV00OUGL49T7tz.TextColor3 = Color3.fromRGB(255, 215, 0)
_0YzV00OUGL49T7tz.TextSize = 14
_0YzV00OUGL49T7tz.Font = Enum.Font.SourceSansBold
_0YzV00OUGL49T7tz.TextStrokeTransparency = 0.5
_0YzV00OUGL49T7tz.Text = player.Name
_0YzV00OUGL49T7tz.Parent = _JWnEMD4krR
local _KAm904JhAR99 = Instance.new("TextLabel")
_KAm904JhAR99.Size = UDim2.new(1, 0, 0, 18)
_KAm904JhAR99.Position = UDim2.new(0, 0, 0, 22)
_KAm904JhAR99.BackgroundTransparency = 1
_KAm904JhAR99.TextColor3 = Color3.fromRGB(200, 200, 200)
_KAm904JhAR99.TextSize = 12
_KAm904JhAR99.Text = ""
_KAm904JhAR99.Parent = _JWnEMD4krR
ESPObjects[player] = { _JWnEMD4krR = _JWnEMD4krR, _0YzV00OUGL49T7tz = _0YzV00OUGL49T7tz, _KAm904JhAR99 = _KAm904JhAR99 }
end
local function _Qs84NBrBgKm72(player)
if ESPObjects[player] then
if ESPObjects[player]._JWnEMD4krR then ESPObjects[player]._JWnEMD4krR:Destroy() end
ESPObjects[player] = nil
end
end
_yrhqEoQGYU8:Toggle({
Title = "人物透视",
Default = false,
Callback = function(val)
State.ESPEnabled = val
if val then
Notify("视觉", "透视已开启", 3)
for _, plr in ipairs(Players:_A2mYyYT14W6AeF()) do
if plr ~= LocalPlayer then _eee0z95DyfDD69bY(plr) end
end
Connections.ESP = RunService.Heartbeat:Connect(function()
for plr, data in pairs(ESPObjects) do
local char = plr.Character
if char then
local head = char:FindFirstChild("Head")
local hrp = char:FindFirstChild("HumanoidRootPart")
if head or hrp then
data._JWnEMD4krR.Adornee = head or hrp
data._0YzV00OUGL49T7tz.Visible = State.ESPNames
data._KAm904JhAR99.Visible = State.ESPDistance
if State.ESPDistance then
local root = GetRoot()
local _biruIPHiTX = hrp or head
local _MJv7RBo3 = 6986
if root and _biruIPHiTX then
data._KAm904JhAR99.Text = math.floor((root.Position - _biruIPHiTX.Position).Magnitude) .. " 米"
end
end
end
end
end
end)
Connections.PAdd = Players.PlayerAdded:Connect(function(p) _eee0z95DyfDD69bY(p) end)
Connections.PRem = Players.PlayerRemoving:Connect(function(p) _Qs84NBrBgKm72(p) end)
else
if Connections.ESP then Connections.ESP:Disconnect() Connections.ESP = nil end
if Connections.PAdd then Connections.PAdd:Disconnect() Connections.PAdd = nil end
if Connections.PRem then Connections.PRem:Disconnect() Connections.PRem = nil end
for p, _ in pairs(ESPObjects) do _Qs84NBrBgKm72(p) end
ESPObjects = {}
Notify("视觉", "透视已关闭", 3)
end
end,
})
_yrhqEoQGYU8:Toggle({
Title = "显示名字",
Default = true,
Callback = function(val) State.ESPNames = val end,
})
_yrhqEoQGYU8:Toggle({
Title = "显示距离",
Default = true,
Callback = function(val) State.ESPDistance = val end,
})
_yrhqEoQGYU8:Toggle({
Title = "物品透视 (金币/零食)",
Default = false,
Callback = function(val)
State.ESPItems = val
if val then
Notify("视觉", "物品透视已开启", 3)
Connections.Items = RunService.Heartbeat:Connect(function()
if not State.ESPItems then return end
local root = GetRoot()
local _AEmdm1CY = 753
if not root then return end
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") then
local ln = string.lower(obj.Name)
if string.find(ln, "coin") or string.find(ln, "treat") or string.find(ln, "token") or string.find(ln, "berry") then
if not obj:FindFirstChild("BeeItemESP") then
local hl = Instance.new("Highlight")
hl.Name = "BeeItemESP"
hl.FillColor = Color3.fromRGB(255, 215, 0)
hl.FillTransparency = 0.3
hl.OutlineColor = Color3.fromRGB(255, 255, 255)
hl.Parent = obj
end
end
end
end
end)
else
if Connections.Items then Connections.Items:Disconnect() Connections.Items = nil end
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:FindFirstChild("BeeItemESP") then obj.BeeItemESP:Destroy() end
end
Notify("视觉", "物品透视已关闭", 3)
end
end,
})
_yrhqEoQGYU8:Toggle({
Title = "全图高亮",
Default = false,
Callback = function(val)
State.Fullbright = val
if val then
Lighting.Brightness = 3
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Lighting.GlobalShadows = false
Connections.FB = RunService.Heartbeat:Connect(function()
Lighting.Brightness = 3
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Lighting.GlobalShadows = false
end)
else
if Connections.FB then Connections.FB:Disconnect() Connections.FB = nil end
Lighting.Brightness = 1
Lighting.ClockTime = 12
Lighting.GlobalShadows = true
Notify("视觉", "全图高亮已关闭", 3)
end
end,
})
local _AWkY7uiG6nKL = Window:Tab({
Title = "传送",
Icon = "map-pin",
})
_AWkY7uiG6nKL:Section({ Title = "花田", TextXAlignment = "Left", TextSize = 17 })
local fields = {
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
for _, field in ipairs(fields) do
_AWkY7uiG6nKL:Button({
Title = "传送到" .. field.name,
Callback = function()
local found = false
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local ln = string.lower(obj.Name)
for _, kw in ipairs(field.keywords) do
if string.find(ln, kw) then
local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if part then
local root = GetRoot()
if root then
root.CFrame = part.CFrame * CFrame.new(0, 5, 0)
Notify("传送", "已传送到" .. field.name, 3)
found = true
end
break
end
end
end
if found then break end
end
end
if not found then Notify("传送", "未找到" .. field.name, 3) end
end,
})
end
_AWkY7uiG6nKL:Divider()
_AWkY7uiG6nKL:Section({ Title = "地点", TextXAlignment = "Left", TextSize = 17 })
local _h36gq8seL6lStCOa = {
{ name = "蜂巢", keywords = {"hive"} },
{ name = "商店", keywords = {"shop", "store"} },
{ name = "商店区", keywords = {"shopzone", "zone"} },
{ name = "母蜂", keywords = {"queen", "mother"} },
{ name = "熊", keywords = {"bear", "panda", "onett"} },
{ name = "传送门", keywords = {"portal", "teleport"} },
{ name = "兑换", keywords = {"converter", "convert"} },
{ name = "花田入口", keywords = {"field", "entrance"} },
}
for _, loc in ipairs(_h36gq8seL6lStCOa) do
_AWkY7uiG6nKL:Button({
Title = "传送到" .. loc.name,
Callback = function()
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("BasePart") or obj:IsA("Model") then
local ln = string.lower(obj.Name)
for _, kw in ipairs(loc.keywords) do
if string.find(ln, kw) then
local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
if part then
local root = GetRoot()
if root then
root.CFrame = part.CFrame * CFrame.new(0, 5, 0)
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
_AWkY7uiG6nKL:Divider()
local _C7YwaANzpT = nil
_AWkY7uiG6nKL:Toggle({
Title = "长按传送",
Default = false,
Callback = function(val)
if val then
Notify("传送", "长按传送已开启 (长按屏幕0.5秒)", 3)
Connections.TpBegin = UserInputService.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_C7YwaANzpT = tick()
end
end)
Connections.TpHold = RunService.Heartbeat:Connect(function()
if not _C7YwaANzpT then return end
if tick() - _C7YwaANzpT >= 0.5 then
local root = GetRoot()
if root then root.CFrame = Mouse.Hit end
_C7YwaANzpT = nil
end
end)
Connections.TpEnd = UserInputService.InputEnded:Connect(function() _C7YwaANzpT = nil end)
else
if Connections.TpBegin then Connections.TpBegin:Disconnect() Connections.TpBegin = nil end
if Connections.TpHold then Connections.TpHold:Disconnect() Connections.TpHold = nil end
if Connections.TpEnd then Connections.TpEnd:Disconnect() Connections.TpEnd = nil end
Notify("传送", "长按传送已关闭", 3)
end
end,
})
local MiscTab = Window:Tab({
Title = "实用",
Icon = "settings",
})
MiscTab:Section({ Title = "工具", TextXAlignment = "Left", TextSize = 17 })
MiscTab:Toggle({
Title = "防挂机",
Default = false,
Callback = function(val)
State.AntiAFK = val
if val then
Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
Notify("实用", "防挂机已开启", 3)
else
if Connections.AntiAFK then Connections.AntiAFK:Disconnect() Connections.AntiAFK = nil end
Notify("实用", "防挂机已关闭", 3)
end
end,
})
MiscTab:Toggle({
Title = "画质提速",
Default = false,
Callback = function(val)
State.FPSBoost = val
if val then
settings().Rendering.QualityLevel = 1
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Connections.FPS = RunService.Heartbeat:Connect(function()
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false end)
end
end
end)
Notify("实用", "画质提速已开启", 3)
else
if Connections.FPS then Connections.FPS:Disconnect() Connections.FPS = nil end
settings().Rendering.QualityLevel = Enum.RenderingQuality.Automatic
Lighting.FogEnd = 100000
Notify("实用", "画质提速已关闭", 3)
end
end,
})
MiscTab:Divider()
MiscTab:Button({
Title = "换服",
Callback = function()
Notify("实用", "正在跳转服务器...", 3)
TeleportService:Teleport(game.PlaceId, LocalPlayer)
end,
})
MiscTab:Button({
Title = "复制服务器号",
Callback = function()
local jobId = game.JobId
if setclipboard then
setclipboard(jobId)
Notify("实用", "已复制: " .. jobId, 3)
else
Notify("实用", "JobId: " .. jobId, 5)
end
end,
})
MiscTab:Button({
Title = "输出角色信息",
Callback = function()
local char = GetChar()
if not char then Notify("实用", "无角色", 3) return end
local info = {}
local h = GetHum()
if h then
table.insert(info, "血量: " .. math.floor(h.Health) .. "/" .. math.floor(h.MaxHealth))
table.insert(info, "速度: " .. h.WalkSpeed)
end
local root = GetRoot()
if root then table.insert(info, "位置: " .. tostring(root.Position)) end
local tool = char:FindFirstChildOfClass("Tool")
if tool then table.insert(info, "手持: " .. tool.Name) end
Notify("角色信息", table.concat(info, "\n"), 10)
end,
})
MiscTab:Divider()
MiscTab:Button({
Title = "清理特效",
Callback = function()
local count = 0
for _, obj in ipairs(Workspace:GetDescendants()) do
if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
pcall(function() obj.Enabled = false; count = count + 1 end)
end
end
Notify("实用", "已清理 " .. count .. " 个特效", 3)
end,
})
MiscTab:Button({
Title = "卸载脚本",
Callback = function()
for _, conn in pairs(Connections) do
if conn then pcall(function() conn:Disconnect() end) end
end
Connections = {}
for p, _ in pairs(ESPObjects) do _Qs84NBrBgKm72(p) end
ESPObjects = {}
Notify("实用", "脚本已卸载", 3)
end,
})
Notify("蜂群模拟器", "脚本已加载!", 5)
LocalPlayer.CharacterAdded:Connect(function(char)
task.wait(0.5)
local h = char:FindFirstChildOfClass("Humanoid")
if h then
if State.WalkSpeed ~= 16 then h.WalkSpeed = State.WalkSpeed end
if State.JumpPower ~= 50 then
if h.UseJumpPower then h.JumpPower = State.JumpPower
else h.JumpHeight = State.JumpPower / 10 end
end
end
end)