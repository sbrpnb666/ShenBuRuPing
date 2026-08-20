local _BnJXL1aj=1~=0
local _u2da7gbKUNhE=function(s)local k="14G)-;;CAZ2PC4sl"local d=""for i=1,#s,2 dolocal h=string.sub(s,i,i)local l=string.sub(s,i+1,i+1)local hv=tonumber(h,16)local lv=tonumber(l,16)if hv and lv then d=d..string.char(hv*16+lv)end endlocal r=""for i=1,#d do r=r..string.char(string.byte(d,i)~string.byte(k,(i-1)%#k+1))end return r end
local _IlllIl0I1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
local _1Ol101II0OOO = game:GetService(_u2da7gbKUNhE("6E0508451C0B0A0A086A7D1F0C"))
local _I10lI000II00 = game:GetService(_u2da7gbKUNhE("6E7D761941720B7371137B6073"))
local _I00O1110OOOOII = game:GetService(_u2da7gbKUNhE("6E7D7719620A0A7271157D1F0C7D3A"))
local __IIl110l0Il00 = game:GetService(_u2da7gbKUNhE("6E6B0E60410A0A732D6A7B3C7304"))
local __O0O1OlO11OIIlO1 = game:GetService(_u2da7gbKUNhE("6E6B0819620A742F0E6B031F0A7D1F2300"))
local ___lI1lI0O0llll = game:GetService(_u2da7gbKUNhE("6E6B1845640A570A7115023C2F581F"))
local __l1010l0lI = game:GetService(_u2da7gbKUNhE("6E6B2B181D0A0B2F71367B"))
local ___O0lIlIlI01l0 = game:GetService(_u2da7gbKUNhE("6E6B18661D57722F08367B60725843"))
local _10III01l00I0l1I = _1Ol101II0OOO._10III01l00I0l1I
local __OOl0110l1I0lIl = __IIl110l0Il00.CurrentCamera
local ___II100OI1O0 = _10III01l00I0l1I:GetMouse()
local ___0IO000lIIlOI0 = _IlllIl0I1:CreateWindow({
Title = _u2da7gbKUNhE("4F425AD4"),
Icon = "car",
Author = _u2da7gbKUNhE("4F425AD43717"),
Folder = _u2da7gbKUNhE("75462E5F44555C062C2A5B2226"),
Size = UDim2.fromOffset((500+10-12), 520),
Theme = _u2da7gbKUNhE("75553542"),
HideSearchBar = (not _BnJXL1aj),
})
local _IlO0lO0l = ___0IO000lIIlOI0:Tag({
Title = _u2da7gbKUNhE("01047D191D"),
Color = Color3.fromRGB(0, (200*3/4), math.floor(255.99))
})
local hue = 0
task.spawn(function()
while (not not _BnJXL1aj) do
local now = os.date("*t")
hue = (hue + 0.01) % 1
_IlO0lO0l:SetTitle(string.format(_u2da7gbKUNhE("1404754D171E0B7125"), now.hour, now.min))
_IlO0lO0l:SetColor(Color3.fromHSV(hue, 1, 1))
do local _4geP5pzw=51 end
task.wait(0.(6+2-4))
end
end)
___0IO000lIIlOI0:Tag({ Title = "驾驶_u2da7gbKUNhE("1D140446415449637C7A713F2F5B015F1F52354640735E3B69")#00C8FF") })
___0IO000lIIlOI0:EditOpenButton({
Title = _u2da7gbKUNhE("4F425AD4"),
Icon = "car",
CornerRadius = UDim.new(0, (16+14-4)),
StrokeThickness = 0x2,
Color = ColorSequence.new(Color3.fromHex(_u2da7gbKUNhE("010404116B7D"))),
Draggable = (not not _BnJXL1aj),
})
local ___00O1Il0OI = {
AutoRace = (not _BnJXL1aj),
AutoCoins = (not _BnJXL1aj),
SpeedBoost = (not _BnJXL1aj),
SpeedMultiplier = 0x3,
InfiniteNitro = (not _BnJXL1aj),
WalkSpeed = (16*3/3),
JumpPower = (50*3/2),
InfJump = (not _BnJXL1aj),
Noclip = (not _BnJXL1aj),
GodMode = (not _BnJXL1aj),
NoFallDamage = (not _BnJXL1aj),
ESPEnabled = (not _BnJXL1aj),
ESPNames = (not not _BnJXL1aj),
ESPDistance = (not not _BnJXL1aj),
ESPItems = (not _BnJXL1aj),
Fullbright = (not _BnJXL1aj),
AntiAFK = (not _BnJXL1aj),
FPSBoost = (not _BnJXL1aj),
}
local __100I1l00I = {}
local _l0OIO1O10l = {}
local function ___010OOlOlOl()
return _10III01l00I0l1I.Character
end
local function _0IOOlO0011l()
local c = ___010OOlOlOl()
return c and c:FindFirstChild(_u2da7gbKUNhE("79412A484354522713355D2413550118")) or nil
end
local function _0Il0O00O0()
local c = ___010OOlOlOl()
return c and c:FindFirstChildOfClass(_u2da7gbKUNhE("79412A4843545227")) or nil
end
local function _00O011000I1O0(title, content, duration)
_IlllIl0I1:_00O011000I1O0({ Title = title, Content = content or "", Duration = duration or (3+4-12) })
end
local function __OOOlII101IO()
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("7C5B234C41")) then
local __l101O0I0IO = obj:FindFirstChild(_u2da7gbKUNhE("75462E5F4849")) or obj:FindFirstChild(_u2da7gbKUNhE("6251265D")) or obj:FindFirstChild(_u2da7gbKUNhE("67512F404E575E10243B46"))
if __l101O0I0IO and __l101O0I0IO:IsA(_u2da7gbKUNhE("67512F404E575E10243B46")) and __l101O0I0IO.Occupant then
local hum = __l101O0I0IO.Occupant
local char = ___010OOlOlOl()
if hum and hum.Parent and hum.Parent.Parent == char then
return obj
end
end
local seat = obj:FindFirstChildWhichIsA(_u2da7gbKUNhE("67512F404E575E10243B46"))
if seat and seat.Occupant then
local char = ___010OOlOlOl()
if seat.Occupant.Parent and seat.Occupant.Parent.Parent == char then
return obj, seat
end
end
end
end
return nil
end
local function _Il01OI101()
local _Il0O0Il1OO0 = {}
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("7355344C7D5A4937")) or obj:IsA(_u2da7gbKUNhE("7C5B234C41")) then
local ln = string.lower(obj.Name)
if string.find(ln, _u2da7gbKUNhE("525C224A464B542A2F2E")) or string.find(ln, _u2da7gbKUNhE("525C224A46")) or string.find(ln, _u2da7gbKUNhE("435D294E")) or string.find(ln, "cp") then
local part = obj:IsA(_u2da7gbKUNhE("7355344C7D5A4937")) and obj or obj:FindFirstChildWhichIsA(_u2da7gbKUNhE("7355344C7D5A4937"))
if part then table.insert(_Il0O0Il1OO0, part) end
end
end
end
table.sort(_Il0O0Il1OO0, function(a, b)
local an = tonumber(string.match(a.Name, "%d+")) or 0
local bn = tonumber(string.match(b.Name, "%d+")) or 0
return an < bn
end)
return _Il0O0Il1OO0
end
local ___lOOllI00O00 = ___0IO000lIIlOI0:Tab({
Title = "赛车",
Icon = _u2da7gbKUNhE("5758264E"),
})
___lOOllI00O00:Section({ Title = _u2da7gbKUNhE("DB9C9372"), TextXAlignment = _u2da7gbKUNhE("7D51215D"), TextSize = (17+15-10) })
___lOOllI00O00:Toggle({
Title = _u2da7gbKUNhE("DB9C9672"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.AutoRace = val
if val then
_00O011000I1O0("赛车", _u2da7gbKUNhE("DB9C9672DF3B14"), 0x3)
local __O0OI11IlO = 1
__100I1l00I.AutoRace = _I10lI000II00.Heartbeat:Connect(function()
if not ___00O1Il0OI.AutoRace then return end
local root = _0IOOlO0011l()
if not root then return end
local __l00lIl1OlIlI = _Il01OI101()
if #__l00lIl1OlIlI == 0 then return end
if __O0OI11IlO > #__l00lIl1OlIlI then __O0OI11IlO = 1 end
local _lI1l1I0I11Ol = __l00lIl1OlIlI[__O0OI11IlO]
if _lI1l1I0I11Ol then
root.CFrame = _lI1l1I0I11Ol.CFrame * CFrame.new(0, 0x3, 0)
task.wait(0.math.floor(3.29))
__O0OI11IlO = __O0OI11IlO + 1
end
end)
else
if __100I1l00I.AutoRace then __100I1l00I.AutoRace:Disconnect() __100I1l00I.AutoRace = nil end
_00O011000I1O0("赛车", _u2da7gbKUNhE("DB9C9672DF48D6"), (3+8-3))
end
end,
})
___lOOllI00O00:Button({
Title = _u2da7gbKUNhE("1135775EFC84"),
Callback = function()
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("7355344C7D5A4937")) or obj:IsA(_u2da7gbKUNhE("7C5B234C41")) then
local ln = string.lower(obj.Name)
if string.find(ln, _u2da7gbKUNhE("4240265B59")) or string.find(ln, _u2da7gbKUNhE("575D29405E53")) or string.find(ln, _u2da7gbKUNhE("5D5D294C")) then
local part = obj:IsA(_u2da7gbKUNhE("7355344C7D5A4937")) and obj or obj:FindFirstChildWhichIsA(_u2da7gbKUNhE("7355344C7D5A4937"))
if part then
local root = _0IOOlO0011l()
if root then
root.CFrame = part.CFrame * CFrame.new(0, (5+16-16), 0)
_00O011000I1O0("赛车", _u2da7gbKUNhE("C31446195AEA84"), (3+10-1))
return
end
end
end
end
end
_00O011000I1O0("赛车", _u2da7gbKUNhE("1B4A775EFC84"), math.floor(3.37))
end,
})
___lOOllI00O00:Divider()
___lOOllI00O00:Section({ Title = _u2da7gbKUNhE("57B2E736"), TextXAlignment = _u2da7gbKUNhE("7D51215D"), TextSize = (17+8-11) })
___lOOllI00O00:Toggle({
Title = _u2da7gbKUNhE("57B2E736"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.SpeedBoost = val
if val then
_00O011000I1O0("赛车", _u2da7gbKUNhE("57B2E736DF3B14"), 0x3)
__100I1l00I.SpeedBoost = _I10lI000II00.Heartbeat:Connect(function()
if not ___00O1Il0OI.SpeedBoost then return end
local _IlI1I11I0OO, seat = __OOOlII101IO()
if _IlI1I11I0OO then
pcall(function()
for _, desc in ipairs(_IlI1I11I0OO:GetDescendants()) do
if desc:IsA(_u2da7gbKUNhE("67552B5C48795A3024")) then
local ln = string.lower(desc.Name)
if string.find(ln, _u2da7gbKUNhE("4244224C49")) or string.find(ln, _u2da7gbKUNhE("5C553F5A5D5E5E27")) or string.find(ln, _u2da7gbKUNhE("47512B464E524F3A")) or string.find(ln, _u2da7gbKUNhE("415B304C5F")) then
if desc:IsA(_u2da7gbKUNhE("7F412A4B48496D222D2F57")) or desc:IsA(_u2da7gbKUNhE("785A337F4C574E26")) then
desc.Value = desc.Value * ___00O1Il0OI.SpeedMultiplier
end
end
end
end
local vs = _IlI1I11I0OO:FindFirstChildWhichIsA(_u2da7gbKUNhE("67512F404E575E10243B46"))
if vs then
vs.MaxSpeed = vs.MaxSpeed * ___00O1Il0OI.SpeedMultiplier
end
local ___0OllIO001O0IlI = _IlI1I11I0OO:FindFirstChild(_u2da7gbKUNhE("745A2040435E")) or _IlI1I11I0OO:FindFirstChild(_u2da7gbKUNhE("7C5B33465F"))
if ___0OllIO001O0IlI then
for _, desc in ipairs(___0OllIO001O0IlI:GetDescendants()) do
if desc:IsA(_u2da7gbKUNhE("67552B5C48795A3024")) then
local ln = string.lower(desc.Name)
if string.find(ln, _u2da7gbKUNhE("4244224C49")) or string.find(ln, _u2da7gbKUNhE("415B304C5F")) or string.find(ln, _u2da7gbKUNhE("455B3558585E")) then
if desc:IsA(_u2da7gbKUNhE("7F412A4B48496D222D2F57")) or desc:IsA(_u2da7gbKUNhE("785A337F4C574E26")) then
desc.Value = desc.Value * ___00O1Il0OI.SpeedMultiplier
end
end
end
end
end
end)
end
end)
else
if __100I1l00I.SpeedBoost then __100I1l00I.SpeedBoost:Disconnect() __100I1l00I.SpeedBoost = nil end
_00O011000I1O0("赛车", _u2da7gbKUNhE("57B2E736DF48D6"), 0x3)
end
end,
})
___lOOllI00O00:Slider({
Title = _u2da7gbKUNhE("912B4A59"),
Value = { Min = (2+20-15), Max = (50+12-15), Default = (3+2-8) },
Increment = 1,
Callback = function(val)
___00O1Il0OI.SpeedMultiplier = val
end,
})
___lOOllI00O00:Toggle({
Title = _u2da7gbKUNhE("D164693D"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.InfiniteNitro = val
if val then
_00O011000I1O0("赛车", _u2da7gbKUNhE("D164693DDF3B14"), (3+20-12))
__100I1l00I.Nitro = _I10lI000II00.Heartbeat:Connect(function()
if not ___00O1Il0OI.InfiniteNitro then return end
local _IlI1I11I0OO = __OOOlII101IO()
if _IlI1I11I0OO then
pcall(function()
for _, desc in ipairs(_IlI1I11I0OO:GetDescendants()) do
if desc:IsA(_u2da7gbKUNhE("67552B5C48795A3024")) then
local ln = string.lower(desc.Name)
if string.find(ln, _u2da7gbKUNhE("5F5D335B42")) or string.find(ln, _u2da7gbKUNhE("535B285A59")) or string.find(ln, _u2da7gbKUNhE("4541354B42")) or string.find(ln, _u2da7gbKUNhE("5F5D335B424E48")) then
if desc:IsA(_u2da7gbKUNhE("7F412A4B48496D222D2F57")) or desc:IsA(_u2da7gbKUNhE("785A337F4C574E26")) then
desc.Value = (100*4/2)
end
end
end
end
end)
end
pcall(function()
for _, obj in ipairs(___lI1lI0O0llll:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("63512A46595E7E35243446")) then
local ln = string.lower(obj.Name)
if string.find(ln, _u2da7gbKUNhE("5F5D335B42")) or string.find(ln, _u2da7gbKUNhE("535B285A59")) or string.find(ln, _u2da7gbKUNhE("4541354B42")) then
obj:FireServer()
end
end
end
end)
end)
else
if __100I1l00I.Nitro then __100I1l00I.Nitro:Disconnect() __100I1l00I.Nitro = nil end
_00O011000I1O0("赛车", _u2da7gbKUNhE("D164693DDF48D6"), 0x3)
end
end,
})
___lOOllI00O00:Divider()
___lOOllI00O00:Section({ Title = "工具_u2da7gbKUNhE("1D14134C554F63022D33553E2E511D18110967")Left", TextSize = (17+14-9) })
___lOOllI00O00:Button({
Title = _u2da7gbKUNhE("11357729FCFBDEFA"),
Callback = function()
local root = _0IOOlO0011l()
if not root then return end
local __l00lIl1OlIlI = _Il01OI101()
if #__l00lIl1OlIlI == 0 then
_00O011000I1O0("赛车", _u2da7gbKUNhE("1B4A77E9C882"), 0x3)
return
end
local __l01llll0lOlIII = nil
local ___OOOl0Il0Il0 = math.huge
for _, cp in ipairs(__l00lIl1OlIlI) do
local dist = (root.Position - cp.Position).Magnitude
if dist < ___OOOl0Il0Il0 then
___OOOl0Il0Il0 = dist
__l01llll0lOlIII = cp
end
end
if __l01llll0lOlIII then
root.CFrame = __l01llll0lOlIII.CFrame * CFrame.new(0, math.floor(3.64), 0)
_00O011000I1O0("赛车", _u2da7gbKUNhE("C31446192DEAFBA6F8"), (3+14-2))
end
end,
})
___lOOllI00O00:Button({
Title = _u2da7gbKUNhE("5AFB21AFCC54"),
Callback = function()
local ___111OII1IlO0Ol0 = {}
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("7C5B234C41")) then
local seat = obj:FindFirstChildWhichIsA(_u2da7gbKUNhE("67512F404E575E10243B46"))
if seat then
table.insert(___111OII1IlO0Ol0, _u2da7gbKUNhE("57B27D09") .. obj.Name)
for _, desc in ipairs(obj:GetDescendants()) do
if desc:IsA(_u2da7gbKUNhE("67552B5C48795A3024")) then
table.insert(___111OII1IlO0Ol0, "  _u2da7gbKUNhE("111A6909495E48206F14533D26145D4211") = " .. tostring(desc.Value))
end
end
end
end
end
local msg = #___111OII1IlO0Ol0 > 0 and table.concat(___111OII1IlO0Ol0, "\n_u2da7gbKUNhE("1814285B0D")未找到车辆"
_00O011000I1O0(_u2da7gbKUNhE("5AFB94B5"), msg, (10*4/2))
end,
})
local _I1IOI1OI11ll0 = ___0IO000lIIlOI0:Tab({
Title = "玩家",
Icon = _u2da7gbKUNhE("4447225B"),
})
_I1IOI1OI11ll0:Section({ Title = "移动_u2da7gbKUNhE("1D14134C554F63022D33553E2E511D18110967")Left", TextSize = 0x11 })
_I1IOI1OI11ll0:Slider({
Title = _u2da7gbKUNhE("7D44588F"),
Value = { Min = (16*2/2), Max = (500+18-11), Default = 0x10 },
Increment = 1,
Callback = function(val)
___00O1Il0OI.WalkSpeed = val
local h = _0Il0O00O0()
if h then h.WalkSpeed = val end
end,
})
_I1IOI1OI11ll0:Slider({
Title = "跳跃力",
Value = { Min = (50+15-1), Max = math.floor(500.12), Default = (50+19-13) },
Increment = 1,
Callback = function(val)
___00O1Il0OI.JumpPower = val
local h = _0Il0O00O0()
if h then
if h.UseJumpPower then h.JumpPower = val
else h.JumpHeight = val / (10+8-11) end
end
end,
})
_I1IOI1OI11ll0:Divider()
_I1IOI1OI11ll0:Toggle({
Title = _u2da7gbKUNhE("D164B4EA"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.InfJump = val
if val then
__100I1l00I.InfJump = _I00O1110OOOOII.JumpRequest:Connect(function()
local h = _0Il0O00O0()
if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if __100I1l00I.InfJump then __100I1l00I.InfJump:Disconnect() __100I1l00I.InfJump = nil end
end
end,
})
_I1IOI1OI11ll0:Toggle({
Title = "穿墙",
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.Noclip = val
if val then
__100I1l00I.NoClip = _I10lI000II00.Stepped:Connect(function()
if not ___00O1Il0OI.Noclip then return end
local c = ___010OOlOlOl()
if c then
for _, p in ipairs(c:GetDescendants()) do
if p:IsA(_u2da7gbKUNhE("7355344C7D5A4937")) and p.CanCollide then p.CanCollide = (not _BnJXL1aj) end
end
end
end)
else
if __100I1l00I.NoClip then __100I1l00I.NoClip:Disconnect() __100I1l00I.NoClip = nil end
end
end,
})
_I1IOI1OI11ll0:Toggle({
Title = "无敌",
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.GodMode = val
if val then
_00O011000I1O0("玩家", _u2da7gbKUNhE("D178B52902"), (3+14-5))
__100I1l00I.GodMode = _I10lI000II00.Heartbeat:Connect(function()
local h = _0Il0O00O0()
if h and h.Health < h.MaxHealth then h.Health = h.MaxHealth end
end)
else
if __100I1l00I.GodMode then __100I1l00I.GodMode:Disconnect() __100I1l00I.GodMode = nil end
_00O011000I1O0("玩家", _u2da7gbKUNhE("D178B55AC0"), math.floor(3.67))
end
end,
})
_I1IOI1OI11ll0:Toggle({
Title = _u2da7gbKUNhE("6509A70D9E"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.NoFallDamage = val
if val then
_00O011000I1O0("玩家", _u2da7gbKUNhE("6509A70D9EC93B6C"), (3+13-13))
local function __III01OlOlI1IOlI(h)
if not h then return end
local ___lI0OI1O0ll10l0 = h.Health
h.StateChanged:Connect(function(old, new)
if not ___00O1Il0OI.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
___lI0OI1O0ll10l0 = h.Health
elseif old == Enum.HumanoidStateType.Freefall then
if h.Health < ___lI0OI1O0ll10l0 then h.Health = ___lI0OI1O0ll10l0 end
end
end)
end
local c = ___010OOlOlOl()
if c then __III01OlOlI1IOlI(c:FindFirstChildOfClass(_u2da7gbKUNhE("79412A4843545227"))) end
__100I1l00I.NoFall = _10III01l00I0l1I.CharacterAdded:Connect(function(char)
task.wait(0.0x3)
if ___00O1Il0OI.NoFallDamage then __III01OlOlI1IOlI(char:FindFirstChildOfClass(_u2da7gbKUNhE("79412A4843545227"))) end
end)
else
if __100I1l00I.NoFall then __100I1l00I.NoFall:Disconnect() __100I1l00I.NoFall = nil end
_00O011000I1O0("玩家", _u2da7gbKUNhE("6509A70D9EC948AE"), 0x3)
end
end,
})
_I1IOI1OI11ll0:Divider()
local ___ll01011lll1 = (not _BnJXL1aj)
_I1IOI1OI11ll0:Button({
Title = _u2da7gbKUNhE("EF7867016601736A"),
Callback = function()
if ___ll01011lll1 then
_00O011000I1O0("飞行", _u2da7gbKUNhE("EF782556DF683B"), 0x3)
return
end
___ll01011lll1 = (not not _BnJXL1aj)
loadstring(game:HttpGet("https://raw.githubusercontent.com/sbrpnb666/ShenBuRuPing/main/.uploads/飞行脚本V3(全游戏通用).txt"))()
end,
})
local __II0I1Ill = ___0IO000lIIlOI0:Tab({
Title = "视觉",
Icon = "eye",
})
__II0I1Ill:Section({ Title = "透视_u2da7gbKUNhE("1D14134C554F63022D33553E2E511D18110967")Left", TextSize = (17*3/2) })
local function _0lOO00I1Il(player)
if player == _10III01l00I0l1I then return end
if _l0OIO1O10l[player] then return end
local __OO01l00IOll0I0 = Instance.new(_u2da7gbKUNhE("735D2B454F545A31251D4739"))
__OO01l00IOll0I0.Name = _u2da7gbKUNhE("75462E5F487E68131E") .. player.Name
__OO01l00IOll0I0.Size = UDim2.new(0, math.floor(200.35), 0, math.floor(50.49))
__OO01l00IOll0I0.StudsOffset = Vector3.new(0, (3*4/2), 0)
__OO01l00IOll0I0.AlwaysOnTop = (not not _BnJXL1aj)
local ___0lll0OO1O1lIl0 = Instance.new(_u2da7gbKUNhE("65513F5D615A59262D"))
___0lll0OO1O1lIl0.Size = UDim2.new(1, 0, 0, math.floor(20.61))
___0lll0OO1O1lIl0.BackgroundTransparency = 1
___0lll0OO1O1lIl0.TextColor3 = Color3.fromRGB(0, (200*2/4), math.floor(255.11))
___0lll0OO1O1lIl0.TextSize = (14+10-13)
___0lll0OO1O1lIl0.Font = Enum.Font.SourceSansBold
___0lll0OO1O1lIl0.TextStrokeTransparency = 0.(5+9-15)
___0lll0OO1O1lIl0.Text = player.Name
___0lll0OO1O1lIl0.Parent = __OO01l00IOll0I0
local ___1llIlIIO00 = Instance.new(_u2da7gbKUNhE("65513F5D615A59262D"))
___1llIlIIO00.Size = UDim2.new(1, 0, 0, (18+10-10))
___1llIlIIO00.Position = UDim2.new(0, 0, 0, 0x16)
___1llIlIIO00.BackgroundTransparency = 1
___1llIlIIO00.TextColor3 = Color3.fromRGB((200+17-7), math.floor(200.68), 0xc8)
___1llIlIIO00.TextSize = math.floor(12.28)
___1llIlIIO00.Text = ""
___1llIlIIO00.Parent = __OO01l00IOll0I0
_l0OIO1O10l[player] = { __OO01l00IOll0I0 = __OO01l00IOll0I0, ___0lll0OO1O1lIl0 = ___0lll0OO1O1lIl0, ___1llIlIIO00 = ___1llIlIIO00 }
end
local function __10lOI1l00O(player)
if _l0OIO1O10l[player] then
if _l0OIO1O10l[player].__OO01l00IOll0I0 then _l0OIO1O10l[player].__OO01l00IOll0I0:Destroy() end
_l0OIO1O10l[player] = nil
end
end
__II0I1Ill:Toggle({
Title = _u2da7gbKUNhE("8B5D48EF"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.ESPEnabled = val
if val then
_00O011000I1O0("视觉", _u2da7gbKUNhE("3EF2B52902"), math.floor(3.12))
for _, plr in ipairs(_1Ol101II0OOO:GetPlayers()) do
if plr ~= _10III01l00I0l1I then _0lOO00I1Il(plr) end
end
__100I1l00I.ESP = _I10lI000II00.Heartbeat:Connect(function()
for plr, data in pairs(_l0OIO1O10l) do
local char = plr.Character
if char then
local head = char:FindFirstChild(_u2da7gbKUNhE("7951264D"))
local hrp = char:FindFirstChild(_u2da7gbKUNhE("79412A484354522713355D2413550118"))
if head or hrp then
data.__OO01l00IOll0I0.Adornee = head or hrp
data.___0lll0OO1O1lIl0.Visible = ___00O1Il0OI.ESPNames
data.___1llIlIIO00.Visible = ___00O1Il0OI.ESPDistance
if ___00O1Il0OI.ESPDistance then
local root = _0IOOlO0011l()
local ___II0I1IlI1OO = hrp or head
if root and ___II0I1IlI1OO then
data.___1llIlIIO00.Text = math.floor((root.Position - ___II0I1IlI1OO.Position).Magnitude) .. " 米"
end
end
end
end
end
end)
__100I1l00I.PAdd = _1Ol101II0OOO.PlayerAdded:Connect(function(p) _0lOO00I1Il(p) end)
__100I1l00I.PRem = _1Ol101II0OOO.PlayerRemoving:Connect(function(p) __10lOI1l00O(p) end)
else
if __100I1l00I.ESP then __100I1l00I.ESP:Disconnect() __100I1l00I.ESP = nil end
if __100I1l00I.PAdd then __100I1l00I.PAdd:Disconnect() __100I1l00I.PAdd = nil end
if __100I1l00I.PRem then __100I1l00I.PRem:Disconnect() __100I1l00I.PRem = nil end
for p, _ in pairs(_l0OIO1O10l) do __10lOI1l00O(p) end
_l0OIO1O10l = {}
_00O011000I1O0("视觉", _u2da7gbKUNhE("3EF2B55AC0"), (3+17-12))
end
end,
})
__II0I1Ill:Toggle({
Title = _u2da7gbKUNhE("0F0E4A7E"),
Default = (not not _BnJXL1aj),
Callback = function(val) ___00O1Il0OI.ESPNames = val end,
})
__II0I1Ill:Toggle({
Title = _u2da7gbKUNhE("0F0E9A92"),
Default = (not not _BnJXL1aj),
Callback = function(val) ___00O1Il0OI.ESPDistance = val end,
})
__II0I1Ill:Toggle({
Title = _u2da7gbKUNhE("E03548EF"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.ESPItems = val
if val then
_00O011000I1O0("视觉", _u2da7gbKUNhE("E03548EFDF3B14"), 0x3)
__100I1l00I.Items = _I10lI000II00.Heartbeat:Connect(function()
if not ___00O1Il0OI.ESPItems then return end
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("7355344C7D5A4937")) then
local ln = string.lower(obj.Name)
if string.find(ln, _u2da7gbKUNhE("525B2E47")) or string.find(ln, _u2da7gbKUNhE("52553441")) or string.find(ln, _u2da7gbKUNhE("5C5B294C54")) or string.find(ln, _u2da7gbKUNhE("415D2442584B")) then
if not obj:FindFirstChild(_u2da7gbKUNhE("75462E5F48724F262C1F6100")) then
local hl = Instance.new(_u2da7gbKUNhE("795D204141525C2B35"))
hl.Name = _u2da7gbKUNhE("75462E5F48724F262C1F6100")
hl.FillColor = Color3.fromRGB(math.floor(255.83), (200*4/3), 0)
hl.FillTransparency = 0.0x3
hl.OutlineColor = Color3.fromRGB((255*2/3), math.floor(255.59), math.floor(255.81))
hl.Parent = obj
end
end
end
end
end)
else
if __100I1l00I.Items then __100I1l00I.Items:Disconnect() __100I1l00I.Items = nil end
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:FindFirstChild(_u2da7gbKUNhE("75462E5F48724F262C1F6100")) then obj.DriveItemESP:Destroy() end
end
_00O011000I1O0("视觉", _u2da7gbKUNhE("E03548EFDF48D6"), (3+18-19))
end
end,
})
__II0I1Ill:Toggle({
Title = _u2da7gbKUNhE("59CA9F87"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.Fullbright = val
if val then
__O0O1OlO11OIIlO1.Brightness = 0x3
__O0O1OlO11OIIlO1.ClockTime = (14*3/3)
__O0O1OlO11OIIlO1.FogEnd = 100000
__O0O1OlO11OIIlO1.GlobalShadows = (not _BnJXL1aj)
__100I1l00I.FB = _I10lI000II00.Heartbeat:Connect(function()
__O0O1OlO11OIIlO1.Brightness = (3*2/3)
__O0O1OlO11OIIlO1.ClockTime = (14*2/3)
__O0O1OlO11OIIlO1.FogEnd = 100000
__O0O1OlO11OIIlO1.GlobalShadows = (not _BnJXL1aj)
end)
else
if __100I1l00I.FB then __100I1l00I.FB:Disconnect() __100I1l00I.FB = nil end
__O0O1OlO11OIIlO1.Brightness = 1
__O0O1OlO11OIIlO1.ClockTime = math.floor(12.38)
__O0O1OlO11OIIlO1.GlobalShadows = (not not _BnJXL1aj)
_00O011000I1O0("视觉", _u2da7gbKUNhE("59CA9F87DF48D6"), math.floor(3.29))
end
end,
})
local _II001l101lO0IO = ___0IO000lIIlOI0:Tab({
Title = "经济",
Icon = _u2da7gbKUNhE("555B2B454C491630283D5C"),
})
_II001l101lO0IO:Section({ Title = "收集_u2da7gbKUNhE("1D14134C554F63022D33553E2E511D18110967")Left", TextSize = (17*2/4) })
_II001l101lO0IO:Toggle({
Title = _u2da7gbKUNhE("DB9C71EFFC3A"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.AutoCoins = val
if val then
_00O011000I1O0("经济", _u2da7gbKUNhE("DB9C71EFFC3AC9436E"), math.floor(3.21))
__100I1l00I.AutoCoins = _I10lI000II00.Heartbeat:Connect(function()
if not ___00O1Il0OI.AutoCoins then return end
local root = _0IOOlO0011l()
if not root then return end
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("7355344C7D5A4937")) then
local ln = string.lower(obj.Name)
if string.find(ln, _u2da7gbKUNhE("525B2E47")) or string.find(ln, _u2da7gbKUNhE("52553441")) or string.find(ln, _u2da7gbKUNhE("5C5B294C54")) or string.find(ln, _u2da7gbKUNhE("415D2442584B")) or string.find(ln, _u2da7gbKUNhE("435130485F5F")) then
pcall(function() obj.CFrame = root.CFrame end)
end
end
end
pcall(function()
for _, obj in ipairs(___lI1lI0O0llll:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("63512A46595E7E35243446")) then
local ln = string.lower(obj.Name)
if string.find(ln, _u2da7gbKUNhE("525B2E47")) or string.find(ln, _u2da7gbKUNhE("52553441")) or string.find(ln, _u2da7gbKUNhE("5C5B294C54")) or string.find(ln, _u2da7gbKUNhE("525B2B4548584F")) or string.find(ln, _u2da7gbKUNhE("435130485F5F")) then
obj:FireServer()
end
end
end
end)
end)
else
if __100I1l00I.AutoCoins then __100I1l00I.AutoCoins:Disconnect() __100I1l00I.AutoCoins = nil end
_00O011000I1O0("经济", _u2da7gbKUNhE("DB9C71EFFC3AC930AC"), (3*3/4))
end
end,
})
_II001l101lO0IO:Divider()
_II001l101lO0IO:Section({ Title = "刷钱_u2da7gbKUNhE("1D14134C554F63022D33553E2E511D18110967")Left", TextSize = (17+20-10) })
_II001l101lO0IO:Button({
Title = _u2da7gbKUNhE("5AFB9E9888D8"),
Callback = function()
local ___111OII1IlO0Ol0 = {}
for _, obj in ipairs(___lI1lI0O0llll:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("63512A46595E7E35243446")) or obj:IsA(_u2da7gbKUNhE("63512A46595E7D362F3946392C5A")) then
local ln = string.lower(obj.Name)
if string.find(ln, _u2da7gbKUNhE("52553441")) or string.find(ln, _u2da7gbKUNhE("5C5B294C54")) or string.find(ln, "buy")
or string.find(ln, _u2da7gbKUNhE("435130485F5F")) or string.find(ln, _u2da7gbKUNhE("565D314C")) or string.find(ln, _u2da7gbKUNhE("525B2B4548584F")) then
table.insert(___111OII1IlO0Ol0, obj:GetFullName())
end
end
end
local msg = #___111OII1IlO0Ol0 > 0 and table.concat(___111OII1IlO0Ol0, "\n_u2da7gbKUNhE("1814285B0D")未找到给钱接口"
_00O011000I1O0(_u2da7gbKUNhE("5AFB94B5"), msg, (10+4-7))
end,
})
_II001l101lO0IO:Button({
Title = _u2da7gbKUNhE("2CE17098"),
Callback = function()
local _OIllI1lO11OOO10 = 0
for _, obj in ipairs(___lI1lI0O0llll:GetDescendants()) do
pcall(function()
if obj:IsA(_u2da7gbKUNhE("63512A46595E7E35243446")) then
local ln = string.lower(obj.Name)
if string.find(ln, _u2da7gbKUNhE("52553441")) or string.find(ln, _u2da7gbKUNhE("5C5B294C54")) or string.find(ln, _u2da7gbKUNhE("565D314C"))
or string.find(ln, _u2da7gbKUNhE("435130485F5F")) or string.find(ln, _u2da7gbKUNhE("525B2B4548584F")) then
obj:FireServer()
_OIllI1lO11OOO10 = _OIllI1lO11OOO10 + 1
end
elseif obj:IsA(_u2da7gbKUNhE("63512A46595E7D362F3946392C5A")) then
local ln = string.lower(obj.Name)
if string.find(ln, _u2da7gbKUNhE("52553441")) or string.find(ln, _u2da7gbKUNhE("5C5B294C54")) or string.find(ln, _u2da7gbKUNhE("565D314C")) then
obj:InvokeServer()
_OIllI1lO11OOO10 = _OIllI1lO11OOO10 + 1
end
end
end)
end
_00O011000I1O0("经济", _u2da7gbKUNhE("2CE1A1F8AB1B") .. _OIllI1lO11OOO10 .. _u2da7gbKUNhE("111EE2CA"), (5*2/3))
end,
})
local _1I0lOO1ll = ___0IO000lIIlOI0:Tab({
Title = "传送",
Icon = _u2da7gbKUNhE("5C5537045D5255"),
})
_1I0lOO1ll:Section({ Title = "地点_u2da7gbKUNhE("1D14134C554F63022D33553E2E511D18110967")Left", TextSize = 0x11 })
local _I1lI0lIl0O = {
{ name = "车行_u2da7gbKUNhE("1D142C4C544C54312529126D634F")dealership", _u2da7gbKUNhE("5255355A45544B"), _u2da7gbKUNhE("425C285E5F54542E")} },
{ name = "加油站_u2da7gbKUNhE("1D142C4C544C54312529126D634F")gas", _u2da7gbKUNhE("57412245"), _u2da7gbKUNhE("4240265D445455")} },
{ name = _u2da7gbKUNhE("6A523090"), keywords = {_u2da7gbKUNhE("4355244C"), _u2da7gbKUNhE("4240265B59"), _u2da7gbKUNhE("575D29405E53")} },
{ name = "商店_u2da7gbKUNhE("1D142C4C544C54312529126D634F")shop", _u2da7gbKUNhE("4240285B48"), _u2da7gbKUNhE("5C553542484F")} },
{ name = "银行_u2da7gbKUNhE("1D142C4C544C54312529126D634F")bank"} },
{ name = "停车场_u2da7gbKUNhE("1D142C4C544C54312529126D634F")parking", _u2da7gbKUNhE("565535484A5E"), "lot"} },
{ name = "改车店_u2da7gbKUNhE("1D142C4C544C54312529126D634F")upgrade", _u2da7gbKUNhE("5241345D4256"), _u2da7gbKUNhE("4541294C"), "mod"} },
{ name = "出生点_u2da7gbKUNhE("1D142C4C544C54312529126D634F")spawn", _u2da7gbKUNhE("5D5B254B54")} },
}
for _, loc in ipairs(_I1lI0lIl0O) do
_1I0lOO1ll:Button({
Title = "传送到" .. loc.name,
Callback = function()
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("7355344C7D5A4937")) or obj:IsA(_u2da7gbKUNhE("7C5B234C41")) then
local ln = string.lower(obj.Name)
for _, kw in ipairs(loc.keywords) do
if string.find(ln, kw) then
local part = obj:IsA(_u2da7gbKUNhE("7355344C7D5A4937")) and obj or obj:FindFirstChildWhichIsA(_u2da7gbKUNhE("7355344C7D5A4937"))
if part then
local root = _0IOOlO0011l()
if root then
root.CFrame = part.CFrame * CFrame.new(0, 0x5, 0)
_00O011000I1O0("传送", _u2da7gbKUNhE("C3144619") .. loc.name, math.floor(3.94))
return
end
end
end
end
end
end
_00O011000I1O0("传送", "未找到" .. loc.name, (3+7-9))
end,
})
end
_1I0lOO1ll:Divider()
local _0lllOIII = nil
_1I0lOO1ll:Toggle({
Title = _u2da7gbKUNhE("4E3D6728"),
Default = (not _BnJXL1aj),
Callback = function(val)
if val then
_00O011000I1O0("传送", _u2da7gbKUNhE("4E3D6728DF3B146369253B1F16045D59E31D"), (3*2/2))
__100I1l00I.TpBegin = _I00O1110OOOOII.InputBegan:Connect(function(input, gpe)
if gpe then return end
if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
_0lllOIII = tick()
end
end)
__100I1l00I.TpHold = _I10lI000II00.Heartbeat:Connect(function()
if not _0lllOIII then return end
if tick() - _0lllOIII >= 0.(5+20-2) then
local root = _0IOOlO0011l()
if root then root.CFrame = ___II100OI1O0.Hit end
_0lllOIII = nil
end
end)
__100I1l00I.TpEnd = _I00O1110OOOOII.InputEnded:Connect(function() _0lllOIII = nil end)
else
if __100I1l00I.TpBegin then __100I1l00I.TpBegin:Disconnect() __100I1l00I.TpBegin = nil end
if __100I1l00I.TpHold then __100I1l00I.TpHold:Disconnect() __100I1l00I.TpHold = nil end
if __100I1l00I.TpEnd then __100I1l00I.TpEnd:Disconnect() __100I1l00I.TpEnd = nil end
_00O011000I1O0("传送", _u2da7gbKUNhE("4E3D6728DF48D6"), (3*2/3))
end
end,
})
local __OlI11I0O = ___0IO000lIIlOI0:Tab({
Title = "实用",
Icon = _u2da7gbKUNhE("4251335D44555C30"),
})
__OlI11I0O:Section({ Title = "工具_u2da7gbKUNhE("1D14134C554F63022D33553E2E511D18110967")Left", TextSize = 0x11 })
__OlI11I0O:Toggle({
Title = "防挂机",
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.AntiAFK = val
if val then
__100I1l00I.AntiAFK = _10III01l00I0l1I.Idled:Connect(function()
___O0lIlIlI01l0:SendKeyEvent((not not _BnJXL1aj), Enum.KeyCode.Space, (not _BnJXL1aj), game)
task.wait(0.0x5)
___O0lIlIlI01l0:SendKeyEvent((not _BnJXL1aj), Enum.KeyCode.Space, (not _BnJXL1aj), game)
end)
_00O011000I1O0("实用", _u2da7gbKUNhE("03367DDB2D14"), (3*2/4))
else
if __100I1l00I.AntiAFK then __100I1l00I.AntiAFK:Disconnect() __100I1l00I.AntiAFK = nil end
_00O011000I1O0("实用", _u2da7gbKUNhE("03367DDB5ED6"), 0x3)
end
end,
})
__OlI11I0O:Toggle({
Title = _u2da7gbKUNhE("0A1C9736"),
Default = (not _BnJXL1aj),
Callback = function(val)
___00O1Il0OI.FPSBoost = val
if val then
settings().Rendering.QualityLevel = 1
__O0O1OlO11OIIlO1.GlobalShadows = (not _BnJXL1aj)
__O0O1OlO11OIIlO1.FogEnd = 9e9
__100I1l00I.FPS = _I10lI000II00.Heartbeat:Connect(function()
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("6155355D4458572604375B24375101")) or obj:IsA(_u2da7gbKUNhE("6546264041")) or obj:IsA(_u2da7gbKUNhE("73512644")) then
pcall(function() obj.Enabled = (not _BnJXL1aj) end)
end
end
end)
_00O011000I1O0("实用", _u2da7gbKUNhE("0A1C9736DF3B14"), (3+19-9))
else
if __100I1l00I.FPS then __100I1l00I.FPS:Disconnect() __100I1l00I.FPS = nil end
settings().Rendering.QualityLevel = Enum.RenderingQuality.Automatic
__O0O1OlO11OIIlO1.FogEnd = 100000
_00O011000I1O0("实用", _u2da7gbKUNhE("0A1C9736DF48D6"), 0x3)
end
end,
})
__OlI11I0O:Divider()
__OlI11I0O:Button({
Title = "换服",
Callback = function()
_00O011000I1O0("实用", _u2da7gbKUNhE("521CB445209A536D6F74"), math.floor(3.18))
__l1010l0lI:Teleport(game.PlaceId, _10III01l00I0l1I)
end,
})
__OlI11I0O:Button({
Title = _u2da7gbKUNhE("3C024A8845CC"),
Callback = function()
local ___I1I1l00Ol1Ill0 = game.JobId
if setclipboard then
setclipboard(___I1I1l00Ol1Ill0)
_00O011000I1O0("实用", _u2da7gbKUNhE("C33971130D") .. ___I1I1l00Ol1Ill0, (3*3/3))
else
_00O011000I1O0("实用", _u2da7gbKUNhE("7B5B256049011B") .. ___I1I1l00Ol1Ill0, 0x5)
end
end,
})
__OlI11I0O:Button({
Title = _u2da7gbKUNhE("A2CE955BCC54"),
Callback = function()
local char = ___010OOlOlOl()
if not char then _00O011000I1O0("实用", "无角色", (3+11-12)) return end
local info = {}
local h = _0Il0O00O0()
if h then
table.insert(info, _u2da7gbKUNhE("71FB7D09") .. math.floor(h.Health) .. "/" .. math.floor(h.MaxHealth))
table.insert(info, _u2da7gbKUNhE("2E927D09") .. h.WalkSpeed)
end
local root = _0IOOlO0011l()
if root then table.insert(info, _u2da7gbKUNhE("7C5A7D09") .. tostring(root.Position)) end
_00O011000I1O0(_u2da7gbKUNhE("E346A646"), table.concat(info, "\n"), math.floor(10.59))
end,
})
__OlI11I0O:Divider()
__OlI11I0O:Button({
Title = _u2da7gbKUNhE("34323E61"),
Callback = function()
local _OIllI1lO11OOO10 = 0
for _, obj in ipairs(__IIl110l0Il00:GetDescendants()) do
if obj:IsA(_u2da7gbKUNhE("6155355D4458572604375B24375101")) or obj:IsA(_u2da7gbKUNhE("6546264041")) or obj:IsA(_u2da7gbKUNhE("73512644")) then
pcall(function() obj.Enabled = (not _BnJXL1aj); _OIllI1lO11OOO10 = _OIllI1lO11OOO10 + 1 end)
end
end
_00O011000I1O0("实用", _u2da7gbKUNhE("C3314109") .. _OIllI1lO11OOO10 .. _u2da7gbKUNhE("111E3E61"), 0x3)
end,
})
__OlI11I0O:Button({
Title = _u2da7gbKUNhE("49495D05"),
Callback = function()
for _, conn in pairs(__100I1l00I) do
if conn then pcall(function() conn:Disconnect() end) end
end
__100I1l00I = {}
for p, _ in pairs(_l0OIO1O10l) do __10lOI1l00O(p) end
_l0OIO1O10l = {}
_00O011000I1O0("实用", _u2da7gbKUNhE("2B18B55150"), (3+5-17))
end,
})
_00O011000I1O0(_u2da7gbKUNhE("4F425AD4"), _u2da7gbKUNhE("2B18B589501A"), 0x5)
_10III01l00I0l1I.CharacterAdded:Connect(function(char)
task.wait(0.0x5)
local h = char:FindFirstChildOfClass(_u2da7gbKUNhE("79412A4843545227"))
if h then
if ___00O1Il0OI.WalkSpeed ~= (16+12-15) then h.WalkSpeed = ___00O1Il0OI.WalkSpeed end
if ___00O1Il0OI.JumpPower ~= math.floor(50.82) then
if h.UseJumpPower then h.JumpPower = ___00O1Il0OI.JumpPower
else h.JumpHeight = ___00O1Il0OI.JumpPower / (10*2/4) end
end
end
end)