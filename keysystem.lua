--========================================================
-- 神不如平脚本 - 卡密验证系统 v1.0
-- 这是用户加载的入口脚本
-- 用户需要输入正确卡密才能加载主脚本
--========================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

--========================================================
-- 配置区 (你可以修改这些)
--========================================================
local CONFIG = {
    -- 卡密列表的 GitHub Raw 链接 (存放有效卡密的文件)
    KEY_LIST_URL = "https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/keys.lua",

    -- 主脚本加载链接 (验证通过后才加载，用户看不到这个链接)
    MAIN_SCRIPT_URL = "https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/main_script.lua",

    -- 脚本名称
    SCRIPT_NAME = "神不如平脚本",

    -- 版本号
    VERSION = "v1.0",

    -- 获取卡密的提示信息
    GET_KEY_HINT = "请联系作者获取卡密",
}

--========================================================
-- 通知函数
--========================================================
local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text or "",
            Duration = duration or 5,
        })
    end)
end

--========================================================
-- 简易 UI (不依赖外部库，防止被反查)
--========================================================
local function createKeyUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KeySystem_" .. HttpService:GenerateGUID(false)
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- 尝试放入 CoreGui，失败则放 PlayerGui
    pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end

    -- 主背景
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 380, 0, 260)
    MainFrame.Position = UDim2.new(0.5, -190, 0.5, -130)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame

    -- 彩虹边框
    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = 2
    Stroke.Transparency = 0.2
    Stroke.Parent = MainFrame

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 100)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255)),
    })
    Gradient.Parent = Stroke

    -- 彩虹边框动画
    local RunService = game:GetService("RunService")
    local rainbowConn
    local rot = 0
    rainbowConn = RunService.RenderStepped:Connect(function(dt)
        rot = (rot + 60 * dt) % 360
        Gradient.Rotation = rot
    end)

    -- 标题
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = CONFIG.SCRIPT_NAME .. " " .. CONFIG.VERSION
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 22
    Title.Parent = MainFrame

    -- 副标题
    local SubTitle = Instance.new("TextLabel")
    SubTitle.Size = UDim2.new(1, 0, 0, 20)
    SubTitle.Position = UDim2.new(0, 0, 0, 48)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = "请输入卡密以激活脚本"
    SubTitle.TextColor3 = Color3.fromRGB(150, 150, 160)
    SubTitle.Font = Enum.Font.Gotham
    SubTitle.TextSize = 13
    SubTitle.Parent = MainFrame

    -- 输入框背景
    local InputFrame = Instance.new("Frame")
    InputFrame.Size = UDim2.new(0, 320, 0, 42)
    InputFrame.Position = UDim2.new(0.5, -160, 0, 85)
    InputFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    InputFrame.BorderSizePixel = 0
    InputFrame.Parent = MainFrame

    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 8)
    InputCorner.Parent = InputFrame

    -- 输入框
    local KeyInput = Instance.new("TextBox")
    KeyInput.Size = UDim2.new(1, -20, 1, 0)
    KeyInput.Position = UDim2.new(0, 10, 0, 0)
    KeyInput.BackgroundTransparency = 1
    KeyInput.PlaceholderText = "在此输入卡密..."
    KeyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
    KeyInput.Text = ""
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.Font = Enum.Font.Code
    KeyInput.TextSize = 15
    KeyInput.ClearTextOnFocus = false
    KeyInput.Parent = InputFrame

    -- 验证按钮
    local VerifyBtn = Instance.new("TextButton")
    VerifyBtn.Size = UDim2.new(0, 320, 0, 42)
    VerifyBtn.Position = UDim2.new(0.5, -160, 0, 140)
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(124, 58, 237)
    VerifyBtn.BorderSizePixel = 0
    VerifyBtn.Text = "验证卡密"
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.TextSize = 16
    VerifyBtn.AutoButtonColor = true
    VerifyBtn.Parent = MainFrame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = VerifyBtn

    -- 状态文字
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, 0, 0, 20)
    StatusLabel.Position = UDim2.new(0, 0, 0, 192)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = CONFIG.GET_KEY_HINT
    StatusLabel.TextColor3 = Color3.fromRGB(120, 120, 130)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextSize = 12
    StatusLabel.Parent = MainFrame

    -- 关闭按钮
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 5)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(200, 80, 80)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 16
    CloseBtn.Parent = MainFrame

    -- 获取卡密链接按钮
    local LinkBtn = Instance.new("TextButton")
    LinkBtn.Size = UDim2.new(0, 320, 0, 28)
    LinkBtn.Position = UDim2.new(0.5, -160, 0, 220)
    LinkBtn.BackgroundTransparency = 1
    LinkBtn.Text = "没有卡密？点击获取"
    LinkBtn.TextColor3 = Color3.fromRGB(100, 150, 255)
    LinkBtn.Font = Enum.Font.Gotham
    LinkBtn.TextSize = 12
    LinkBtn.Parent = MainFrame

    --========================================================
    -- 卡密验证逻辑
    --========================================================
    local isVerifying = false

    local function verifyKey(key)
        if isVerifying then return end
        if key == "" or not key then
            StatusLabel.Text = "请输入卡密"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 50)
            return
        end

        isVerifying = true
        VerifyBtn.Text = "验证中..."
        StatusLabel.Text = "正在验证卡密..."
        StatusLabel.TextColor3 = Color3.fromRGB(100, 150, 255)

        task.spawn(function()
            -- 从 GitHub 获取卡密列表
            local success, result = pcall(function()
                return game:HttpGet(CONFIG.KEY_LIST_URL)
            end)

            if not success then
                StatusLabel.Text = "网络错误，请重试"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                VerifyBtn.Text = "验证卡密"
                isVerifying = false
                return
            end

            -- 解析卡密列表 (Lua 格式)
            local validKeys = {}
            local fn, err = loadstring(result)
            if fn then
                validKeys = fn()
            end

            -- 检查卡密是否有效
            local isValid = false
            for _, validKey in ipairs(validKeys) do
                if validKey == key then
                    isValid = true
                    break
                end
            end

            if isValid then
                StatusLabel.Text = "验证成功！正在加载脚本..."
                StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
                VerifyBtn.Text = "成功!"

                -- 延迟加载主脚本
                task.wait(1)

                -- 销毁卡密 UI
                if rainbowConn then rainbowConn:Disconnect() end
                ScreenGui:Destroy()

                -- 加载主脚本
                local mainSuccess, mainResult = pcall(function()
                    return game:HttpGet(CONFIG.MAIN_SCRIPT_URL)
                end)

                if mainSuccess then
                    local mainFn, mainErr = loadstring(mainResult)
                    if mainFn then
                        mainFn()
                    else
                        notify("加载失败", "脚本解析错误", 5)
                    end
                else
                    notify("加载失败", "无法获取主脚本", 5)
                end
            else
                StatusLabel.Text = "卡密无效，请检查输入"
                StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                VerifyBtn.Text = "验证卡密"
                isVerifying = false
            end
        end)
    end

    -- 按钮事件
    VerifyBtn.MouseButton1Click:Connect(function()
        verifyKey(KeyInput.Text)
    end)

    -- 回车提交
    KeyInput.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            verifyKey(KeyInput.Text)
        end
    end)

    -- 关闭按钮
    CloseBtn.MouseButton1Click:Connect(function()
        if rainbowConn then rainbowConn:Disconnect() end
        ScreenGui:Destroy()
    end)

    -- 获取卡密按钮 (可以改成你的 Discord/链接)
    LinkBtn.MouseButton1Click:Connect(function()
        notify("获取卡密", CONFIG.GET_KEY_HINT, 5)
    end)

    -- 启动通知
    notify(CONFIG.SCRIPT_NAME, "请输入卡密以激活脚本", 3)

    return ScreenGui
end

--========================================================
-- 启动
--========================================================
createKeyUI()
