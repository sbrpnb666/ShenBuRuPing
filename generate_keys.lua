--========================================================
-- 神不如平脚本 - 卡密生成器
-- 用途：生成卡密，然后把生成的卡密复制到 keys.lua 文件里
-- 使用方法：在本地 Lua 环境运行，或直接在 Roblox 执行器里运行
--========================================================

-- 生成随机卡密
local function generateKey()
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local segments = {}
    for s = 1, 4 do
        local segment = ""
        for i = 1, 4 do
            local idx = math.random(1, #chars)
            segment = segment .. string.sub(chars, idx, idx)
        end
        table.insert(segments, segment)
    end
    return "SBP-" .. table.concat(segments, "-")
end

-- 生成多个卡密
local function generateKeys(count)
    local keys = {}
    for i = 1, count do
        table.insert(keys, generateKey())
    end
    return keys
end

-- 生成 keys.lua 文件内容
local function formatKeysLua(keys)
    local lines = {}
    table.insert(lines, "-- 神不如平脚本 - 卡密列表")
    table.insert(lines, "-- 格式：return { \"卡密1\", \"卡密2\", ... }")
    table.insert(lines, "-- 生成时间: " .. os.date("%Y-%m-%d %H:%M:%S"))
    table.insert(lines, "")
    table.insert(lines, "return {")
    for _, key in ipairs(keys) do
        table.insert(lines, '    "' .. key .. '",')
    end
    table.insert(lines, "}")
    return table.concat(lines, "\n")
end

--========================================================
-- 主程序
--========================================================

-- 修改这里来控制生成数量
local KEY_COUNT = 10

print("========================================")
print("  神不如平脚本 - 卡密生成器")
print("========================================")
print()

local keys = generateKeys(KEY_COUNT)

-- 打印到控制台
for i, key in ipairs(keys) do
    print("  [" .. i .. "] " .. key)
end

print()
print("========================================")
print("  keys.lua 文件内容 (复制以下内容):")
print("========================================")
print()
print(formatKeysLua(keys))

-- 同时也输出到剪贴板提示
print()
print("========================================")
print("  把上面的内容保存到 keys.lua 并上传到 GitHub")
print("========================================")

-- 在 Roblox 环境中弹出通知
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "卡密生成完成",
        Text = "已生成 " .. KEY_COUNT .. " 个卡密，请查看控制台输出",
        Duration = 10,
    })
end)
