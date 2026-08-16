--========================================================
-- 神不如平脚本 - 主脚本 (验证通过后加载)
-- 这个文件只有输入正确卡密后才会被加载
--========================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local function Notify(title, content, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = content or "",
            Duration = duration or 3,
        })
    end)
end

local function GetChar() return LocalPlayer.Character end
local function GetRoot()
    local c = GetChar()
    return c and c:FindFirstChild("HumanoidRootPart") or nil
end
local function GetHum()
    local c = GetChar()
    return c and c:FindFirstChildOfClass("Humanoid") or nil
end

--=========== 状态 ===========
local State = {
    WalkSpeed = 16,
    JumpPower = 50,
    NoFallDamage = false,
    ESPEnabled = false,
}

--=========== 速度/跳跃 ===========
local function applyWalkSpeed()
    local h = GetHum() if h then h.WalkSpeed = State.WalkSpeed end
end
local function applyJumpPower()
    local h = GetHum()
    if h then
        if h.UseJumpPower then h.JumpPower = State.JumpPower
        else h.JumpHeight = State.JumpPower / 10 end
    end
end

--=========== 无掉落伤害 ===========
local function setupNoFallDamage(hum)
    if not hum then return end
    hum.StateChanged:Connect(function(_, new)
        if new == Enum.HumanoidStateType.FallingDown then
            task.wait()
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end)
end

local function onCharacterAdded(char)
    local hum = char:WaitForChild("Humanoid", 10)
    if not hum then return end
    task.wait(0.3)
    applyWalkSpeed()
    applyJumpPower()
    if State.NoFallDamage then setupNoFallDamage(hum) end
end

if LocalPlayer.Character then task.spawn(onCharacterAdded, LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

--=========== 甩飞功能 ===========
local function getPlayerList()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then table.insert(list, p.Name) end
    end
    return list
end

local function flingPlayer(targetName)
    local target = Players:FindFirstChild(targetName)
    if not target or not target.Character then return end
    local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
    local myRoot = GetRoot()
    if not targetRoot or not myRoot then return end

    local original = myRoot.CFrame
    myRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 0, 0)

    local bv = Instance.new("BodyAngularVelocity")
    bv.AngularVelocity = Vector3.new(math.huge, math.huge, math.huge)
    bv.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bv.Parent = myRoot

    task.wait(0.3)
    bv:Destroy()
    myRoot.CFrame = original
end

local function flingAllPlayers()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            task.spawn(function()
                pcall(flingPlayer, p.Name)
            end)
            task.wait(0.2)
        end
    end
end

--=========== 快速跑步 ===========
local sprintConn = nil
local function startSprint()
    sprintConn = RunService.Heartbeat:Connect(function()
        local hum = GetHum()
        if hum then hum.WalkSpeed = State.WalkSpeed * 3 end
    end)
end
local function stopSprint()
    if sprintConn then sprintConn:Disconnect() sprintConn = nil end
    applyWalkSpeed()
end

--=========== 无限跳跃 ===========
local infJumpConn = nil
local function startInfJump()
    infJumpConn = UserInputService.JumpRequest:Connect(function()
        local hum = GetHum()
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end)
end
local function stopInfJump()
    if infJumpConn then infJumpConn:Disconnect() infJumpConn = nil end
end

--=========== 穿墙 ===========
local noclipConn = nil
local function startNoclip()
    noclipConn = RunService.Stepped:Connect(function()
        local char = GetChar()
        if char then
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then
                    p.CanCollide = false
                end
            end
        end
    end)
end
local function stopNoclip()
    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
    local char = GetChar()
    if char then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = true end
        end
    end
end

--=========== 防挂机 ===========
local antiAFKConn = nil
local function startAntiAFK()
    local VirtualUser = game:GetService("VirtualUser")
    antiAFKConn = LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end
local function stopAntiAFK()
    if antiAFKConn then antiAFKConn:Disconnect() antiAFKConn = nil end
end

--========================================================
-- 加载 WindUI
--========================================================
local WindUI
pcall(function()
    WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
end)
if not WindUI then
    Notify("加载失败", "WindUI 无法加载")
    return
end

--========================================================
-- 创建主窗口
--========================================================
local Window = WindUI:CreateWindow({
    Title = "神不如平脚本",
    Icon = "sparkles",
    Folder = "ShenBuRuPing",
    HideSearchBar = true,
})

--========================================================
-- Tab1: 角色
--========================================================
local CharTab = Window:Tab({Title = "角色", Icon = "user"})

CharTab:Slider({
    Title = "行走速度",
    Value = {Min = 16, Max = 500, Default = 16},
    Step = 1,
    Callback = function(val) State.WalkSpeed = val applyWalkSpeed() end,
})

CharTab:Slider({
    Title = "跳跃力度",
    Value = {Min = 50, Max = 500, Default = 50},
    Step = 1,
    Callback = function(val) State.JumpPower = val applyJumpPower() end,
})

CharTab:Button({
    Title = "重置移动",
    Callback = function()
        State.WalkSpeed = 16 State.JumpPower = 50
        applyWalkSpeed() applyJumpPower()
    end,
})

CharTab:Button({
    Title = "立即重生",
    Callback = function()
        local h = GetHum() if h then h.Health = 0 end
    end,
})

--========================================================
-- Tab2: 通用
--========================================================
local GenTab = Window:Tab({Title = "通用", Icon = "package"})

GenTab:Toggle({
    Title = "无掉落伤害",
    Default = false,
    Callback = function(val)
        State.NoFallDamage = val
        if val then
            local h = GetHum()
            if h then setupNoFallDamage(h) end
        end
    end,
})

local flingTarget = nil
GenTab:Dropdown({
    Title = "甩飞目标",
    Values = getPlayerList(),
    Callback = function(val) flingTarget = val end,
})

GenTab:Button({
    Title = "甩飞!",
    Callback = function()
        if flingTarget then flingPlayer(flingTarget)
        else Notify("未选择", "请先选择目标", 3) end
    end,
})

GenTab:Button({
    Title = "甩飞所有人!",
    Callback = function()
        task.spawn(flingAllPlayers)
    end,
})

GenTab:Divider()

GenTab:Toggle({
    Title = "快速跑步 (3倍速度)",
    Default = false,
    Callback = function(val)
        if val then startSprint() else stopSprint() end
    end,
})

GenTab:Toggle({
    Title = "无限跳跃",
    Default = false,
    Callback = function(val)
        if val then startInfJump() else stopInfJump() end
    end,
})

GenTab:Toggle({
    Title = "穿墙",
    Default = false,
    Callback = function(val)
        if val then startNoclip() else stopNoclip() end
    end,
})

GenTab:Divider()

GenTab:Toggle({
    Title = "防挂机",
    Default = false,
    Callback = function(val)
        if val then startAntiAFK() else stopAntiAFK() end
    end,
})

GenTab:Button({
    Title = "服务器跳转",
    Callback = function()
        Notify("跳转中", "正在寻找新服务器...", 3)
        local TeleportService = game:GetService("TeleportService")
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})

GenTab:Button({
    Title = "重新加入",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})

--========================================================
-- 启动通知
--========================================================
Notify("欢迎使用", "神不如平脚本已加载", 5)
