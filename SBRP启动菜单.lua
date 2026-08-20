--========================================================
-- SBRP脚本 — 启动菜单版
-- 启动 → 弹出菜单 → 点击执行 → 加载通用功能
--========================================================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- 加载 WindUI
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

--========================================================
-- 第一阶段：启动菜单
--========================================================
local startGui = Instance.new("ScreenGui")
startGui.Name = "SBRP_StartMenu"
startGui.ResetOnSpawn = false
startGui.IgnoreGuiInset = true
startGui.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 200)
frame.Position = UDim2.new(0.5, -160, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
frame.BorderSizePixel = 0
frame.Parent = startGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 1.5
stroke.Color = Color3.fromRGB(100, 130, 255)
stroke.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 70)
title.Position = UDim2.new(0, 0, 0, 15)
title.BackgroundTransparency = 1
title.Text = "SBRP脚本"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.Parent = frame

-- 执行按钮
local execBtn = Instance.new("TextButton")
execBtn.Size = UDim2.new(0, 130, 0, 42)
execBtn.Position = UDim2.new(0, 20, 0, 130)
execBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
execBtn.Text = "执行"
execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
execBtn.Font = Enum.Font.GothamBold
execBtn.TextSize = 17
execBtn.BorderSizePixel = 0
execBtn.Parent = frame

Instance.new("UICorner", execBtn).CornerRadius = UDim.new(0, 8)

-- 取消按钮
local cancelBtn = Instance.new("TextButton")
cancelBtn.Size = UDim2.new(0, 130, 0, 42)
cancelBtn.Position = UDim2.new(0, 170, 0, 130)
cancelBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
cancelBtn.Text = "取消"
cancelBtn.TextColor3 = Color3.fromRGB(190, 190, 190)
cancelBtn.Font = Enum.Font.GothamBold
cancelBtn.TextSize = 17
cancelBtn.BorderSizePixel = 0
cancelBtn.Parent = frame

Instance.new("UICorner", cancelBtn).CornerRadius = UDim.new(0, 8)

-- 取消：关闭菜单
cancelBtn.MouseButton1Click:Connect(function()
    startGui:Destroy()
end)

--========================================================
-- 第二阶段：执行 → 加载通用 UI
--========================================================
execBtn.MouseButton1Click:Connect(function()
    startGui:Destroy()

    local Window = WindUI:CreateWindow({
        Title = "SBRP脚本",
        Icon = "sparkles",
        Folder = "SBRP",
        HideSearchBar = true,
    })

    local Tab = Window:Tab({ Title = "通用", Icon = "package" })

    Tab:Button({
        Title = "通用",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/sbrp_obfuscated.lua"))()
            end)
        end,
    })
end)
