local _JuASDhw6 = 0
local _frsopbqc = ""
local _PZnJZlM3 = nil
local _0001  game:GetService("_0001")
local function sysMsg(title, text)
pcall(function()
_0001:SetCore("SendNotification", {Title = title, Text = text or "", Duration = 5})
end)
end
local _0002 local _0003  err = pcall(function()
_0002 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/_0002/main/dist/main.lua"))()
end)
if not _0003 or not _0002 then
sysMsg("加载失败", "_0002 加载失败: " .. tostring(err))
return
end
local _0004  _0002:CreateWindow({
Title = "sbrp启动器",
Icon = "sparkles",
Folder = "QiDongQi",
HideSearchBar = true,
})
_0004:EditOpenButton({
Title = "sbrp启动器",
Icon = "monitor",
CornerRadius = UDim.new(0, 16),
StrokeThickness = 2,
Color = ColorSequence.new(Color3.fromHex("FF6B6B")),
Draggable = true,
})
local _0005  _0004:_0005({
Title = "脚本",
Icon = "file-text",
})
_0005:Button({
Title = "SBRP通用脚本",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "SBRP通用脚本", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/sbrp%E8%84%9A%E6%9C%AC.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "战争大亨",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "战争大亨", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E6%88%98%E4%BA%89%E5%A4%A7%E4%BA%A8.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "Ohio",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "Ohio", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/Ohio.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "蜂群模拟器",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "蜂群模拟器", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E8%9C%82%E7%BE%A4%E6%A8%A1%E6%8B%9F%E5%99%A8.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "驾驶帝国",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "驾驶帝国", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E9%A9%BE%E9%A9%B6%E5%B8%9D%E5%9B%BD.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "力量传奇",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "力量传奇", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E5%8A%9B%E9%87%8F%E4%BC%A0%E5%A5%87.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "最强战场",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "最强战场", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E6%9C%80%E5%BC%BA%E6%88%98%E5%9C%BA.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "死铁轨",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "死铁轨", Duration = 3 })
local _0006  errorMsg = pcall(function()
local _0007  game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E6%AD%BB%E9%93%81%E8%BD%A8.lua")
if not _0007 or #_0007 < 100 then
error("HttpGet返回内容过短 (" .. tostring(_0007 and #_0007 or 0) .. " 字节), 可能是网络问题")
end
local _0008  loadErr = loadstring(_0007)
if not _0008 then
error("语法错误: " .. tostring(loadErr))
end
_0008()
end)
if not _0006 then
local _0009  tostring(errorMsg)
if #_0009 > 200 then _0009 = _0009:sub(1, 200) .. "..." end
_0002:Notify({ Title = "死铁轨加载失败", Content = _0009, Duration = 15 })
warn("[死铁轨] 加载失败: " .. tostring(errorMsg))
end
end,
})
_0005:Button({
Title = "死铁轨(测试版)",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "死铁轨测试版", Duration = 3 })
local _0006  errorMsg = pcall(function()
local _0007  game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E6%AD%BB%E9%93%81%E8%BD%A8_test.lua")
local _0008  loadstring(_0007)
if not _0008 then error("语法错误") end
_0008()
end)
if not _0006 then
_0002:Notify({ Title = "测试版也失败", Content = tostring(errorMsg):sub(1, 200), Duration = 15 })
end
end,
})
_0005:Button({
Title = "速度传奇",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "速度传奇", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E9%80%9F%E5%BA%A6%E4%BC%A0%E5%A5%87.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "忍者传奇",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "忍者传奇", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E5%BF%8D%E8%80%85%E4%BC%A0%E5%A5%87.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "圣奥里",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "圣奥里", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E5%9C%A3%E5%A5%A5%E9%87%8C.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0005:Button({
Title = "自然灾害",
Callback = function()
_0002:Notify({ Title = "正在加载", Content = "自然灾害", Duration = 3 })
local _0006  errorMsg = pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3.lua"))()
end)
if not _0006 then
_0002:Notify({ Title = "加载失败", Content = tostring(errorMsg), Duration = 8 })
end
end,
})
_0002:Notify({ Title = "欢迎使用", Content = "启动器已加载", Duration = 3 })
local _000a  _0004:_0005({
Title = "公告",
Icon = "bell",
})
_000a:Image(
"https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/%E8%B5%9E%E8%B5%8F%E7%A0%81.png",
"zanshangma",
12,
"Notice",
"zsm"
)
_000a:Space()
_000a:Section({ Title = "脚本作者" })
_000a:Paragraph({
Title = "霉国总统",
Desc = "脚本核心开发 / 功能实现"
})
_000a:Paragraph({
Title = "神不如平",
Desc = "脚本核心开发 / 功能实现"
})