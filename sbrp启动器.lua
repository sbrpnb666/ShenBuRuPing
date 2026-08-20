--========================================================
-- sbrp启动器
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
    Title = "sbrp启动器",
    Icon = "sparkles",
    Folder = "QiDongQi",
    HideSearchBar = true,
})

Window:EditOpenButton({
    Title = "sbrp启动器",
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

Tab:Button({
    Title = "力量传奇",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "力量传奇", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E5%8A%9B%E9%87%8F%E4%BC%A0%E5%A5%87.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "最强战场",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "最强战场", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E6%9C%80%E5%BC%BA%E6%88%98%E5%9C%BA.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "死铁轨",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "死铁轨", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E6%AD%BB%E9%93%81%E8%BD%A8.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "速度传奇",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "速度传奇", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E9%80%9F%E5%BA%A6%E4%BC%A0%E5%A5%87.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "忍者传奇",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "忍者传奇", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E5%BF%8D%E8%80%85%E4%BC%A0%E5%A5%87.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "圣奥里",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "圣奥里", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E5%9C%A3%E5%A5%A5%E9%87%8C.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

Tab:Button({
    Title = "自然灾害",
    Callback = function()
        WindUI:Notify({ Title = "正在加载", Content = "自然灾害", Duration = 3 })
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3.lua"))()
        end)
        if not success then
            WindUI:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
        end
    end,
})

WindUI:Notify({ Title = "欢迎使用", Content = "启动器已加载", Duration = 3 })
