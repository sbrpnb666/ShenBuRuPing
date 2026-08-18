--========================================================
-- 启动器
--========================================================

local StarterGui = game:GetService("StarterGui")
local function sysMsg(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = title, Text = text or "", Duration = 5})
    end)
end

-- 加载 WindUI（用原来 sbrp脚本 能跑的源）
local WindUI
local ok, err = pcall(function()
    WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
end)
if not ok or not WindUI then
    sysMsg("加载失败", "WindUI 加载失败: " .. tostring(err))
    return
end

local Window = WindUI:CreateWindow({
    Title = "启动器",
    Icon = "sparkles",
    Folder = "QiDongQi",
    HideSearchBar = true,
})

Window:EditOpenButton({
    Title = "启动器",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
    Draggable = true,
})

--========================================================
-- 脚本板块
--========================================================
local Tab = Window:Tab({
    Title = "脚本",
    Icon = "file-text",
})

Tab:Button({
    Title = "SBRP通用脚本",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "SBRP通用脚本", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/sbrp%E8%84%9A%E6%9C%AC.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "战争大亨",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "战争大亨", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E6%88%98%E4%BA%89%E5%A4%A7%E4%BA%A8.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "Ohio",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "Ohio", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/Ohio.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "蜂群模拟器",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "蜂群模拟器", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E8%9C%82%E7%BE%A4%E6%A8%A1%E6%8B%9F%E5%99%A8.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "驾驶帝国",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "驾驶帝国", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E9%A9%BE%E9%A9%B6%E5%B8%9D%E5%9B%BD.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

WindUI:Notify({ Title = "欢迎使用", Content = "启动器已加载", Duration = 3 })
