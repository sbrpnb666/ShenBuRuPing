--[[
    死铁轨 - 最小测试版本
    用于排查加载失败的具体原因
]]

print("[死铁轨测试] 开始加载")

-- ========== WindUI 加载 ==========
local WindUI
local uiOk, uiErr = pcall(function()
    WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
end)
if not uiOk or not WindUI then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "死铁轨 - WindUI失败",
        Text = tostring(uiErr):sub(1, 200),
        Duration = 15,
    })
    return
end
print("[死铁轨测试] WindUI 加载成功")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "死铁轨测试",
    Text = "WindUI加载成功, 正在创建窗口...",
    Duration = 5,
})

-- ========== 创建窗口 ==========
local ok1, err1 = pcall(function()
    local Window = WindUI:CreateWindow({
        Title   = "死铁轨",
        Icon    = "train",
        Author  = "死铁轨脚本",
        Folder  = "DeadRails",
        Size    = UDim2.fromOffset(500, 520),
        Theme   = "Dark",
    })
    print("[死铁轨测试] 窗口创建成功")

    -- 测试 Tag
    local ok2, err2 = pcall(function()
        Window:Tag({ Title = "死铁轨", Color = Color3.fromHex("#8B0000") })
    end)
    if not ok2 then
        print("[死铁轨测试] Tag 失败: " .. tostring(err2))
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "死铁轨 - Tag失败",
            Text = tostring(err2):sub(1, 200),
            Duration = 15,
        })
    end

    -- 测试 EditOpenButton
    local ok3, err3 = pcall(function()
        Window:EditOpenButton({
            Title = "死铁轨",
            Icon = "train",
            CornerRadius = UDim.new(0, 16),
            StrokeThickness = 2,
            Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
            Draggable = true,
        })
    end)
    if not ok3 then
        print("[死铁轨测试] EditOpenButton 失败: " .. tostring(err3))
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "死铁轨 - EditOpenButton失败",
            Text = tostring(err3):sub(1, 200),
            Duration = 15,
        })
    end

    -- 测试 Tab
    local AutoTab = Window:Tab({ Title = "自动", Icon = "bot" })
    local PlayerTab = Window:Tab({ Title = "玩家", Icon = "user" })
    local VisualTab = Window:Tab({ Title = "视觉", Icon = "eye" })
    local TeleportTab = Window:Tab({ Title = "传送", Icon = "map-pin" })
    local UtilityTab = Window:Tab({ Title = "实用", Icon = "wrench" })
    print("[死铁轨测试] 标签页创建成功")

    -- 测试 Toggle
    AutoTab:Toggle({
        Title = "测试开关",
        Desc  = "这是一个测试",
        Value = false,
        Callback = function(state)
            print("[死铁轨测试] 开关状态: " .. tostring(state))
        end,
    })
    print("[死铁轨测试] Toggle 创建成功")

    -- 测试 Button
    PlayerTab:Button({
        Title = "测试按钮",
        Callback = function()
            print("[死铁轨测试] 按钮被点击")
        end,
    })
    print("[死铁轨测试] Button 创建成功")

    -- 测试 Slider
    PlayerTab:Slider({
        Title = "测试滑块",
        Min = 16,
        Max = 100,
        Default = 16,
        Callback = function(val)
            print("[死铁轨测试] 滑块值: " .. tostring(val))
        end,
    })
    print("[死铁轨测试] Slider 创建成功")

    -- 测试 Space
    local okSpace, errSpace = pcall(function()
        PlayerTab:Space()
    end)
    if not okSpace then
        print("[死铁轨测试] Space 失败: " .. tostring(errSpace))
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "死铁轨 - Space方法失败",
            Text = tostring(errSpace):sub(1, 200),
            Duration = 15,
        })
    end

    print("[死铁轨测试] 所有测试通过!")
    WindUI:Notify({
        Title = "死铁轨测试",
        Content = "所有功能测试通过! 可以使用完整版了",
        Duration = 5,
    })
end)

if not ok1 then
    print("[死铁轨测试] 窗口创建失败: " .. tostring(err1))
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "死铁轨 - 窗口创建失败",
        Text = tostring(err1):sub(1, 200),
        Duration = 20,
    })
end
