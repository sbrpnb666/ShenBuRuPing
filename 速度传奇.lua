local _Yvm9qhzD = 0
local _tBbQBU1K = ""
local _bGDYyIeh = nil
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
local _000e  {
AutoTrain = false,
AutoRebirth = false,
AutoBuyShoe = false,
AutoBuyPet = false,
AutoHatch = false,
AutoCollectCoin = false,
AutoQuest = false,
WalkSpeed = 16,
JumpPower = 50,
InfiniteJump = false,
Noclip = false,
GodMode = false,
NoFallDamage = false,
Fly = false,
PlayerESP = false,
ItemESP = false,
FullHighlight = false,
HoldTeleport = false,
AntiAFK = false,
GraphicsBoost = false,
}
local _000f  {}
local _0010  {}
local _0011 local _0012 local function GetChar()
return _000b.Character or _000b.CharacterAdded:Wait()
end
local function GetRoot()
local _0013  GetChar()
if _0013 then
return _0013:FindFirstChild("HumanoidRootPart") or _0013:FindFirstChildWhichIsA("BasePart")
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
Duration = duration or 3,
})
end
local function FindRemoteAny(keywords)
local _0014  {}
for _, k in ipairs(keywords) do table.insert(_0014, string.lower(k)) end
local function search(_0034)
for _, v in ipairs(_0034:GetDescendants()) do
if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
local _0015  string.lower(v.Name)
for _, kw in ipairs(_0014) do
if string.find(_0015, kw) then
return v
end
end
end
end
return nil
end
return search(_0008) or search(_0005)
end
local function FindRemoteAll(keys)
local _0014  {}
for _, k in ipairs(keys) do table.insert(_0014, string.lower(k)) end
local function search(_0034)
for _, v in ipairs(_0034:GetDescendants()) do
if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
local _0015  string.lower(v.Name)
local _0016  true
for _, kw in ipairs(_0014) do
if not string.find(_0015, kw) then _0016 = false break end
end
if _0016 then return v end
end
end
return nil
end
return search(_0008) or search(_0005)
end
local function FireRemote(_0018, ...)
if not _0018 then return end
pcall(function(...)
if _0018:IsA("RemoteEvent") then
_0018:FireServer(...)
elseif _0018:IsA("RemoteFunction") then
pcall(_0018.InvokeServer, _0018, ...)
end
end, ...)
end
local function FindParts(keywords)
local _0017  {}
local _0014  {}
for _, k in ipairs(keywords) do table.insert(_0014, string.lower(k)) end
for _, v in ipairs(_0005:GetDescendants()) do
if v:IsA("BasePart") then
local _0015  string.lower(v.Name)
for _, kw in ipairs(_0014) do
if string.find(_0015, kw) then
table.insert(_0017, v)
break
end
end
end
end
return _0017
end
local function FindFirstPart(keywords)
local _0014  {}
for _, k in ipairs(keywords) do table.insert(_0014, string.lower(k)) end
for _, v in ipairs(_0005:GetDescendants()) do
if v:IsA("BasePart") then
local _0015  string.lower(v.Name)
for _, kw in ipairs(_0014) do
if string.find(_0015, kw) then return v end
end
end
end
return nil
end
local function FindFirstModel(keywords)
local _0014  {}
for _, k in ipairs(keywords) do table.insert(_0014, string.lower(k)) end
for _, v in ipairs(_0005:GetDescendants()) do
if v:IsA("Model") then
local _0015  string.lower(v.Name)
for _, kw in ipairs(_0014) do
if string.find(_0015, kw) then return v end
end
end
end
return nil
end
local function AutoTrain()
local _0018  FindRemoteAny({"train", "run", "speed", "velocity", "treadmill"})
FireRemote(_0018)
end
local function AutoRebirth()
local _0018  FindRemoteAny({"rebirth", "prestige", "reset"})
FireRemote(_0018)
end
local function AutoBuyShoe()
local _0018  FindRemoteAll({"buy", "shoe"}) or FindRemoteAll({"buy", "speed"}) or FindRemoteAny({"shoe", "shoes"})
FireRemote(_0018)
end
local function AutoBuyPet()
local _0018  FindRemoteAll({"buy", "pet"}) or FindRemoteAll({"buy", "egg"}) or FindRemoteAny({"pet", "egg"})
FireRemote(_0018)
end
local function AutoHatch()
local _0018  FindRemoteAny({"hatch", "egg"})
FireRemote(_0018)
end
local function AutoCollectCoin()
local _0019  GetRoot()
if not _0019 then return end
local _001a  FindParts({"coin", "cash", "money", "gold"})
for _, _0027 in ipairs(_001a) do
pcall(function()
if firetouchinterest then
firetouchinterest(_0027, _0019, 0)
firetouchinterest(_0027, _0019, 1)
else
_0027.CFrame = _0019.CFrame
end
end)
end
end
local function AutoQuest()
local _0018  FindRemoteAny({"quest", "mission", "claim"})
FireRemote(_0018)
end
local function StartAutoLoop(_0022, func)
_000f[_0022] = task.spawn(function()
while _000e[_0022] do
pcall(func)
task.wait(math.random(30, 80) / 100)
end
end)
end
local function StopAutoLoop(_0022)
_000e[_0022] = false
end
local function SetWalkSpeed(value)
_000e.WalkSpeed = value
local _001b  GetHum()
if _001b then _001b.WalkSpeed = value end
if not _000f.WalkSpeedMaintain then
_000f.WalkSpeedMaintain = _0003.Heartbeat:Connect(function()
local _001c  GetHum()
if _001c and _001c.WalkSpeed ~= _000e.WalkSpeed then
pcall(function() _001c.WalkSpeed = _000e.WalkSpeed end)
end
end)
end
end
local function SetJumpPower(value)
_000e.JumpPower = value
local _001b  GetHum()
if _001b then
pcall(function()
_001b.UseJumpPower = true
_001b.JumpPower = value
end)
end
if not _000f.JumpPowerMaintain then
_000f.JumpPowerMaintain = _0003.Heartbeat:Connect(function()
local _001c  GetHum()
if _001c then
pcall(function()
_001c.UseJumpPower = true
if _001c.JumpPower ~= _000e.JumpPower then _001c.JumpPower = _000e.JumpPower end
end)
end
end)
end
end
local function ToggleInfiniteJump(enabled)
if enabled then
_000f.InfiniteJump = _0004.JumpRequest:Connect(function()
local _001b  GetHum()
if _001b then
pcall(function() _001b:ChangeState(Enum.HumanoidStateType.Jumping) end)
end
end)
else
if _000f.InfiniteJump then _000f.InfiniteJump:Disconnect() _000f.InfiniteJump = nil end
end
end
local function ToggleNoclip(enabled)
if enabled then
_000f.Noclip = _0003.Stepped:Connect(function()
local _0013  GetChar()
if _0013 then
for _, _0027 in ipairs(_0013:GetDescendants()) do
if _0027:IsA("BasePart") and _0027.CanCollide then
_0027.CanCollide = false
end
end
end
end)
else
if _000f.Noclip then _000f.Noclip:Disconnect() _000f.Noclip = nil end
local _0013  GetChar()
if _0013 then
for _, _0027 in ipairs(_0013:GetDescendants()) do
if _0027:IsA("BasePart") then
pcall(function() _0027.CanCollide = true end)
end
end
end
end
end
local function ToggleGodMode(enabled)
if enabled then
_000f.GodMode = _0003.Heartbeat:Connect(function()
local _001b  GetHum()
if _001b then
pcall(function()
if _001b.MaxHealth < 1e9 then _001b.MaxHealth = 1e9 end
_001b.Health = _001b.MaxHealth
end)
end
end)
else
if _000f.GodMode then _000f.GodMode:Disconnect() _000f.GodMode = nil end
local _001b  GetHum()
if _001b then
pcall(function()
_001b.MaxHealth = 100
_001b.Health = 100
end)
end
end
end
local function ToggleNoFallDamage(enabled)
if enabled then
_000f.NoFallDamage = _0003.Heartbeat:Connect(function()
local _001b  GetHum()
if _001b then
pcall(function()
_001b:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
_001b:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
end)
end
end)
else
if _000f.NoFallDamage then _000f.NoFallDamage:Disconnect() _000f.NoFallDamage = nil end
end
end
local _001d  false
local _001e  "https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"
local function ToggleFly(enabled)
_000e.Fly = enabled
if enabled then
if not _001d then
_001d = true
pcall(function()
loadstring(game:HttpGet(_001e))()
end)
end
end
end
local function CreateESPBillboard(_0034, color, sizeY)
local _001f  Instance.new("BillboardGui")
_001f.Name = "SpeedLegendESP"
_001f.AlwaysOnTop = true
_001f.Size = UDim2.new(0, 200, 0, sizeY or 30)
_001f.StudsOffset = Vector3.new(0, 2.5, 0)
_001f.MaxDistance = 2000
_001f.ResetOnSpawn = false
_001f.LightInfluence = 0
local _0020  Instance.new("TextLabel")
_0020.Name = "Text"
_0020.BackgroundTransparency = 1
_0020.Size = UDim2.new(1, 0, 1, 0)
_0020.TextColor3 = color or Color3.fromHex("#00BFFF")
_0020.TextStrokeTransparency = 0
_0020.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
_0020.TextScaled = true
_0020.Font = Enum.Font.GothamBold
_0020.Text = ""
_0020.Parent = _001f
_001f.Parent = _0034
return _001f, _0020
end
local function TogglePlayerESP(enabled)
if enabled then
_000f.PlayerESP = task.spawn(function()
while _000e.PlayerESP do
for _, plr in ipairs(_0002:GetPlayers()) do
if plr ~= _000b and plr.Character then
local _0021  plr.Character:FindFirstChild("Head")
if _0021 then
local _0022  "p_" .. plr.UserId
local _001f  _0010[_0022]
if not _001f or not _001f.Parent or not _001f.Parent:IsDescendantOf(game) then
_001f = CreateESPBillboard(_0021, Color3.fromHex("#00BFFF"))
_0010[_0022] = _001f
end
local _0019  GetRoot()
local _0023  plr.Character:FindFirstChild("HumanoidRootPart")
local _0024  ""
if _0019 and _0023 then
_0024 = string.format("  [%.0fm]", (_0019.Position - _0023.Position).Magnitude)
end
_001f.Text.Text = plr.DisplayName .. _0024
end
end
end
task.wait(0.1)
end
end)
else
if _000f.PlayerESP then _000f.PlayerESP = nil end
for _0022 in pairs(_0010) do
if string.sub(_0022, 1, 2) == "p_" then
pcall(function() _0010[_0022]:Destroy() end)
_0010[_0022] = nil
end
end
end
end
local function ToggleItemESP(enabled)
if enabled then
_000f.ItemESP = task.spawn(function()
while _000e.ItemESP do
local _001a  FindParts({"coin", "cash", "money", "gem", "diamond", "chest", "orb", "crystal"})
for idx, _0027 in ipairs(_001a) do
if idx > 250 then break end
local _0022  "i_" .. _0027:GetDebugId()
local _0025  _0010[_0022]
if not _0025 or not _0025.Parent then
_0025 = Instance.new("Highlight")
_0025.Name = "SpeedLegendItemESP"
_0025.FillColor = Color3.fromHex("#FFD700")
_0025.OutlineColor = Color3.fromRGB(255, 255, 255)
_0025.FillTransparency = 0.5
_0025.OutlineTransparency = 0
_0025.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
_0025.Adornee = _0027
_0025.Parent = _0027
_0010[_0022] = _0025
end
end
task.wait(0.5)
end
end)
else
if _000f.ItemESP then _000f.ItemESP = nil end
for _0022 in pairs(_0010) do
if string.sub(_0022, 1, 2) == "i_" then
pcall(function() _0010[_0022]:Destroy() end)
_0010[_0022] = nil
end
end
end
end
local function ToggleFullHighlight(enabled)
if enabled then
_000f.FullHighlight = task.spawn(function()
while _000e.FullHighlight do
for _, v in ipairs(_0005:GetDescendants()) do
if v:IsA("Model") and #v:GetChildren() > 0 then
local _0022  "f_" .. v:GetDebugId()
if not _0010[_0022] then
local _0025  Instance.new("Highlight")
_0025.Name = "SpeedLegendFullHL"
_0025.FillColor = Color3.fromHex("#00BFFF")
_0025.FillTransparency = 0.75
_0025.OutlineColor = Color3.fromRGB(255, 255, 255)
_0025.OutlineTransparency = 0.4
_0025.Adornee = v
_0025.Parent = v
_0010[_0022] = _0025
end
end
task.wait()
end
task.wait(2)
end
end)
else
if _000f.FullHighlight then _000f.FullHighlight = nil end
for _0022 in pairs(_0010) do
if string.sub(_0022, 1, 2) == "f_" then
pcall(function() _0010[_0022]:Destroy() end)
_0010[_0022] = nil
end
end
end
end
local function TeleportTo(obj)
local _0019  GetRoot()
if not _0019 or not obj then return false end
pcall(function()
local _0026 if obj:IsA("BasePart") then
_0026 = obj.CFrame + Vector3.new(0, 3, 0)
elseif obj:IsA("Model") then
_0026 = obj:GetPivot() + Vector3.new(0, 3, 0)
end
if _0026 then _0019.CFrame = _0026 end
end)
return true
end
local function TeleportByName(keywords, _0020)
local _0027  FindFirstPart(keywords) or FindFirstModel(keywords)
if _0027 then
TeleportTo(_0027)
Notify("速度传奇", "已传送到: " .. _0020, 3)
else
Notify("速度传奇", "未找到: " .. _0020, 3)
end
end
local _0028  false
local function ToggleHoldTeleport(enabled)
if enabled then
_000f.HoldTPBegin = _0004.InputBegan:Connect(function(input, gp)
if gp then return end
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
_0028 = true
end
end)
_000f.HoldTPEnd = _0004.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
_0028 = false
end
end)
_000f.HoldTP = _0003.RenderStepped:Connect(function()
if _0028 then
local _0019  GetRoot()
if _0019 then
local _0029  _000d.Hit.Position
_0019.CFrame = _0019.CFrame:Lerp(CFrame.new(_0029), 0.25)
end
end
end)
else
_0028 = false
for _, k in ipairs({"HoldTPBegin", "HoldTPEnd", "HoldTP"}) do
if _000f[k] then _000f[k]:Disconnect() _000f[k] = nil end
end
end
end
local function ToggleAntiAFK(enabled)
if enabled then
_000f.AntiAFK = _000b.Idled:Connect(function()
pcall(function()
_000a:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
_000a:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
end)
else
if _000f.AntiAFK then _000f.AntiAFK:Disconnect() _000f.AntiAFK = nil end
end
end
local function ToggleGraphicsBoost(enabled)
if enabled then
_0006.GlobalShadows = true
_0006.FogEnd = 1e9
_0006.Brightness = 2
_0006.ClockTime = 14
_0006.ExposureCompensation = 0.3
_0006.Ambient = Color3.fromRGB(150, 150, 150)
_0006.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
pcall(function() _0006.Technology = Enum.Technology.Future end)
else
_0006.GlobalShadows = false
_0006.FogEnd = 100000
_0006.Brightness = 1
_0006.ExposureCompensation = 0
_0006.Ambient = Color3.fromRGB(0, 0, 0)
_0006.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
end
end
local function ServerHop()
Notify("速度传奇", "正在换服...", 3)
pcall(function()
local _002a  game:GetService("_002a")
local _002b  game.PlaceId
local _002c  (request or http_request or (syn and syn.request))
local function fetchServers(cursor)
local _002d  string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", _002b)
if cursor and cursor ~= "" then
_002d = _002d .. "&cursor=" .. cursor
end
local _002e  _002c({ Url = _002d, Method = "GET" })
return _002a:JSONDecode(_002e.Body)
end
local _002f  fetchServers("")
local _0030 if _002f and _002f._002f then
for _, server in ipairs(_002f._002f) do
if server.playing and server.maxPlayers and server.playing < server.maxPlayers and server.id ~= game.JobId then
_0030 = server
break
end
end
end
if _0030 then
_0009:TeleportToPlaceInstance(_002b, _0030.id, _000b)
else
Notify("速度传奇", "未找到可用服务器", 4)
end
end)
end
local function CopyServerID()
local _0031  game.JobId
if _0031 == "" then _0031 = "未知" end
pcall(function()
if setclipboard then setclipboard(_0031) end
end)
Notify("速度传奇", "服务器号已复制: " .. _0031, 6)
end
local function CharacterInfo()
local _001b  GetHum()
local _0019  GetRoot()
local _0032  "未找到角色"
if _001b and _0019 then
_0032 = string.format(
"血量: %.0f / %.0f\n速度: %.0f\n跳跃力: %.0f\n位置: %.1f, %.1f, %.1f",
_001b.Health, _001b.MaxHealth, _001b.WalkSpeed, _001b.JumpPower,
_0019.Position.X, _0019.Position.Y, _0019.Position.Z
)
end
Notify("角色信息", _0032, 8)
end
local function ClearEffects()
local _0033  0
for _, v in ipairs(_0005:GetDescendants()) do
if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("Explosion") then
pcall(function() v.Enabled = false v:Destroy() end)
_0033 = _0033 + 1
end
end
Notify("速度传奇", "已清理 " .. _0033 .. " 个特效", 4)
end
local function UnloadScript()
for k, v in pairs(_000e) do
if type(v) == "boolean" then _000e[k] = false end
end
for k, conn in pairs(_000f) do
pcall(function()
if typeof(conn) == "RBXScriptConnection" then
conn:Disconnect()
end
end)
_000f[k] = nil
end
for k, obj in pairs(_0010) do
pcall(function() obj:Destroy() end)
_0010[k] = nil
end
pcall(function()
local _001b  GetHum()
if _001b then
_001b.WalkSpeed = 16
pcall(function() _001b.JumpPower = 50 end)
end
local _0013  GetChar()
if _0013 then
for _, _0027 in ipairs(_0013:GetDescendants()) do
if _0027:IsA("BasePart") then pcall(function() _0027.CanCollide = true end) end
end
end
end)
ToggleGraphicsBoost(false)
pcall(function() _0011:Destroy() end)
pcall(function() _0012:Destroy() end)
Notify("速度传奇", "脚本已卸载", 4)
end
_0011 = _0001:CreateWindow({
Title = "速度传奇",
Icon = "zap",
Author = "速度传奇脚本",
Folder = "SpeedLegend",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
})
_0012 = Instance.new("ScreenGui")
_0012.Name = "SpeedLegendTimeLabel"
_0012.ResetOnSpawn = false
_0012.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_0012.IgnoreGuiInset = true
pcall(function()
local _0034  (gethui and gethui()) or game:GetService("CoreGui")
_0012.Parent = _0034
end)
if not _0012.Parent then
_0012.Parent = _000b:WaitForChild("PlayerGui")
end
local _0035  Instance.new("TextLabel")
_0035.Name = "Time"
_0035.Size = UDim2.new(0, 180, 0, 32)
_0035.Position = UDim2.new(1, -190, 0, 12)
_0035.AnchorPoint = Vector2.new(0, 0)
_0035.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
_0035.BackgroundTransparency = 0.35
_0035.BorderSizePixel = 0
_0035.TextColor3 = Color3.fromHSV(0, 1, 1)
_0035.TextScaled = true
_0035.Font = Enum.Font.GothamBold
_0035.Text = os.date("%H:%M:%S")
local _0036  Instance.new("UICorner")
_0036.CornerRadius = UDim.new(0, 10)
_0036.Parent = _0035
_0035.Parent = _0012
task.spawn(function()
local _0037  0
while _0012 and _0012.Parent do
_0037 = (_0037 + 0.02) % 1
_0035.TextColor3 = Color3.fromHSV(_0037, 1, 1)
_0035.Text = os.date("%H:%M:%S")
task.wait(0.06)
end
end)
_0011:Tag({
Title = "速度传奇",
Color = Color3.fromHex("#00BFFF"),
})
local function CSFromHex(hex)
local _0038  Color3.fromHex(string.find(hex, "^#") and hex or ("#" .. hex))
return ColorSequence.new(_0038, _0038)
end
_0011:EditOpenButton({
Title = "速度传奇",
Icon = "zap",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = CSFromHex("00BFFF"),
Draggable = true,
})
local function ToggleCb(_0015, _0022, onEnable, onDisable)
return function(value)
_000e[_0022] = value
if value then
Notify("速度传奇", _0015 .. " 已开启", 3)
if onEnable then pcall(onEnable) end
else
Notify("速度传奇", _0015 .. " 已关闭", 3)
if onDisable then pcall(onDisable) end
end
end
end
local _0039  _0011:Tab({
Title = "自动",
Icon = "zap",
})
_0039:Toggle({
Title = "自动跑步训练",
Desc = "自动触发训练/速度提升",
Value = false,
Callback = ToggleCb("自动跑步训练", "AutoTrain", function()
StartAutoLoop("AutoTrain", AutoTrain)
end, function()
StopAutoLoop("AutoTrain")
end),
})
_0039:Toggle({
Title = "自动转生",
Desc = "自动触发 rebirth/prestige",
Value = false,
Callback = ToggleCb("自动转生", "AutoRebirth", function()
StartAutoLoop("AutoRebirth", AutoRebirth)
end, function()
StopAutoLoop("AutoRebirth")
end),
})
_0039:Toggle({
Title = "自动买鞋子",
Desc = "自动购买最佳鞋子/速度装备",
Value = false,
Callback = ToggleCb("自动买鞋子", "AutoBuyShoe", function()
StartAutoLoop("AutoBuyShoe", AutoBuyShoe)
end, function()
StopAutoLoop("AutoBuyShoe")
end),
})
_0039:Toggle({
Title = "自动买宠物",
Desc = "自动购买宠物/蛋",
Value = false,
Callback = ToggleCb("自动买宠物", "AutoBuyPet", function()
StartAutoLoop("AutoBuyPet", AutoBuyPet)
end, function()
StopAutoLoop("AutoBuyPet")
end),
})
_0039:Toggle({
Title = "自动孵化",
Desc = "自动孵化宠物蛋",
Value = false,
Callback = ToggleCb("自动孵化", "AutoHatch", function()
StartAutoLoop("AutoHatch", AutoHatch)
end, function()
StopAutoLoop("AutoHatch")
end),
})
_0039:Toggle({
Title = "自动收集金币",
Desc = "自动收集附近金币/现金",
Value = false,
Callback = ToggleCb("自动收集金币", "AutoCollectCoin", function()
StartAutoLoop("AutoCollectCoin", AutoCollectCoin)
end, function()
StopAutoLoop("AutoCollectCoin")
end),
})
_0039:Toggle({
Title = "自动做任务",
Desc = "自动领取/完成任务",
Value = false,
Callback = ToggleCb("自动做任务", "AutoQuest", function()
StartAutoLoop("AutoQuest", AutoQuest)
end, function()
StopAutoLoop("AutoQuest")
end),
})
local _003a  _0011:Tab({
Title = "玩家",
Icon = "user",
})
_003a:Slider({
Title = "行走速度",
Desc = "调整角色移动速度 (16-500)",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(value)
SetWalkSpeed(value)
Notify("速度传奇", "行走速度: " .. tostring(value), 2)
end,
})
_003a:Slider({
Title = "跳跃力",
Desc = "调整角色跳跃力 (50-500)",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(value)
SetJumpPower(value)
Notify("速度传奇", "跳跃力: " .. tostring(value), 2)
end,
})
_003a:Toggle({
Title = "无限跳跃",
Desc = "可在空中持续跳跃",
Value = false,
Callback = ToggleCb("无限跳跃", "InfiniteJump", function()
ToggleInfiniteJump(true)
end, function()
ToggleInfiniteJump(false)
end),
})
_003a:Toggle({
Title = "穿墙",
Desc = "角色可穿过障碍物",
Value = false,
Callback = ToggleCb("穿墙", "Noclip", function()
ToggleNoclip(true)
end, function()
ToggleNoclip(false)
end),
})
_003a:Toggle({
Title = "无敌",
Desc = "保持满血不死",
Value = false,
Callback = ToggleCb("无敌", "GodMode", function()
ToggleGodMode(true)
end, function()
ToggleGodMode(false)
end),
})
_003a:Toggle({
Title = "摔落无伤害",
Desc = "免疫坠落伤害",
Value = false,
Callback = ToggleCb("摔落无伤害", "NoFallDamage", function()
ToggleNoFallDamage(true)
end, function()
ToggleNoFallDamage(false)
end),
})
_003a:Toggle({
Title = "飞行 (手机版)",
Desc = "加载全游戏通用飞行脚本",
Value = false,
Callback = ToggleCb("飞行", "Fly", function()
ToggleFly(true)
end, function()
ToggleFly(false)
end),
})
local _003b  _0011:Tab({
Title = "视觉",
Icon = "eye",
})
_003b:Toggle({
Title = "人物透视",
Desc = "显示其他玩家名字 + 距离",
Value = false,
Callback = ToggleCb("人物透视", "PlayerESP", function()
TogglePlayerESP(true)
end, function()
TogglePlayerESP(false)
end),
})
_003b:Toggle({
Title = "物品透视",
Desc = "高亮金币/宝石等物品",
Value = false,
Callback = ToggleCb("物品透视", "ItemESP", function()
ToggleItemESP(true)
end, function()
ToggleItemESP(false)
end),
})
_003b:Toggle({
Title = "全图高亮",
Desc = "高亮全图所有物体",
Value = false,
Callback = ToggleCb("全图高亮", "FullHighlight", function()
ToggleFullHighlight(true)
end, function()
ToggleFullHighlight(false)
end),
})
local _003c  _0011:Tab({
Title = "传送",
Icon = "navigation",
})
_003c:Button({
Title = "传送到训练区",
Desc = "前往训练区域",
Icon = "zap",
Callback = function()
TeleportByName({"train", "training"}, "训练区")
end,
})
_003c:Button({
Title = "传送到商店",
Desc = "前往商店",
Icon = "shopping-cart",
Callback = function()
TeleportByName({"shop", "store"}, "商店")
end,
})
_003c:Button({
Title = "传送到鞋店",
Desc = "前往鞋店",
Icon = "footprints",
Callback = function()
TeleportByName({"shoe", "shoes"}, "鞋店")
end,
})
_003c:Button({
Title = "传送到宠物店",
Desc = "前往宠物店",
Icon = "paw-print",
Callback = function()
TeleportByName({"pet", "petshop"}, "宠物店")
end,
})
_003c:Button({
Title = "传送到转生区",
Desc = "前往转生区域",
Icon = "refresh-cw",
Callback = function()
TeleportByName({"rebirth", "prestige"}, "转生区")
end,
})
_003c:Button({
Title = "传送到赛道",
Desc = "前往赛道",
Icon = "flag",
Callback = function()
TeleportByName({"race", "track", "speedway"}, "赛道")
end,
})
_003c:Button({
Title = "传送到出生点",
Desc = "前往出生点/大厅",
Icon = "home",
Callback = function()
TeleportByName({"spawn", "lobby", "start"}, "出生点")
end,
})
_003c:Toggle({
Title = "长按传送",
Desc = "按住屏幕/鼠标滑行到指针位置 (手机可用)",
Value = false,
Callback = ToggleCb("长按传送", "HoldTeleport", function()
ToggleHoldTeleport(true)
end, function()
ToggleHoldTeleport(false)
end),
})
local _003d  _0011:Tab({
Title = "实用",
Icon = "wrench",
})
_003d:Toggle({
Title = "防挂机",
Desc = "防止被系统踢出",
Value = false,
Callback = ToggleCb("防挂机", "AntiAFK", function()
ToggleAntiAFK(true)
end, function()
ToggleAntiAFK(false)
end),
})
_003d:Toggle({
Title = "画质提速",
Desc = "优化光照提升画面表现",
Value = false,
Callback = ToggleCb("画质提速", "GraphicsBoost", function()
ToggleGraphicsBoost(true)
end, function()
ToggleGraphicsBoost(false)
end),
})
_003d:Button({
Title = "换服",
Desc = "随机传送到另一个服务器",
Icon = "shuffle",
Callback = function()
ServerHop()
end,
})
_003d:Button({
Title = "复制服务器号",
Desc = "复制当前服务器 JobId",
Icon = "copy",
Callback = function()
CopyServerID()
end,
})
_003d:Button({
Title = "角色信息",
Desc = "查看当前角色状态",
Icon = "_0032",
Callback = function()
CharacterInfo()
end,
})
_003d:Button({
Title = "清理特效",
Desc = "移除场景内粒子/拖尾等特效",
Icon = "sparkles",
Callback = function()
ClearEffects()
end,
})
_003d:Button({
Title = "卸载脚本",
Desc = "清理所有功能并卸载",
Icon = "x",
Callback = function()
UnloadScript()
end,
})
_000b.CharacterAdded:Connect(function(_0013)
local _001b  _0013:WaitForChild("Humanoid", 10)
task.wait(0.4)
if _001b then
if _000e.WalkSpeed and _000e.WalkSpeed ~= 16 then
pcall(function() _001b.WalkSpeed = _000e.WalkSpeed end)
end
if _000e.JumpPower and _000e.JumpPower ~= 50 then
pcall(function()
_001b.UseJumpPower = true
_001b.JumpPower = _000e.JumpPower
end)
end
end
if _000e.Noclip and _000f.Noclip then
end
_000c = _0005.CurrentCamera
end)
Notify("速度传奇", "脚本已加载!", 5)