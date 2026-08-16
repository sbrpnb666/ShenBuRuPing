--========================================================
-- NexusHub 卡密生成器
-- 在 Roblox 执行器里运行，按 F9 查看控制台输出
--========================================================

-- 私钥 (必须和 NexusHub.lua 里的 SECRET_SEED 一致)
local SECRET_SEED = 48217

local function hashStr(str)
    local h = SECRET_SEED
    for i = 1, #str do
        h = ((h * 37) + string.byte(str, i)) % 9999999
    end
    return h
end

local function numToCode(num, length)
    local chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
    local result = ""
    num = num % (chars:len() ^ length)
    for i = 1, length do
        local idx = (num % chars:len()) + 1
        result = string.sub(chars, idx, idx) .. result
        num = math.floor(num / chars:len())
    end
    return result
end

local function generateKey()
    local chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
    local body = ""
    for i = 1, 16 do
        local idx = math.random(1, #chars)
        body = body .. string.sub(chars, idx, idx)
    end
    local checkNum = hashStr(body)
    local checkCode = numToCode(checkNum, 4)
    local formatted = body:sub(1,4) .. "-" .. body:sub(5,8) .. "-" ..
                      body:sub(9,12) .. "-" .. body:sub(13,16) .. "-" .. checkCode
    return "NEX-" .. formatted
end

-- 验证
local function verifyKey(key)
    local body = key:gsub("^NEX%-", "")
    local parts = {}
    for part in body:gmatch("[^-]+") do table.insert(parts, part) end
    if #parts ~= 5 then return false end
    local mainBody = parts[1]..parts[2]..parts[3]..parts[4]
    local checkCode = parts[5]
    return checkCode == numToCode(hashStr(mainBody), 4)
end

--========================================================
-- 生成卡密
--========================================================
local COUNT = 15 -- 修改数量

print("========================================")
print("  NexusHub 卡密生成器")
print("========================================")
print()

for i = 1, COUNT do
    local key = generateKey()
    local ok = verifyKey(key)
    print(string.format("  [%2d] %s  %s", i, key, ok and "[OK]" or "[FAIL]"))
end

print()
print("========================================")
print("  直接复制发给用户即可")
print("  修改 SECRET_SEED 可让所有旧卡密失效")
print("========================================")

local StarterGui = game:GetService("StarterGui")
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "卡密生成完成",
        Text = "已生成 " .. COUNT .. " 个卡密，按 F9 查看",
        Duration = 10,
    })
end)
