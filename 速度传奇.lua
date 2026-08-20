local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
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
_uoxvLOxEh6T = false,
_PuP4ioy2YqNncg5 = false,
_kiaihlCngl0w = false,
_b6dH1rUh2YIKQCvS = false,
_CKiJ5aOZafxR1 = false,
_cbGW8Hc69Xg9b = false,
_YcrYThSN2ck071v9 = false,
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
local Connections = {}
local ESPObjects = {}
local Window
local _jFX5eNo4OgBUU
local function GetChar()
return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end
local function GetRoot()
local char = GetChar()
if char then
return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
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
local function _jTwAgS4hQTL(keywords)
local lowers = {}
for _, k in ipairs(keywords) do table.insert(lowers, string.lower(k)) end
local function search(parent)
for _, v in ipairs(parent:GetDescendants()) do
if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
local name = string.lower(v.Name)
for _, kw in ipairs(lowers) do
if string.find(name, kw) then
return v
end
end
end
end
return nil
end
return search(ReplicatedStorage) or search(Workspace)
end
local function _3t2mQx2gW3bM(keys)
local lowers = {}
for _, k in ipairs(keys) do table.insert(lowers, string.lower(k)) end
local function search(parent)
for _, v in ipairs(parent:GetDescendants()) do
if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
local name = string.lower(v.Name)
local ok = true
for _, kw in ipairs(lowers) do
if not string.find(name, kw) then ok = false break end
end
if ok then return v end
end
end
return nil
end
return search(ReplicatedStorage) or search(Workspace)
end
local function _StsGlMeH5qUtb(rem, ...)
if not rem then return end
pcall(function(...)
if rem:IsA("RemoteEvent") then
rem:FireServer(...)
elseif rem:IsA("RemoteFunction") then
pcall(rem.InvokeServer, rem, ...)
end
end, ...)
end
local function _UbnzPWN8Z1hYC6(keywords)
local results = {}
local lowers = {}
for _, k in ipairs(keywords) do table.insert(lowers, string.lower(k)) end
for _, v in ipairs(Workspace:GetDescendants()) do
if v:IsA("BasePart") then
local name = string.lower(v.Name)
for _, kw in ipairs(lowers) do
if string.find(name, kw) then
table.insert(results, v)
break
end
end
end
end
return results
end
local function _SV3nrWapJc6ycEI(keywords)
local lowers = {}
for _, k in ipairs(keywords) do table.insert(lowers, string.lower(k)) end
for _, v in ipairs(Workspace:GetDescendants()) do
if v:IsA("BasePart") then
local name = string.lower(v.Name)
for _, kw in ipairs(lowers) do
if string.find(name, kw) then return v end
end
end
end
return nil
end
local function _u93nrc1bxZ5t(keywords)
local lowers = {}
local _2g0ItO2x = 2795
for _, k in ipairs(keywords) do table.insert(lowers, string.lower(k)) end
for _, v in ipairs(Workspace:GetDescendants()) do
if v:IsA("Model") then
local name = string.lower(v.Name)
for _, kw in ipairs(lowers) do
if string.find(name, kw) then return v end
end
end
end
return nil
end
local function _uoxvLOxEh6T()
local rem = _jTwAgS4hQTL({"train", "run", "speed", "velocity", "treadmill"})
_StsGlMeH5qUtb(rem)
end
local function _PuP4ioy2YqNncg5()
local rem = _jTwAgS4hQTL({"rebirth", "prestige", "reset"})
_StsGlMeH5qUtb(rem)
end
local function _kiaihlCngl0w()
local rem = _3t2mQx2gW3bM({"buy", "shoe"}) or _3t2mQx2gW3bM({"buy", "speed"}) or _jTwAgS4hQTL({"shoe", "shoes"})
_StsGlMeH5qUtb(rem)
end
local function _b6dH1rUh2YIKQCvS()
local rem = _3t2mQx2gW3bM({"buy", "pet"}) or _3t2mQx2gW3bM({"buy", "egg"}) or _jTwAgS4hQTL({"pet", "egg"})
_StsGlMeH5qUtb(rem)
end
local function _CKiJ5aOZafxR1()
local rem = _jTwAgS4hQTL({"hatch", "egg"})
_StsGlMeH5qUtb(rem)
end
local function _cbGW8Hc69Xg9b()
local root = GetRoot()
if not root then return end
local parts = _UbnzPWN8Z1hYC6({"coin", "cash", "money", "gold"})
for _, part in ipairs(parts) do
pcall(function()
if firetouchinterest then
firetouchinterest(part, root, 0)
firetouchinterest(part, root, 1)
else
part.CFrame = root.CFrame
end
end)
end
end
local function _YcrYThSN2ck071v9()
local rem = _jTwAgS4hQTL({"quest", "mission", "claim"})
_StsGlMeH5qUtb(rem)
end
local function _GCmXa7bTcygjlo(key, func)
Connections[key] = task.spawn(function()
while State[key] do
pcall(func)
task.wait(math.random(30, 80) / 100)
end
end)
end
local function _qjwCIwEz1klm8ow(key)
State[key] = false
end
local function _FBW21PsQwYFpa(value)
State.WalkSpeed = value
local hum = GetHum()
if hum then hum.WalkSpeed = value end
if not Connections.WalkSpeedMaintain then
Connections.WalkSpeedMaintain = RunService.Heartbeat:Connect(function()
local h = GetHum()
if h and h.WalkSpeed ~= State.WalkSpeed then
pcall(function() h.WalkSpeed = State.WalkSpeed end)
end
end)
end
end
local function _oHtR9sMVPWvj(value)
State.JumpPower = value
local hum = GetHum()
if hum then
pcall(function()
hum.UseJumpPower = true
hum.JumpPower = value
end)
end
if not Connections.JumpPowerMaintain then
Connections.JumpPowerMaintain = RunService.Heartbeat:Connect(function()
local h = GetHum()
if h then
pcall(function()
h.UseJumpPower = true
if h.JumpPower ~= State.JumpPower then h.JumpPower = State.JumpPower end
end)
end
end)
end
end
local function _DssilPuYO4ssz(enabled)
if enabled then
Connections.InfiniteJump = UserInputService.JumpRequest:Connect(function()
local hum = GetHum()
if hum then
pcall(function() hum:ChangeState(Enum.HumanoidStateType.Jumping) end)
end
end)
else
if Connections.InfiniteJump then Connections.InfiniteJump:Disconnect() Connections.InfiniteJump = nil end
end
end
local function _Vll6Y4gj0gQ(enabled)
if enabled then
Connections.Noclip = RunService.Stepped:Connect(function()
local char = GetChar()
if char then
for _, part in ipairs(char:GetDescendants()) do
if part:IsA("BasePart") and part.CanCollide then
part.CanCollide = false
end
end
end
end)
else
if Connections.Noclip then Connections.Noclip:Disconnect() Connections.Noclip = nil end
local char = GetChar()
if char then
for _, part in ipairs(char:GetDescendants()) do
if part:IsA("BasePart") then
pcall(function() part.CanCollide = true end)
end
end
end
end
end
local function _84Xob5MHRsuAGB(enabled)
if enabled then
Connections.GodMode = RunService.Heartbeat:Connect(function()
local hum = GetHum()
if hum then
pcall(function()
if hum.MaxHealth < 1e9 then hum.MaxHealth = 1e9 end
hum.Health = hum.MaxHealth
end)
end
end)
else
if Connections.GodMode then Connections.GodMode:Disconnect() Connections.GodMode = nil end
local hum = GetHum()
if hum then
pcall(function()
hum.MaxHealth = 100
hum.Health = 100
end)
end
end
end
local function _Tq6EdH4rSFq1z(enabled)
if enabled then
Connections.NoFallDamage = RunService.Heartbeat:Connect(function()
local hum = GetHum()
if hum then
pcall(function()
hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
end)
end
end)
else
if Connections.NoFallDamage then Connections.NoFallDamage:Disconnect() Connections.NoFallDamage = nil end
end
end
local _oHc8XPYZuWNi4 = false
local FLY_URL = "https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8).txt"
local function _nT0HLotKrucyxjgl(enabled)
State.Fly = enabled
if enabled then
if not _oHc8XPYZuWNi4 then
_oHc8XPYZuWNi4 = true
pcall(function()
loadstring(game:HttpGet(FLY_URL))()
end)
end
end
end
local function _KYwkzjY0FPQr(parent, color, sizeY)
local gui = Instance.new("BillboardGui")
gui.Name = "SpeedLegendESP"
gui.AlwaysOnTop = true
gui.Size = UDim2.new(0, 200, 0, sizeY or 30)
gui.StudsOffset = Vector3.new(0, 2.5, 0)
gui.MaxDistance = 2000
gui.ResetOnSpawn = false
gui.LightInfluence = 0
local label = Instance.new("TextLabel")
label.Name = "Text"
label.BackgroundTransparency = 1
label.Size = UDim2.new(1, 0, 1, 0)
label.TextColor3 = color or Color3.fromHex("#00BFFF")
label.TextStrokeTransparency = 0
label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.Text = ""
label.Parent = gui
gui.Parent = parent
return gui, label
end
local function _hJhS7ofY8WbG66(enabled)
if enabled then
Connections.PlayerESP = task.spawn(function()
while State.PlayerESP do
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character then
local head = plr.Character:FindFirstChild("Head")
if head then
local key = "p_" .. plr.UserId
local gui = ESPObjects[key]
if not gui or not gui.Parent or not gui.Parent:IsDescendantOf(game) then
gui = _KYwkzjY0FPQr(head, Color3.fromHex("#00BFFF"))
ESPObjects[key] = gui
end
local root = GetRoot()
local _XQdx2XgEuD = plr.Character:FindFirstChild("HumanoidRootPart")
local dist = ""
if root and _XQdx2XgEuD then
dist = string.format("  [%.0fm]", (root.Position - _XQdx2XgEuD.Position).Magnitude)
end
gui.Text.Text = plr.DisplayName .. dist
end
end
end
task.wait(0.1)
end
end)
else
if Connections.PlayerESP then Connections.PlayerESP = nil end
for key in pairs(ESPObjects) do
if string.sub(key, 1, 2) == "p_" then
pcall(function() ESPObjects[key]:Destroy() end)
ESPObjects[key] = nil
end
end
end
end
local function _BWUWiXrqE88V(enabled)
if enabled then
Connections.ItemESP = task.spawn(function()
while State.ItemESP do
local parts = _UbnzPWN8Z1hYC6({"coin", "cash", "money", "gem", "diamond", "chest", "orb", "crystal"})
for idx, part in ipairs(parts) do
if idx > 250 then break end
local key = "i_" .. part:GetDebugId()
local hl = ESPObjects[key]
if not hl or not hl.Parent then
hl = Instance.new("Highlight")
hl.Name = "SpeedLegendItemESP"
hl.FillColor = Color3.fromHex("#FFD700")
hl.OutlineColor = Color3.fromRGB(255, 255, 255)
hl.FillTransparency = 0.5
hl.OutlineTransparency = 0
hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
hl.Adornee = part
hl.Parent = part
ESPObjects[key] = hl
end
end
task.wait(0.5)
end
end)
else
if Connections.ItemESP then Connections.ItemESP = nil end
for key in pairs(ESPObjects) do
if string.sub(key, 1, 2) == "i_" then
pcall(function() ESPObjects[key]:Destroy() end)
ESPObjects[key] = nil
end
end
end
end
local function _Og1h3nYZurnMWi(enabled)
if enabled then
Connections.FullHighlight = task.spawn(function()
while State.FullHighlight do
for _, v in ipairs(Workspace:GetDescendants()) do
if v:IsA("Model") and #v:GetChildren() > 0 then
local key = "f_" .. v:GetDebugId()
if not ESPObjects[key] then
local hl = Instance.new("Highlight")
hl.Name = "SpeedLegendFullHL"
hl.FillColor = Color3.fromHex("#00BFFF")
hl.FillTransparency = 0.75
hl.OutlineColor = Color3.fromRGB(255, 255, 255)
hl.OutlineTransparency = 0.4
hl.Adornee = v
hl.Parent = v
ESPObjects[key] = hl
end
end
task.wait()
end
task.wait(2)
end
end)
else
if Connections.FullHighlight then Connections.FullHighlight = nil end
for key in pairs(ESPObjects) do
if string.sub(key, 1, 2) == "f_" then
pcall(function() ESPObjects[key]:Destroy() end)
ESPObjects[key] = nil
end
end
end
end
local function _TxSF9EsGqfO(obj)
local root = GetRoot()
if not root or not obj then return false end
pcall(function()
local cf
if obj:IsA("BasePart") then
cf = obj.CFrame + Vector3.new(0, 3, 0)
elseif obj:IsA("Model") then
cf = obj:GetPivot() + Vector3.new(0, 3, 0)
end
if cf then root.CFrame = cf end
end)
return true
end
local function _dfjP1jxMOrZ(keywords, label)
local part = _SV3nrWapJc6ycEI(keywords) or _u93nrc1bxZ5t(keywords)
if part then
_TxSF9EsGqfO(part)
Notify("速度传奇", "已传送到: " .. label, 3)
else
Notify("速度传奇", "未找到: " .. label, 3)
end
end
local _9YUXxrSYJ6W29A00 = false
local function _BjaP5r533c0Kg(enabled)
if enabled then
Connections.HoldTPBegin = UserInputService.InputBegan:Connect(function(input, gp)
if gp then return end
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
_9YUXxrSYJ6W29A00 = true
end
end)
Connections.HoldTPEnd = UserInputService.InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
_9YUXxrSYJ6W29A00 = false
end
end)
Connections.HoldTP = RunService.RenderStepped:Connect(function()
if _9YUXxrSYJ6W29A00 then
local root = GetRoot()
if root then
local target = Mouse.Hit.Position
root.CFrame = root.CFrame:Lerp(CFrame.new(target), 0.25)
end
end
end)
else
_9YUXxrSYJ6W29A00 = false
for _, k in ipairs({"HoldTPBegin", "HoldTPEnd", "HoldTP"}) do
if Connections[k] then Connections[k]:Disconnect() Connections[k] = nil end
end
end
end
local function _dMrXCgRvKGDjE1(enabled)
if enabled then
Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
pcall(function()
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.05)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
end)
else
if Connections.AntiAFK then Connections.AntiAFK:Disconnect() Connections.AntiAFK = nil end
end
end
local function _bwOEt8n55vISd(enabled)
if enabled then
Lighting.GlobalShadows = true
Lighting.FogEnd = 1e9
Lighting.Brightness = 2
Lighting.ClockTime = 14
Lighting.ExposureCompensation = 0.3
Lighting.Ambient = Color3.fromRGB(150, 150, 150)
Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
pcall(function() Lighting.Technology = Enum.Technology.Future end)
else
Lighting.GlobalShadows = false
Lighting.FogEnd = 100000
Lighting.Brightness = 1
Lighting.ExposureCompensation = 0
Lighting.Ambient = Color3.fromRGB(0, 0, 0)
Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
end
end
local function _prqJwGRnnGs4R4I()
Notify("速度传奇", "正在换服...", 3)
pcall(function()
local _IUHmWcJsVAM09KYe = game:GetService("_IUHmWcJsVAM09KYe")
local placeId = game.PlaceId
local _M1c1UyZy = 5965
local req = (request or http_request or (syn and syn.request))
local function _98FzDr8jPmdoLD(cursor)
local url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", placeId)
if cursor and cursor ~= "" then
url = url .. "&cursor=" .. cursor
end
local resp = req({ Url = url, Method = "GET" })
return _IUHmWcJsVAM09KYe:JSONDecode(resp.Body)
end
local data = _98FzDr8jPmdoLD("")
local picked
if data and data.data then
for _, server in ipairs(data.data) do
if server.playing and server.maxPlayers and server.playing < server.maxPlayers and server.id ~= game.JobId then
picked = server
break
end
end
end
if picked then
TeleportService:TeleportToPlaceInstance(placeId, picked.id, LocalPlayer)
else
Notify("速度传奇", "未找到可用服务器", 4)
end
end)
end
local function _utwW5yWaeb()
local jobId = game.JobId
if jobId == "" then jobId = "未知" end
pcall(function()
if setclipboard then setclipboard(jobId) end
end)
Notify("速度传奇", "服务器号已复制: " .. jobId, 6)
end
local function _9gNUKZpjiHlw3fd()
local hum = GetHum()
local root = GetRoot()
local info = "未找到角色"
if hum and root then
info = string.format(
"血量: %.0f / %.0f\n速度: %.0f\n跳跃力: %.0f\n位置: %.1f, %.1f, %.1f",
hum.Health, hum.MaxHealth, hum.WalkSpeed, hum.JumpPower,
root.Position.X, root.Position.Y, root.Position.Z
)
end
Notify("角色信息", info, 8)
end
local function _Ztb7FL4t62Yfycw1()
local count = 0
for _, v in ipairs(Workspace:GetDescendants()) do
if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("Explosion") then
pcall(function() v.Enabled = false v:Destroy() end)
count = count + 1
end
end
Notify("速度传奇", "已清理 " .. count .. " 个特效", 4)
end
local function _ryD4erxUKOPBJ()
for k, v in pairs(State) do
if type(v) == "boolean" then State[k] = false end
end
for k, conn in pairs(Connections) do
pcall(function()
if typeof(conn) == "RBXScriptConnection" then
conn:Disconnect()
end
end)
Connections[k] = nil
end
for k, obj in pairs(ESPObjects) do
pcall(function() obj:Destroy() end)
ESPObjects[k] = nil
end
pcall(function()
local hum = GetHum()
if hum then
hum.WalkSpeed = 16
pcall(function() hum.JumpPower = 50 end)
end
local char = GetChar()
local _WEl2MDoX = 9330
if char then
for _, part in ipairs(char:GetDescendants()) do
if part:IsA("BasePart") then pcall(function() part.CanCollide = true end) end
end
end
end)
_bwOEt8n55vISd(false)
pcall(function() Window:Destroy() end)
pcall(function() _jFX5eNo4OgBUU:Destroy() end)
Notify("速度传奇", "脚本已卸载", 4)
end
Window = WindUI:CreateWindow({
Title = "速度传奇",
Icon = "zap",
Author = "速度传奇脚本",
Folder = "SpeedLegend",
Size = UDim2.fromOffset(500, 520),
Theme = "Dark",
})
_jFX5eNo4OgBUU = Instance.new("ScreenGui")
_jFX5eNo4OgBUU.Name = "SpeedLegendTimeLabel"
_jFX5eNo4OgBUU.ResetOnSpawn = false
_jFX5eNo4OgBUU.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_jFX5eNo4OgBUU.IgnoreGuiInset = true
pcall(function()
local parent = (gethui and gethui()) or game:GetService("CoreGui")
_jFX5eNo4OgBUU.Parent = parent
end)
if not _jFX5eNo4OgBUU.Parent then
_jFX5eNo4OgBUU.Parent = LocalPlayer:WaitForChild("PlayerGui")
end
local _fSv4A8SnFZmB = Instance.new("TextLabel")
_fSv4A8SnFZmB.Name = "Time"
_fSv4A8SnFZmB.Size = UDim2.new(0, 180, 0, 32)
_fSv4A8SnFZmB.Position = UDim2.new(1, -190, 0, 12)
_fSv4A8SnFZmB.AnchorPoint = Vector2.new(0, 0)
_fSv4A8SnFZmB.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
_fSv4A8SnFZmB.BackgroundTransparency = 0.35
_fSv4A8SnFZmB.BorderSizePixel = 0
_fSv4A8SnFZmB.TextColor3 = Color3.fromHSV(0, 1, 1)
_fSv4A8SnFZmB.TextScaled = true
_fSv4A8SnFZmB.Font = Enum.Font.GothamBold
_fSv4A8SnFZmB.Text = os.date("%H:%M:%S")
local _Oy1LfBiIPBFC8zfA = Instance.new("UICorner")
_Oy1LfBiIPBFC8zfA.CornerRadius = UDim.new(0, 10)
_Oy1LfBiIPBFC8zfA.Parent = _fSv4A8SnFZmB
_fSv4A8SnFZmB.Parent = _jFX5eNo4OgBUU
task.spawn(function()
local hue = 0
while _jFX5eNo4OgBUU and _jFX5eNo4OgBUU.Parent do
hue = (hue + 0.02) % 1
_fSv4A8SnFZmB.TextColor3 = Color3.fromHSV(hue, 1, 1)
_fSv4A8SnFZmB.Text = os.date("%H:%M:%S")
task.wait(0.06)
end
end)
Window:Tag({
Title = "速度传奇",
Color = Color3.fromHex("#00BFFF"),
})
local function _FiJ6C7okn0Ub(hex)
local c = Color3.fromHex(string.find(hex, "^#") and hex or ("#" .. hex))
return ColorSequence.new(c, c)
end
Window:EditOpenButton({
Title = "速度传奇",
Icon = "zap",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = _FiJ6C7okn0Ub("00BFFF"),
Draggable = true,
})
local function _FB0q6fwbV5(name, key, onEnable, onDisable)
return function(value)
State[key] = value
if value then
Notify("速度传奇", name .. " 已开启", 3)
if onEnable then pcall(onEnable) end
else
Notify("速度传奇", name .. " 已关闭", 3)
if onDisable then pcall(onDisable) end
end
end
end
local AutoTab = Window:Tab({
Title = "自动",
Icon = "zap",
})
AutoTab:Toggle({
Title = "自动跑步训练",
Desc = "自动触发训练/速度提升",
Value = false,
Callback = _FB0q6fwbV5("自动跑步训练", "_uoxvLOxEh6T", function()
_GCmXa7bTcygjlo("_uoxvLOxEh6T", _uoxvLOxEh6T)
end, function()
_qjwCIwEz1klm8ow("_uoxvLOxEh6T")
end),
})
AutoTab:Toggle({
Title = "自动转生",
Desc = "自动触发 rebirth/prestige",
Value = false,
Callback = _FB0q6fwbV5("自动转生", "_PuP4ioy2YqNncg5", function()
_GCmXa7bTcygjlo("_PuP4ioy2YqNncg5", _PuP4ioy2YqNncg5)
end, function()
_qjwCIwEz1klm8ow("_PuP4ioy2YqNncg5")
end),
})
AutoTab:Toggle({
Title = "自动买鞋子",
Desc = "自动购买最佳鞋子/速度装备",
Value = false,
Callback = _FB0q6fwbV5("自动买鞋子", "_kiaihlCngl0w", function()
_GCmXa7bTcygjlo("_kiaihlCngl0w", _kiaihlCngl0w)
end, function()
_qjwCIwEz1klm8ow("_kiaihlCngl0w")
end),
})
AutoTab:Toggle({
Title = "自动买宠物",
Desc = "自动购买宠物/蛋",
Value = false,
Callback = _FB0q6fwbV5("自动买宠物", "_b6dH1rUh2YIKQCvS", function()
_GCmXa7bTcygjlo("_b6dH1rUh2YIKQCvS", _b6dH1rUh2YIKQCvS)
end, function()
_qjwCIwEz1klm8ow("_b6dH1rUh2YIKQCvS")
end),
})
AutoTab:Toggle({
Title = "自动孵化",
Desc = "自动孵化宠物蛋",
Value = false,
Callback = _FB0q6fwbV5("自动孵化", "_CKiJ5aOZafxR1", function()
_GCmXa7bTcygjlo("_CKiJ5aOZafxR1", _CKiJ5aOZafxR1)
end, function()
_qjwCIwEz1klm8ow("_CKiJ5aOZafxR1")
end),
})
AutoTab:Toggle({
Title = "自动收集金币",
Desc = "自动收集附近金币/现金",
Value = false,
Callback = _FB0q6fwbV5("自动收集金币", "_cbGW8Hc69Xg9b", function()
_GCmXa7bTcygjlo("_cbGW8Hc69Xg9b", _cbGW8Hc69Xg9b)
end, function()
_qjwCIwEz1klm8ow("_cbGW8Hc69Xg9b")
end),
})
AutoTab:Toggle({
Title = "自动做任务",
Desc = "自动领取/完成任务",
Value = false,
Callback = _FB0q6fwbV5("自动做任务", "_YcrYThSN2ck071v9", function()
_GCmXa7bTcygjlo("_YcrYThSN2ck071v9", _YcrYThSN2ck071v9)
end, function()
_qjwCIwEz1klm8ow("_YcrYThSN2ck071v9")
end),
})
local _EiOLpYFk3c6eu = Window:Tab({
Title = "玩家",
Icon = "user",
})
_EiOLpYFk3c6eu:Slider({
Title = "行走速度",
Desc = "调整角色移动速度 (16-500)",
Value = { Min = 16, Max = 500, Default = 16 },
Increment = 1,
Callback = function(value)
_FBW21PsQwYFpa(value)
Notify("速度传奇", "行走速度: " .. tostring(value), 2)
end,
})
_EiOLpYFk3c6eu:Slider({
Title = "跳跃力",
Desc = "调整角色跳跃力 (50-500)",
Value = { Min = 50, Max = 500, Default = 50 },
Increment = 1,
Callback = function(value)
_oHtR9sMVPWvj(value)
Notify("速度传奇", "跳跃力: " .. tostring(value), 2)
end,
})
_EiOLpYFk3c6eu:Toggle({
Title = "无限跳跃",
Desc = "可在空中持续跳跃",
Value = false,
Callback = _FB0q6fwbV5("无限跳跃", "InfiniteJump", function()
_DssilPuYO4ssz(true)
end, function()
_DssilPuYO4ssz(false)
end),
})
_EiOLpYFk3c6eu:Toggle({
Title = "穿墙",
Desc = "角色可穿过障碍物",
Value = false,
Callback = _FB0q6fwbV5("穿墙", "Noclip", function()
_Vll6Y4gj0gQ(true)
end, function()
_Vll6Y4gj0gQ(false)
end),
})
_EiOLpYFk3c6eu:Toggle({
Title = "无敌",
Desc = "保持满血不死",
Value = false,
Callback = _FB0q6fwbV5("无敌", "GodMode", function()
_84Xob5MHRsuAGB(true)
end, function()
_84Xob5MHRsuAGB(false)
end),
})
_EiOLpYFk3c6eu:Toggle({
Title = "摔落无伤害",
Desc = "免疫坠落伤害",
Value = false,
Callback = _FB0q6fwbV5("摔落无伤害", "NoFallDamage", function()
_Tq6EdH4rSFq1z(true)
end, function()
_Tq6EdH4rSFq1z(false)
end),
})
_EiOLpYFk3c6eu:Toggle({
Title = "飞行 (手机版)",
Desc = "加载全游戏通用飞行脚本",
Value = false,
Callback = _FB0q6fwbV5("飞行", "Fly", function()
_nT0HLotKrucyxjgl(true)
end, function()
_nT0HLotKrucyxjgl(false)
end),
})
local _0u9l8ib9mi5YVU = Window:Tab({
Title = "视觉",
Icon = "eye",
})
_0u9l8ib9mi5YVU:Toggle({
Title = "人物透视",
Desc = "显示其他玩家名字 + 距离",
Value = false,
Callback = _FB0q6fwbV5("人物透视", "PlayerESP", function()
_hJhS7ofY8WbG66(true)
end, function()
_hJhS7ofY8WbG66(false)
end),
})
_0u9l8ib9mi5YVU:Toggle({
Title = "物品透视",
Desc = "高亮金币/宝石等物品",
Value = false,
Callback = _FB0q6fwbV5("物品透视", "ItemESP", function()
_BWUWiXrqE88V(true)
end, function()
_BWUWiXrqE88V(false)
end),
})
_0u9l8ib9mi5YVU:Toggle({
Title = "全图高亮",
Desc = "高亮全图所有物体",
Value = false,
Callback = _FB0q6fwbV5("全图高亮", "FullHighlight", function()
_Og1h3nYZurnMWi(true)
end, function()
_Og1h3nYZurnMWi(false)
end),
})
local _NZQhOgfYvzSu = Window:Tab({
Title = "传送",
Icon = "navigation",
})
_NZQhOgfYvzSu:Button({
Title = "传送到训练区",
Desc = "前往训练区域",
Icon = "zap",
Callback = function()
_dfjP1jxMOrZ({"train", "training"}, "训练区")
end,
})
_NZQhOgfYvzSu:Button({
Title = "传送到商店",
Desc = "前往商店",
Icon = "shopping-cart",
Callback = function()
_dfjP1jxMOrZ({"shop", "store"}, "商店")
end,
})
_NZQhOgfYvzSu:Button({
Title = "传送到鞋店",
Desc = "前往鞋店",
Icon = "footprints",
Callback = function()
_dfjP1jxMOrZ({"shoe", "shoes"}, "鞋店")
end,
})
_NZQhOgfYvzSu:Button({
Title = "传送到宠物店",
Desc = "前往宠物店",
Icon = "paw-print",
Callback = function()
_dfjP1jxMOrZ({"pet", "petshop"}, "宠物店")
end,
})
_NZQhOgfYvzSu:Button({
Title = "传送到转生区",
Desc = "前往转生区域",
Icon = "refresh-cw",
Callback = function()
_dfjP1jxMOrZ({"rebirth", "prestige"}, "转生区")
end,
})
_NZQhOgfYvzSu:Button({
Title = "传送到赛道",
Desc = "前往赛道",
Icon = "flag",
Callback = function()
_dfjP1jxMOrZ({"race", "track", "speedway"}, "赛道")
end,
})
_NZQhOgfYvzSu:Button({
Title = "传送到出生点",
Desc = "前往出生点/大厅",
Icon = "home",
Callback = function()
_dfjP1jxMOrZ({"spawn", "lobby", "start"}, "出生点")
end,
})
_NZQhOgfYvzSu:Toggle({
Title = "长按传送",
Desc = "按住屏幕/鼠标滑行到指针位置 (手机可用)",
Value = false,
Callback = _FB0q6fwbV5("长按传送", "HoldTeleport", function()
_BjaP5r533c0Kg(true)
end, function()
_BjaP5r533c0Kg(false)
end),
})
local _818ynFJldhJSqvJC = Window:Tab({
Title = "实用",
Icon = "wrench",
})
_818ynFJldhJSqvJC:Toggle({
Title = "防挂机",
Desc = "防止被系统踢出",
Value = false,
Callback = _FB0q6fwbV5("防挂机", "AntiAFK", function()
_dMrXCgRvKGDjE1(true)
end, function()
_dMrXCgRvKGDjE1(false)
end),
})
_818ynFJldhJSqvJC:Toggle({
Title = "画质提速",
Desc = "优化光照提升画面表现",
Value = false,
Callback = _FB0q6fwbV5("画质提速", "GraphicsBoost", function()
_bwOEt8n55vISd(true)
end, function()
_bwOEt8n55vISd(false)
end),
})
_818ynFJldhJSqvJC:Button({
Title = "换服",
Desc = "随机传送到另一个服务器",
Icon = "shuffle",
Callback = function()
_prqJwGRnnGs4R4I()
end,
})
_818ynFJldhJSqvJC:Button({
Title = "复制服务器号",
Desc = "复制当前服务器 JobId",
Icon = "copy",
Callback = function()
_utwW5yWaeb()
end,
})
_818ynFJldhJSqvJC:Button({
Title = "角色信息",
Desc = "查看当前角色状态",
Icon = "info",
Callback = function()
_9gNUKZpjiHlw3fd()
end,
})
_818ynFJldhJSqvJC:Button({
Title = "清理特效",
Desc = "移除场景内粒子/拖尾等特效",
Icon = "sparkles",
Callback = function()
_Ztb7FL4t62Yfycw1()
end,
})
_818ynFJldhJSqvJC:Button({
Title = "卸载脚本",
Desc = "清理所有功能并卸载",
Icon = "x",
Callback = function()
_ryD4erxUKOPBJ()
end,
})
LocalPlayer.CharacterAdded:Connect(function(char)
local hum = char:WaitForChild("Humanoid", 10)
task.wait(0.4)
if hum then
if State.WalkSpeed and State.WalkSpeed ~= 16 then
pcall(function() hum.WalkSpeed = State.WalkSpeed end)
end
if State.JumpPower and State.JumpPower ~= 50 then
pcall(function()
hum.UseJumpPower = true
hum.JumpPower = State.JumpPower
end)
end
end
if State.Noclip and Connections.Noclip then
end
Camera = Workspace.CurrentCamera
end)
Notify("速度传奇", "脚本已加载!", 5)