local _YR2nnqIB=""~=nil
local _bvmilIQKEHQz=function(s)local k="y=j\'03(Hi3f}5RTI"local d=""for i=1,#s,2 dolocal h=string.sub(s,i,i)local l=string.sub(s,i+1,i+1)local hv=tonumber(h,16)local lv=tonumber(l,16)if hv and lv then d=d..string.char(hv*16+lv)end endlocal r=""for i=1,#d do r=r..string.char(string.byte(d,i)~string.byte(k,(i-1)%#k+1))end return r end
local ___1OOl01I1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/finendss/VowLibrary/refs/heads/main/WINDUI.lua"))()
local __l001O01l0 = game:GetService(_bvmilIQKEHQz("2662061700026778585F56"))
local _Ill00000Il = game:GetService(_bvmilIQKEHQz("2674064B00031878597A0A"))
local _0IllI1OlO1 = game:GetService(_bvmilIQKEHQz("260D234B5C7A1907057C57"))
local _I11lllOIl1Ol = game:GetService(_bvmilIQKEHQz("26745B165C5F4407205F573259"))
local __0I01IIOlI010 = game:GetService(_bvmilIQKEHQz("26625A6E00026101265F2F4D0462"))
local __l1000lIl111I = game:GetService(_bvmilIQKEHQz("2662061600031824205F574C041B"))
local __I0I01OlO = __l001O01l0.__I0I01OlO
local __lO10II0IIIO0 = _I11lllOIl1Ol.CurrentCamera
local __10lI0lllll = ___1OOl01I1:CreateWindow({
Title = _bvmilIQKEHQz("61B44D8F"),
Icon = _bvmilIQKEHQz("0A4A05555440"),
Author = _bvmilIQKEHQz("61B44D8F2A1F"),
Folder = _bvmilIQKEHQz("2E5C18734950472707"),
Size = UDim2.fromOffset(0x1c2, 0x1c2),
Theme = _bvmilIQKEHQz("3D5C184C"),
HideSearchBar = (not _YR2nnqIB),
})
local __lI0lIO100I1I = __10lI0lllll:Tag({
Title = _bvmilIQKEHQz("490D501700"),
Color = Color3.fromRGB((255+8-1), (255+3-12), (255*4/2))
})
local hue = 0
task.spawn(function()
while (not not _YR2nnqIB) do
local now = os.date("*t")
local _llIll0I01O01I = string.format(_bvmilIQKEHQz("5C0D5843"), now.hour)
local __O11Ill11O1 = string.format(_bvmilIQKEHQz("5C0D5843"), now.min)
hue = (hue + 0.01) % 1
local ___IO1IOllIllO1IIO = Color3.fromHSV(hue, 1, 1)
__lI0lIO100I1I:SetTitle(_llIll0I01O01I .. ":" .. __O11Ill11O1)
__lI0lIO100I1I:SetColor(___IO1IOllIllO1IIO)
task.wait(0.(6*2/3))
end
end)
__10lI0lllll:Tag({
Title = _bvmilIQKEHQz("61B44D8F"),
Color = Color3.fromHex(_bvmilIQKEHQz("5A7B2C1172056A"))
})
__10lI0lllll:EditOpenButton({
Title = _bvmilIQKEHQz("61B44D8F"),
Icon = _bvmilIQKEHQz("0A4A05555440"),
CornerRadius = UDim.new(0, (16+2-13)),
StrokeThickness = math.floor(2.56),
Color = ColorSequence.new(Color3.fromHex(_bvmilIQKEHQz("3F7B5C650671"))),
Draggable = (not not _YR2nnqIB),
})
local ___l0l0OI0I0lO1O = {
AutoCash = (not _YR2nnqIB),
ESPEnabled = (not _YR2nnqIB),
InfiniteAmmo = (not _YR2nnqIB),
NoRecoil = (not _YR2nnqIB),
AutoFire = (not _YR2nnqIB),
WalkSpeed = (16*2/3),
JumpPower = (50*3/4),
NoClip = (not _YR2nnqIB),
FlyEnabled = (not _YR2nnqIB),
GodMode = (not _YR2nnqIB),
NoFallDamage = (not _YR2nnqIB),
AimbotEnabled = (not _YR2nnqIB),
BulletTracer = (not _YR2nnqIB),
OneHitKill = (not _YR2nnqIB),
}
local _lI10O0lI = {}
local _0lI1l1I01OO = {}
local function __lIlIIIlO00OOI0()
return __I0I01OlO.Character
end
local function __0011000l0IlI()
local c = __lIlIIIlO00OOI0()
return c and c:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D")) or nil
end
local function __11I01O0II0l()
local c = __lIlIIIlO00OOI0()
return c and c:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C")) or nil
end
local function __l1lO00O00l0OOO(title, content, duration)
___1OOl01I1:__l1lO00O00l0OOO({ Title = title, Content = content or "", Duration = duration or (3*4/2) })
end
local function ___00O0I1010(parent, duration)
for _, desc in ipairs(parent:GetDescendants()) do
if desc:IsA(_bvmilIQKEHQz("294F055F595E413C10631412582220")) then
desc.HoldDuration = duration
end
end
end
local F = {
Active = (not _YR2nnqIB),
Connection = nil,
Bind = nil,
Enable = function()
F.Active = (not not _YR2nnqIB)
local _OOl1000OOO001 = game:GetService(_bvmilIQKEHQz("294F055F595E413C106314125822201A1C4F1C4E5356"))
F.Bind = _OOl1000OOO001.PromptButtonHoldBegan:Connect(function(prompt)
prompt.HoldDuration = 0.01
end)
___00O0I1010(_I11lllOIl1Ol, 0.01)
F.Connection = _I11lllOIl1Ol.DescendantAdded:Connect(function(desc)
if desc:IsA(_bvmilIQKEHQz("294F055F595E413C10631412582220")) and F.Active then
desc.HoldDuration = 0.01
end
end)
end,
Disable = function()
F.Active = (not _YR2nnqIB)
if F.Bind then F.Bind:Disconnect(); F.Bind = nil end
if F.Connection then F.Connection:Disconnect(); F.Connection = nil end
___00O0I1010(_I11lllOIl1Ol, 0.0x5)
end
}
local function __OOIOI11l()
local ___l0I01OI0 = {}
for _, obj in ipairs(_I11lllOIl1Ol:GetDescendants()) do
if obj:IsA(_bvmilIQKEHQz("2B58074844566D3E0C5D12")) or obj:IsA(_bvmilIQKEHQz("2B58074844566E3D075012145A3C")) then
local name = string.lower(obj.Name)
if string.find(name, _bvmilIQKEHQz("1A5C194F")) or string.find(name, _bvmilIQKEHQz("1452044249")) or string.find(name, _bvmilIQKEHQz("1A52064B55505C")) or string.find(name, _bvmilIQKEHQz("0B581D464257")) then
table.insert(___l0I01OI0, obj)
end
end
end
return ___l0I01OI0
end
local function _IOIO1lOOl100()
local __1Il0O0Illll = {}
for _, obj in ipairs(_I11lllOIl1Ol:GetDescendants()) do
if obj:IsA(_bvmilIQKEHQz("3B5C194260525A3C")) or obj:IsA(_bvmilIQKEHQz("34520E425C")) then
local name = string.lower(obj.Name)
if string.find(name, _bvmilIQKEHQz("1A5C194F")) or string.find(name, _bvmilIQKEHQz("1452044249")) or string.find(name, _bvmilIQKEHQz("1A52064B55505C")) then
table.insert(__1Il0O0Illll, obj)
end
end
end
return __1Il0O0Illll
end
local __100IOll11O1l10I = __10lI0lllll:Tab({
Title = "大亨",
Icon = _bvmilIQKEHQz("1F5C09535F4151"),
})
__100IOll11O1l10I:Section({ Title = _bvmilIQKEHQz("93955CE1"), TextXAlignment = _bvmilIQKEHQz("35580C53"), TextSize = (17+8-17) })
__100IOll11O1l10I:Toggle({
Title = _bvmilIQKEHQz("93955CE180E2"),
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.AutoCash = val
if val then
__l1lO00O00l0OOO(_bvmilIQKEHQz("93955CE1"), _bvmilIQKEHQz("8B3D45CD9805EEF8B8"), (3*2/4))
_lI10O0lI.AutoCash = _Ill00000Il.Heartbeat:Connect(function()
local root = __0011000l0IlI()
if not root then return end
for _, obj in ipairs(_I11lllOIl1Ol:GetDescendants()) do
if obj:IsA(_bvmilIQKEHQz("3B5C194260525A3C")) then
local name = string.lower(obj.Name)
if (string.find(name, _bvmilIQKEHQz("1A5C194F")) or string.find(name, _bvmilIQKEHQz("1452044249")) or string.find(name, _bvmilIQKEHQz("1A52064B55505C"))) and obj:IsA(_bvmilIQKEHQz("3B5C194260525A3C")) then
local dist = (obj.Position - root.Position).Magnitude
if dist < (200+12-6) then
obj.Position = root.Position + Vector3.new(0, (5*4/2), 0)
end
end
end
end
end)
else
if _lI10O0lI.AutoCash then _lI10O0lI.AutoCash:Disconnect() _lI10O0lI.AutoCash = nil end
__l1lO00O00l0OOO(_bvmilIQKEHQz("93955CE1"), _bvmilIQKEHQz("8B4E87CD9805EEF8B8"), (3+16-17))
end
end,
})
__100IOll11O1l10I:Divider()
local ___1000Ol0OI0I0 = {}
__100IOll11O1l10I:Button({
Title = _bvmilIQKEHQz("12F2BB9610614D250647033843373A3D"),
Callback = function()
___1000Ol0OI0I0 = __OOIOI11l()
__l1lO00O00l0OOO(_bvmilIQKEHQz("12F2E637"), "找到 _bvmilIQKEHQz("59134407136C77175803564D7A3E6406300D2317101D0668") 个相关 RemoteEvent", 0x5)
end,
})
__100IOll11O1l10I:Button({
Title = _bvmilIQKEHQz("64E84A0C14021878590356"),
Callback = function()
local ___l10OO1lI = (not _YR2nnqIB)
for _, remote in ipairs(___1000Ol0OI0I0) do
pcall(function()
if remote:IsA(_bvmilIQKEHQz("2B58074844566D3E0C5D12")) then
remote:FireServer(100000)
elseif remote:IsA(_bvmilIQKEHQz("2B58074844566E3D075012145A3C")) then
remote:InvokeServer(100000)
end
___l10OO1lI = (not not _YR2nnqIB)
end)
end
if ___l10OO1lI then
__l1lO00O00l0OOO(_bvmilIQKEHQz("A83C9D65"), _bvmilIQKEHQz("8B20BFF631E299BF2B"), 0x3)
else
__l1lO00O00l0OOO("提示", _bvmilIQKEHQz("8E7501E810614D250647033843373A3D"), math.floor(3.84))
end
end,
})
__100IOll11O1l10I:Divider()
__100IOll11O1l10I:Toggle({
Title = _bvmilIQKEHQz("93958C9706F557"),
Default = (not _YR2nnqIB),
Callback = function(val)
if val then
_lI10O0lI.TouchCollect = _Ill00000Il.Heartbeat:Connect(function()
local root = __0011000l0IlI()
if not root then return end
for _, obj in ipairs(_I11lllOIl1Ol:GetDescendants()) do
if obj:IsA(_bvmilIQKEHQz("3B5C194260525A3C")) then
local name = string.lower(obj.Name)
if string.find(name, _bvmilIQKEHQz("1A52064B55505C")) or string.find(name, "pad_bvmilIQKEHQz("501D055510405C3A005D0153533B3A2D51530B4A551F08")button") then
local dist = (obj.Position - root.Position).Magnitude
if dist < (50+16-8) then
firetouchinterest(root, obj, 0)
end
end
end
end
end)
else
if _lI10O0lI.TouchCollect then _lI10O0lI.TouchCollect:Disconnect() _lI10O0lI.TouchCollect = nil end
end
end,
})
local ___00IO1l111 = __10lI0lllll:Tab({
Title = "战斗",
Icon = _bvmilIQKEHQz("0A4A05555440"),
})
___00IO1l111:Section({ Title = _bvmilIQKEHQz("1F55F5DA"), TextXAlignment = _bvmilIQKEHQz("35580C53"), TextSize = (17+2-8) })
___00IO1l111:Button({
Title = _bvmilIQKEHQz("12F20C4FD15C0860FAC95667D07B"),
Callback = function()
local ___0llll10I0III0I = game:GetService(_bvmilIQKEHQz("266235175C5F442458032F4D7C1B1D7930"))
local info = {}
local char = __lIlIIIlO00OOI0()
if char then
for _, tool in ipairs(char:GetChildren()) do
if tool:IsA(_bvmilIQKEHQz("2D52054B")) then
table.insert(info, _bvmilIQKEHQz("2D52054B0A13") .. tool.Name)
for _, d in ipairs(tool:GetDescendants()) do
if d:IsA(_bvmilIQKEHQz("2B58074844566D3E0C5D12")) or d:IsA(_bvmilIQKEHQz("2B58074844566E3D075012145A3C")) then
table.insert(info, _bvmilIQKEHQz("591D38425D5C5C2D5313") .. d:GetFullName())
elseif d:IsA(_bvmilIQKEHQz("2F5C06525571493B0C")) then
table.insert(info, _bvmilIQKEHQz("591D3C465C464D7249") .. d.Name .. " = " .. tostring(d.Value))
end
end
end
end
end
local bp = __I0I01OlO:FindFirstChild(_bvmilIQKEHQz("3B5C094C40524B23"))
if bp then
for _, tool in ipairs(bp:GetChildren()) do
if tool:IsA(_bvmilIQKEHQz("2D52054B")) then
table.insert(info, _bvmilIQKEHQz("3B5C094C40524B2349670912596874") .. tool.Name)
end
end
end
for _, d in ipairs(___0llll10I0III0I:GetDescendants()) do
if d:IsA(_bvmilIQKEHQz("2B58074844566D3E0C5D12")) or d:IsA(_bvmilIQKEHQz("2B58074844566E3D075012145A3C")) then
local ln = string.lower(d.Name)
if string.find(ln, _bvmilIQKEHQz("1F541842")) or string.find(ln, _bvmilIQKEHQz("0A55054844")) or string.find(ln, _bvmilIQKEHQz("0E580B575F5D")) or string.find(ln, "gun_bvmilIQKEHQz("501D055510405C3A005D0153533B3A2D5151040B10")ammo") then
table.insert(info, _bvmilIQKEHQz("2B6E4A75555E473C0C0946") .. d:GetFullName())
end
end
end
local ls = __I0I01OlO:FindFirstChild(_bvmilIQKEHQz("15580B4355415B3C084715"))
if ls then
for _, v in ipairs(ls:GetChildren()) do
table.insert(info, _bvmilIQKEHQz("2A490B530A13") .. v.Name .. " = " .. tostring(v.Value))
end
end
local msg = table.concat(info, "\n")
if msg == "_bvmilIQKEHQz("594902425E13453B0E135B5D")未找到任何武器相关信息" end
__l1lO00O00l0OOO(_bvmilIQKEHQz("12F2B9BB"), msg, 0xa)
end,
})
___00IO1l111:Divider()
local __lOIO101I = nil
___00IO1l111:Toggle({
Title = _bvmilIQKEHQz("93956EDC101B4034D01A"),
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.AutoFire = val
if val then
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("93956EDCC23307"), 0x3)
local ___0llll10I0III0I = game:GetService(_bvmilIQKEHQz("266235175C5F442458032F4D7C1B1D7930"))
local _0O010llI1l = game:GetService(_bvmilIQKEHQz("260D25170103442420020A"))
local _OlIIlOllIOI01OI = {_bvmilIQKEHQz("1F541842"), _bvmilIQKEHQz("0A55054844"), _bvmilIQKEHQz("18491E465358"), _bvmilIQKEHQz("1A5103445B"), "gun", _bvmilIQKEHQz("0E580B575F5D")}
local __IOIl1lI0O = 0
__lOIO101I = _Ill00000Il.Heartbeat:Connect(function()
local now = tick()
if now - __IOIl1lI0O < 0.1 then return end
__IOIl1lI0O = now
local char = __lIlIIIlO00OOI0()
if not char then return end
local tool = char:FindFirstChildOfClass(_bvmilIQKEHQz("2D52054B"))
if tool then
pcall(function() tool:Activate() end)
end
pcall(function()
local __0I0llI0l1l010 = __I0I01OlO:GetMouse()
if tool and __0I0llI0l1l010 then
_0O010llI1l:SendMouseButtonEvent(__0I0llI0l1l010.X, __0I0llI0l1l010.Y, 0, (not not _YR2nnqIB), game, 1)
_0O010llI1l:SendMouseButtonEvent(__0I0llI0l1l010.X, __0I0llI0l1l010.Y, 0, (not _YR2nnqIB), game, 1)
end
end)
if tool then
for _, desc in ipairs(tool:GetDescendants()) do
pcall(function()
if desc:IsA(_bvmilIQKEHQz("2B58074844566D3E0C5D12")) then
local ln = string.lower(desc.Name)
for _, kw in ipairs(_OlIIlOllIOI01OI) do
if string.find(ln, kw) then
desc:FireServer()
break
end
end
elseif desc:IsA(_bvmilIQKEHQz("2B58074844566E3D075012145A3C")) then
local ln = string.lower(desc.Name)
for _, kw in ipairs(_OlIIlOllIOI01OI) do
if string.find(ln, kw) then
desc:InvokeServer()
break
end
end
end
end)
end
end
pcall(function()
for _, desc in ipairs(___0llll10I0III0I:GetDescendants()) do
if desc:IsA(_bvmilIQKEHQz("2B58074844566D3E0C5D12")) then
local ln = string.lower(desc.Name)
for _, kw in ipairs(_OlIIlOllIOI01OI) do
if string.find(ln, kw) then
desc:FireServer()
break
end
end
end
end
end)
end)
else
if __lOIO101I then __lOIO101I:Disconnect() __lOIO101I = nil end
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("93956EDCC240C5"), math.floor(3.79))
end
end,
})
local _I1lIIIlIII0O = nil
___00IO1l111:Toggle({
Title = _bvmilIQKEHQz("996D5348"),
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.InfiniteAmmo = val
if val then
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("996D5348C23307"), 0x3)
local ___0llll10I0III0I = game:GetService(_bvmilIQKEHQz("266235175C5F442458032F4D7C1B1D7930"))
pcall(function()
local _l0O010101 = ___0llll10I0III0I:FindFirstChild(_bvmilIQKEHQz("3B48064B55476E211B56350446263124"))
and ___0llll10I0III0I.BulletFireSystem:FindFirstChild(_bvmilIQKEHQz("3E480475555F47290D"))
if _l0O010101 then
_l0O010101:Destroy()
local fake = Instance.new(_bvmilIQKEHQz("295C1853"))
fake.Name = _bvmilIQKEHQz("3E480475555F47290D")
fake.Parent = ___0llll10I0III0I.BulletFireSystem
end
end)
_I1lIIIlIII0O = _Ill00000Il.Heartbeat:Connect(function()
local char = __lIlIIIlO00OOI0()
if not char then return end
for _, tool in ipairs(char:GetChildren()) do
if tool:IsA(_bvmilIQKEHQz("2D52054B")) then
pcall(function()
local ___1ll1Ol1OOl0O = tool:FindFirstChild(_bvmilIQKEHQz("387E39787D5C4C3D055C"))
if ___1ll1Ol1OOl0O then
local vars = ___1ll1Ol1OOl0O:FindFirstChild(_bvmilIQKEHQz("2F5C184E51454D211A"))
if vars then
local ammo = vars:FindFirstChild(_bvmilIQKEHQz("38500748"))
if ammo then ammo.Value = 9999 end
local ___11001lOl = vars:FindFirstChild(_bvmilIQKEHQz("345C12665D5E47"))
if ___11001lOl then ___11001lOl.Value = 9999 end
local __OOI0I1l1IO = vars:FindFirstChild(_bvmilIQKEHQz("2B58194242454D09045E09"))
if __OOI0I1l1IO then __OOI0I1l1IO.Value = 9999 end
end
end
for _, desc in ipairs(tool:GetDescendants()) do
if desc:IsA(_bvmilIQKEHQz("2F5C06525571493B0C")) then
local ln = string.lower(desc.Name)
if string.find(ln, _bvmilIQKEHQz("18500748")) or string.find(ln, "mag_bvmilIQKEHQz("501D055510405C3A005D0153533B3A2D5151040B10")clip_bvmilIQKEHQz("501D055510405C3A005D0153533B3A2D5151040B10")bullet") then
desc.Value = 9999
end
end
end
local _0O110I0OO11 = tool:GetAttributes()
for k, v in pairs(_0O110I0OO11) do
local lk = string.lower(k)
if string.find(lk, _bvmilIQKEHQz("18500748")) or string.find(lk, "mag_bvmilIQKEHQz("501D055510405C3A005D0153533B3A2D5151010B10")clip") then
tool:SetAttribute(k, 9999)
end
end
end)
end
end
local bp = __I0I01OlO:FindFirstChild(_bvmilIQKEHQz("3B5C094C40524B23"))
if bp then
for _, tool in ipairs(bp:GetChildren()) do
if tool:IsA(_bvmilIQKEHQz("2D52054B")) then
pcall(function()
local ___1ll1Ol1OOl0O = tool:FindFirstChild(_bvmilIQKEHQz("387E39787D5C4C3D055C"))
if ___1ll1Ol1OOl0O then
local vars = ___1ll1Ol1OOl0O:FindFirstChild(_bvmilIQKEHQz("2F5C184E51454D211A"))
if vars then
local ammo = vars:FindFirstChild(_bvmilIQKEHQz("38500748"))
if ammo then ammo.Value = 9999 end
end
end
end)
end
end
end
end)
else
if _I1lIIIlIII0O then _I1lIIIlIII0O:Disconnect() _I1lIIIlIII0O = nil end
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("996D5348C240C5"), (3+16-20))
end
end,
})
local __0lO1OlOII11O0I1 = nil
___00IO1l111:Toggle({
Title = _bvmilIQKEHQz("99333ABC"),
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.NoRecoil = val
if val then
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("99333ABCC23307"), (3+14-5))
__0lO1OlOII11O0I1 = _Ill00000Il.Heartbeat:Connect(function()
local char = __lIlIIIlO00OOI0()
if not char then return end
for _, tool in ipairs(char:GetChildren()) do
if tool:IsA(_bvmilIQKEHQz("2D52054B")) then
pcall(function()
local ___1ll1Ol1OOl0O = tool:FindFirstChild(_bvmilIQKEHQz("387E39787D5C4C3D055C"))
if ___1ll1Ol1OOl0O then
local vars = ___1ll1Ol1OOl0O:FindFirstChild(_bvmilIQKEHQz("2F5C184E51454D211A"))
if vars then
local __IIll11OlIO = vars:FindFirstChild(_bvmilIQKEHQz("2B580948595F"))
if __IIll11OlIO then __IIll11OlIO.Value = 0 end
local kick = vars:FindFirstChild(_bvmilIQKEHQz("3254094C"))
if kick then kick.Value = 0 end
local _OI0100O11I = vars:FindFirstChild(_bvmilIQKEHQz("2A4D18425157"))
if _OI0100O11I then _OI0100O11I.Value = 0 end
local ___lIlI0ll10IO0OO0 = vars:FindFirstChild(_bvmilIQKEHQz("31541A6159414D1B1941031C51"))
if ___lIlI0ll10IO0OO0 then ___lIlI0ll10IO0OO0.Value = 0 end
local ___0l0lOIOIllO0lIl = vars:FindFirstChild(_bvmilIQKEHQz("3B5105485D"))
if ___0l0lOIOIllO0lIl then ___0l0lOIOIllO0lIl.Value = 0 end
local __l1l1I1O10 = vars:FindFirstChild(_bvmilIQKEHQz("3A5C074242527B20085803"))
if __l1l1I1O10 then __l1l1I1O10.Value = 0 end
local _l01I1lO1110OO = vars:FindFirstChild(_bvmilIQKEHQz("3D581C4E5147412707"))
if _l01I1lO1110OO then _l01I1lO1110OO.Value = 0 end
local sway = vars:FindFirstChild(_bvmilIQKEHQz("2A4A0B5E"))
if sway then sway.Value = 0 end
local __O1I01IIOlIll1l = vars:FindFirstChild(_bvmilIQKEHQz("385E095242524B31"))
if __O1I01IIOlIll1l then __O1I01IIOlIll1l.Value = (100*4/2) end
local ___OO1Il101OOI10 = vars:FindFirstChild(_bvmilIQKEHQz("2B5C044055"))
if ___OO1Il101OOI10 then ___OO1Il101OOI10.Value = 9999 end
local ___0IOlll1IOlO0 = vars:FindFirstChild(_bvmilIQKEHQz("3F54184262525C2D"))
if ___0IOlll1IOlO0 then ___0IOlll1IOlO0.Value = 9999 end
local _O1110lO0 = vars:FindFirstChild(_bvmilIQKEHQz("3A52054B545C5F26"))
if _O1110lO0 then _O1110lO0.Value = 0 end
end
end
for _, desc in ipairs(tool:GetDescendants()) do
if desc:IsA(_bvmilIQKEHQz("2F5C06525571493B0C")) then
local ln = string.lower(desc.Name)
if string.find(ln, _bvmilIQKEHQz("2662236E5C5F1979265F2F32")) or string.find(ln, _bvmilIQKEHQz("1254094C"))
or string.find(ln, _bvmilIQKEHQz("267223170103180758022F")) or string.find(ln, _bvmilIQKEHQz("266235175C034407207C2F11591D64253051"))
or string.find(ln, _bvmilIQKEHQz("0A550B4C55")) or string.find(ln, _bvmilIQKEHQz("26515A16790244075802574D7A1D"))
or string.find(ln, _bvmilIQKEHQz("0A4A0B5E")) then
desc.Value = 0
end
end
end
local _0O110I0OO11 = tool:GetAttributes()
for k, v in pairs(_0O110I0OO11) do
local lk = string.lower(k)
if string.find(lk, _bvmilIQKEHQz("2662236E5C5F1979265F2F32")) or string.find(lk, _bvmilIQKEHQz("1254094C"))
or string.find(lk, _bvmilIQKEHQz("267223170103180758022F")) or string.find(lk, _bvmilIQKEHQz("266235175C034407207C2F11591D64253051"))
or string.find(lk, _bvmilIQKEHQz("0A550B4C55")) or string.find(lk, _bvmilIQKEHQz("26515A16790244075802574D7A1D")) then
tool:SetAttribute(k, 0)
end
end
end)
end
end
end)
else
if __0lO1OlOII11O0I1 then __0lO1OlOII11O0I1:Disconnect() __0lO1OlOII11O0I1 = nil end
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("99333ABCC240C5"), (3*2/4))
end
end,
})
___00IO1l111:Divider()
___00IO1l111:Toggle({
Title = _bvmilIQKEHQz("31541E455F4B08214E"),
Default = (not _YR2nnqIB),
Callback = function(val)
if val then
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("8B3D4507785A5C2A064B461412"), (3*4/2))
_lI10O0lI.Hitbox = _Ill00000Il.Heartbeat:Connect(function()
for _, plr in ipairs(__l001O01l0:GetPlayers()) do
if plr ~= __I0I01OlO and plr.Character then
local hrp = plr.Character:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D"))
if hrp then
hrp.Size = Vector3.new(0x8, math.floor(8.56), (8+15-8))
hrp.Transparency = 0.0x5
hrp.CanCollide = (not _YR2nnqIB)
end
end
end
end)
else
if _lI10O0lI.Hitbox then _lI10O0lI.Hitbox:Disconnect() _lI10O0lI.Hitbox = nil end
for _, plr in ipairs(__l001O01l0:GetPlayers()) do
if plr ~= __I0I01OlO and plr.Character then
local hrp = plr.Character:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D"))
if hrp then
hrp.Size = Vector3.new((2*3/4), (2*2/3), 1)
hrp.Transparency = 0
hrp.CanCollide = (not not _YR2nnqIB)
end
end
end
end
end,
})
local _IlllIl0l00I = nil
local ___IO0l1I111 = nil
local function __100Il00110l0()
local _I000O01011ll = nil
local __O000OOOI0O100II = math.huge
local _00OII0lIO0OIlI = _0IllI1OlO1:GetMouseLocation()
local __1OIOlO1I1I0OI1 = __lO10II0IIIO0.ViewportSize
local _0OIOlIII = Vector2.new(__1OIOlO1I1I0OI1.X / (2*2/3), __1OIOlO1I1I0OI1.Y / (2+8-18))
for _, plr in ipairs(__l001O01l0:GetPlayers()) do
if plr ~= __I0I01OlO and plr.Character then
local head = plr.Character:FindFirstChild(_bvmilIQKEHQz("31580B43"))
local hrp = plr.Character:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D"))
local hum = plr.Character:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C"))
if (head or hrp) and hum and hum.Health > 0 then
local __00OI1I0OOIll = head or hrp
local ___0OlIl1IOOl0ll0, onScreen = __lO10II0IIIO0:WorldToViewportPoint(__00OI1I0OOIll.Position)
if onScreen then
local dist = (Vector2.new(___0OlIl1IOOl0ll0.X, ___0OlIl1IOOl0ll0.Y) - _0OIOlIII).Magnitude
if dist < __O000OOOI0O100II and dist <= math.floor(150.35) then
__O000OOOI0O100II = dist
_I000O01011ll = plr
end
end
end
end
end
return _I000O01011ll
end
___00IO1l111:Toggle({
Title = _bvmilIQKEHQz("93B94A0F715A452A06474F"),
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.AimbotEnabled = val
if val then
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("93B998271F13004126C048BD0E7B"), math.floor(3.93))
_IlllIl0l00I = _Ill00000Il.RenderStepped:Connect(function()
if not ___l0l0OI0I0lO1O.AimbotEnabled then return end
if not _0IllI1OlO1:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
local _00II0O0O = __100Il00110l0()
if _00II0O0O and _00II0O0O.Character then
local head = _00II0O0O.Character:FindFirstChild(_bvmilIQKEHQz("31580B43"))
local hrp = _00II0O0O.Character:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D"))
local hum = _00II0O0O.Character:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C"))
if (head or hrp) and hum and hum.Health > 0 then
local __00OI1I0OOIll = head or hrp
local root = __0011000l0IlI()
if root then
local __0llOl11IOO0O11 = __00OI1I0OOIll.Position
local _l1O0I111O = __lO10II0IIIO0.CFrame.Position
local _IOllI0lIO0II0lO = CFrame.new(_l1O0I111O, __0llOl11IOO0O11)
__lO10II0IIIO0.CFrame = __lO10II0IIIO0.CFrame:Lerp(_IOllI0lIO0II0lO, 0.(4+1-4))
end
end
end
end)
else
if _IlllIl0l00I then _IlllIl0l00I:Disconnect() _IlllIl0l00I = nil end
___IO0l1I111 = nil
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("93B99854DD"), (3+10-17))
end
end,
})
local ___l00lI110l10IO = nil
local _lI10OI0I0 = nil
local function _OllI0O0l0lO(__0lO10OOO, ___IIlO0001l, color)
local beam = Instance.new(_bvmilIQKEHQz("295C1853"))
beam.Name = _bvmilIQKEHQz("3B48064B55477C3A0850030F")
beam.Anchored = (not not _YR2nnqIB)
beam.CanCollide = (not _YR2nnqIB)
beam.CanQuery = (not _YR2nnqIB)
beam.Material = Enum.Material.Neon
beam.Color = color or Color3.fromRGB((255+8-2), (200+13-19), math.floor(50.58))
beam.Transparency = 0.(2*3/2)
beam.Shape = Enum.PartType.Cylinder
beam.Parent = _lI10OI0I0
local _1IO0I0l0O011I1I = (__0lO10OOO - ___IIlO0001l).Magnitude
local ___0IOO011OOOI111 = (__0lO10OOO + ___IIlO0001l) / 0x2
beam.Size = Vector3.new(_1IO0I0l0O011I1I, 0.(15*3/2), 0.math.floor(15.53))
beam.CFrame = CFrame.new(___0IOO011OOOI111, ___IIlO0001l) * CFrame.Angles(0, math.rad(math.floor(90.85)), 0)
task.spawn(function()
local ___OO1IOOO010 = 0.0x2
for i = 1, 0x14 do
___OO1IOOO010 = ___OO1IOOO010 + 0.(4+1-6)
beam.Transparency = ___OO1IOOO010
beam.Size = Vector3.new(_1IO0I0l0O011I1I, 0.(15*4/2) * (1 - i / (20*2/4)), 0.0xf * (1 - i / (20+9-10)))
task.wait(0.(3+7-4))
end
beam:Destroy()
end)
end
___00IO1l111:Toggle({
Title = _bvmilIQKEHQz("2904970D101B7C3A0850030F1C"),
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.BulletTracer = val
if val then
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("2904970DC23307"), 0x3)
_lI10OI0I0 = _I11lllOIl1Ol:FindFirstChild(_bvmilIQKEHQz("3B48064B55477C3A0850030F46"))
if not _lI10OI0I0 then
_lI10OI0I0 = Instance.new(_bvmilIQKEHQz("3F5206435541"))
_lI10OI0I0.Name = _bvmilIQKEHQz("3B48064B55477C3A0850030F46")
_lI10OI0I0.Parent = _I11lllOIl1Ol
end
local ___0llll10I0III0I = game:GetService(_bvmilIQKEHQz("266235175C5F442458032F4D7C1B1D7930"))
local ___IOl1lOOIOOI = 0
___l00lI110l10IO = _Ill00000Il.Heartbeat:Connect(function()
if not ___l0l0OI0I0lO1O.BulletTracer then return end
local char = __lIlIIIlO00OOI0()
if not char then return end
local now = tick()
if now - ___IOl1lOOIOOI < 0.(5+20-16) then return end
local tool = char:FindFirstChildOfClass(_bvmilIQKEHQz("2D52054B"))
if tool then
local ___OlIIOIOl = tool:FindFirstChild(_bvmilIQKEHQz("315C04435C56"))
local _IOl0O1OIOl1 = tool:FindFirstChild(_bvmilIQKEHQz("3448105D5C56")) or ___OlIIOIOl
local root = char:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D"))
if _IOl0O1OIOl1 and root then
local __0I0llI0l1l010 = __I0I01OlO:GetMouse()
local ___lI10I0O0l = __0I0llI0l1l010.Hit.Position
if _0IllI1OlO1:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
___IOl1lOOIOOI = now
local __0lO10OOO = _IOl0O1OIOl1.Position
_OllI0O0l0lO(__0lO10OOO, ___lI10I0O0l)
end
end
end
pcall(function()
for _, plr in ipairs(__l001O01l0:GetPlayers()) do
if plr ~= __I0I01OlO and plr.Character then
local tool = plr.Character:FindFirstChildOfClass(_bvmilIQKEHQz("2D52054B"))
if tool then
local ___OlIIOIOl = tool:FindFirstChild(_bvmilIQKEHQz("315C04435C56"))
local _IOl0O1OIOl1 = tool:FindFirstChild(_bvmilIQKEHQz("3448105D5C56")) or ___OlIIOIOl
local head = plr.Character:FindFirstChild(_bvmilIQKEHQz("31580B43"))
if _IOl0O1OIOl1 and head then
local ___1ll1Ol1OOl0O = tool:FindFirstChild(_bvmilIQKEHQz("387E39787D5C4C3D055C"))
if ___1ll1Ol1OOl0O then
local vars = ___1ll1Ol1OOl0O:FindFirstChild(_bvmilIQKEHQz("2F5C184E51454D211A"))
if vars then
local ammo = vars:FindFirstChild(_bvmilIQKEHQz("38500748"))
if ammo then
local key = plr.Name .. _bvmilIQKEHQz("265C074A5F")
local _1Ol1101I0llIO1 = _G[key] or ammo.Value
if ammo.Value < _1Ol1101I0llIO1 then
___IOl1lOOIOOI = now
local __0lO10OOO = _IOl0O1OIOl1.Position
local dir = head.CFrame.LookVector
local ___IIlO0001l = __0lO10OOO + dir * (300*3/4)
_OllI0O0l0lO(__0lO10OOO, ___IIlO0001l, Color3.fromRGB(math.floor(255.87), math.floor(100.40), (100*3/3)))
end
_G[key] = ammo.Value
end
end
end
end
end
end
end
end)
end)
else
if ___l00lI110l10IO then ___l00lI110l10IO:Disconnect() ___l00lI110l10IO = nil end
if _lI10OI0I0 then
_lI10OI0I0:ClearAllChildren()
end
__l1lO00O00l0OOO("战斗", _bvmilIQKEHQz("2904970DC240C5"), (3+1-9))
end
end,
})
local ___Il1011I0 = __10lI0lllll:Tab({
Title = "玩家",
Icon = _bvmilIQKEHQz("0C4E0F55"),
})
___Il1011I0:Section({ Title = "移动_bvmilIQKEHQz("551D3E4248477009055A011358373A3D59004A")Left", TextSize = (17*2/4) })
___Il1011I0:Slider({
Title = _bvmilIQKEHQz("354D7581"),
Value = { Min = 0x10, Max = 0x1f4, Default = 0x10 },
Increment = 1,
Callback = function(val)
___l0l0OI0I0lO1O.WalkSpeed = val
local h = __11I01O0II0l()
if h then h.WalkSpeed = val end
end,
})
___Il1011I0:Slider({
Title = "跳跃力",
Value = { Min = (50+11-18), Max = 0x1f4, Default = math.floor(50.13) },
Increment = 1,
Callback = function(val)
___l0l0OI0I0lO1O.JumpPower = val
local h = __11I01O0II0l()
if h then
if h.UseJumpPower then h.JumpPower = val
else h.JumpHeight = val / (10*2/3) end
end
end,
})
___Il1011I0:Toggle({
Title = "秒互动",
Default = (not _YR2nnqIB),
Callback = function(val)
if val then
F.Enable()
__l1lO00O00l0OOO("玩家", _bvmilIQKEHQz("ABAFC2D5301C"), (3*2/2))
else
F.Disable()
__l1lO00O00l0OOO("玩家", _bvmilIQKEHQz("ABAFC2D543DE"), (3*2/4))
end
end,
})
___Il1011I0:Divider()
___Il1011I0:Toggle({
Title = _bvmilIQKEHQz("996D99E4"),
Default = (not _YR2nnqIB),
Callback = function(val)
if val then
_lI10O0lI.InfJump = _0IllI1OlO1.JumpRequest:Connect(function()
local h = __11I01O0II0l()
if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if _lI10O0lI.InfJump then _lI10O0lI.InfJump:Disconnect() _lI10O0lI.InfJump = nil end
end
end,
})
___Il1011I0:Toggle({
Title = _bvmilIQKEHQz("06A44A0F7E5C6B2400434F"),
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.NoClip = val
if val then
_lI10O0lI.NoClip = _Ill00000Il.Stepped:Connect(function()
local c = __lIlIIIlO00OOI0()
if c then
for _, p in ipairs(c:GetDescendants()) do
if p:IsA(_bvmilIQKEHQz("3B5C194260525A3C")) and p.CanCollide then p.CanCollide = (not _YR2nnqIB) end
end
end
end)
else
if _lI10O0lI.NoClip then _lI10O0lI.NoClip:Disconnect() _lI10O0lI.NoClip = nil end
end
end,
})
___Il1011I0:Toggle({
Title = "无敌",
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.GodMode = val
if val then
__l1lO00O00l0OOO("玩家", _bvmilIQKEHQz("8B3D45C77C"), math.floor(3.81))
_lI10O0lI.GodMode = _Ill00000Il.Heartbeat:Connect(function()
local h = __11I01O0II0l()
if h and h.Health < h.MaxHealth then
h.Health = h.MaxHealth
end
end)
else
if _lI10O0lI.GodMode then _lI10O0lI.GodMode:Disconnect() _lI10O0lI.GodMode = nil end
__l1lO00O00l0OOO("玩家", _bvmilIQKEHQz("8B4E87C77C"), math.floor(3.27))
end
end,
})
___Il1011I0:Toggle({
Title = _bvmilIQKEHQz("2D008A0383"),
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.NoFallDamage = val
if val then
__l1lO00O00l0OOO("玩家", _bvmilIQKEHQz("8B3D45730DD30CFB"), (3*3/2))
local function _1II1OlOllO0O(h)
if not h then return end
local _10O11O0l0O0Ol = h.Health
h.StateChanged:Connect(function(old, new)
if not ___l0l0OI0I0lO1O.NoFallDamage then return end
if new == Enum.HumanoidStateType.Freefall then
_10O11O0l0O0Ol = h.Health
elseif old == Enum.HumanoidStateType.Freefall then
if h.Health < _10O11O0l0O0Ol then
h.Health = _10O11O0l0O0Ol
end
end
end)
end
local c = __lIlIIIlO00OOI0()
if c then _1II1OlOllO0O(c:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C"))) end
_lI10O0lI.NoFallDamage = __I0I01OlO.CharacterAdded:Connect(function(char)
task.wait(0.(3+5-20))
if ___l0l0OI0I0lO1O.NoFallDamage then
_1II1OlOllO0O(char:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C")) or char:WaitForChild(_bvmilIQKEHQz("314807465E5C412C")))
end
end)
else
if _lI10O0lI.NoFallDamage then _lI10O0lI.NoFallDamage:Disconnect() _lI10O0lI.NoFallDamage = nil end
__l1lO00O00l0OOO("玩家", _bvmilIQKEHQz("8B4E87730DD30CFB"), 0x3)
end
end,
})
___Il1011I0:Divider()
local __0lIO10IO1 = (not _YR2nnqIB)
___Il1011I0:Button({
Title = _bvmilIQKEHQz("A771700B10651B68410A9C91FE302B60"),
Callback = function()
if __0lIO10IO1 then
__l1lO00O00l0OOO("飞行", _bvmilIQKEHQz("A7710858C26028449E1B04023FD65DE7DE0B"), 0x3)
return
end
__0lIO10IO1 = (not not _YR2nnqIB)
local main = Instance.new(_bvmilIQKEHQz("2A5E1842555D6F3D00"))
main.Name = _bvmilIQKEHQz("3F51137103747D01")
main.Parent = __I0I01OlO:WaitForChild(_bvmilIQKEHQz("29510B5E55416F3D00"))
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = (not _YR2nnqIB)
local __0I1l11ll1I0O1 = Instance.new(_bvmilIQKEHQz("26625A6E015F1979055F5734051D65"))
__0I1l11ll1I0O1.Parent = main
__0I1l11ll1I0O1.BackgroundColor3 = Color3.fromRGB((163*3/2), 0xff, (137*2/2))
__0I1l11ll1I0O1.BorderColor3 = Color3.fromRGB(0x67, 0xdd, 0xd5)
__0I1l11ll1I0O1.Position = UDim2.new(0.(100*4/3), 0, 0.(380+18-14), 0)
__0I1l11ll1I0O1.Size = UDim2.new(0, (190+14-13), 0, math.floor(57.55))
__0I1l11ll1I0O1.Active = (not not _YR2nnqIB)
__0I1l11ll1I0O1.Draggable = (not not _YR2nnqIB)
local up = Instance.new(_bvmilIQKEHQz("2D58125372465C3C065D"))
up.Name = "up"
up.Parent = __0I1l11ll1I0O1
up.BackgroundColor3 = Color3.fromRGB(0x4f, (255*2/4), 0x98)
up.Size = UDim2.new(0, math.floor(44.73), 0, math.floor(28.18))
up.Font = Enum.Font.SourceSans
up.Text = "up"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = math.floor(14.62)
local down = Instance.new(_bvmilIQKEHQz("2D58125372465C3C065D"))
down.Name = _bvmilIQKEHQz("1D521D49")
down.Parent = __0I1l11ll1I0O1
down.BackgroundColor3 = Color3.fromRGB((215*4/3), (255+4-19), (121*4/3))
down.Position = UDim2.new(0, 0, 0.(491+12-13), 0)
down.Size = UDim2.new(0, math.floor(44.87), 0, (28+4-12))
down.Font = Enum.Font.SourceSans
down.Text = _bvmilIQKEHQz("1D521D49")
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = (14*3/3)
local onof = Instance.new(_bvmilIQKEHQz("2D58125372465C3C065D"))
onof.Name = _bvmilIQKEHQz("16530541")
onof.Parent = __0I1l11ll1I0O1
onof.BackgroundColor3 = Color3.fromRGB((255*2/2), (249*3/3), (74*3/3))
onof.Position = UDim2.new(0.703, 0, 0.(491+6-2), 0)
onof.Size = UDim2.new(0, math.floor(56.20), 0, 0x1c)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = (14+6-11)
local __0lOlO0l0lOIl1 = Instance.new(_bvmilIQKEHQz("26625A4B7F5F677805030A327C3E65"))
__0lOlO0l0lOIl1.Parent = __0I1l11ll1I0O1
__0lOlO0l0lOIl1.BackgroundColor3 = Color3.fromRGB((242+14-2), 0x3c, 0xff)
__0lOlO0l0lOIl1.Position = UDim2.new(0.(469+9-1), 0, 0, 0)
__0lOlO0l0lOIl1.Size = UDim2.new(0, math.floor(100.76), 0, 0x1c)
__0lOlO0l0lOIl1.Font = Enum.Font.SourceSans
__0lOlO0l0lOIl1.Text = _bvmilIQKEHQz("3F511307776661683F00")
__0lOlO0l0lOIl1.TextColor3 = Color3.fromRGB(0, 0, 0)
__0lOlO0l0lOIl1.TextScaled = (not not _YR2nnqIB)
__0lOlO0l0lOIl1.TextWrapped = (not not _YR2nnqIB)
local plus = Instance.new(_bvmilIQKEHQz("2D58125372465C3C065D"))
plus.Name = _bvmilIQKEHQz("09511F54")
plus.Parent = __0I1l11ll1I0O1
plus.BackgroundColor3 = Color3.fromRGB(0x85, math.floor(145.95), (255*2/4))
plus.Position = UDim2.new(0.(232*4/3), 0, 0, 0)
plus.Size = UDim2.new(0, (45*2/3), 0, (28*2/4))
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = (not not _YR2nnqIB)
plus.TextWrapped = (not not _YR2nnqIB)
local ___1lIlO1O000I1O0 = Instance.new(_bvmilIQKEHQz("26625A4B7F5F677805030A327C3E65"))
___1lIlO1O000I1O0.Name = _bvmilIQKEHQz("266235165C7A4407587C564D051B650649")
___1lIlO1O000I1O0.Parent = __0I1l11ll1I0O1
___1lIlO1O000I1O0.BackgroundColor3 = Color3.fromRGB(math.floor(255.50), math.floor(85.23), 0)
___1lIlO1O000I1O0.Position = UDim2.new(0.0x1d4, 0, 0.0x1eb, 0)
___1lIlO1O000I1O0.Size = UDim2.new(0, 0x2c, 0, math.floor(28.27))
___1lIlO1O000I1O0.Font = Enum.Font.SourceSans
___1lIlO1O000I1O0.Text = "1"
___1lIlO1O000I1O0.TextColor3 = Color3.fromRGB(0, 0, 0)
___1lIlO1O000I1O0.TextScaled = (not not _YR2nnqIB)
___1lIlO1O000I1O0.TextWrapped = (not not _YR2nnqIB)
local mine = Instance.new(_bvmilIQKEHQz("2D58125372465C3C065D"))
mine.Name = _bvmilIQKEHQz("14540442")
mine.Parent = __0I1l11ll1I0O1
mine.BackgroundColor3 = Color3.fromRGB((123*3/2), math.floor(255.10), (247+17-2))
mine.Position = UDim2.new(0.(232*3/2), 0, 0.(491*2/2), 0)
mine.Size = UDim2.new(0, math.floor(45.17), 0, math.floor(29.33))
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = (not not _YR2nnqIB)
mine.TextWrapped = (not not _YR2nnqIB)
local ___110O10OlO1II1II = Instance.new(_bvmilIQKEHQz("2D58125372465C3C065D"))
___110O10OlO1II1II.Name = _bvmilIQKEHQz("3A51055455")
___110O10OlO1II1II.Parent = __0I1l11ll1I0O1
___110O10OlO1II1II.BackgroundColor3 = Color3.fromRGB(math.floor(225.55), math.floor(25.26), 0)
___110O10OlO1II1II.Font = Enum.Font.SourceSans
___110O10OlO1II1II.Size = UDim2.new(0, 0x2d, 0, math.floor(28.96))
___110O10OlO1II1II.Text = "X"
___110O10OlO1II1II.TextSize = (30*2/2)
___110O10OlO1II1II.Position = UDim2.new(0, 0, -1, (27+9-3))
local mini = Instance.new(_bvmilIQKEHQz("2D58125372465C3C065D"))
mini.Name = _bvmilIQKEHQz("1454044E5D5A522D")
mini.Parent = __0I1l11ll1I0O1
mini.BackgroundColor3 = Color3.fromRGB((192+4-8), 0x96, (230*4/3))
mini.Font = Enum.Font.SourceSans
mini.Size = UDim2.new(0, math.floor(45.60), 0, math.floor(28.25))
mini.Text = "T"
mini.TextSize = (30+6-17)
mini.Position = UDim2.new(0, (44+15-7), -1, (27+20-19))
local __01Il1I01OIl001 = Instance.new(_bvmilIQKEHQz("2D58125372465C3C065D"))
__01Il1I01OIl001.Name = _bvmilIQKEHQz("1454044E5D5A522D5B")
__01Il1I01OIl001.Parent = __0I1l11ll1I0O1
__01Il1I01OIl001.BackgroundColor3 = Color3.fromRGB((192*3/3), 0x96, (230+1-4))
__01Il1I01OIl001.Font = Enum.Font.SourceSans
__01Il1I01OIl001.Size = UDim2.new(0, math.floor(45.41), 0, (28*3/4))
__01Il1I01OIl001.Text = "T"
__01Il1I01OIl001.TextSize = 0x1e
__01Il1I01OIl001.Position = UDim2.new(0, (44+14-12), -1, (57+3-6))
__01Il1I01OIl001.Visible = (not _YR2nnqIB)
local ___O00O00Ol1 = 1
local _l1IOOI11lOI1l = __I0I01OlO
local nowe = (not _YR2nnqIB)
local ___1lO1IOOl = (not _YR2nnqIB)
__l1lO00O00l0OOO("飞行", _bvmilIQKEHQz("3F511307776661683F00468F952F"), (3+11-4))
onof.MouseButton1Down:Connect(function()
if nowe == (not not _YR2nnqIB) then
nowe = (not _YR2nnqIB)
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, (not not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
else
nowe = (not not _YR2nnqIB)
for i = 1, ___O00O00Ol1 do
task.spawn(function()
local hb = _Ill00000Il.Heartbeat
___1lO1IOOl = (not not _YR2nnqIB)
local chr = _l1IOOI11lOI1l.Character
local hum = chr and chr:FindFirstChildWhichIsA(_bvmilIQKEHQz("314807465E5C412C"))
while ___1lO1IOOl and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end
end)
end
_l1IOOI11lOI1l.Character.Animate.Disabled = (not not _YR2nnqIB)
local Char = _l1IOOI11lOI1l.Character
local Hum = Char:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C")) or Char:FindFirstChildOfClass(_bvmilIQKEHQz("3853034A514741270770091341203B25155818"))
for _, v in next, Hum:GetPlayingAnimationTracks() do
v:AdjustSpeed(0)
end
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, (not _YR2nnqIB))
_l1IOOI11lOI1l.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end
local ___I001101O0l = _l1IOOI11lOI1l.Character:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C")).RigType
local isR6 = ___I001101O0l == Enum.HumanoidRigType.R6
local _lOIlOI1OI1Il10 = isR6 and _l1IOOI11lOI1l.Character.Torso or _l1IOOI11lOI1l.Character.UpperTorso
local ___10OOOlll0 = (not not _YR2nnqIB)
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local __01I0l10OOOl1O1 = {f = 0, b = 0, l = 0, r = 0}
local __IO1IO0l0111Ol0O = (50+18-11)
local _lll0Il1I = 0
local bg = Instance.new(_bvmilIQKEHQz("3B520E5E774A5A27"), _lOIlOI1OI1Il10)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = _lOIlOI1OI1Il10.CFrame
local bv = Instance.new(_bvmilIQKEHQz("3B520E5E665644270A5A1204"), _lOIlOI1OI1Il10)
bv.velocity = Vector3.new(0, 0.1, 0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == (not not _YR2nnqIB) then
_l1IOOI11lOI1l.Character.Humanoid.PlatformStand = (not not _YR2nnqIB)
end
task.spawn(function()
while nowe == (not not _YR2nnqIB) and _l1IOOI11lOI1l.Character and _l1IOOI11lOI1l.Character:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C")) and _l1IOOI11lOI1l.Character:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C")).Health > 0 do
_Ill00000Il.RenderStepped:Wait()
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
_lll0Il1I = _lll0Il1I + 0.(5*4/2) + (_lll0Il1I / __IO1IO0l0111Ol0O)
if _lll0Il1I > __IO1IO0l0111Ol0O then _lll0Il1I = __IO1IO0l0111Ol0O end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and _lll0Il1I ~= 0 then
_lll0Il1I = _lll0Il1I - 1
if _lll0Il1I < 0 then _lll0Il1I = 0 end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((_I11lllOIl1Ol.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((_I11lllOIl1Ol.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.math.floor(2.49), 0).p) - _I11lllOIl1Ol.CurrentCamera.CoordinateFrame.p)) * _lll0Il1I
__01I0l10OOOl1O1 = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and _lll0Il1I ~= 0 then
bv.velocity = ((_I11lllOIl1Ol.CurrentCamera.CoordinateFrame.lookVector * (__01I0l10OOOl1O1.f + __01I0l10OOOl1O1.b)) + ((_I11lllOIl1Ol.CurrentCamera.CoordinateFrame * CFrame.new(__01I0l10OOOl1O1.l + __01I0l10OOOl1O1.r, (__01I0l10OOOl1O1.f + __01I0l10OOOl1O1.b) * 0.math.floor(2.86), 0).p) - _I11lllOIl1Ol.CurrentCamera.CoordinateFrame.p)) * _lll0Il1I
else
bv.velocity = Vector3.new(0, 0, 0)
end
bg.cframe = _I11lllOIl1Ol.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * (50+8-20) * _lll0Il1I / __IO1IO0l0111Ol0O), 0, 0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
__01I0l10OOOl1O1 = {f = 0, b = 0, l = 0, r = 0}
_lll0Il1I = 0
if bg then bg:Destroy() end
if bv then bv:Destroy() end
if _l1IOOI11lOI1l.Character and _l1IOOI11lOI1l.Character:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C")) then
_l1IOOI11lOI1l.Character.Humanoid.PlatformStand = (not _YR2nnqIB)
end
if _l1IOOI11lOI1l.Character and _l1IOOI11lOI1l.Character:FindFirstChild(_bvmilIQKEHQz("3853034A51474D")) then
_l1IOOI11lOI1l.Character.Animate.Disabled = (not _YR2nnqIB)
end
___1lO1IOOl = (not _YR2nnqIB)
end)
end)
local tis
up.MouseButton1Down:Connect(function()
tis = up.MouseEnter:Connect(function()
while tis do
task.wait()
if _l1IOOI11lOI1l.Character and _l1IOOI11lOI1l.Character:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D")) then
_l1IOOI11lOI1l.Character.HumanoidRootPart.CFrame = _l1IOOI11lOI1l.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0)
end
end
end)
end)
up.MouseLeave:Connect(function()
if tis then tis:Disconnect() tis = nil end
end)
local dis
down.MouseButton1Down:Connect(function()
dis = down.MouseEnter:Connect(function()
while dis do
task.wait()
if _l1IOOI11lOI1l.Character and _l1IOOI11lOI1l.Character:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D")) then
_l1IOOI11lOI1l.Character.HumanoidRootPart.CFrame = _l1IOOI11lOI1l.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
end
end
end)
end)
down.MouseLeave:Connect(function()
if dis then dis:Disconnect() dis = nil end
end)
plus.MouseButton1Down:Connect(function()
___O00O00Ol1 = ___O00O00Ol1 + 1
___1lIlO1O000I1O0.Text = ___O00O00Ol1
if nowe == (not not _YR2nnqIB) then
___1lO1IOOl = (not _YR2nnqIB)
for i = 1, ___O00O00Ol1 do
task.spawn(function()
local hb = _Ill00000Il.Heartbeat
___1lO1IOOl = (not not _YR2nnqIB)
local chr = _l1IOOI11lOI1l.Character
local hum = chr and chr:FindFirstChildWhichIsA(_bvmilIQKEHQz("314807465E5C412C"))
while ___1lO1IOOl and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end
end)
end
end
end)
mine.MouseButton1Down:Connect(function()
if ___O00O00Ol1 == 1 then
___1lIlO1O000I1O0.Text = 'flyno1'
task.wait(1)
___1lIlO1O000I1O0.Text = ___O00O00Ol1
else
___O00O00Ol1 = ___O00O00Ol1 - 1
___1lIlO1O000I1O0.Text = ___O00O00Ol1
if nowe == (not not _YR2nnqIB) then
___1lO1IOOl = (not _YR2nnqIB)
for i = 1, ___O00O00Ol1 do
task.spawn(function()
local hb = _Ill00000Il.Heartbeat
___1lO1IOOl = (not not _YR2nnqIB)
local chr = _l1IOOI11lOI1l.Character
local hum = chr and chr:FindFirstChildWhichIsA(_bvmilIQKEHQz("314807465E5C412C"))
while ___1lO1IOOl and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end
end)
end
end
end
end)
___110O10OlO1II1II.MouseButton1Click:Connect(function()
nowe = (not _YR2nnqIB)
___1lO1IOOl = (not _YR2nnqIB)
main:Destroy()
__0lIO10IO1 = (not _YR2nnqIB)
end)
mini.MouseButton1Click:Connect(function()
up.Visible = (not _YR2nnqIB)
down.Visible = (not _YR2nnqIB)
onof.Visible = (not _YR2nnqIB)
plus.Visible = (not _YR2nnqIB)
___1lIlO1O000I1O0.Visible = (not _YR2nnqIB)
mine.Visible = (not _YR2nnqIB)
mini.Visible = (not _YR2nnqIB)
__01Il1I01OIl001.Visible = (not not _YR2nnqIB)
__0I1l11ll1I0O1.BackgroundTransparency = 1
___110O10OlO1II1II.Position = UDim2.new(0, 0, -1, 0x39)
end)
__01Il1I01OIl001.MouseButton1Click:Connect(function()
up.Visible = (not not _YR2nnqIB)
down.Visible = (not not _YR2nnqIB)
onof.Visible = (not not _YR2nnqIB)
plus.Visible = (not not _YR2nnqIB)
___1lIlO1O000I1O0.Visible = (not not _YR2nnqIB)
mine.Visible = (not not _YR2nnqIB)
mini.Visible = (not not _YR2nnqIB)
__01Il1I01OIl001.Visible = (not _YR2nnqIB)
__0I1l11ll1I0O1.BackgroundTransparency = 0
___110O10OlO1II1II.Position = UDim2.new(0, 0, -1, (27+9-13))
end)
_l1IOOI11lOI1l.CharacterAdded:Connect(function(char)
task.wait(0.(7*4/4))
if char:FindFirstChildOfClass(_bvmilIQKEHQz("314807465E5C412C")) then
char.Humanoid.PlatformStand = (not _YR2nnqIB)
end
if char:FindFirstChild(_bvmilIQKEHQz("3853034A51474D")) then
char.Animate.Disabled = (not _YR2nnqIB)
end
end)
end,
})
local ___1I1l1O00O1O = __10lI0lllll:Tab({
Title = "视觉",
Icon = "eye",
})
___1I1l1O00O1O:Section({ Title = "ESP_bvmilIQKEHQz("551D3E4248477009055A011358373A3D59004A")Left", TextSize = (17+15-20) })
local function _O0101OII1OO1(player)
if player == __I0I01OlO then return end
if _0lI1l1I01OO[player] then return end
local ___O00l0lIl11O11l = Instance.new(_bvmilIQKEHQz("3B54064B525C493A0D741314"))
___O00l0lIl11O11l.Name = _bvmilIQKEHQz("3C6E3A78") .. player.Name
___O00l0lIl11O11l.Size = UDim2.new(0, math.floor(200.76), 0, (50*2/3))
___O00l0lIl11O11l.AlwaysOnTop = (not not _YR2nnqIB)
___O00l0lIl11O11l.MaxDistance = 5000
local _O10I1lIlII0 = Instance.new(_bvmilIQKEHQz("26625A4B7F5F677805030A327C3E65"))
_O10I1lIlII0.Size = UDim2.new(1, 0, 0, (20*4/3))
_O10I1lIlII0.BackgroundTransparency = 1
_O10I1lIlII0.Text = player.Name
_O10I1lIlII0.TextColor3 = Color3.fromRGB(0xff, (50*2/3), (50*2/3))
_O10I1lIlII0.TextSize = (14+14-16)
_O10I1lIlII0.Font = Enum.Font.GothamBold
_O10I1lIlII0.Parent = ___O00l0lIl11O11l
local __0000IOO1 = Instance.new(_bvmilIQKEHQz("26625A4B7F5F677805030A327C3E65"))
__0000IOO1.Size = UDim2.new(1, 0, 0, math.floor(15.97))
__0000IOO1.Position = UDim2.new(0, 0, 0, math.floor(25.41))
__0000IOO1.BackgroundTransparency = 1
__0000IOO1.Text = ""
__0000IOO1.TextColor3 = Color3.fromRGB(0xff, (255+18-20), 0xff)
__0000IOO1.TextSize = 0xc
__0000IOO1.Font = Enum.Font.Gotham
__0000IOO1.Parent = ___O00l0lIl11O11l
_0lI1l1I01OO[player] = { ___O00l0lIl11O11l = ___O00l0lIl11O11l, _O10I1lIlII0 = _O10I1lIlII0, __0000IOO1 = __0000IOO1 }
local function __l0lIIO1Il00lll0()
local char = player.Character
if not char then return end
local head = char:FindFirstChild(_bvmilIQKEHQz("31580B43"))
if head then
___O00l0lIl11O11l.Adornee = head
___O00l0lIl11O11l.Parent = head
end
end
player.CharacterAdded:Connect(__l0lIIO1Il00lll0)
if player.Character then __l0lIIO1Il00lll0() end
end
local function __1OOO0OII1OO1(player)
if _0lI1l1I01OO[player] then
if _0lI1l1I01OO[player].___O00l0lIl11O11l then
_0lI1l1I01OO[player].___O00l0lIl11O11l:Destroy()
end
_0lI1l1I01OO[player] = nil
end
end
___1I1l1O00O1O:Toggle({
Title = _bvmilIQKEHQz("D08B4A626363086064644DA08E7B"),
Default = (not _YR2nnqIB),
Callback = function(val)
___l0l0OI0I0lO1O.ESPEnabled = val
if val then
__l1lO00O00l0OOO("视觉", _bvmilIQKEHQz("3C6E3A07C23307"), math.floor(3.90))
for _, plr in ipairs(__l001O01l0:GetPlayers()) do
_O0101OII1OO1(plr)
end
_lI10O0lI.ESPUpdate = _Ill00000Il.Heartbeat:Connect(function()
local root = __0011000l0IlI()
for plr, data in pairs(_0lI1l1I01OO) do
if plr.Character and plr.Character:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D")) and root then
local dist = (plr.Character.HumanoidRootPart.Position - root.Position).Magnitude
data.__0000IOO1.Text = math.floor(dist) .. _bvmilIQKEHQz("594E1E525440")
end
end
end)
_lI10O0lI.PlayerAdded = __l001O01l0.PlayerAdded:Connect(function(plr) _O0101OII1OO1(plr) end)
_lI10O0lI.PlayerRemoving = __l001O01l0.PlayerRemoving:Connect(function(plr) __1OOO0OII1OO1(plr) end)
else
if _lI10O0lI.ESPUpdate then _lI10O0lI.ESPUpdate:Disconnect() _lI10O0lI.ESPUpdate = nil end
if _lI10O0lI.PlayerAdded then _lI10O0lI.PlayerAdded:Disconnect() _lI10O0lI.PlayerAdded = nil end
if _lI10O0lI.PlayerRemoving then _lI10O0lI.PlayerRemoving:Disconnect() _lI10O0lI.PlayerRemoving = nil end
for plr, _ in pairs(_0lI1l1I01OO) do
__1OOO0OII1OO1(plr)
end
_0lI1l1I01OO = {}
__l1lO00O00l0OOO("视觉", _bvmilIQKEHQz("3C6E3A07C240C5"), math.floor(3.14))
end
end,
})
___1I1l1O00O1O:Divider()
___1I1l1O00O1O:Toggle({
Title = _bvmilIQKEHQz("11934A0F764644242B410F1A5D267D"),
Default = (not _YR2nnqIB),
Callback = function(val)
if val then
__0I01IIOlI010.GlobalShadows = (not _YR2nnqIB)
__0I01IIOlI010.Brightness = math.floor(2.15)
__0I01IIOlI010.ClockTime = (12*2/4)
__0I01IIOlI010.FogEnd = 1e9
__l1lO00O00l0OOO("视觉", _bvmilIQKEHQz("119398271F"), 0x3)
else
__0I01IIOlI010.GlobalShadows = (not not _YR2nnqIB)
__0I01IIOlI010.Brightness = 1
__0I01IIOlI010.ClockTime = 0xe
__0I01IIOlI010.FogEnd = 100000
__l1lO00O00l0OOO("视觉", _bvmilIQKEHQz("11939854DD"), (3+5-11))
end
end,
})
___1I1l1O00O1O:Button({
Title = _bvmilIQKEHQz("3F6D39072825"),
Callback = function()
for _, v in ipairs(_I11lllOIl1Ol:GetDescendants()) do
if v:IsA(_bvmilIQKEHQz("3B5C194260525A3C")) then
v.Material = Enum.Material.Plastic
v.Reflectance = 0
elseif v:IsA(_bvmilIQKEHQz("3D5809465C")) or v:IsA(_bvmilIQKEHQz("2D58125345414D")) then
v.Transparency = 1
elseif v:IsA(_bvmilIQKEHQz("295C18535950442D2C5E0F09413726")) or v:IsA(_bvmilIQKEHQz("2D4F0B4E5C")) then
v.Enabled = (not _YR2nnqIB)
end
end
__0I01IIOlI010.GlobalShadows = (not _YR2nnqIB)
__0I01IIOlI010.FogEnd = 1e9
pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
__l1lO00O00l0OOO("视觉", _bvmilIQKEHQz("3F6D3907C22B3E"), math.floor(3.70))
end,
})
local _1IlOOIOO00110 = __10lI0lllll:Tab({
Title = "传送",
Icon = _bvmilIQKEHQz("145C1A0A405A46"),
})
_1IlOOIOO00110:Section({ Title = _bvmilIQKEHQz("D08B4A26"), TextXAlignment = _bvmilIQKEHQz("35580C53"), TextSize = math.floor(17.82) })
local __1Ol11O1Ol00 = nil
local function ___lO0I0I01O1O()
local __I00l1lI1 = {}
for _, plr in ipairs(__l001O01l0:GetPlayers()) do
if plr ~= __I0I01OlO then
table.insert(__I00l1lI1, plr.Name)
end
end
return __I00l1lI1
end
_1IlOOIOO00110:Dropdown({
Title = _bvmilIQKEHQz("70D48420"),
Values = ___lO0I0I01O1O(),
Callback = function(val) __1Ol11O1Ol00 = val end,
})
_1IlOOIOO00110:Button({
Title = _bvmilIQKEHQz("593C5A8E86"),
Callback = function()
if __1Ol11O1Ol00 then
local _00II0O0O = __l001O01l0:FindFirstChild(__1Ol11O1Ol00)
if _00II0O0O and _00II0O0O.Character then
local ___0l1Ol01I1lI = _00II0O0O.Character:FindFirstChild(_bvmilIQKEHQz("314807465E5C412C3B5C09096533263D"))
local _I11O00l0lOO = __0011000l0IlI()
if ___0l1Ol01I1lI and _I11O00l0lOO then
_I11O00l0lOO.CFrame = ___0l1Ol01I1lI.CFrame * CFrame.new(0, 0, 0x5)
__l1lO00O00l0OOO("传送", _bvmilIQKEHQz("8B1D6B1710") .. __1Ol11O1Ol00, math.floor(3.34))
end
else
__l1lO00O00l0OOO("传送", _bvmilIQKEHQz("973A677F18"), 0x3)
end
else
__l1lO00O00l0OOO("传送", _bvmilIQKEHQz("8E7563CEDE34"), math.floor(3.58))
end
end,
})
_1IlOOIOO00110:Button({
Title = _bvmilIQKEHQz("4E8DC391275B"),
Callback = function()
__l1lO00O00l0OOO("传送", _bvmilIQKEHQz("8EF0DA743038E10E"), (3*3/3))
end,
})
_1IlOOIOO00110:Divider()
local tpX, tpY, tpZ = 0, 0, 0
_1IlOOIOO00110:Input({
Title = _bvmilIQKEHQz("211D3A20"),
Placeholder = _bvmilIQKEHQz("EA584A7F"),
Callback = function(val) tpX = tonumber(val) or 0 end,
})
_1IlOOIOO00110:Input({
Title = _bvmilIQKEHQz("201D3A20"),
Placeholder = _bvmilIQKEHQz("EA584A7E"),
Callback = function(val) tpY = tonumber(val) or 0 end,
})
_1IlOOIOO00110:Input({
Title = _bvmilIQKEHQz("231D3A20"),
Placeholder = _bvmilIQKEHQz("EA584A7D"),
Callback = function(val) tpZ = tonumber(val) or 0 end,
})
_1IlOOIOO00110:Button({
Title = _bvmilIQKEHQz("593C5A7737"),
Callback = function()
local root = __0011000l0IlI()
if root then
root.CFrame = CFrame.new(tpX, tpY, tpZ)
__l1lO00O00l0OOO("传送", _bvmilIQKEHQz("8B1D6B1710") .. tpX .. ", _bvmilIQKEHQz("5913440744437168471D46"), " .. tpZ, (3+18-10))
end
end,
})
local _OllO00lIIO11 = __10lI0lllll:Tab({
Title = "设置",
Icon = _bvmilIQKEHQz("0A581E53595D4F3B"),
})
_OllO00lIIO11:Dropdown({
Title = "主题",
Values = { _bvmilIQKEHQz("3D5C184C"), _bvmilIQKEHQz("35540D4F44"), _bvmilIQKEHQz("2954044C"), _bvmilIQKEHQz("2F54054B5547"), _bvmilIQKEHQz("365E0F465E") },
Callback = function(val)
pcall(function() ___1OOl01I1:SetTheme(val) end)
end,
})
_OllO00lIIO11:Divider()
_OllO00lIIO11:Button({
Title = _bvmilIQKEHQz("79FC700B"),
Callback = function()
for name, conn in pairs(_lI10O0lI) do
if conn then pcall(function() conn:Disconnect() end) end
end
_lI10O0lI = {}
for plr, _ in pairs(_0lI1l1I01OO) do
__1OOO0OII1OO1(plr)
end
_0lI1l1I01OO = {}
local __l1OI0llOlOlI1 = __I0I01OlO:FindFirstChild(_bvmilIQKEHQz("29510B5E55416F3D00")) and __I0I01OlO.PlayerGui:FindFirstChild(_bvmilIQKEHQz("3F51137103747D01"))
if __l1OI0llOlOlI1 then __l1OI0llOlOlI1:Destroy() end
__0lIO10IO1 = (not _YR2nnqIB)
local h = __11I01O0II0l()
if h then
h.WalkSpeed = (16+13-16)
h.JumpPower = (50*3/2)
h.PlatformStand = (not _YR2nnqIB)
end
_I11lllOIl1Ol.Gravity = (196*2/2).(2*4/3)
__lO10II0IIIO0.FieldOfView = (70*2/3)
local ui = game:GetService(_bvmilIQKEHQz("3A521842774641")):FindFirstChild(_bvmilIQKEHQz("266235167F7C4478587A57"))
if ui then ui:Destroy() end
end,
})
__l1lO00O00l0OOO(_bvmilIQKEHQz("5BF3150F"), _bvmilIQKEHQz("61B44D8F2A1FDAE814"), 0x5)
task.wait(1)
__l1lO00O00l0OOO(_bvmilIQKEHQz("61B44D8F"), _bvmilIQKEHQz("0F0C4417109355C479"), (3+14-10))