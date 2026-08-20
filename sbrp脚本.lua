local _3o0HjFro=""~=nil
local _CFWNBZChCZV8=function(s)local k="YIKIOJBqRy-f(f.\'"local d=""for i=1,#s,2 dolocal h=string.sub(s,i,i)local l=string.sub(s,i+1,i+1)local hv=tonumber(h,16)local lv=tonumber(l,16)if hv and lv then d=d..string.char(hv*16+lv)end endlocal r=""for i=1,#d do r=r..string.char(string.byte(d,i)~string.byte(k,(i-1)%#k+1))end return r end
local _0lOI0I100IO00 = game:GetService(_CFWNBZChCZV8("06792706067A0B40624964291856"))
local function __Ol01O010I0O(title, text)
pcall(function()
_0lOI0I100IO00:SetCore(_CFWNBZChCZV8("0A2C252D0125361834104E075C0F4149"), {Title = title, Text = text or "", Duration = (5+11-1)})
end)
end
local __1lI0lll1I010
pcall(function()
__1lI0lll1I010 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/__1lI0lll1I010/main/dist/main.lua"))()
end)
if not __1lI0lll1I010 then
__Ol01O010I0O(_CFWNBZChCZV8("F9347A6C"), _CFWNBZChCZV8("06167A25067A2E1D3E48645619560EC78CE936"))
return
end
local __ll0IO0I1OI = game:GetService(_CFWNBZChCZV8("061627257F030D411B48622F"))
local __O0I000O1O11O1O = game:GetService(_CFWNBZChCZV8("06160479067A72411D48625719291F68"))
local ___1l0IOIO1IIl = game:GetService(_CFWNBZChCZV8("06161478237A0B3E1B361C2F610A"))
local ___O11l0OII0l1lI = game:GetService(_CFWNBZChCZV8("061614067E7B2E411D3064564457426E"))
local _I0I1010lII11IO1 = game:GetService(_CFWNBZChCZV8("06007B007E7A73413E306457192F6116"))
local __000l10IIl0I0l01 = game:GetService(_CFWNBZChCZV8("06167B797F2673411B3041566156421768"))
local ___I01IIl0I = game:GetService(_CFWNBZChCZV8("061614007F7B0B383E4964"))
local _lIlIIllOOIOI = __ll0IO0I1OI._lIlIIllOOIOI
local ___11l001llOII = _I0I1010lII11IO1.CurrentCamera
local function _I1l101I1O0O1l0I(title, content, duration)
pcall(function()
__1lI0lll1I010:_I1l101I1O0O1l0I({Title = title, Content = content or "", Duration = duration or (3+3-8)})
end)
end
local function __II0III0OI1O1() return _lIlIIllOOIOI.Character end
local function _lIOlIllO()
local c = __II0III0OI1O1()
return c and c:FindFirstChild(_CFWNBZChCZV8("113C262821252B150016421278075C53")) or nil
end
local function __OOOOOI0I1OI1()
local c = __II0III0OI1O1()
return c and c:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15")) or nil
end
local _IO1O0lO1001111 = {
WalkSpeed = math.floor(16.25),
JumpPower = math.floor(50.40),
NoFallDamage = (not _3o0HjFro),
ESPEnabled = (not _3o0HjFro),
Aimbot = (not _3o0HjFro),
AimbotFOV = (150*3/2),
AimbotKey = (not _3o0HjFro),
ShowFOV = (not _3o0HjFro),
NpcAimbot = (not _3o0HjFro),
CharRotate = (not _3o0HjFro),
}
local _010l1OIll0 = nil
local __III11IO1IOO = nil
local ___lOlOO101 = nil
local __lll11lllO11l101 = nil
local _OO110IOI1OI1OIO = nil
local ___Il11I0OIO1 = nil
local __OI00I1IIIOl = nil
local function _lOIlIl0l1()
local h = __OOOOOI0I1OI1() if h then h.WalkSpeed = _IO1O0lO1001111.WalkSpeed end
end
local function ___OIlIO1O0lO1O00()
local h = __OOOOOI0I1OI1()
if h then
if h.UseJumpPower then h.JumpPower = _IO1O0lO1001111.JumpPower
else h.JumpHeight = _IO1O0lO1001111.JumpPower / (10*4/3) end
end
end
local ___l0llOOII00Il1O1
local function __lIl11llO(hum)
if not hum then return end
hum.StateChanged:Connect(function(_, new)
if new == Enum.HumanoidStateType.FallingDown then
task.wait()
hum:ChangeState(Enum.HumanoidStateType.GettingUp)
end
end)
end
local function ___I01101OO1ll0O(char)
local hum = char:WaitForChild(_CFWNBZChCZV8("113C262821252B15"), (10*2/3))
if not hum then return end
task.wait(0.0x3)
_lOIlIl0l1()
___OIlIO1O0lO1O00()
if _IO1O0lO1001111.NoFallDamage then __lIl11llO(hum) end
end
if _lIlIIllOOIOI.Character then task.spawn(___I01101OO1ll0O, _lIlIIllOOIOI.Character) end
_lIlIIllOOIOI.CharacterAdded:Connect(___I01101OO1ll0O)
local ___0l11O00lOllIO10 = [=[
local main = Instance.new(_CFWNBZChCZV8("0616020000032E411D491D5618"))
local __1lll1Il0IIl1 = Instance.new(_CFWNBZChCZV8("06167A25232673383E49642F4457"))
local up = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local down = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local onof = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local _lOl1ll10OlIll = Instance.new(_CFWNBZChCZV8("062504257E262E406236412F440A"))
local plus = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local __IIIl00I1OII = Instance.new(_CFWNBZChCZV8("062504257E262E406236412F440A"))
local mine = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local ___l1l1I00OIlO00 = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local mini = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local _110I1IO0I11I = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
main.Name = _CFWNBZChCZV8("34282227")
main.Parent = game.__ll0IO0I1OI._lIlIIllOOIOI:WaitForChild(_CFWNBZChCZV8("09252A302A3805043B"))
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = (not _3o0HjFro)
__1lll1Il0IIl1.Parent = main
__1lll1Il0IIl1.BackgroundColor3 = Color3.fromRGB(0xa3, (255+1-11), (137*2/3))
__1lll1Il0IIl1.BorderColor3 = Color3.fromRGB((103+12-3), (221*3/3), 0xd5)
__1lll1Il0IIl1.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
__1lll1Il0IIl1.Size = UDim2.new(0, 0xbe, 0, 0x39)
up.Name = "up"
up.Parent = __1lll1Il0IIl1
up.BackgroundColor3 = Color3.fromRGB(math.floor(79.49), (255+18-7), 0x98)
up.Size = UDim2.new(0, math.floor(44.23), 0, (28+10-9))
up.Font = Enum.Font.SourceSans
up.Text = "up"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = math.floor(14.14).000
down.Name = _CFWNBZChCZV8("3D263C27")
down.Parent = __1lll1Il0IIl1
down.BackgroundColor3 = Color3.fromRGB((215+17-14), (255+9-12), math.floor(121.85))
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 0x2c, 0, math.floor(28.79))
down.Font = Enum.Font.SourceSans
down.Text = _CFWNBZChCZV8("3D263C27")
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = (14*2/4).000
onof.Name = _CFWNBZChCZV8("3627242F")
onof.Parent = __1lll1Il0IIl1
onof.BackgroundColor3 = Color3.fromRGB((255+7-18), (249*4/4), 0x4a)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, (56+9-9), 0, (28*4/2))
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = (14*3/3).000
_lOl1ll10OlIll.Parent = __1lll1Il0IIl1
_lOl1ll10OlIll.BackgroundColor3 = Color3.fromRGB(0xf2, math.floor(60.54), (255*2/4))
_lOl1ll10OlIll.Position = UDim2.new(0.469327301, 0, 0, 0)
_lOl1ll10OlIll.Size = UDim2.new(0, 0x64, 0, math.floor(28.30))
_lOl1ll10OlIll.Font = Enum.Font.SourceSans
_lOl1ll10OlIll.Text = _CFWNBZChCZV8("1F253269081F0B51044A")
_lOl1ll10OlIll.TextColor3 = Color3.fromRGB(0, 0, 0)
_lOl1ll10OlIll.TextScaled = (not not _3o0HjFro)
_lOl1ll10OlIll.TextSize = (14*3/4).000
_lOl1ll10OlIll.TextWrapped = (not not _3o0HjFro)
plus.Name = _CFWNBZChCZV8("29253E3A")
plus.Parent = __1lll1Il0IIl1
plus.BackgroundColor3 = Color3.fromRGB((133*2/4), 0x91, 0xff)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 0x2d, 0, math.floor(28.42))
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = (not not _3o0HjFro)
plus.TextSize = math.floor(14.34).000
plus.TextWrapped = (not not _3o0HjFro)
__IIIl00I1OII.Name = _CFWNBZChCZV8("06160200062672411B48622F61")
__IIIl00I1OII.Parent = __1lll1Il0IIl1
__IIIl00I1OII.BackgroundColor3 = Color3.fromRGB((255+5-14), (85+14-5), 0)
__IIIl00I1OII.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
__IIIl00I1OII.Size = UDim2.new(0, math.floor(44.42), 0, (28*2/3))
__IIIl00I1OII.Font = Enum.Font.SourceSans
__IIIl00I1OII.Text = "1"
__IIIl00I1OII.TextColor3 = Color3.fromRGB(0, 0, 0)
__IIIl00I1OII.TextScaled = (not not _3o0HjFro)
__IIIl00I1OII.TextSize = (14*3/3).000
__IIIl00I1OII.TextWrapped = (not not _3o0HjFro)
mine.Name = _CFWNBZChCZV8("3420252C")
mine.Parent = __1lll1Il0IIl1
mine.BackgroundColor3 = Color3.fromRGB(0x7b, 0xff, 0xf7)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, math.floor(45.48), 0, math.floor(29.63))
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = (not not _3o0HjFro)
mine.TextSize = (14+13-9).000
mine.TextWrapped = (not not _3o0HjFro)
___l1l1I00OIlO00.Name = _CFWNBZChCZV8("1A25243A2A")
___l1l1I00OIlO00.Parent = main.__1lll1Il0IIl1
___l1l1I00OIlO00.BackgroundColor3 = Color3.fromRGB(0xe1, (25*3/4), 0)
___l1l1I00OIlO00.Font = _CFWNBZChCZV8("0A263E3B2C2F11103C0A")
___l1l1I00OIlO00.Size = UDim2.new(0, math.floor(45.79), 0, math.floor(28.34))
___l1l1I00OIlO00.Text = "X"
___l1l1I00OIlO00.TextSize = (30*4/2)
___l1l1I00OIlO00.Position =  UDim2.new(0, 0, -1, (27*3/2))
mini.Name = _CFWNBZChCZV8("3420252022233814")
mini.Parent = main.__1lll1Il0IIl1
mini.BackgroundColor3 = Color3.fromRGB((192*3/2), math.floor(150.83), (230+10-16))
mini.Font = _CFWNBZChCZV8("0A263E3B2C2F11103C0A")
mini.Size = UDim2.new(0, (45*2/2), 0, (28*3/2))
mini.Text = "T"
mini.TextSize = 0x1e
mini.Position = UDim2.new(0, (44+9-8), -1, (27+1-2))
_110I1IO0I11I.Name = _CFWNBZChCZV8("342025202223381460")
_110I1IO0I11I.Parent = main.__1lll1Il0IIl1
_110I1IO0I11I.BackgroundColor3 = Color3.fromRGB((192*2/2), (150+18-9), math.floor(230.93))
_110I1IO0I11I.Font = _CFWNBZChCZV8("0A263E3B2C2F11103C0A")
_110I1IO0I11I.Size = UDim2.new(0, (45*2/2), 0, math.floor(28.57))
_110I1IO0I11I.Text = "T"
_110I1IO0I11I.TextSize = 0x1e
_110I1IO0I11I.Position = UDim2.new(0, math.floor(44.66), -1, (57+14-16))
_110I1IO0I11I.Visible = (not _3o0HjFro)
speeds = 1
local ___100IIIOO = game:GetService(_CFWNBZChCZV8("061627257F030D411B48622F"))._lIlIIllOOIOI
local chr = game.__ll0IO0I1OI._lIlIIllOOIOI.Character
local hum = chr and chr:FindFirstChildWhichIsA(_CFWNBZChCZV8("113C262821252B15"))
nowe = (not _3o0HjFro)
game:GetService(_CFWNBZChCZV8("06792706067A0B40624964291856")):SetCore(_CFWNBZChCZV8("0A2C252D0125361834104E075C0F4149"), {
Title = _CFWNBZChCZV8("1F253269081F0B51044A");
Text = _CFWNBZChCZV8("3527212C2C3E2B1E3C595E134B054B423D2C2F");
Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = (5+13-10);
__1lll1Il0IIl1.Active = (not not _3o0HjFro)
__1lll1Il0IIl1.Draggable = (not not _3o0HjFro)
onof.MouseButton1Down:connect(function()
if nowe == (not not _3o0HjFro) then
nowe = (not _3o0HjFro)
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,(not not _3o0HjFro))
___100IIIOO.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
else
nowe = (not not _3o0HjFro)
for i = 1, speeds do
spawn(function()
local hb = game:GetService(_CFWNBZChCZV8("06160479067A72411D48625719291F68")).Heartbeat
tpwalking = (not not _3o0HjFro)
local chr = game.__ll0IO0I1OI._lIlIIllOOIOI.Character
local hum = chr and chr:FindFirstChildWhichIsA(_CFWNBZChCZV8("113C262821252B15"))
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end
end)
end
game.__ll0IO0I1OI._lIlIIllOOIOI.Character.Animate.Disabled = (not not _3o0HjFro)
local Char = game.__ll0IO0I1OI._lIlIIllOOIOI.Character
local Hum = Char:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15")) or Char:FindFirstChildOfClass(_CFWNBZChCZV8("182722242E3E2B1E3C3A42085C14414B352C39"))
for i,v in next, Hum:GetPlayingAnimationTracks() do
v:AdjustSpeed(0)
end
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,(not _3o0HjFro))
___100IIIOO.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end
if game:GetService(_CFWNBZChCZV8("061627257F030D411B48622F"))._lIlIIllOOIOI.Character:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15")).RigType == Enum.HumanoidRigType.R6 then
local plr = game.__ll0IO0I1OI._lIlIIllOOIOI
local ___OIO1O0IO110I = plr.Character.Torso
local __1IOIIOOl1l1 = (not not _3o0HjFro)
local deb = (not not _3o0HjFro)
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local __1Ol1O0lIlllO010 = {f = 0, b = 0, l = 0, r = 0}
local __0O101O01ll10O1l = (50*3/2)
local __IIIl00I1OII = 0
local bg = Instance.new(_CFWNBZChCZV8("1B262F300833301E"), ___OIO1O0IO110I)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = ___OIO1O0IO110I.CFrame
local bv = Instance.new(_CFWNBZChCZV8("1B262F30192F2E1E3110591F"), ___OIO1O0IO110I)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == (not not _3o0HjFro) then
plr.Character.Humanoid.PlatformStand = (not not _3o0HjFro)
end
while nowe == (not not _3o0HjFro) or game:GetService(_CFWNBZChCZV8("061627257F030D411B48622F"))._lIlIIllOOIOI.Character.Humanoid.Health == 0 do
game:GetService(_CFWNBZChCZV8("06160479067A72411D48625719291F68")).RenderStepped:Wait()
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
__IIIl00I1OII = __IIIl00I1OII+.(5+15-7)+(__IIIl00I1OII/__0O101O01ll10O1l)
if __IIIl00I1OII > __0O101O01ll10O1l then
__IIIl00I1OII = __0O101O01ll10O1l
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and __IIIl00I1OII ~= 0 then
__IIIl00I1OII = __IIIl00I1OII-1
if __IIIl00I1OII < 0 then
__IIIl00I1OII = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.(2+3-7),0).p) - game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame.p))*__IIIl00I1OII
__1Ol1O0lIlllO010 = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and __IIIl00I1OII ~= 0 then
bv.velocity = ((game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame.lookVector * (__1Ol1O0lIlllO010.f+__1Ol1O0lIlllO010.b)) + ((game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame * CFrame.new(__1Ol1O0lIlllO010.l+__1Ol1O0lIlllO010.r,(__1Ol1O0lIlllO010.f+__1Ol1O0lIlllO010.b)*.0x2,0).p) - game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame.p))*__IIIl00I1OII
else
bv.velocity = Vector3.new(0,0,0)
end
bg.cframe = game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*math.floor(50.68)*__IIIl00I1OII/__0O101O01ll10O1l),0,0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
__1Ol1O0lIlllO010 = {f = 0, b = 0, l = 0, r = 0}
__IIIl00I1OII = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = (not _3o0HjFro)
game.__ll0IO0I1OI._lIlIIllOOIOI.Character.Animate.Disabled = (not _3o0HjFro)
tpwalking = (not _3o0HjFro)
else
local plr = game.__ll0IO0I1OI._lIlIIllOOIOI
local __10I0lO001I0 = plr.Character.__10I0lO001I0
local __1IOIIOOl1l1 = (not not _3o0HjFro)
local deb = (not not _3o0HjFro)
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local __1Ol1O0lIlllO010 = {f = 0, b = 0, l = 0, r = 0}
local __0O101O01ll10O1l = math.floor(50.55)
local __IIIl00I1OII = 0
local bg = Instance.new(_CFWNBZChCZV8("1B262F300833301E"), __10I0lO001I0)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = __10I0lO001I0.CFrame
local bv = Instance.new(_CFWNBZChCZV8("1B262F30192F2E1E3110591F"), __10I0lO001I0)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == (not not _3o0HjFro) then
plr.Character.Humanoid.PlatformStand = (not not _3o0HjFro)
end
while nowe == (not not _3o0HjFro) or game:GetService(_CFWNBZChCZV8("061627257F030D411B48622F"))._lIlIIllOOIOI.Character.Humanoid.Health == 0 do
wait()
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
__IIIl00I1OII = __IIIl00I1OII+.(5*3/3)+(__IIIl00I1OII/__0O101O01ll10O1l)
if __IIIl00I1OII > __0O101O01ll10O1l then
__IIIl00I1OII = __0O101O01ll10O1l
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and __IIIl00I1OII ~= 0 then
__IIIl00I1OII = __IIIl00I1OII-1
if __IIIl00I1OII < 0 then
__IIIl00I1OII = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.(2*4/3),0).p) - game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame.p))*__IIIl00I1OII
__1Ol1O0lIlllO010 = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and __IIIl00I1OII ~= 0 then
bv.velocity = ((game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame.lookVector * (__1Ol1O0lIlllO010.f+__1Ol1O0lIlllO010.b)) + ((game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame * CFrame.new(__1Ol1O0lIlllO010.l+__1Ol1O0lIlllO010.r,(__1Ol1O0lIlllO010.f+__1Ol1O0lIlllO010.b)*.(2+14-14),0).p) - game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame.p))*__IIIl00I1OII
else
bv.velocity = Vector3.new(0,0,0)
end
bg.cframe = game._I0I1010lII11IO1.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*(50+6-10)*__IIIl00I1OII/__0O101O01ll10O1l),0,0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
__1Ol1O0lIlllO010 = {f = 0, b = 0, l = 0, r = 0}
__IIIl00I1OII = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = (not _3o0HjFro)
game.__ll0IO0I1OI._lIlIIllOOIOI.Character.Animate.Disabled = (not _3o0HjFro)
tpwalking = (not _3o0HjFro)
end
end)
local tis
up.MouseButton1Down:connect(function()
tis = up.MouseEnter:connect(function()
while tis do
wait()
game.__ll0IO0I1OI._lIlIIllOOIOI.Character.HumanoidRootPart.CFrame = game.__ll0IO0I1OI._lIlIIllOOIOI.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
end
end)
end)
up.MouseLeave:connect(function()
if tis then
tis:Disconnect()
tis = nil
end
end)
local dis
down.MouseButton1Down:connect(function()
dis = down.MouseEnter:connect(function()
while dis do
wait()
game.__ll0IO0I1OI._lIlIIllOOIOI.Character.HumanoidRootPart.CFrame = game.__ll0IO0I1OI._lIlIIllOOIOI.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
end
end)
end)
down.MouseLeave:connect(function()
if dis then
dis:Disconnect()
dis = nil
end
end)
game:GetService(_CFWNBZChCZV8("061627257F030D411B48622F"))._lIlIIllOOIOI.CharacterAdded:Connect(function(char)
wait(0.(7+8-4))
game.__ll0IO0I1OI._lIlIIllOOIOI.Character.Humanoid.PlatformStand = (not _3o0HjFro)
game.__ll0IO0I1OI._lIlIIllOOIOI.Character.Animate.Disabled = (not _3o0HjFro)
end)
plus.MouseButton1Down:connect(function()
speeds = speeds + 1
__IIIl00I1OII.Text = speeds
if nowe == (not not _3o0HjFro) then
tpwalking = (not _3o0HjFro)
for i = 1, speeds do
spawn(function()
local hb = game:GetService(_CFWNBZChCZV8("06160479067A72411D48625719291F68")).Heartbeat
tpwalking = (not not _3o0HjFro)
local chr = game.__ll0IO0I1OI._lIlIIllOOIOI.Character
local hum = chr and chr:FindFirstChildWhichIsA(_CFWNBZChCZV8("113C262821252B15"))
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end
end)
end
end
end)
mine.MouseButton1Down:connect(function()
if speeds == 1 then
__IIIl00I1OII.Text = 'flyno1'
wait(1)
__IIIl00I1OII.Text = speeds
else
speeds = speeds - 1
__IIIl00I1OII.Text = speeds
if nowe == (not not _3o0HjFro) then
tpwalking = (not _3o0HjFro)
for i = 1, speeds do
spawn(function()
local hb = game:GetService(_CFWNBZChCZV8("06160479067A72411D48625719291F68")).Heartbeat
tpwalking = (not not _3o0HjFro)
local chr = game.__ll0IO0I1OI._lIlIIllOOIOI.Character
local hum = chr and chr:FindFirstChildWhichIsA(_CFWNBZChCZV8("113C262821252B15"))
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end
end)
end
end
end
end)
___l1l1I00OIlO00.MouseButton1Click:Connect(function()
main:Destroy()
end)
mini.MouseButton1Click:Connect(function()
up.Visible = (not _3o0HjFro)
down.Visible = (not _3o0HjFro)
onof.Visible = (not _3o0HjFro)
plus.Visible = (not _3o0HjFro)
__IIIl00I1OII.Visible = (not _3o0HjFro)
mine.Visible = (not _3o0HjFro)
mini.Visible = (not _3o0HjFro)
_110I1IO0I11I.Visible = (not not _3o0HjFro)
main.__1lll1Il0IIl1.BackgroundTransparency = 1
___l1l1I00OIlO00.Position =  UDim2.new(0, 0, -1, 0x39)
end)
_110I1IO0I11I.MouseButton1Click:Connect(function()
up.Visible = (not not _3o0HjFro)
down.Visible = (not not _3o0HjFro)
onof.Visible = (not not _3o0HjFro)
plus.Visible = (not not _3o0HjFro)
__IIIl00I1OII.Visible = (not not _3o0HjFro)
mine.Visible = (not not _3o0HjFro)
mini.Visible = (not not _3o0HjFro)
_110I1IO0I11I.Visible = (not _3o0HjFro)
main.__1lll1Il0IIl1.BackgroundTransparency = 0
___l1l1I00OIlO00.Position =  UDim2.new(0, 0, -1, (27+5-2))
end)
]=]
local function _O0010OIlI11lII0()
local ___0111l001010O = _lIlIIllOOIOI.PlayerGui:FindFirstChild(_CFWNBZChCZV8("34282227"))
if ___0111l001010O then ___0111l001010O:Destroy() end
loadstring(___0l11O00lOllIO10)()
end
local function __OI00l0l1IOO()
_G.nowe = (not _3o0HjFro)
_G.tpwalking = (not _3o0HjFro)
local gui = _lIlIIllOOIOI.PlayerGui:FindFirstChild(_CFWNBZChCZV8("34282227"))
if gui then gui:Destroy() end
local char = _lIlIIllOOIOI.Character
local hum = char and char:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15"))
if hum then
hum.PlatformStand = (not _3o0HjFro)
local ___111110lIIl1 = char:FindFirstChild(_CFWNBZChCZV8("182722242E3E27"))
if ___111110lIIl1 then ___111110lIIl1.Disabled = (not _3o0HjFro) end
end
end
local function __100IlIOO(targetName)
local __000II1I1OlOO = __ll0IO0I1OI:FindFirstChild(targetName)
if not __000II1I1OlOO or not __000II1I1OlOO.Character then
_I1l101I1O0O1l0I("失败", _CFWNBZChCZV8("B74EE2FF42A56A"), math.floor(3.87)) return
end
local __OO10lIlII = __000II1I1OlOO.Character:FindFirstChild(_CFWNBZChCZV8("113C262821252B150016421278075C53"))
local _0lO100l0IOI = _lIOlIllO()
if not __OO10lIlII or not _0lO100l0IOI then return end
local ___ll0IOO1II0O11 = _0lO100l0IOI.CFrame
local bav = Instance.new(_CFWNBZChCZV8("1B262F300E2425043E185F304D0A4144303D32"))
bav.AngularVelocity = Vector3.new(0, 99999, 0)
bav.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
bav.Parent = _0lO100l0IOI
local bv = Instance.new(_CFWNBZChCZV8("1B262F30192F2E1E3110591F"))
bv.Velocity = Vector3.zero
bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
bv.Parent = _0lO100l0IOI
_0lO100l0IOI.CFrame = __OO10lIlII.CFrame + Vector3.new(0, 0, 0)
task.wait(0.math.floor(5.99))
bav:Destroy()
bv:Destroy()
_0lO100l0IOI.CFrame = ___ll0IOO1II0O11
_I1l101I1O0O1l0I("甩飞", _CFWNBZChCZV8("AB609569") .. targetName, math.floor(3.79))
end
local __0lIl0ll1I = (not _3o0HjFro)
local function __lI0lI0lOO()
if __0lIl0ll1I then return end
__0lIl0ll1I = (not not _3o0HjFro)
local _lO0IO0Ol0llO1 = 0
_I1l101I1O0O1l0I(_CFWNBZChCZV8("70970B40F5"), _CFWNBZChCZV8("5982629742EB2AF4127084D0064800"), (3*2/3))
local _0lO100l0IOI = _lIOlIllO()
if not _0lO100l0IOI then __0lIl0ll1I = (not _3o0HjFro) return end
local ___ll0IOO1II0O11 = _0lO100l0IOI.CFrame
for _, p in ipairs(__ll0IO0I1OI:GetPlayers()) do
if p ~= _lIlIIllOOIOI and p.Character then
local __OO10lIlII = p.Character:FindFirstChild(_CFWNBZChCZV8("113C262821252B150016421278075C53"))
local tHum = p.Character:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15"))
if __OO10lIlII and tHum and tHum.Health > 0 then
local bav = Instance.new(_CFWNBZChCZV8("1B262F300E2425043E185F304D0A4144303D32"))
bav.AngularVelocity = Vector3.new(0, 99999, 0)
bav.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
bav.Parent = _0lO100l0IOI
local bv = Instance.new(_CFWNBZChCZV8("1B262F30192F2E1E3110591F"))
bv.Velocity = Vector3.zero
bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
bv.Parent = _0lO100l0IOI
_0lO100l0IOI.CFrame = __OO10lIlII.CFrame
task.wait(0.(3+3-20))
bav:Destroy()
bv:Destroy()
_0lO100l0IOI.CFrame = ___ll0IOO1II0O11
_lO0IO0Ol0llO1 = _lO0IO0Ol0llO1 + 1
task.wait(0.1)
end
end
end
__0lIl0ll1I = (not _3o0HjFro)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("7097C759"), _CFWNBZChCZV8("28609569") .. _lO0IO0Ol0llO1 .. _CFWNBZChCZV8("7944E2FF"), 0x5)
end
local _l0IOIl0lOIO10 = {}
local function ___1OIlIl1lOl(player)
if player == _lIlIIllOOIOI then return end
local function _00l10I0I0O(char)
if not char then return end
local head = char:FindFirstChild(_CFWNBZChCZV8("112C2A2D")) or char:WaitForChild(_CFWNBZChCZV8("112C2A2D"), (5*3/4))
local root = char:FindFirstChild(_CFWNBZChCZV8("113C262821252B150016421278075C53")) or char:WaitForChild(_CFWNBZChCZV8("113C262821252B150016421278075C53"), (5+15-2))
local hum = char:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15"))
if not head then return end
if _l0IOIl0lOIO10[player] then
for _, v in pairs(_l0IOIl0lOIO10[player]) do
if v and v.Destroy then pcall(function() v:Destroy() end) end
end
end
local bb = Instance.new(_CFWNBZChCZV8("1B2027252D252303363E580F"))
bb.Name = "ESP"
bb.Adornee = head
bb.Size = UDim2.new(0, (200+6-16), 0, (50*3/2))
bb.StudsOffset = Vector3.new(0, 0x2.(5+5-18), 0)
bb.AlwaysOnTop = (not not _3o0HjFro)
bb.Enabled = _IO1O0lO1001111.ESPEnabled
local name = Instance.new(_CFWNBZChCZV8("062504257E262E406236412F440A"))
name.BackgroundTransparency = 1
name.Size = UDim2.new(1, 0, 0, (20+15-6))
name.Font = Enum.Font.GothamBold
name.TextSize = (14*4/2)
name.TextColor3 = Color3.fromRGB((255+16-6), 0x50, math.floor(80.28))
name.TextStrokeTransparency = 0
name.Text = player.Name
name.Parent = bb
local info = Instance.new(_CFWNBZChCZV8("062504257E262E406236412F440A"))
info.BackgroundTransparency = 1
info.Size = UDim2.new(1, 0, 0, 0x10)
info.Position = UDim2.new(0, 0, 0, math.floor(20.64))
info.Font = Enum.Font.Gotham
info.TextSize = math.floor(12.32)
info.TextColor3 = Color3.fromRGB(math.floor(200.55), (200+10-15), (200+1-3))
info.TextStrokeTransparency = 0.(5+13-12)
info.Text = ""
info.Parent = bb
bb.Parent = head
local hl = Instance.new(_CFWNBZChCZV8("11202C212323251926"))
hl.Adornee = char
hl.FillColor = Color3.fromRGB((255+9-9), (80+13-18), 0x50)
hl.FillTransparency = 0.(8+19-13)
hl.OutlineColor = Color3.fromRGB((255*3/4), 0xff, math.floor(255.21))
hl.Enabled = _IO1O0lO1001111.ESPEnabled
hl.Parent = char
_l0IOIl0lOIO10[player] = {bb = bb, hl = hl, info = info, root = root, hum = hum}
task.spawn(function()
while _l0IOIl0lOIO10[player] and char and char.Parent do
local obj = _l0IOIl0lOIO10[player]
if not obj then break end
local _0lO100l0IOI = _lIOlIllO()
if obj.root and _0lO100l0IOI then
local d = math.floor((obj.root.Position - _0lO100l0IOI.Position).Magnitude)
local hp = obj.hum and math.floor(obj.hum.Health) or "?"
obj.info.Text = d .. _CFWNBZChCZV8("34696B011F70") .. hp
end
task.wait(0.(15+2-2))
end
end)
end
if player.Character then _00l10I0I0O(player.Character) end
player.CharacterAdded:Connect(_00l10I0I0O)
end
local function ___I1lOl111I1l01l1(player)
if _l0IOIl0lOIO10[player] then
for _, v in pairs(_l0IOIl0lOIO10[player]) do
if v and v.Destroy then pcall(function() v:Destroy() end) end
end
_l0IOIl0lOIO10[player] = nil
end
end
local __OIO1l0lO1O1lI = (not _3o0HjFro)
local function ___1I1l1OOll()
if __OIO1l0lO1O1lI then return end
__OIO1l0lO1O1lI = (not not _3o0HjFro)
for _, p in ipairs(__ll0IO0I1OI:GetPlayers()) do ___1OIlIl1lOl(p) end
__ll0IO0I1OI.PlayerAdded:Connect(___1OIlIl1lOl)
__ll0IO0I1OI.PlayerRemoving:Connect(___I1lOl111I1l01l1)
end
local function __IllOI001()
local list = {}
for _, p in ipairs(__ll0IO0I1OI:GetPlayers()) do
if p ~= _lIlIIllOOIOI then table.insert(list, p.Name) end
end
return list
end
local ___I1IlOI1l000II1 = nil
local _10O0IOO0II = nil
local function _IIOOO1O11000()
if _IO1O0lO1001111.ShowFOV then
if not ___I1IlOI1l000II1 then
___I1IlOI1l000II1 = Instance.new(_CFWNBZChCZV8("0928393D"))
___I1IlOI1l000II1.Name = _CFWNBZChCZV8("1F061D0A2638211D37")
___I1IlOI1l000II1.Shape = Enum.PartType.Cylinder
___I1IlOI1l000II1.Material = Enum.Material.ForceField
___I1IlOI1l000II1.Color = Color3.fromRGB(math.floor(255.12), (255*3/4), (255+8-19))
___I1IlOI1l000II1.Transparency = 0.0x5
___I1IlOI1l000II1.Anchored = (not not _3o0HjFro)
___I1IlOI1l000II1.CanCollide = (not _3o0HjFro)
___I1IlOI1l000II1.CanQuery = (not _3o0HjFro)
___I1IlOI1l000II1.CastShadow = (not _3o0HjFro)
___I1IlOI1l000II1.Parent = _I0I1010lII11IO1
end
___I1IlOI1l000II1.Transparency = 1
local gui = game:GetService(_CFWNBZChCZV8("1A26392C083F2B")):FindFirstChild(_CFWNBZChCZV8("1820262B203E043E04"))
if not gui then
gui = Instance.new(_CFWNBZChCZV8("0616020000032E411D491D5618"))
gui.Name = _CFWNBZChCZV8("1820262B203E043E04")
gui.ResetOnSpawn = (not _3o0HjFro)
gui.Parent = game:GetService(_CFWNBZChCZV8("1A26392C083F2B"))
end
local _0111I1I1111l0O = gui:FindFirstChild(_CFWNBZChCZV8("1A20392A232F"))
if not _0111I1I1111l0O then
_0111I1I1111l0O = Instance.new(_CFWNBZChCZV8("06167A25232673383E49642F4457"))
_0111I1I1111l0O.Name = _CFWNBZChCZV8("1A20392A232F")
_0111I1I1111l0O.BackgroundColor3 = Color3.fromRGB((255*4/3), math.floor(255.52), (255*4/4))
_0111I1I1111l0O.BackgroundTransparency = 1
_0111I1I1111l0O.BorderSizePixel = 0
_0111I1I1111l0O.Parent = gui
local ___IlIOOOlI0 = Instance.new(_CFWNBZChCZV8("0C0008263D242703"))
___IlIOOOlI0.CornerRadius = UDim.new(1, 0)
___IlIOOOlI0.Parent = _0111I1I1111l0O
local _IOOlOllI10l = Instance.new(_CFWNBZChCZV8("0C00183D3D252914"))
_IOOlOllI10l.Name = _CFWNBZChCZV8("0A3D3926242F")
_IOOlOllI10l.Color = Color3.fromRGB(0, (255+7-6), (100+1-7))
_IOOlOllI10l.Thickness = 1.(5*2/3)
_IOOlOllI10l.Transparency = 0.0x3
_IOOlOllI10l.Parent = _0111I1I1111l0O
end
_0111I1I1111l0O.Visible = (not not _3o0HjFro)
else
local gui = game:GetService(_CFWNBZChCZV8("1A26392C083F2B")):FindFirstChild(_CFWNBZChCZV8("1820262B203E043E04"))
if gui then
local _0111I1I1111l0O = gui:FindFirstChild(_CFWNBZChCZV8("1A20392A232F"))
if _0111I1I1111l0O then _0111I1I1111l0O.Visible = (not _3o0HjFro) end
end
end
end
local function _010lIl1IO()
local ___IO10IOOlO1OlOOl = nil
local _lIO10OO0Ol0O = _IO1O0lO1001111.AimbotFOV
local ___ll0IIO10 = Vector2.new(___11l001llOII.ViewportSize.X / math.floor(2.96), ___11l001llOII.ViewportSize.Y / 0x2)
for _, p in ipairs(__ll0IO0I1OI:GetPlayers()) do
if p ~= _lIlIIllOOIOI and p.Character then
local head = p.Character:FindFirstChild(_CFWNBZChCZV8("112C2A2D"))
local hum = p.Character:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15"))
if head and hum and hum.Health > 0 then
local ___1Ol11OlOl, onScreen = ___11l001llOII:WorldToViewportPoint(head.Position)
if onScreen then
local dist = (Vector2.new(___1Ol11OlOl.X, ___1Ol11OlOl.Y) - ___ll0IIO10).Magnitude
if dist < _lIO10OO0Ol0O then
_lIO10OO0Ol0O = dist
___IO10IOOlO1OlOOl = p
end
end
end
end
end
return ___IO10IOOlO1OlOOl
end
local function ___IIIOOIl01()
_10O0IOO0II = __O0I000O1O11O1O.RenderStepped:Connect(function()
if not _IO1O0lO1001111.Aimbot then return end
local __OI1Il10l = (not not _3o0HjFro)
if _IO1O0lO1001111.AimbotKey then
__OI1Il10l = ___1l0IOIO1IIl:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end
if not __OI1Il10l then return end
local __000II1I1OlOO = _010lIl1IO()
if __000II1I1OlOO and __000II1I1OlOO.Character then
local head = __000II1I1OlOO.Character:FindFirstChild(_CFWNBZChCZV8("112C2A2D"))
if head then
local ___0OI10OI11I10 = CFrame.new(___11l001llOII.CFrame.Position, head.Position)
___11l001llOII.CFrame = ___11l001llOII.CFrame:Lerp(___0OI10OI11I10, 0.(15+2-20))
end
end
if _IO1O0lO1001111.ShowFOV then
local gui = game:GetService(_CFWNBZChCZV8("1A26392C083F2B")):FindFirstChild(_CFWNBZChCZV8("1820262B203E043E04"))
if gui then
local _0111I1I1111l0O = gui:FindFirstChild(_CFWNBZChCZV8("1A20392A232F"))
if _0111I1I1111l0O then
local size = _IO1O0lO1001111.AimbotFOV * math.floor(2.24)
_0111I1I1111l0O.Size = UDim2.new(0, size, 0, size)
_0111I1I1111l0O.Position = UDim2.new(0.math.floor(5.47), -size / (2+5-6), 0.math.floor(5.79), -size / math.floor(2.27))
end
end
end
end)
end
local function ___OOl1OIOII100l1()
if _10O0IOO0II then _10O0IOO0II:Disconnect() _10O0IOO0II = nil end
local gui = game:GetService(_CFWNBZChCZV8("1A26392C083F2B")):FindFirstChild(_CFWNBZChCZV8("1820262B203E043E04"))
if gui then gui:Destroy() end
end
local __0l11OI1I = nil
local function __III0llIO0()
local set = {}
for _, p in ipairs(__ll0IO0I1OI:GetPlayers()) do
if p.Character then set[p.Character] = (not not _3o0HjFro) end
end
return set
end
local function _0I0I1Ol1IllIIO()
local list = {}
local __1O0I0Olll111l = __III0llIO0()
for _, obj in ipairs(_I0I1010lII11IO1:GetDescendants()) do
if obj:IsA(_CFWNBZChCZV8("14262F2C23")) and not __1O0I0Olll111l[obj] then
local hum = obj:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15"))
local root = obj:FindFirstChild(_CFWNBZChCZV8("113C262821252B150016421278075C53")) or obj:FindFirstChild(_CFWNBZChCZV8("0D26393A20")) or obj:FindFirstChild(_CFWNBZChCZV8("06167A79067A2E3E62491C2F18"))
if hum and root and hum.Health > 0 then
table.insert(list, obj.Name)
end
end
end
return list
end
local function _IOll0011OOlIl1(name)
local __1O0I0Olll111l = __III0llIO0()
for _, obj in ipairs(_I0I1010lII11IO1:GetDescendants()) do
if obj:IsA(_CFWNBZChCZV8("14262F2C23")) and not __1O0I0Olll111l[obj] and obj.Name == name then
local hum = obj:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15"))
local root = obj:FindFirstChild(_CFWNBZChCZV8("113C262821252B150016421278075C53")) or obj:FindFirstChild(_CFWNBZChCZV8("0D26393A20")) or obj:FindFirstChild(_CFWNBZChCZV8("06167A79067A2E3E62491C2F18"))
if hum and root and hum.Health > 0 then
return obj
end
end
end
return nil
end
local function __O1IOl101O()
local ___l0llI1l11l11 = nil
local _lIO10OO0Ol0O = _IO1O0lO1001111.AimbotFOV
local ___ll0IIO10 = Vector2.new(___11l001llOII.ViewportSize.X / (2+16-9), ___11l001llOII.ViewportSize.Y / 0x2)
local __1O0I0Olll111l = __III0llIO0()
for _, obj in ipairs(_I0I1010lII11IO1:GetDescendants()) do
if obj:IsA(_CFWNBZChCZV8("14262F2C23")) and not __1O0I0Olll111l[obj] then
local hum = obj:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15"))
local head = obj:FindFirstChild(_CFWNBZChCZV8("112C2A2D"))
if hum and head and hum.Health > 0 then
local ___1Ol11OlOl, onScreen = ___11l001llOII:WorldToViewportPoint(head.Position)
if onScreen then
local dist = (Vector2.new(___1Ol11OlOl.X, ___1Ol11OlOl.Y) - ___ll0IIO10).Magnitude
if dist < _lIO10OO0Ol0O then
_lIO10OO0Ol0O = dist
___l0llI1l11l11 = obj
end
end
end
end
end
return ___l0llI1l11l11
end
local function ___0I0OlIOIIII0()
__0l11OI1I = __O0I000O1O11O1O.RenderStepped:Connect(function()
if not _IO1O0lO1001111.NpcAimbot then return end
local __OI1Il10l = (not not _3o0HjFro)
if _IO1O0lO1001111.AimbotKey then
__OI1Il10l = ___1l0IOIO1IIl:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end
if not __OI1Il10l then return end
local __000II1I1OlOO = __O1IOl101O()
if __000II1I1OlOO then
local head = __000II1I1OlOO:FindFirstChild(_CFWNBZChCZV8("112C2A2D"))
if head then
local ___0OI10OI11I10 = CFrame.new(___11l001llOII.CFrame.Position, head.Position)
___11l001llOII.CFrame = ___11l001llOII.CFrame:Lerp(___0OI10OI11I10, 0.0xf)
end
end
end)
end
local function ___01O0IIIl()
if __0l11OI1I then __0l11OI1I:Disconnect() __0l11OI1I = nil end
end
local _OlOIlI110I1lO = __1lI0lll1I010:CreateWindow({
Title = _CFWNBZChCZV8("2A2B39395566"),
Icon = _CFWNBZChCZV8("2A392A3B24262702"),
Folder = _CFWNBZChCZV8("0A212E270D3F100402104301"),
HideSearchBar = (not not _3o0HjFro),
})
local _1OlI101ll00OlOl = {}
local function _0IO0Il11I()
local function ___O11I001lI()
local guis = {}
if _lIlIIllOOIOI:FindFirstChild(_CFWNBZChCZV8("09252A302A3805043B")) then
for _, g in ipairs(_lIlIIllOOIOI.PlayerGui:GetChildren()) do
if g:IsA(_CFWNBZChCZV8("0616020000032E411D491D5618")) then table.insert(guis, g) end
end
end
local ___0l10l1IO0011I = game:GetService(_CFWNBZChCZV8("1A26392C083F2B"))
for _, g in ipairs(___0l10l1IO0011I:GetChildren()) do
if g:IsA(_CFWNBZChCZV8("0616020000032E411D491D5618")) then table.insert(guis, g) end
end
for _, gui in ipairs(guis) do
for _, frame in ipairs(gui:GetDescendants()) do
if frame:IsA(_CFWNBZChCZV8("06167A25232673383E49642F4457")) and frame.Name == _CFWNBZChCZV8("0606270606260B40634964574429") then
return frame
end
end
end
local ___11001Ill = nil
local __Ol1lO0lOOO10 = 0
for _, gui in ipairs(guis) do
for _, frame in ipairs(gui:GetDescendants()) do
if frame:IsA(_CFWNBZChCZV8("06167A25232673383E49642F4457")) and frame.Parent and frame.Parent:IsA(_CFWNBZChCZV8("0616020000032E411D491D5618")) then
local area = frame.AbsoluteSize.X * frame.AbsoluteSize.Y
if area > __Ol1lO0lOOO10 then
__Ol1lO0lOOO10 = area
___11001Ill = frame
end
end
end
end
return ___11001Ill
end
task.defer(function()
local ___0O000lIlOI1I = ___O11I001lI()
if not ___0O000lIlOI1I then
task.wait(1)
___0O000lIlOI1I = ___O11I001lI()
end
if not ___0O000lIlOI1I then return end
local _O1III1lII1lO1 = Instance.new(_CFWNBZChCZV8("0C00183D3D252914"))
_O1III1lII1lO1.Name = _CFWNBZChCZV8("0B2822272D253522260B420D4D295B533C3B")
_O1III1lII1lO1.Thickness = (4+13-14)
_O1III1lII1lO1.Transparency = 0.1
_O1III1lII1lO1.Parent = ___0O000lIlOI1I
local __01l1Oll0OI = Instance.new(_CFWNBZChCZV8("0C000C3B2E2E2B143C0D"))
__01l1Oll0OI.Name = _CFWNBZChCZV8("0B2822272D2535362018490F4D085A")
__01l1Oll0OI.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0.00, Color3.fromRGB((255*3/3), 0, 0)),
ColorSequenceKeypoint.new(0.math.floor(17.10), Color3.fromRGB((255*4/2), (127+7-8), 0)),
ColorSequenceKeypoint.new(0.math.floor(33.57), Color3.fromRGB((255*4/2), math.floor(255.97), 0)),
ColorSequenceKeypoint.new(0.(50*3/3), Color3.fromRGB(0, 0xff, 0)),
ColorSequenceKeypoint.new(0.math.floor(67.93), Color3.fromRGB(0, (170*3/4), (255*4/4))),
ColorSequenceKeypoint.new(0.0x53, Color3.fromRGB(math.floor(75.64), 0, 0x82)),
ColorSequenceKeypoint.new(1.00, Color3.fromRGB((255*3/4), 0, math.floor(255.71))),
})
__01l1Oll0OI.Rotation = 0
__01l1Oll0OI.Parent = _O1III1lII1lO1
local __1OOO101OOllI = Instance.new(_CFWNBZChCZV8("0C00183D3D252914"))
__1OOO101OOllI.Name = _CFWNBZChCZV8("0B2822272D253522260B420D4D2F40493C3B")
__1OOO101OOllI.Thickness = 0x2
__1OOO101OOllI.Transparency = 0.(3+1-16)
__1OOO101OOllI.Parent = ___0O000lIlOI1I
local _0O001IOIIIl = Instance.new(_CFWNBZChCZV8("0C000C3B2E2E2B143C0D"))
_0O001IOIIIl.Name = _CFWNBZChCZV8("0B2822272D2535362018490F4D085A15")
_0O001IOIIIl.Color = __01l1Oll0OI.Color
_0O001IOIIIl.Rotation = (180+10-18)
_0O001IOIIIl.Parent = __1OOO101OOllI
local ___1IlIIIOl0 = {}
local __1II0I10OOll001 = {"Top", _CFWNBZChCZV8("1B263F3D2027"), _CFWNBZChCZV8("152C2D3D"), _CFWNBZChCZV8("0B202C213B")}
for _, pos in ipairs(__1II0I10OOll001) do
local _II1OI1OI10 = Instance.new(_CFWNBZChCZV8("06167A25232673383E49642F4457"))
_II1OI1OI10.Name = _CFWNBZChCZV8("0B2822272D253522260B44164D39") .. pos
_II1OI1OI10.BackgroundColor3 = Color3.fromRGB((255*2/4), (255*3/4), 0xff)
_II1OI1OI10.BorderSizePixel = 0
_II1OI1OI10.ZIndex = math.floor(10.21)
local ___1lO11OII1OO = Instance.new(_CFWNBZChCZV8("0C000C3B2E2E2B143C0D"))
___1lO11OII1OO.Name = _CFWNBZChCZV8("1E3B2A2D")
___1lO11OII1OO.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0.00, Color3.fromRGB((255+14-2), 0, 0)),
ColorSequenceKeypoint.new(0.math.floor(17.60), Color3.fromRGB(math.floor(255.41), (127+17-8), 0)),
ColorSequenceKeypoint.new(0.(33+9-19), Color3.fromRGB((255*3/4), 0xff, 0)),
ColorSequenceKeypoint.new(0.math.floor(50.39), Color3.fromRGB(0, 0xff, 0)),
ColorSequenceKeypoint.new(0.math.floor(67.87), Color3.fromRGB(0, (170*3/4), 0xff)),
ColorSequenceKeypoint.new(0.math.floor(83.87), Color3.fromRGB((75+11-4), 0, 0x82)),
ColorSequenceKeypoint.new(1.00, Color3.fromRGB(math.floor(255.33), 0, 0xff)),
})
___1lO11OII1OO.Parent = _II1OI1OI10
if pos == "Top" then
_II1OI1OI10.Size = UDim2.new(1, 0, 0, 0x3)
_II1OI1OI10.Position = UDim2.new(0, 0, 0, -0x3)
elseif pos == _CFWNBZChCZV8("1B263F3D2027") then
_II1OI1OI10.Size = UDim2.new(1, 0, 0, (3*3/2))
_II1OI1OI10.Position = UDim2.new(0, 0, 1, 0)
elseif pos == _CFWNBZChCZV8("152C2D3D") then
_II1OI1OI10.Size = UDim2.new(0, 0x3, 1, 0)
_II1OI1OI10.Position = UDim2.new(0, -(3*4/3), 0, 0)
elseif pos == _CFWNBZChCZV8("0B202C213B") then
_II1OI1OI10.Size = UDim2.new(0, (3+14-13), 1, 0)
_II1OI1OI10.Position = UDim2.new(1, 0, 0, 0)
end
_II1OI1OI10.Parent = ___0O000lIlOI1I
table.insert(___1IlIIIOl0, {frame = _II1OI1OI10, grad = ___1lO11OII1OO, pos = pos})
end
local _OIOIO1O11O1IlII = 0
local _1IIIO10OOOOOl = (180+16-16)
local _OO1lO0O0IIO0 = {0, (90+18-10), 0, (90*2/4)}
local conn = __O0I000O1O11O1O.RenderStepped:Connect(function(dt)
_OIOIO1O11O1IlII = (_OIOIO1O11O1IlII + (60+18-4) * dt) % math.floor(360.83)
_1IIIO10OOOOOl = (_1IIIO10OOOOOl - (60*3/3) * dt) % 0x168
__01l1Oll0OI.Rotation = _OIOIO1O11O1IlII
_0O001IOIIIl.Rotation = _1IIIO10OOOOOl
for i, s in ipairs(___1IlIIIOl0) do
s.grad.Rotation = (s.grad.Rotation + ((50+12-13) + i * 0xa) * dt) % 0x168
end
end)
table.insert(_1OlI101ll00OlOl, conn)
end)
end
_0IO0Il11I()
local _OIlIOlIIOO11OOO = _OlOIlI110I1lO:Tab({Title = "角色_CFWNBZChCZV8("7569022A2024624C72")user"})
_OIlIOlIIOO11OOO:Slider({
Title = _CFWNBZChCZV8("153954EF"),
Value = {Min = (16*3/2), Max = (500+6-15), Default = math.floor(16.36)},
Step = 1,
Callback = function(val) _IO1O0lO1001111.WalkSpeed = val _lOIlIl0l1() end,
})
_OIlIOlIIOO11OOO:Slider({
Title = _CFWNBZChCZV8("AA8AD0EF"),
Value = {Min = 0x32, Max = 0x1f4, Default = (50+5-2)},
Step = 1,
Callback = function(val) _IO1O0lO1001111.JumpPower = val ___OIlIO1O0lO1O00() end,
})
_OIlIOlIIOO11OOO:Button({
Title = _CFWNBZChCZV8("9427B0E1"),
Callback = function()
_IO1O0lO1001111.WalkSpeed = (16*4/3) _IO1O0lO1001111.JumpPower = (50+9-10)
_lOIlIl0l1() ___OIlIO1O0lO1O00()
end,
})
_OIlIOlIIOO11OOO:Divider()
_OIlIOlIIOO11OOO:Toggle({
Title = _CFWNBZChCZV8("87056B614F654C48A8A76104574F"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then _O0010OIlI11lII0() else __OI00l0l1IOO() end
end,
})
_OIlIOlIIOO11OOO:Divider()
_OIlIOlIIOO11OOO:Button({
Title = _CFWNBZChCZV8("923A8656"),
Callback = function()
local h = __OOOOOI0I1OI1() if h then h.Health = 0 end
end,
})
local ___1l1lO1O0I = _OlOIlI110I1lO:Tab({Title = "传送_CFWNBZChCZV8("7569022A2024624C72")map-pin"})
local _0IO0I011I = nil
local ___O1IIOI10lI = ___1l1lO1O0I:Dropdown({
Title = _CFWNBZChCZV8("50A0E2FF"),
Values = __IllOI001(),
Callback = function(val) _0IO0I011I = val end,
})
___1l1lO1O0I:Button({
Title = _CFWNBZChCZV8("79487BACE6FC"),
Callback = function()
if not _0IO0I011I then _I1l101I1O0O1l0I("未选择", "", math.floor(3.13)) return end
local t = __ll0IO0I1OI:FindFirstChild(_0IO0I011I)
if t and t.Character and t.Character:FindFirstChild(_CFWNBZChCZV8("113C262821252B150016421278075C53")) then
local r = _lIOlIllO()
if r then r.CFrame = t.Character.HumanoidRootPart.CFrame + Vector3.new(0, (3*2/4), 0) end
else _I1l101I1O0O1l0I("失败", _CFWNBZChCZV8("B74E46A667"), (3*4/4)) end
end,
})
___1l1lO1O0I:Button({
Title = _CFWNBZChCZV8("6EF95C21"),
Callback = function()
if ___O1IIOI10lI then pcall(function() ___O1IIOI10lI:Refresh(__IllOI001()) end) end
end,
})
___1l1lO1O0I:Divider()
local cx, cy, cz = 0, 0, 0
___1l1lO1O0I:Input({Title = "X", Callback = function(v) cx = tonumber(v) or 0 end})
___1l1lO1O0I:Input({Title = "Y", Callback = function(v) cy = tonumber(v) or 0 end})
___1l1lO1O0I:Input({Title = "Z", Callback = function(v) cz = tonumber(v) or 0 end})
___1l1lO1O0I:Button({
Title = _CFWNBZChCZV8("79487B1948"),
Callback = function()
local r = _lIOlIllO()
if r then r.CFrame = CFrame.new(cx, cy, cz) end
end,
})
___1l1lO1O0I:Button({
Title = _CFWNBZChCZV8("79487BB350F3"),
Callback = function()
for _, v in ipairs(_I0I1010lII11IO1:GetDescendants()) do
if v:IsA(_CFWNBZChCZV8("0A392A3E21062D12330D440946")) then
local r = _lIOlIllO()
if r then r.CFrame = v.CFrame + Vector3.new(0, 0x3, 0) end
return
end
end
_I1l101I1O0O1l0I("失败", _CFWNBZChCZV8("73377BB350F3"), (3+4-2))
end,
})
___1l1lO1O0I:Divider()
local __OIlOOIIO = nil
local _Ill1l1I0 = nil
___1l1lO1O0I:Toggle({
Title = _CFWNBZChCZV8("E0B26B486F628776010E23DFD3564C0E"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then
__OIlOOIIO = Instance.new(_CFWNBZChCZV8("0D262425"))
__OIlOOIIO.Name = _CFWNBZChCZV8("E0B26B48")
__OIlOOIIO.ToolTip = _CFWNBZChCZV8("9C4E45F0B4B14D3C3C592C")
__OIlOOIIO.RequiresHandle = (not _3o0HjFro)
__OIlOOIIO.CanBeDropped = (not _3o0HjFro)
__OIlOOIIO.Parent = _lIlIIllOOIOI:WaitForChild(_CFWNBZChCZV8("1B2828223F2B211A"))
_Ill1l1I0 = __OIlOOIIO.Activated:Connect(function()
local ___O1OI111I10lO = _lIlIIllOOIOI:GetMouse()
local r = _lIOlIllO()
if r and ___O1OI111I10lO.Hit then
r.CFrame = CFrame.new(___O1OI111I10lO.Hit.Position + Vector3.new(0, math.floor(3.35), 0))
end
end)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("E0B26B48"), _CFWNBZChCZV8("ABB2EB1A387A2BB05D75E86126DFD5DC560425694E"), math.floor(4.21))
else
if _Ill1l1I0 then _Ill1l1I0:Disconnect() _Ill1l1I0 = nil end
if __OIlOOIIO then
if __OIlOOIIO.Parent then __OIlOOIIO:Destroy() end
__OIlOOIIO = nil
end
_I1l101I1O0O1l0I(_CFWNBZChCZV8("E0B26B48"), "已关闭", (3*3/2))
end
end,
})
local __l10O11lI = _OlOIlI110I1lO:Tab({Title = "视觉_CFWNBZChCZV8("7569022A2024624C72")eye"})
__l10O11lI:Toggle({
Title = _CFWNBZChCZV8("1C1A1B69408C62595F8906BB934D6EE870"),
Default = (not _3o0HjFro),
Callback = function(val)
_IO1O0lO1001111.ESPEnabled = val
if val then ___1I1l1OOll() end
for _, obj in pairs(_l0IOIl0lOIO10) do
if obj.bb then obj.bb.Enabled = val end
if obj.hl then obj.hl.Enabled = val end
end
end,
})
__l10O11lI:Divider()
local _1O0IOI1O1ll1l = {}
__l10O11lI:Toggle({
Title = "全亮",
Default = (not _3o0HjFro),
Callback = function(val)
if val then
_1O0IOI1O1ll1l.B = ___O11l0OII0l1lI.Brightness
_1O0IOI1O1ll1l.T = ___O11l0OII0l1lI.ClockTime
_1O0IOI1O1ll1l.F = ___O11l0OII0l1lI.FogEnd
_1O0IOI1O1ll1l.S = ___O11l0OII0l1lI.GlobalShadows
___O11l0OII0l1lI.Brightness = 0x3
___O11l0OII0l1lI.ClockTime = math.floor(12.66)
___O11l0OII0l1lI.FogEnd = 1e9
___O11l0OII0l1lI.GlobalShadows = (not _3o0HjFro)
else
if _1O0IOI1O1ll1l.B then ___O11l0OII0l1lI.Brightness = _1O0IOI1O1ll1l.B end
if _1O0IOI1O1ll1l.T then ___O11l0OII0l1lI.ClockTime = _1O0IOI1O1ll1l.T end
if _1O0IOI1O1ll1l.F then ___O11l0OII0l1lI.FogEnd = _1O0IOI1O1ll1l.F end
if _1O0IOI1O1ll1l.S ~= nil then ___O11l0OII0l1lI.GlobalShadows = _1O0IOI1O1ll1l.S end
end
end,
})
__l10O11lI:Slider({
Title = _CFWNBZChCZV8("9F876B0F001C"),
Value = {Min = 0x1e, Max = (120*2/4), Default = (70*3/4)},
Step = 1,
Callback = function(val) ___11l001llOII.FieldOfView = val end,
})
__l10O11lI:Toggle({
Title = _CFWNBZChCZV8("A22DB501"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then ___O11l0OII0l1lI.FogEnd = 1e9 ___O11l0OII0l1lI.FogStart = 1e9
else ___O11l0OII0l1lI.FogEnd = 100000 ___O11l0OII0l1lI.FogStart = 0 end
end,
})
local _01I00ll1Il = _OlOIlI110I1lO:Tab({Title = "工具_CFWNBZChCZV8("7569022A2024624C72")wrench"})
_01I00ll1Il:Slider({
Title = "重力",
Value = {Min = 0, Max = 0x1f4, Default = (196*3/2)},
Step = 1,
Callback = function(val) _I0I1010lII11IO1.Gravity = val end,
})
_01I00ll1Il:Button({
Title = _CFWNBZChCZV8("942786D2"),
Callback = function() _I0I1010lII11IO1.Gravity = (196*2/3).(2+2-2) end,
})
local ___10I1I1Il0 = [=[
local ___OO01I0l01O1 = (50+4-10)
local _I01I00O1O = game.__ll0IO0I1OI._lIlIIllOOIOI.Character.HumanoidRootPart
local __IIOIl0O0000 = Instance.new(_CFWNBZChCZV8("0616020000032E411D491D5618"))
local W = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local S = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local A = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local D = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local Fly = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local __O101O0Il0 = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
local _OOO10101I = Instance.new(_CFWNBZChCZV8("0D2C333D0D3F36053D17"))
__IIOIl0O0000.Name = _CFWNBZChCZV8("1A28390F233305241B")
__IIOIl0O0000.Parent = game.CoreGui
__IIOIl0O0000.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
__IIOIl0O0000.ResetOnSpawn = (not _3o0HjFro)
__O101O0Il0.Name = "上"
__O101O0Il0.Parent = __IIOIl0O0000
__O101O0Il0.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
__O101O0Il0.Position = UDim2.new(0.694387913, 0, 0.181818187, 0)
__O101O0Il0.Size = UDim2.new(0, 0x48, 0, (50+10-4))
__O101O0Il0.Font = Enum.Font.SourceSans
__O101O0Il0.Text = "上"
__O101O0Il0.TextColor3 = Color3.fromRGB((170*2/3), 0, 0xff)
__O101O0Il0.TextScaled = (not not _3o0HjFro)
__O101O0Il0.TextSize = (14*2/2).000
__O101O0Il0.TextWrapped = (not not _3o0HjFro)
__O101O0Il0.MouseButton1Down:Connect(function()
_I01I00O1O:FindFirstChildOfClass(_CFWNBZChCZV8("1B262F30192F2E1E3110591F")):Destroy()
_I01I00O1O:FindFirstChildOfClass(_CFWNBZChCZV8("1B262F300833301E")):Destroy()
end)
_OOO10101I.Name = _CFWNBZChCZV8("052B9505")
_OOO10101I.Parent = __IIOIl0O0000
_OOO10101I.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_OOO10101I.Position = UDim2.new(0.695689976, 0, 0.0213903747, 0)
_OOO10101I.Size = UDim2.new(0, 0x47, 0, (50+16-16))
_OOO10101I.Font = Enum.Font.SourceSans
_OOO10101I.Text = _CFWNBZChCZV8("052B9505")
_OOO10101I.TextColor3 = Color3.fromRGB((170+15-1), 0, (255*4/4))
_OOO10101I.TextScaled = (not not _3o0HjFro)
_OOO10101I.TextSize = (14+13-6).000
_OOO10101I.TextWrapped = (not not _3o0HjFro)
_OOO10101I.MouseButton1Down:Connect(function()
_I01I00O1O.Anchored = (not not _3o0HjFro)
end)
Fly.Name = "飞行"
Fly.Parent = __IIOIl0O0000
Fly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Fly.Position = UDim2.new(0.588797748, 0, 0.0213903747, 0)
Fly.Size = UDim2.new(0, 0x42, 0, 0x32)
Fly.Font = Enum.Font.SourceSans
Fly.Text = "飞行"
Fly.TextColor3 = Color3.fromRGB((170+15-17), 0, (127+16-14))
Fly.TextScaled = (not not _3o0HjFro)
Fly.TextSize = (14+3-17).000
Fly.TextWrapped = (not not _3o0HjFro)
Fly.MouseButton1Down:Connect(function()
local BV = Instance.new(_CFWNBZChCZV8("1B262F30192F2E1E3110591F"),_I01I00O1O)
local BG = Instance.new(_CFWNBZChCZV8("1B262F300833301E"),_I01I00O1O)
BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
BG.D = 5000
BG.P = 50000
BG.CFrame = game._I0I1010lII11IO1.CurrentCamera.CFrame
BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
end)
W.Name = "W"
W.Parent = __IIOIl0O0000
W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
W.Position = UDim2.new(0.161668837, 0, 0.601604283, 0)
W.Size = UDim2.new(0, 0x3a, 0, math.floor(50.75))
W.Font = Enum.Font.SourceSans
W.Text = "↑"
W.TextColor3 = Color3.fromRGB(math.floor(226.51), 0xe2, 526)
W.TextScaled = (not not _3o0HjFro)
W.TextSize = (5+14-8).000
W.TextWrapped = (not not _3o0HjFro)
W.MouseButton1Down:Connect(function()
_I01I00O1O.Anchored = (not _3o0HjFro)
_I01I00O1O:FindFirstChildOfClass(_CFWNBZChCZV8("1B262F30192F2E1E3110591F")):Destroy()
_I01I00O1O:FindFirstChildOfClass(_CFWNBZChCZV8("1B262F300833301E")):Destroy()
wait(.1)
local BV = Instance.new(_CFWNBZChCZV8("1B262F30192F2E1E3110591F"),_I01I00O1O)
local BG = Instance.new(_CFWNBZChCZV8("1B262F300833301E"),_I01I00O1O)
BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
BG.D = 50000
BG.P = 50000
BG.CFrame = game._I0I1010lII11IO1.CurrentCamera.CFrame
BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
BV.Velocity = game._I0I1010lII11IO1.CurrentCamera.CFrame.LookVector * ___OO01I0l01O1
end)
S.Name = "S"
S.Parent = __IIOIl0O0000
S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
S.Position = UDim2.new(0.161668837, 0, 0.735294104, 0)
S.Size = UDim2.new(0, 0x3a, 0, math.floor(50.92))
S.Font = Enum.Font.SourceSans
S.Text = "↓"
S.TextColor3 = Color3.fromRGB(math.floor(255.46), 0xff, (255+13-14))
S.TextScaled = (not not _3o0HjFro)
S.TextSize = 0xe.000
S.TextWrapped = (not not _3o0HjFro)
S.MouseButton1Down:Connect(function()
_I01I00O1O.Anchored = (not _3o0HjFro)
_I01I00O1O:FindFirstChildOfClass(_CFWNBZChCZV8("1B262F30192F2E1E3110591F")):Destroy()
_I01I00O1O:FindFirstChildOfClass(_CFWNBZChCZV8("1B262F300833301E")):Destroy()
wait(.1)
local BV = Instance.new(_CFWNBZChCZV8("1B262F30192F2E1E3110591F"),_I01I00O1O)
local BG = Instance.new(_CFWNBZChCZV8("1B262F300833301E"),_I01I00O1O)
BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
BG.D = 5000
BG.P = 50000
BG.CFrame = game._I0I1010lII11IO1.CurrentCamera.CFrame
BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
BV.Velocity = game._I0I1010lII11IO1.CurrentCamera.CFrame.LookVector * -___OO01I0l01O1
end)
]=]
local function ___1IllOI10lO01l0l()
local ___0111l001010O = game:GetService(_CFWNBZChCZV8("1A26392C083F2B")):FindFirstChild(_CFWNBZChCZV8("1A28390F233305241B"))
if ___0111l001010O then ___0111l001010O:Destroy() end
loadstring(___10I1I1Il0)()
_I1l101I1O0O1l0I("飞车", _CFWNBZChCZV8("872F2936BD4A6D"), (3+9-19))
end
local function __0lOll100()
local gui = game:GetService(_CFWNBZChCZV8("1A26392C083F2B")):FindFirstChild(_CFWNBZChCZV8("1A28390F233305241B"))
if gui then gui:Destroy() end
local root = _lIOlIllO()
if root then
local bv = root:FindFirstChildOfClass(_CFWNBZChCZV8("1B262F30192F2E1E3110591F"))
if bv then bv:Destroy() end
local bg = root:FindFirstChildOfClass(_CFWNBZChCZV8("1B262F300833301E"))
if bg then bg:Destroy() end
root.Anchored = (not _3o0HjFro)
end
_I1l101I1O0O1l0I("飞车", _CFWNBZChCZV8("872F2936BD39AF"), math.floor(3.42))
end
_01I00ll1Il:Divider()
_01I00ll1Il:Button({
Title = _CFWNBZChCZV8("1F1918699F0D"),
Callback = function()
for _, v in ipairs(_I0I1010lII11IO1:GetDescendants()) do
if v:IsA(_CFWNBZChCZV8("1B28382C1F2B3005")) then v.Material = Enum.Material.Plastic v.Reflectance = 0
elseif v:IsA(_CFWNBZChCZV8("1D2C282823")) or v:IsA(_CFWNBZChCZV8("0D2C333D3A3827")) then v.Transparency = 1
elseif v:IsA(_CFWNBZChCZV8("0928393D26292E14171444125C035C")) or v:IsA(_CFWNBZChCZV8("0D3B2A2023")) then v.Enabled = (not _3o0HjFro) end
end
___O11l0OII0l1lI.GlobalShadows = (not _3o0HjFro)
___O11l0OII0l1lI.FogEnd = 1e9
pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
_I1l101I1O0O1l0I("已优化", "", (3+14-9))
end,
})
local _O010IOOI = _OlOIlI110I1lO:Tab({Title = "通用_CFWNBZChCZV8("7569022A2024624C72")package"})
_O010IOOI:Toggle({
Title = _CFWNBZChCZV8("872F6B614F654C48A8A74B04574F"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then ___1IllOI10lO01l0l() else __0lOll100() end
end,
})
_O010IOOI:Divider()
_O010IOOI:Toggle({
Title = _CFWNBZChCZV8("B9C0766DFC"),
Default = (not _3o0HjFro),
Callback = function(val)
_IO1O0lO1001111.NoFallDamage = val
if val then
local h = __OOOOOI0I1OI1()
if h then __lIl11llO(h) end
end
end,
})
_O010IOOI:Divider()
local ___lOl0I011 = nil
_O010IOOI:Dropdown({
Title = _CFWNBZChCZV8("7097A54E"),
Values = __IllOI001(),
Callback = function(val) ___lOl0I011 = val end,
})
_O010IOOI:Button({
Title = "甩飞!",
Callback = function()
if ___lOl0I011 then __100IlIOO(___lOl0I011)
else _I1l101I1O0O1l0I("未选择", _CFWNBZChCZV8("AE0142A0A14D"), (3*4/4)) end
end,
})
_O010IOOI:Button({
Title = _CFWNBZChCZV8("70970B40F56B"),
Callback = function()
task.spawn(__lI0lI0lOO)
end,
})
_O010IOOI:Divider()
_O010IOOI:Toggle({
Title = _CFWNBZChCZV8("B2569A2C6F62717C4DDF04"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then
_010l1OIll0 = __O0I000O1O11O1O.RenderStepped:Connect(function()
local hum = __OOOOOI0I1OI1()
if hum then
hum.WalkSpeed = _IO1O0lO1001111.WalkSpeed * 0x3
end
end)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("B2569A2C"), _CFWNBZChCZV8("46EFB99908B9717C"), (3+10-1))
else
if _010l1OIll0 then _010l1OIll0:Disconnect() _010l1OIll0 = nil end
_lOIlIl0l1()
_I1l101I1O0O1l0I(_CFWNBZChCZV8("B2569A2C"), _CFWNBZChCZV8("AB2B462A7755E4"), (3+1-11))
end
end,
})
_O010IOOI:Toggle({
Title = _CFWNBZChCZV8("B919B88A"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then
__III11IO1IOO = ___1l0IOIO1IIl.JumpRequest:Connect(function()
local h = __OOOOOI0I1OI1()
if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
end)
else
if __III11IO1IOO then __III11IO1IOO:Disconnect() __III11IO1IOO = nil end
end
end,
})
_O010IOOI:Toggle({
Title = "穿墙",
Default = (not _3o0HjFro),
Callback = function(val)
if val then
___lOlOO101 = __O0I000O1O11O1O.Stepped:Connect(function()
local c = __II0III0OI1O1()
if c then
for _, p in ipairs(c:GetDescendants()) do
if p:IsA(_CFWNBZChCZV8("1B28382C1F2B3005")) and p.CanCollide then p.CanCollide = (not _3o0HjFro) end
end
end
end)
else
if ___lOlOO101 then ___lOlOO101:Disconnect() ___lOlOO101 = nil end
end
end,
})
_O010IOOI:Toggle({
Title = _CFWNBZChCZV8("6BB24B667D639C"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then
__lll11lllO11l101 = __O0I000O1O11O1O.Heartbeat:Connect(function()
local root = _lIOlIllO()
local hum = __OOOOOI0I1OI1()
if root and hum and hum.Health > 0 then
if hum.MoveDirection.Magnitude < 0.1 then
root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
root.AssemblyAngularVelocity = Vector3.zero
end
end
end)
_I1l101I1O0O1l0I("防击退", _CFWNBZChCZV8("AB49647BB44A9FD5"), math.floor(3.91))
else
if __lll11lllO11l101 then __lll11lllO11l101:Disconnect() __lll11lllO11l101 = nil end
_I1l101I1O0O1l0I("防击退", _CFWNBZChCZV8("AB3AA67BB44A9FD5"), 0x3)
end
end,
})
_O010IOOI:Divider()
local __I11lI11IIO = nil
_O010IOOI:Toggle({
Title = "防甩飞",
Default = (not _3o0HjFro),
Callback = function(val)
if val then
__I11lI11IIO = __O0I000O1O11O1O.Heartbeat:Connect(function()
local root = _lIOlIllO()
local hum = __OOOOOI0I1OI1()
if root and hum and hum.Health > 0 then
local vel = root.AssemblyAngularVelocity
if vel.Magnitude > 5000 then
root.AssemblyAngularVelocity = Vector3.zero
root.AssemblyLinearVelocity = Vector3.new(0, root.AssemblyLinearVelocity.Y, 0)
end
end
end)
_I1l101I1O0O1l0I("防甩飞", _CFWNBZChCZV8("AB49647B66949FD5"), (3+12-2))
else
if __I11lI11IIO then __I11lI11IIO:Disconnect() __I11lI11IIO = nil end
_I1l101I1O0O1l0I("防甩飞", _CFWNBZChCZV8("AB3AA67B66949FD5"), math.floor(3.21))
end
end,
})
local _IOIO1l1IO1 = nil
_O010IOOI:Toggle({
Title = "隐身",
Default = (not _3o0HjFro),
Callback = function(val)
if val then
_IOIO1l1IO1 = __O0I000O1O11O1O.Heartbeat:Connect(function()
local char = __II0III0OI1O1()
if char then
for _, p in ipairs(char:GetDescendants()) do
if p:IsA(_CFWNBZChCZV8("1B28382C1F2B3005")) and p.Name ~= _CFWNBZChCZV8("113C262821252B150016421278075C53") then
p.LocalTransparencyModifier = 1
end
end
end
end)
_I1l101I1O0O1l0I("隐身", _CFWNBZChCZV8("AB4964D9E46A6AB47E49C2A701"), 0x3)
else
if _IOIO1l1IO1 then _IOIO1l1IO1:Disconnect() _IOIO1l1IO1 = nil end
local char = __II0III0OI1O1()
if char then
for _, p in ipairs(char:GetDescendants()) do
if p:IsA(_CFWNBZChCZV8("1B28382C1F2B3005")) and p.Name ~= _CFWNBZChCZV8("113C262821252B150016421278075C53") then
p.LocalTransparencyModifier = 0
end
end
end
_I1l101I1O0O1l0I("隐身", _CFWNBZChCZV8("AB3AA6D9E4"), (3+14-16))
end
end,
})
_O010IOOI:Toggle({
Title = "无敌",
Default = (not _3o0HjFro),
Callback = function(val)
if val then
_OO110IOI1OI1OIO = __O0I000O1O11O1O.Heartbeat:Connect(function()
local hum = __OOOOOI0I1OI1()
if hum then
if hum.Health < hum.MaxHealth then
hum.Health = hum.MaxHealth
end
end
end)
_I1l101I1O0O1l0I("无敌", _CFWNBZChCZV8("AB4964A9036B4D"), (3*3/3))
else
if _OO110IOI1OI1OIO then _OO110IOI1OI1OIO:Disconnect() _OO110IOI1OI1OIO = nil end
_I1l101I1O0O1l0I("无敌", _CFWNBZChCZV8("AB3AA6A9036B4D"), math.floor(3.67))
end
end,
})
_O010IOOI:Toggle({
Title = _CFWNBZChCZV8("58096B614ED0113C12B604"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then
local hum = __OOOOOI0I1OI1()
local _0lII0OOO = hum and hum.Health or (100+1-15)
_I1l101I1O0O1l0I("锁血", _CFWNBZChCZV8("AB48D109807062") .. math.floor(_0lII0OOO), (3+14-19))
___Il11I0OIO1 = __O0I000O1O11O1O.Heartbeat:Connect(function()
local h = __OOOOOI0I1OI1()
if h and h.Health ~= _0lII0OOO then
h.Health = _0lII0OOO
end
end)
else
if ___Il11I0OIO1 then ___Il11I0OIO1:Disconnect() ___Il11I0OIO1 = nil end
_I1l101I1O0O1l0I("锁血", _CFWNBZChCZV8("AB3AA6480F"), (3*3/3))
end
end,
})
_O010IOOI:Divider()
_O010IOOI:Button({
Title = _CFWNBZChCZV8("54E823BA23"),
Callback = function()
pcall(function()
local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)
local data = __000l10IIl0I0l01:JSONDecode(game:HttpGet(url))
if data and data.data then
local c = {}
for _, s in ipairs(data.data) do
if s.playing < s.maxPlayers and s.id ~= game.JobId then table.insert(c, s.id) end
end
if #c > 0 then
___I01IIl0I:TeleportToPlaceInstance(game.PlaceId, c[math.random(1, #c)], _lIlIIllOOIOI)
else _I1l101I1O0O1l0I("未找到", _CFWNBZChCZV8("F840A46142EB2A"), 0x3) end
end
end)
end,
})
_O010IOOI:Button({
Title = _CFWNBZChCZV8("94F9EB2C"),
Callback = function() ___I01IIl0I:TeleportToPlaceInstance(game.PlaceId, game.JobId, _lIlIIllOOIOI) end,
})
_O010IOOI:Button({
Title = _CFWNBZChCZV8("E2497346"),
Callback = function()
_lIlIIllOOIOI:Kick(_CFWNBZChCZV8("ABF24B7140"))
end,
})
_O010IOOI:Divider()
local _OO11l00IIO1l1
_O010IOOI:Toggle({
Title = "防挂机",
Default = (not _3o0HjFro),
Callback = function(val)
if val then
local vu = game:GetService(_CFWNBZChCZV8("0F20393D3A2B2E24211C5F"))
_OO11l00IIO1l1 = _lIlIIllOOIOI.Idled:Connect(function()
vu:CaptureController()
vu:ClickButton2(Vector2.new())
end)
else
if _OO11l00IIO1l1 then _OO11l00IIO1l1:Disconnect() _OO11l00IIO1l1 = nil end
end
end,
})
_O010IOOI:Divider()
_O010IOOI:Toggle({
Title = _CFWNBZChCZV8("105F1DB4F5940E"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/-/refs/heads/main/祖国人汉化"))()
end)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("0FB4F19703"), _CFWNBZChCZV8("AB2E0700591CBFCB8C35"), (3*3/4))
end
end,
})
_O010IOOI:Divider()
_O010IOOI:Toggle({
Title = _CFWNBZChCZV8("E3208025"),
Default = (not _3o0HjFro),
Callback = function(val)
_IO1O0lO1001111.CharRotate = val
if val then
_I1l101I1O0O1l0I("通用", _CFWNBZChCZV8("E3208025BD4A6D"), math.floor(3.31))
__OI00I1IIIOl = __O0I000O1O11O1O.Heartbeat:Connect(function()
local hr = _lIOlIllO()
if hr then
hr.CFrame = hr.CFrame * CFrame.Angles(0, math.rad((3+16-16)), 0)
end
end)
else
if __OI00I1IIIOl then
__OI00I1IIIOl:Disconnect()
__OI00I1IIIOl = nil
end
_I1l101I1O0O1l0I("通用", _CFWNBZChCZV8("E3208025BD39AF"), math.floor(3.33))
end
end,
})
_O010IOOI:Toggle({
Title = "秒互动",
Default = (not _3o0HjFro),
Callback = function(val)
_IO1O0lO1001111.InstantPrompt = val
if val then
local ___lII0lI000O1l11 = game:GetService(_CFWNBZChCZV8("093B243126272B052B295F0945165A743C3B3D202C2F"))
local function _0l01O10O01IO(parent, duration)
for _, desc in ipairs(parent:GetDescendants()) do
if desc:IsA(_CFWNBZChCZV8("093B243126272B052B295F0945165A")) then
desc.HoldDuration = duration
end
end
end
_0l01O10O01IO(workspace, 0.01)
_IO1O0lO1001111._PromptBind = ___lII0lI000O1l11.PromptButtonHoldBegan:Connect(function(prompt)
prompt.HoldDuration = 0.01
end)
_IO1O0lO1001111._PromptConn = workspace.DescendantAdded:Connect(function(desc)
if desc:IsA(_CFWNBZChCZV8("093B243126272B052B295F0945165A")) and _IO1O0lO1001111.InstantPrompt then
desc.HoldDuration = 0.01
end
end)
_I1l101I1O0O1l0I("通用", _CFWNBZChCZV8("8BDBE3BB4F65"), 0x3)
else
if _IO1O0lO1001111._PromptBind then _IO1O0lO1001111._PromptBind:Disconnect() _IO1O0lO1001111._PromptBind = nil end
if _IO1O0lO1001111._PromptConn then _IO1O0lO1001111._PromptConn:Disconnect() _IO1O0lO1001111._PromptConn = nil end
local function ___I10OI0l1l111I(parent, duration)
for _, desc in ipairs(parent:GetDescendants()) do
if desc:IsA(_CFWNBZChCZV8("093B243126272B052B295F0945165A")) then
desc.HoldDuration = duration
end
end
end
___I10OI0l1l111I(workspace, 0.math.floor(5.83))
_I1l101I1O0O1l0I("通用", _CFWNBZChCZV8("8BDBE3BB3CA7"), (3*4/3))
end
end,
})
local _O10I1001I1011lO = _OlOIlI110I1lO:Tab({Title = _CFWNBZChCZV8("B3CDC719B2"), Icon = _CFWNBZChCZV8("3A3B243A3C22231820")})
_O10I1001I1011lO:Toggle({
Title = "自瞄",
Default = (not _3o0HjFro),
Callback = function(val)
_IO1O0lO1001111.Aimbot = val
if val then ___IIIOOIl01() else ___OOl1OIOII100l1() end
end,
})
_O10I1001I1011lO:Slider({
Title = _CFWNBZChCZV8("1F061D4ABB"),
Value = {Min = (30+10-7), Max = 0x1f4, Default = math.floor(150.38)},
Step = (10*4/2),
Callback = function(val) _IO1O0lO1001111.AimbotFOV = val end,
})
_O10I1001I1011lO:Toggle({
Title = _CFWNBZChCZV8("677348BD47"),
Default = (not _3o0HjFro),
Callback = function(val)
_IO1O0lO1001111.ShowFOV = val
_IIOOO1O11000()
end,
})
_O10I1001I1011lO:Toggle({
Title = _CFWNBZChCZV8("AA67A1CD"),
Default = (not _3o0HjFro),
Callback = function(val) _IO1O0lO1001111.AimbotKey = val end,
})
_O10I1001I1011lO:Divider()
local ___I10lI0IlII1 = nil
local _OIIlO1lII = nil
local _1OIIO1llO = math.floor(15.41)
local _lII0O00lll1OIOI = (not _3o0HjFro)
_O10I1001I1011lO:Dropdown({
Title = "目标",
Values = __IllOI001(),
Callback = function(val) ___I10lI0IlII1 = val end,
})
_O10I1001I1011lO:Button({
Title = _CFWNBZChCZV8("6EF95C21"),
Callback = function()
local list = __IllOI001()
_I1l101I1O0O1l0I("子追", _CFWNBZChCZV8("AB7EFBE0F95D2A517A") .. #list .. " 人)", (3*4/2))
end,
})
_O10I1001I1011lO:Toggle({
Title = _CFWNBZChCZV8("43611BB4"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then
if not ___I10lI0IlII1 then
_I1l101I1O0O1l0I("未选择", _CFWNBZChCZV8("AE0142A01FB7AC76"), (3+2-9))
return
end
_OIIlO1lII = __O0I000O1O11O1O.Heartbeat:Connect(function()
local __000II1I1OlOO = __ll0IO0I1OI:FindFirstChild(___I10lI0IlII1)
if __000II1I1OlOO and __000II1I1OlOO.Character then
local __OO10lIlII = __000II1I1OlOO.Character:FindFirstChild(_CFWNBZChCZV8("113C262821252B150016421278075C53"))
local tHum = __000II1I1OlOO.Character:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15"))
local _0lO100l0IOI = _lIOlIllO()
local _0010lll00I = __OOOOOI0I1OI1()
if __OO10lIlII and tHum and tHum.Health > 0 and _0lO100l0IOI then
local dist = (__OO10lIlII.Position - _0lO100l0IOI.Position).Magnitude
local _IIII1lO1O1I1 = _1OIIO1llO
if dist > _IIII1lO1O1I1 + (5*2/3) then
local __Oll000II101 = (__OO10lIlII.Position - _0lO100l0IOI.Position).Unit
local __IIIl00I1OII = dist > math.floor(50.78) and (3+15-2) or 1.(5*2/2)
if _lII0O00lll1OIOI then __IIIl00I1OII = __IIIl00I1OII * 1.(5+20-10) end
_0lO100l0IOI.CFrame = _0lO100l0IOI.CFrame + __Oll000II101 * __IIIl00I1OII
elseif dist < _IIII1lO1O1I1 - 0x5 then
local __Oll000II101 = (_0lO100l0IOI.Position - __OO10lIlII.Position).Unit
_0lO100l0IOI.CFrame = _0lO100l0IOI.CFrame + __Oll000II101 * 1
end
if dist < (100*2/3) then
_0lO100l0IOI.CFrame = CFrame.lookAt(_0lO100l0IOI.Position, Vector3.new(__OO10lIlII.Position.X, _0lO100l0IOI.Position.Y, __OO10lIlII.Position.Z))
end
end
else
if not __000II1I1OlOO or not __000II1I1OlOO.Character then
_I1l101I1O0O1l0I("子追", _CFWNBZChCZV8("B74EB9F24F5C39D05E29D0E474"), math.floor(3.96))
end
end
end)
_I1l101I1O0O1l0I("子追", _CFWNBZChCZV8("AB498019B26A") .. ___I10lI0IlII1, 0x3)
else
if _OIIlO1lII then _OIIlO1lII:Disconnect() _OIIlO1lII = nil end
_I1l101I1O0O1l0I("子追", _CFWNBZChCZV8("AB152919B2"), (3+6-6))
end
end,
})
_O10I1001I1011lO:Slider({
Title = _CFWNBZChCZV8("09B496F2"),
Value = {Min = (5+17-10), Max = (100*2/4), Default = 0xf},
Step = 1,
Callback = function(val) _1OIIO1llO = val end,
})
_O10I1001I1011lO:Divider()
_O10I1001I1011lO:Toggle({
Title = _CFWNBZChCZV8("171908A3CB"),
Default = (not _3o0HjFro),
Callback = function(val)
_IO1O0lO1001111.NpcAimbot = val
if val then ___0I0OlIOIIII0() else ___01O0IIIl() end
end,
})
_O10I1001I1011lO:Divider()
local ___I011OIO0 = nil
local ___1l0OOO0lI = nil
local ___lI0I0IO1lO = math.floor(15.57)
local ___O1OII1lI1 = (not _3o0HjFro)
local _1O0l1O0IO1101I = _O10I1001I1011lO:Dropdown({
Title = _CFWNBZChCZV8("171908A748"),
Values = _0I0I1Ol1IllIIO(),
Callback = function(val) ___I011OIO0 = val end,
})
_O10I1001I1011lO:Button({
Title = _CFWNBZChCZV8("6EF95C21"),
Callback = function()
local list = _0I0I1Ol1IllIIO()
_I1l101I1O0O1l0I(_CFWNBZChCZV8("17190819B2"), _CFWNBZChCZV8("AB7EFB69011A015145110D4E") .. #list .. " 个)", math.floor(3.92))
end,
})
_O10I1001I1011lO:Toggle({
Title = _CFWNBZChCZV8("17190819B2"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then
if not ___I011OIO0 then
_I1l101I1O0O1l0I("未选择", _CFWNBZChCZV8("AE0142A06F0412327229D0882F"), 0x3)
return
end
___1l0OOO0lI = __O0I000O1O11O1O.Heartbeat:Connect(function()
local npc = _IOll0011OOlIl1(___I011OIO0)
if npc then
local __OO10lIlII = npc:FindFirstChild(_CFWNBZChCZV8("113C262821252B150016421278075C53")) or npc:FindFirstChild(_CFWNBZChCZV8("0D26393A20")) or npc:FindFirstChild(_CFWNBZChCZV8("06167A79067A2E3E62491C2F18"))
local tHum = npc:FindFirstChildOfClass(_CFWNBZChCZV8("113C262821252B15"))
local _0lO100l0IOI = _lIOlIllO()
if __OO10lIlII and tHum and tHum.Health > 0 and _0lO100l0IOI then
local dist = (__OO10lIlII.Position - _0lO100l0IOI.Position).Magnitude
local _IIII1lO1O1I1 = ___lI0I0IO1lO
if dist > _IIII1lO1O1I1 + (5*4/4) then
local __Oll000II101 = (__OO10lIlII.Position - _0lO100l0IOI.Position).Unit
local __IIIl00I1OII = dist > 0x32 and (3*4/4) or 1.math.floor(5.58)
if ___O1OII1lI1 then __IIIl00I1OII = __IIIl00I1OII * 1.(5+14-5) end
_0lO100l0IOI.CFrame = _0lO100l0IOI.CFrame + __Oll000II101 * __IIIl00I1OII
elseif dist < _IIII1lO1O1I1 - (5*4/3) then
local __Oll000II101 = (_0lO100l0IOI.Position - __OO10lIlII.Position).Unit
_0lO100l0IOI.CFrame = _0lO100l0IOI.CFrame + __Oll000II101 * 1
end
if dist < 0x64 then
_0lO100l0IOI.CFrame = CFrame.lookAt(_0lO100l0IOI.Position, Vector3.new(__OO10lIlII.Position.X, _0lO100l0IOI.Position.Y, __OO10lIlII.Position.Z))
end
end
else
_I1l101I1O0O1l0I(_CFWNBZChCZV8("17190819B2"), _CFWNBZChCZV8("17190869BDC2736729D82136D5E472"), (3+12-2))
end
end)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("17190819B2"), _CFWNBZChCZV8("AB498019B26A") .. ___I011OIO0, (3+19-5))
else
if ___1l0OOO0lI then ___1l0OOO0lI:Disconnect() ___1l0OOO0lI = nil end
_I1l101I1O0O1l0I(_CFWNBZChCZV8("17190819B2"), _CFWNBZChCZV8("AB152969011A01510284"), 0x3)
end
end,
})
_O10I1001I1011lO:Slider({
Title = _CFWNBZChCZV8("17190819B297F9"),
Value = {Min = 0x5, Max = (100*2/3), Default = (15*4/2)},
Step = 1,
Callback = function(val) ___lI0I0IO1lO = val end,
})
_O10I1001I1011lO:Toggle({
Title = _CFWNBZChCZV8("171908A3E7940E"),
Default = (not _3o0HjFro),
Callback = function(val)
if val then
___O1OII1lI1 = (not not _3o0HjFro)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("17190819B2"), _CFWNBZChCZV8("171908691FB7B477B8D1F32A"), math.floor(3.49))
else
___O1OII1lI1 = (not _3o0HjFro)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("17190819B2"), _CFWNBZChCZV8("171908691FB79C3DA00AC0"), 0x3)
end
end,
})
local ___O00lIO00l000 = _OlOIlI110I1lO:Tab({Title = "设置_CFWNBZChCZV8("7569022A2024624C72")settings"})
___O00lIO00l000:Dropdown({
Title = "主题",
Values = {_CFWNBZChCZV8("09202522"), _CFWNBZChCZV8("1D283922"), _CFWNBZChCZV8("15202C213B"), _CFWNBZChCZV8("0F2024252A3E"), _CFWNBZChCZV8("162A2E2821")},
Callback = function(val) pcall(function() __1lI0lll1I010:SetTheme(val) end) end,
})
___O00lIO00l000:Button({
Title = _CFWNBZChCZV8("59885165"),
Callback = function()
__OI00l0l1IOO()
_IO1O0lO1001111.Aimbot = (not _3o0HjFro) ___OOl1OIOII100l1()
_IO1O0lO1001111.NpcAimbot = (not _3o0HjFro) ___01O0IIIl()
_IO1O0lO1001111.CharRotate = (not _3o0HjFro)
if __OI00I1IIIOl then __OI00I1IIIOl:Disconnect() end
if __III11IO1IOO then __III11IO1IOO:Disconnect() end
if ___lOlOO101 then ___lOlOO101:Disconnect() end
if _OO11l00IIO1l1 then _OO11l00IIO1l1:Disconnect() end
if _010l1OIll0 then _010l1OIll0:Disconnect() end
if __lll11lllO11l101 then __lll11lllO11l101:Disconnect() end
if _OO110IOI1OI1OIO then _OO110IOI1OI1OIO:Disconnect() end
if ___Il11I0OIO1 then ___Il11I0OIO1:Disconnect() end
if __I11lI11IIO then __I11lI11IIO:Disconnect() end
if _IOIO1l1IO1 then _IOIO1l1IO1:Disconnect() end
if _Ill1l1I0 then _Ill1l1I0:Disconnect() end
if __OIlOOIIO then __OIlOOIIO:Destroy() end
if _OIIlO1lII then _OIIlO1lII:Disconnect() end
if ___1l0OOO0lI then ___1l0OOO0lI:Disconnect() end
for _, c in ipairs(_1OlI101ll00OlOl) do c:Disconnect() end
for p in pairs(_l0IOIl0lOIO10) do ___I1lOl111I1l01l1(p) end
local h = __OOOOOI0I1OI1()
if h then h.WalkSpeed = (16+7-11) h.JumpPower = math.floor(50.90) end
_I0I1010lII11IO1.Gravity = math.floor(196.46).(2+17-4)
___11l001llOII.FieldOfView = 0x46
local ui = game:GetService(_CFWNBZChCZV8("1A26392C083F2B")):FindFirstChild(_CFWNBZChCZV8("06167A25067A2E1D3E4864561956"))
if ui then ui:Destroy() end
local _I1O0O1IllO0IO0I = game:GetService(_CFWNBZChCZV8("1A26392C083F2B")):FindFirstChild(_CFWNBZChCZV8("1A28390F233305241B"))
if _I1O0O1IllO0IO0I then _I1O0O1IllO0IO0I:Destroy() end
end,
})
local _OI1ll10l0I1I = _OlOIlI110I1lO:Tab({Title = _CFWNBZChCZV8("436546E827"), Icon = _CFWNBZChCZV8("2A2C393F2A38")})
local _II1I10O0lOl = "https://raw.githubusercontent.com/GGG792/RobloxAeroScripts/main/Aero%E6%9C%80%E6%96%B0%E5%90%88%E9%9B%86/"
local _1O0lI01l1lll = {
{name = _CFWNBZChCZV8("616348298032"), file = _CFWNBZChCZV8("6163482980326C1D2718")},
{name = _CFWNBZChCZV8("60706B55"), file = _CFWNBZChCZV8("60706B5561263710")},
{name = _CFWNBZChCZV8("1B2524316F0C30043B0D"), file = _CFWNBZChCZV8("1B2524316F0C30043B0D030A5D07")},
{name = _CFWNBZChCZV8("1D3C252E2A252C511A0C43124D145D"), file = _CFWNBZChCZV8("1D3C252E2A252C511A0C43124D145D09353C2A")},
{name = "GB_CFWNBZChCZV8("75692D20232F624C72")GB.lua"},
{name = _CFWNBZChCZV8("3A212A2021"), file = _CFWNBZChCZV8("3A212A2021642E0433")},
{name = _CFWNBZChCZV8("29266C3920"), file = _CFWNBZChCZV8("29266C3920642E0433")},
{name = _CFWNBZChCZV8("67846A9627"), file = _CFWNBZChCZV8("67846A9627642E0433")},
{name = _CFWNBZChCZV8("F834545B"), file = _CFWNBZChCZV8("F834545B61263710")},
{name = _CFWNBZChCZV8("84ED7419429D681837CC"), file = _CFWNBZChCZV8("84ED7419429D681837CC030A5D07")},
{name = _CFWNBZChCZV8("9669004A"), file = _CFWNBZChCZV8("9669004A61263710")},
{name = _CFWNBZChCZV8("AC71001D"), file = _CFWNBZChCZV8("AC71001D61263710")},
{name = _CFWNBZChCZV8("AC71541191CA78"), file = _CFWNBZChCZV8("AC71541191CA785F3E0C4C")},
{name = _CFWNBZChCZV8("12CFC0B468E2"), file = _CFWNBZChCZV8("12CFC0B468E26C1D2718")},
{name = "决斗场_CFWNBZChCZV8("75692D20232F624C72")决斗场.lua"},
{name = "刀刃球_CFWNBZChCZV8("75692D20232F624C72")刀刃球.lua"},
{name = _CFWNBZChCZV8("4B496C3E"), file = _CFWNBZChCZV8("4B496C3E61263710")},
{name = _CFWNBZChCZV8("C2866B0E"), file = _CFWNBZChCZV8("C2866B0E61263710")},
{name = _CFWNBZChCZV8("0EC879EB26"), file = _CFWNBZChCZV8("0EC879EB26642E0433")},
{name = "启示录_CFWNBZChCZV8("75692D20232F624C72")启示录.lua"},
{name = _CFWNBZChCZV8("2D046CE1"), file = _CFWNBZChCZV8("2D046CE161263710")},
{name = _CFWNBZChCZV8("A237A3C233"), file = _CFWNBZChCZV8("A237A3C233642E0433")},
{name = _CFWNBZChCZV8("2A984C0E"), file = _CFWNBZChCZV8("2A984C0E61263710")},
{name = _CFWNBZChCZV8("63A76B0E"), file = _CFWNBZChCZV8("63A76B0E61263710")},
{name = _CFWNBZChCZV8("944C6B0E"), file = _CFWNBZChCZV8("944C6B0E61263710")},
{name = _CFWNBZChCZV8("4B1875648C"), file = _CFWNBZChCZV8("4B1875648C642E0433")},
{name = _CFWNBZChCZV8("41C07121"), file = _CFWNBZChCZV8("41C0712161263710")},
{name = _CFWNBZChCZV8("12E395C975"), file = _CFWNBZChCZV8("12E395C975642E0433")},
{name = _CFWNBZChCZV8("CCE50055"), file = _CFWNBZChCZV8("CCE5005561263710")},
{name = _CFWNBZChCZV8("B9FFA41B"), file = _CFWNBZChCZV8("B9FFA41B61263710")},
{name = _CFWNBZChCZV8("59735373"), file = _CFWNBZChCZV8("5973537361263710")},
{name = _CFWNBZChCZV8("5973CFBAB46B9D19"), file = _CFWNBZChCZV8("5973CFBAB46B9D197C155807")},
{name = _CFWNBZChCZV8("514AD586"), file = _CFWNBZChCZV8("514AD58661263710")},
{name = _CFWNBZChCZV8("71067A797E635D29"), file = _CFWNBZChCZV8("71067A797E635D297C155807")},
{name = _CFWNBZChCZV8("D8566B0E"), file = _CFWNBZChCZV8("D8566B0E61263710")},
{name = "模仿者_CFWNBZChCZV8("75692D20232F624C72")模仿者.lua"},
{name = "死铁轨_CFWNBZChCZV8("75692D20232F624C72")死铁轨.lua"},
{name = _CFWNBZChCZV8("962C60786F3004"), file = _CFWNBZChCZV8("962C60786F30045F3E0C4C")},
{name = _CFWNBZChCZV8("6D02C50E"), file = _CFWNBZChCZV8("6D02C50E61263710")},
{name = _CFWNBZChCZV8("242F8449096DEA"), file = _CFWNBZChCZV8("242F8449096DEA5F3E0C4C")},
{name = _CFWNBZChCZV8("D091CF73ED"), file = _CFWNBZChCZV8("D091CF73ED642E0433")},
{name = _CFWNBZChCZV8("88BA7F1B010D"), file = _CFWNBZChCZV8("88BA7F1B010D6C1D2718")},
{name = _CFWNBZChCZV8("324AE68A"), file = _CFWNBZChCZV8("324AE68A61263710")},
{name = _CFWNBZChCZV8("32E49A4D6E952A"), file = _CFWNBZChCZV8("32E49A4D6E952A5F3E0C4C")},
{name = "犯罪_CFWNBZChCZV8("75692D20232F624C72")犯罪.lua"},
{name = _CFWNBZChCZV8("4611C50904"), file = _CFWNBZChCZV8("4611C50904642E0433")},
{name = "画我_CFWNBZChCZV8("75692D20232F624C72")画我.lua"},
{name = "监狱泵_CFWNBZChCZV8("75692D20232F624C72")监狱泵.lua"},
{name = "矿井_CFWNBZChCZV8("75692D20232F624C72")矿井.lua"},
{name = _CFWNBZChCZV8("54595A61"), file = _CFWNBZChCZV8("54595A6161263710")},
{name = _CFWNBZChCZV8("6D064E55AD78"), file = _CFWNBZChCZV8("6D064E55AD786C1D2718")},
{name = _CFWNBZChCZV8("9444FAA4"), file = _CFWNBZChCZV8("9444FAA461263710")},
{name = _CFWNBZChCZV8("87C0B202"), file = _CFWNBZChCZV8("87C0B20261263710")},
{name = _CFWNBZChCZV8("E8A47B3AF0"), file = _CFWNBZChCZV8("E8A47B3AF0642E0433")},
{name = "血债_CFWNBZChCZV8("75692D20232F624C72")血债.lua"},
{name = _CFWNBZChCZV8("193B7B6F"), file = _CFWNBZChCZV8("193B7B6F61263710")},
{name = _CFWNBZChCZV8("F48A61349406763E"), file = _CFWNBZChCZV8("F48A61349406763E7C155807")},
{name = _CFWNBZChCZV8("9CDB004A"), file = _CFWNBZChCZV8("9CDB004A61263710")},
{name = _CFWNBZChCZV8("DC56D52A3C2D2D"), file = _CFWNBZChCZV8("DC56D52A3C2D2D5F3E0C4C")},
{name = _CFWNBZChCZV8("DC9154984A"), file = _CFWNBZChCZV8("DC9154984A642E0433")},
{name = _CFWNBZChCZV8("AE2956B4"), file = _CFWNBZChCZV8("AE2956B461263710")},
{name = _CFWNBZChCZV8("7970B0D4"), file = _CFWNBZChCZV8("7970B0D461263710")},
{name = _CFWNBZChCZV8("8848F2B227"), file = _CFWNBZChCZV8("8848F2B227642E0433")},
{name = _CFWNBZChCZV8("CA356A9627"), file = _CFWNBZChCZV8("CA356A9627642E0433")},
{name = "闪光_CFWNBZChCZV8("75692D20232F624C72")闪光.lua"},
{name = "防御_CFWNBZChCZV8("75692D20232F624C72")防御.lua"},
{name = _CFWNBZChCZV8("9F8CFA1B010D"), file = _CFWNBZChCZV8("9F8CFA1B010D6C1D2718")},
{name = _CFWNBZChCZV8("49CC6CE17C"), file = _CFWNBZChCZV8("49CC6CE17C642E0433")},
{name = "鲨鱼咬_CFWNBZChCZV8("75692D20232F624C72")鲨鱼咬.lua"},
}
local function _OOllOIllIOOl(scriptName, fileName)
local url = _II1I10O0lOl .. __000l10IIl0I0l01:UrlEncode(fileName)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("3A61EB34"), _CFWNBZChCZV8("3A61FC9F6F") .. scriptName .. _CFWNBZChCZV8("79D94A676164"), (3+15-4))
local __1lOlIIO1, result = pcall(function()
return game:HttpGet(url)
end)
if __1lOlIIO1 and result then
local _1I0O000lI, execErr = pcall(function()
loadstring(result)()
local _dHkJdqcf=false
if _dHkJdqcf then goto _zNjo3fvV end
goto _jhf22j0Y
::_zNjo3fvV::
::_jhf22j0Y::
end)
if _1I0O000lI then
_I1l101I1O0O1l0I(_CFWNBZChCZV8("F9345BD6"), scriptName .. _CFWNBZChCZV8("79BB5BD69F0663"), (3*2/2))
else
__Ol01O010I0O(_CFWNBZChCZV8("3E057A6C"), tostring(execErr))
end
else
__Ol01O010I0O(_CFWNBZChCZV8("EE9F7A6C"), _CFWNBZChCZV8("B99CFC9F6F") .. scriptName .. _CFWNBZChCZV8("79CDDB48"))
end
end
_OI1ll10l0I1I:Input({
Title = _CFWNBZChCZV8("456B5165"),
Placeholder = _CFWNBZChCZV8("CA2C516542BA5E537C5703"),
Callback = function(text)
if text and #text > 0 then
local __1ll0IlO0II01Ol = (not _3o0HjFro)
for _, s in ipairs(_1O0lI01l1lll) do
if string.find(string.lower(s.name), string.lower(text), 1, (not not _3o0HjFro)) then
__1ll0IlO0II01Ol = (not not _3o0HjFro)
break
end
end
if not __1ll0IlO0II01Ol then
_I1l101I1O0O1l0I(_CFWNBZChCZV8("456B98D5"), _CFWNBZChCZV8("73377B70026A65") .. text .. _CFWNBZChCZV8("7E69CF5363"), math.floor(3.76))
end
end
end,
})
_OI1ll10l0I1I:Divider()
local _l00OI001 = nil
local scriptDropdown = _OI1ll10l0I1I:Dropdown({
Title = _CFWNBZChCZV8("50A05165"),
Values = (function()
local __IIOOI00lO = {}
for _, s in ipairs(_1O0lI01l1lll) do
table.insert(__IIOOI00lO, s.name)
end
return __IIOOI00lO
end)(),
Callback = function(val) _l00OI001 = val end,
})
_OI1ll10l0I1I:Button({
Title = _CFWNBZChCZV8("3E0542645566"),
Callback = function()
if _l00OI001 then
for _, s in ipairs(_1O0lI01l1lll) do
if s.name == _l00OI001 then
_OOllOIllIOOl(s.name, s.file)
return
end
end
else
_I1l101I1O0O1l0I("提示", _CFWNBZChCZV8("AE0142A04F60585D"), 0x3)
end
end,
})
_OI1ll10l0I1I:Button({
Title = _CFWNBZChCZV8("6EF951655822"),
Callback = function()
local __IIOOI00lO = {}
for _, s in ipairs(_1O0lI01l1lll) do
table.insert(__IIOOI00lO, s.name)
end
_I1l101I1O0O1l0I(_CFWNBZChCZV8("43655C21"), "共 _CFWNBZChCZV8("796765696C151D381B36622F1856426879676569") 个脚本", 0x3)
end,
})
_OI1ll10l0I1I:Divider()
_OI1ll10l0I1I:Button({
Title = "圣奥里",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://pastebin.com/raw/3U9WtQGU"))()
end)
_I1l101I1O0O1l0I("圣奥里", _CFWNBZChCZV8("AB2E076A2A86585D"), 0x3)
end,
})
local _00l0OIOIOI1 = _OlOIlI110I1lO:Tab({Title = _CFWNBZChCZV8("2F9F5165"), Icon = _CFWNBZChCZV8("3F20272C623E270926")})
_00l0OIOIOI1:Button({
Title = _CFWNBZChCZV8("9CD85165"),
Callback = function()
pcall(function()
loadstring(utf8.char((function() return table.unpack({math.floor(108.65),(111+7-10),(97*3/2),0x64,math.floor(115.26),math.floor(116.78),math.floor(114.45),math.floor(105.28),math.floor(110.73),0x67,math.floor(40.79),math.floor(103.48),math.floor(97.18),math.floor(109.82),(101+8-14),0x3a,math.floor(72.44),(116+19-14),math.floor(116.37),math.floor(112.36),(71*2/2),(101*4/4),(116*3/3),(40+5-17),math.floor(34.59),math.floor(104.91),math.floor(116.57),(116*2/2),0x70,(115+9-12),math.floor(58.47),(47*4/3),math.floor(47.27),(114*3/3),math.floor(97.47),0x77,(46*2/4),(103*3/4),math.floor(105.38),(116*4/2),math.floor(104.70),0x75,(98+1-10),0x75,0x73,(101+14-11),(114*3/4),(99*3/3),(111*4/3),(110*4/3),(116+17-4),(101*3/3),(110+18-18),(116+8-12),(46+14-3),0x63,(111+20-2),(109+7-5),(47+13-8),math.floor(67.20),0x68,0x69,math.floor(110.57),(97+14-20),0x51,math.floor(89.25),(47+10-12),0x2d,0x2f,math.floor(109.42),math.floor(97.31),(105+1-20),0x6e,0x2f,math.floor(37.19),math.floor(69.72),0x36,math.floor(37.72),math.floor(56.86),0x33,0x25,(56+16-4),(53*3/3),0x25,(69*3/4),0x34,math.floor(37.64),math.floor(66.71),(65*4/3),(37+12-12),math.floor(57.96),(49*2/3),0x22,math.floor(41.58),(41+10-16),0x28,math.floor(41.99)})end)()))()
end)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("9CD85165"), _CFWNBZChCZV8("AB2E078CDE506E"), (3*2/4))
end,
})
_00l0OIOIOI1:Button({
Title = "夜脚本",
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ylt410/roblox-Script/refs/heads/main/yejiaoben"))()
end)
_I1l101I1O0O1l0I("夜脚本", _CFWNBZChCZV8("AB2E07555566"), (3+19-11))
end,
})
_00l0OIOIOI1:Button({
Title = _CFWNBZChCZV8("01085165"),
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.gitcode.com/Xingtaiduan/Scripts/raw/main/Loader.lua"))()
end)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("01085165"), _CFWNBZChCZV8("AB2E07110E506E"), math.floor(3.18))
end,
})
_00l0OIOIOI1:Button({
Title = "皮脚本",
Callback = function()
pcall(function()
getgenv().XiaoPi = _CFWNBZChCZV8("F75367181EEE7341644C1A541D561611")
loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
end)
_I1l101I1O0O1l0I("皮脚本", _CFWNBZChCZV8("AB2E07E75566"), (3+10-15))
end,
})
_00l0OIOIOI1:Button({
Title = _CFWNBZChCZV8("0B06095363"),
Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.gitcode.com/ROB5201314/robscript/raw/main/ROB.V3"))()
end)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("0B06095363"), _CFWNBZChCZV8("AB2E071B0008585D"), 0x3)
end,
})
_I1l101I1O0O1l0I(_CFWNBZChCZV8("7B873461"), _CFWNBZChCZV8("2A2B39395566"), (5*3/4))
task.wait(1)
_I1l101I1O0O1l0I(_CFWNBZChCZV8("2A2B39395566"), _CFWNBZChCZV8("2F7C65796FEA3FFD42"), (3*4/4))