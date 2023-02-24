
function SkillReady(skillName)
    x = 1;
    while(x <= 5)do
        totalCount = GetNumSkill(x);
        if(totalCount)then
            y = 1;
            while(y <= totalCount) do
                if GetSkillDetail(x, y) == skillName then
                    totalSR, remainingSR = GetSkillCooldown(x, y);
					return remainingSR
                end
                y = y + 1;
            end
        end
        x = x + 1;
    end
	return 999
end
----------------------------------------------
----------------------------------------------

function FFA_SearchBuffStack(target,buffName)
 local n = 1;
 while( UnitBuff( target, n ) ~= nil )do
  local name, icon, count, ID = UnitBuff( target, n );
  if( name == buffName )then return count; end;
  n = n + 1;
 end;
 return 0;
end;
----------------------------------------------
----------------------------------------------
function SearchBuff(player,buffName)
    local i = 1;
    local r = false;
    while(UnitBuff(player,i) ~= nil)do
        if(UnitBuff(player,i) == buffName)then
            r = true;
        end;
        i = i + 1;
    end;
    return r;
end;
----------------------------------------------
----------------------------------------------
function FFA_SearchBuffTime(target,buffName)
	local i = 1;
	local Buf_time = 0;
	while UnitBuff(target,i)~=nil do
		if UnitBuff(target,i)== buffName then
			Buf_time = UnitBuffLeftTime(target,i)
		end
		i = i + 1
	end
	return Buf_time
end
----------------------------------------------
----------------------------------------------
function FFA_SearchBuffTime(player,buffName)
	local i = 1;
	local Buf_time = 0;
	while UnitBuff(player,i)~=nil do
		if UnitBuff(player,i)== buffName then
			Buf_time = UnitBuffLeftTime(player,i)
		end
		i = i + 1
	end
	return Buf_time
end
----------------------------------------------
----------------------------------------------
function SearchDebuff(target,debuffName)
    local i = 1;
    local r = false;
    while(UnitDebuff(target,i) ~= nil)do
        if(UnitDebuff(target,i) == debuffName)then
           return  true;
        end;
        i = i + 1;
    end;
    return false;
end; 
----------------------------------------------
----------------------------------------------
function SearchDebuff(player,debuffName)
    local i = 1;
    local r = false;
    while(UnitDebuff(player,i) ~= nil)do
        if(UnitDebuff(player,i) == debuffName)then
            return  true;
        end;
        i = i + 1;
    end;
    return false;
end;
----------------------------------------------
----------------------------------------------
function SearchDeBuff(unit,buffName)
    local i = 1;
    local r = false;
    while(UnitDebuff(unit,i) ~= nil)do
        if(UnitDebuff(unit,i) == buffName)then
            return  true;
        end;
        i = i + 1;
    end;
    return false;
end;

----------------------------------------------
----------------------------------------------
function FFA_SearchDebuffTime(target,buffName)
	local i = 1;
	local Debuf_time = 0;
	while UnitDebuff(target,i) ~= nil do
		if UnitDebuff(target,i) == buffName then
			Debuf_time = UnitDebuffLeftTime(target,i)
		end
		i = i + 1
	end
	return Debuf_time
end;
----------------------------------------------
----------------------------------------------
local function PctHP(t)
		if not t then t="player" end
        return UnitHealth(t)/UnitMaxHealth(t);
end
----------------------------------------------
----------------------------------------------
local function isItemInBag25(item_name)
	if (not item_name or type(item_name) ~= "string") then return false; end

	local i,index,name,maxCount,currentCount = "","",0,0;

	for i=1,180 do -- 180 possible bag slots
		index,_,name = GetBagItemInfo(i);
		if (string.find(name,item_name)) then
			maxCount, currentCount = GetBagItemCooldown(index);
			if (currentCount < 0.30) then
				return true;
			else
				return false;
			end
		end
	end
	return false;

end
----------------------------------------------
----------------------------------------------
local function isItemInBag(item_name)
	if (not item_name or type(item_name) ~= "string") then return false; end

	local i,index,name,maxCount,currentCount = "","",0,0;

	for i=1,180 do -- 180 possible bag slots
		index,_,name = GetBagItemInfo(i);
		if (string.find(name,item_name)) then
			maxCount, currentCount = GetBagItemCooldown(index);
			if (currentCount == 0.20) then
				return true;
			else
				return false;
			end
		end
	end
	return false;

end
----------------------------------------------
----------------------------------------------
function FFA_IsItemReady( itemName )
	local _, bagCount = GetBagCount()
	for n = 1, bagCount do
		local index, _, name = GetBagItemInfo( n );
		if( name == itemName )then
			return GetBagItemCooldown( index );
		end;
	end;
end;
----------------------------------------------
----------------------------------------------
local function CancelBuffFiz()
local i = 1
local buff = UnitBuff("player",i)

while buff ~= nil do
if buff == "Золотая аура" then
CancelPlayerBuff(i)
return true
end

i = i + 1
buff = UnitBuff("player",i)
end
return false
end
----------------------------------------------
----------------------------------------------
function BagItemReady(item)
	local occupied, bagCount = GetBagCount()
	for slot = 1, bagCount do
		local index, icon, name, count = GetBagItemInfo(slot)
		if name == item then
			local duration, remaining = GetBagItemCooldown(index)
			if remaining == 0 then
				return true
			end
		end
	end
end;
----------------------------------------------
----------------------------------------------
function Msg(outstr,a1,a2,a3)
 if not a1 then a1=0.8 end
 if not a2 then a2=0.8 end
 if not a3 then a3=0 end
     DEFAULT_CHAT_FRAME:AddMessage(tostring(outstr),a1,a2,a3)
end
----------------------------------------------
----------------------------------------------
function InTable( _table, _value )
 for key, value in pairs( _table )do
  if( value == _value )then return true; end;
 end;
 return false;
end;
----------------------------------------------
----------------------------------------------
local function FindActionIcon(SkillIcon1)
local i;
	for i=1,80 do
			local iconpath,btnName = GetActionInfo(i);
			if iconpath==SkillIcon1 then
				return i
			end
		end
	return 0
end
----------------------------------------------
----------------------------------------------

function Lon_OnUpdate(this) 	

	if (GetTime() - this.lastUpdate) < 0.2  then
		return;
	end
	this.lastUpdate = GetTime();



	--per()
	--йbezb()
	anty()
	--cast
	--GameBar_GoFree() рулетка

	--rul()
	CancelBuffFiz()
end
----------------------------------------------
----------------------------------------------
function Lon_OnLoad(this) 	
	
	this.lastUpdate = 0
	this:RegisterEvent("UNIT_BUFF_CHANGED");
	
end
----------------------------------------------
----------------------------------------------
function Zver()-- назначение   нажатия  определенной ячейки
if( GetActionUsable( 8) ) then UseAction(8); end;
end
----------------------------------------------
----------------------------------------------
function Lev()-- назначение   нажатия  определенной ячейки
if( GetActionUsable( 1 ) ) then UseAction(1); end;
end
----------------------------------------------
----------------------------------------------
function belie()-- атака белыми ударами  бежит к цели

	if (UnitIsDeadOrGhost("target") == false) then
		CastSpellByName("Атаковать");
	end
end
----------------------------------------------
----------------------------------------------
function Attack()---  не бежит к цели
 
 if( not mAutoLootVariables.AutoAttack )then return nil; end;
 if (UnitIsDeadOrGhost("target") == false)
  then CastSpellByName("Атаковать");
 end
 
end

--local PsiPoints, PsiStatus = GetSoulPoint() психомагия
---if (UnitMana("player")>=20)	 ярость
---if (UnitSkill("player")<=20) энергия

-- больше >у
-- меньше <
	
	function Lon()
	baffdangg()
	
	local  h = math.floor( UnitHealth("player") / UnitMaxHealth("player") * 100 );
	
	local combat = GetPlayerCombatState()
	
	if (SearchDebuff("player","Stun")) 	or 	(SearchDebuff("player","Родственная душа"))	or	(SearchDebuff("player","Пунш пыльцы"))						and		(SkillReady("Указ свыше")<=0.4)							then	CastSpellByName("Указ свыше"); else
	
	if  (SearchBuff("player","Теневой взрыв")==false) 									and		(SkillReady("Теневой взрыв")<=0.4) 						then	CastSpellByName("Теневой взрыв");						else
	
	if  (SearchBuff("player","Кузница")==false) 										and		(SkillReady("Кузница")<=0.4) 							then	CastSpellByName("Кузница");								else
	
	if	combat																			and 	( h < 60 )												then	UseAction(9)											else
	
	if  combat	and (UnitMana("player")>=45)											and		( not MLib.SearchBuff( "player", 500073 )) 				then	CastSpellByName("Атака - лучшая защита")				else
		
	if  combat	and (UnitMana("player"))												and		(SkillReady("Рунический рост")<=0.4)  					then	CastSpellByName("Рунический рост");						else
	
	if (UnitMana("player")>=20)															and 	(SkillReady("Приток рунной энергии")<=0.4) 				then	CastSpellByName("Приток рунной энергии");				else
	
	if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 	TargetNearestEnemy()				else
	----------
	----------
	cast()
		if  (SearchBuff("player","Превращение в щит")) then
			
			
			
			if (SearchBuff("player","Взаимосвязь")==true)					and		(SkillReady("Рунный импульс")<=0.8) 		then	CastSpellByName("Рунный импульс");			else
	
			if (UnitMana("player")<=50)										and		(SkillReady("Бросок")<=0.4)					then 	CastSpellByName("Бросок");					else
	
			if (UnitSkill("player")>=40)									and		(SkillReady("Теневой удар")<=0.4)			then	CastSpellByName("Теневой удар");			else
			
			
			
			
			
			end
			end
			end
		end
		
		if  (SearchBuff("player","Режим разборки")) or	(SearchBuff("player","Режим разборки")==false) then
		
			if	(UnitSkill("player")>=25) 								and	(SearchBuff("player","Взаимосвязь")==true)			and		(SkillReady("Теневой импульс")<=0.8) 	then	CastSpellByName("Теневой импульс");						else
		
			if (UnitMana("player")<=50)									and		(SkillReady("Бросок")<=0.4)						then 	CastSpellByName("Бросок");				else
	
			if (UnitSkill("player")>=40)								and		(SkillReady("Теневой удар")<=0.4)				then	CastSpellByName("Теневой удар");		else
			
			if	(UnitSkill("player")<=30)								and 	(SkillReady("Бесстрашный удар")<=0.4)  			then	CastSpellByName("Бесстрашный удар");	else
			
			if	(UnitSkill("player")<=25)								and 	(SearchBuff("player","Взаимосвязь")==true)		and		(SkillReady("Рунный импульс")<=0.4)  					then	CastSpellByName("Рунный импульс");					else
			end
			end
			end 
			end
			end
			end
		end
		
		if (SearchBuff("player","Взаимосвязь")==false)											then CastSpellByName("Атаковать") 								else
	end	
	end
	end
	end
	end
	end
	end
	end
end
	function razgon()
		
	if (not SearchBuff("player","Эль Гномов"))							and		(BagItemReady("Экспериментальный Эль Гномов")==true)	then 	UseItemByName("Экспериментальный Эль Гномов");			end
	
	if (not SearchBuff("player","Сильный стимулятор"))					and		(BagItemReady("Сильный стимулятор")==true)				then 	UseItemByName("Сильный стимулятор"); 					end
	
	if (not SearchBuff("player","Простой кусочек ребра"))				then 	UseItemByName("Превосходная часть ребра"); 			end
	
--	if (not SearchBuff("player",""))									then 	UseItemByName(""); 										end
	
--	if (not SearchBuff("player",""))									then 	UseItemByName(""); 										end
	
	if (not SearchBuff("player","Органическая деконструкция"))			and		(SkillReady("Органическая деконструкция")<=0.4)			then	CastSpellByName("Органическая деконструкция")			end
	
	if (not SearchBuff("player","Рост руны атаки"))						and		(SkillReady("Рунический рост")<=0.4)					then	CastSpellByName("Рунический рост") 						end
	
	if (not SearchBuff("player","Игра в ожидание"))						and		(SkillReady("Игра в ожидание")<=0.4)					then	CastSpellByName("Игра в ожидание")						end
	
	if (not SearchBuff("player","Режим разборки"))						and		(SkillReady("Режим разборки")<=0.4)						then 	CastSpellByName("Режим разборки")						end
	
	if (not SearchBuff("player","Шоковая перегрузка"))					and		(SkillReady("Шоковая перегрузка")<=0.4)					then 	CastSpellByName("Шоковая перегрузка")					end
	
	
	
	
	end
function baffdangg()

local GetZoneID=GetZoneID;
	zid=GetZoneID()%1000
	
	if zid==971 or zid==970 or zid==968 or zid==969	or zid==976 then
	 
		if (not SearchBuff("player","Fruit Tart in a Local Style"))			and		(BagItemReady("Fruit Tart in a Local Style")==true)				then 	UseItemByName("Fruit Tart in a Local Style"); 					end
	
		if (FFA_SearchBuffTime("player","Прикосновение единорога") < 15)	and 	(not SearchBuff("player","Прикосновение единорога"))			then 	UseItemByName("Прикосновение единорога"); 						end
	
		if (not SearchBuff("player","Деликатес популярной кухни"))			then 	UseItemByName("Деликатес популярной кухни"); 					end
	
		if (not SearchBuff("player","Десерт Дружбы"))						then 	UseItemByName("Десерт Дружбы"); 								end
	
		if (not SearchBuff("player","Магическое снадобье героя"))			then 	UseItemByName("Зелье героя"); 									end

		if	(not SearchBuff("player","Рисовые клецки с яйцом"))				then	UseItemByName("Запеченное яйцо с рисом"); 						end
	
		
	
		if	(not SearchBuff("player","Горячая любовь"))						and		(BagItemReady("Зелье: горячая любовь")==true)					then	UseItemByName("Зелье: горячая любовь"); 						end

		if	( SearchBuff("player","Ножка Динозавра")==false)				and		( SearchBuff("player","Горячее тушеное мясо")==false)			then	UseItemByName("Ножка Динозавра"); 									end

		if	( SearchBuff("player","Горячее тушеное мясо")==false)			and		( SearchBuff("player","Ножка Динозавра")==false)				then	UseItemByName("Горячее тушеное мясо"); 									end
		
		
		
		if (not SearchBuff("player","Удивительный торт"))					then	UseItemByName("Удивительный торт"); 							end
		
		--if (not SearchBuff("player","Бутерброд с икрой"))					then	UseItemByName("Бутерброд с икрой"); 							end
		
	end
end

--[Сотрясающий удар +104]
function cast()

local name, maxValue, currValue = UnitCastingTime("target")-- определение каста

if UnitCastingTime("target")	and	(UnitSkill("player")>=40)	and	(SkillReady("Сотрясающий удар")<=0.4)	then	CastSpellByName("Сотрясающий удар"); end

 if UnitCastingTime("target")	and	(UnitSkill("player")>=30)	and	(SkillReady("Удар током")<=0.4)	then	CastSpellByName("Удар током");	end

end

function fir()

	local h = math.floor( UnitHealth("player") / UnitMaxHealth("player") * 100 );
	
		if( h < 29 )then 
			CastSpellByName("Чувство опасности");
			return nil;
		elseif( h < 30 )then 
			UseItemByName("Зелье Фириуса - тип F");
			return nil;
		elseif( h < 49 )then
			CastSpellByName("Инстинкт самосохранения");
			return nil;
		elseif( h < 80 )then
			UseItemByName("Универсальное зелье");
			return nil;
		end;
	end;
	
function bla()
	local TrgtMainClass, TrgtSubClass = UnitClass("target")
	local mainClass, subClass = UnitClass( "player" )
	
	
	local boss = UnitSex("target")
    local elite = UnitSex("target")
	local MAG =  TrgtMainClass =="Колдун"
	
	
	if MAG and (UnitMana("player")>=25) (SkillReady("Сотрясающий удар")<=0.4) 				then	CastSpellByName("Сотрясающий удар"); end
	
	if (boss or elite) and (UnitMana("player")>=25) (SkillReady("Сотрясающий удар")<=0.4) 	then	CastSpellByName("Сотрясающий удар"); end
	
	
	
	
	
	end

--[[function RaidFocusFrame_UpdateUnits() 

 RaidFocusFrame.units = {};

 local unit;
 for i = 1 , 36 , 1 do
  unit = "raid" .. i;

  if UnitExists("raid"..i) and not UnitIsDeadOrGhost("raid"..i)  then
   local classr1,classr2=UnitClass("raid"..i)
  if classr1~="Священник" and classr1~="Друид" and classr1~="Маг" then
   table.insert( RaidFocusFrame.units , unit );
  end
  end


 end

 
 FocusFrame_Update( RaidFocusFrame , g_FocusFrameOption );
 
end]]--

function sh()

--------------------------------------Бафики-------------------------------------------------------------------------------------------------------
--------------------------------------Бафики-------------------------------------------------------------------------------------------------------
--------------------------------------Бафики-------------------------------------------------------------------------------------------------------
	if (not SearchBuff("player","Терновый щит"))					and (SkillReady("Терновый щит")<=0.4)				then	CastSpellByName("Терновый щит");				end

	if (not SearchBuff("player","Морозная стрела"))					and (SkillReady("Морозная стрела")<=0.4)			then	CastSpellByName("Морозная стрела");				end

	if (not SearchBuff("player","Зона наблюдения"))					and (SkillReady("Зона наблюдения")<=0.4)			then	CastSpellByName("Зона наблюдения");				end
	
	if (not SearchBuff("player","Подношение молодых энтов"))		and (SkillReady("Подношение молодых энтов")<=0.4)	then	CastSpellByName("Подношение молодых энтов");	end

	if (not SearchBuff("player","Дикая сила"))						and (SkillReady("Дикая сила")<=0.4)					then	CastSpellByName("Дикая сила");					end
--------------------------------------Авто таргет---------------------------------------------------------------------------------------------------
--------------------------------------Авто таргет---------------------------------------------------------------------------------------------------
--------------------------------------Авто таргет---------------------------------------------------------------------------------------------------
   if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target"))		then	TargetNearestEnemy()	else
--------------------------------------Боевая часть--------------------------------------------------------------------------------------------------
--------------------------------------Боевая часть--------------------------------------------------------------------------------------------------	
--------------------------------------Боевая часть--------------------------------------------------------------------------------------------------	
	if ( SearchBuff("player","Скрытая опасность"))					and 	(SkillReady("Снайперский выстрел")<=0.4)		then	CastSpellByName("Снайперский выстрел");		end
	
	if (SkillReady("Скрытая опасность")<=0.4) 						then 	CastSpellByName("Скрытая опасность");			else
	
	if (SkillReady("Заряженый удар")<=0.4)							then 	CastSpellByName("Заряженый удар");				else
	
	if (SkillReady("Удар грифона")<=0.4) 							then 	CastSpellByName("Удар грифона");				else
	
	if (SkillReady("Шипастая стрела")<=0.4) 						then 	CastSpellByName("Шипастая стрела");				else
	
	if (SkillReady("Пронзающая стрела")<=0.4) 						then 	CastSpellByName("Пронзающая стрела");			else
	
	if (SkillReady("Стрелы ветра")<=0.4) 				        	then 	CastSpellByName("Стрелы ветра");				else
end
end
end
end
end
end
end
end
-- больше >
-- меньше <
function anty()

	local playerName =UnitName("player")
	local Ncombat = GetPlayerCombatState()==false
	local combat = GetPlayerCombatState()
	local _,jp	=	GetActionCooldown(19)
	local jpp	=	GetActionCooldown(20)
	local mainClass, subClass = UnitClass( "player" )
	local im = SearchDeBuff("player","Молния");
	local immm = SearchDeBuff("player","Ограничение движения");
	local immmm = SearchDeBuff("player","Оковы Света");
	local _,_,itemNam1  = GetInventoryItemDurable("player", 1)
	--(SearchBuff("player","Скоростное движение")==false)
	
	if  mainClass == "Друид" then
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
	if Ncombat	and	(SearchBuff("player","Скоростное движение")==false) then UseEquipmentItem(11);  end 
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--	if	(SearchBuff("player","Режим разборки"))		and (UnitMana("player")<=16) and	jp<0.1	and	(SearchBuff("player","Шоковая перегрузка"))  and (not SearchBuff("player","Приход смерти")) then UseItemByName("Доблестный плащ Аота") UseEquipmentItem(5)  end
	
--	if	(SearchBuff("player","Превращение в щит"))	and (UnitMana("player")<=16) and	jp<0.1	and	(SearchBuff("player","Рунная перегрузка"))  and (not SearchBuff("player","Приход смерти")) then UseItemByName("Доблестный плащ Аота") UseEquipmentItem(5)  end
	
	
--	if	(itemNam5~=("Накидка Вымирания Астарота (Изысканный)")== true)	then	UseItemByName("Накидка Вымирания Астарота (Изысканный)");	end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--if combat and (SearchDeBuff("player","Ужас")) or (SearchDeBuff("player","Паника"))or (SearchDeBuff("player","Ядовитая стрела ужаса")) or (SearchDeBuff("player","Ожог пламени")) or (SearchDeBuff("player","Страх")) or (SearchDeBuff("player","Презрение Сэйса")) or (SearchDeBuff("player","Контроль разума")) or (SearchDeBuff("player","Страх перед темной ночью"))	then  DoEmote(21)   end
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--	if	 jpp<0.5	and	(SearchDeBuff("player","Stun")) 	or	(SearchDeBuff("player","Молния")) 	or 	(SearchDebuff("player","Родственная душа"))	or	(SearchDebuff("player","Пунш пыльцы"))	then	 UseItemByName("Эластичные кожаные перчатки штормов") UseEquipmentItem(1) end
	
--	if (itemNam1~=("Перчатки исчезновения Астарота (Изысканные)")==true)  then	 UseItemByName("Перчатки исчезновения Астарота (Изысканные)") end
end	
end


function RBard()
	local boss = UnitSex("target") > 2
	
	---------------------------------------------------- Авто таргет --------------------------------------------------- 
   if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
		TargetNearestEnemy()
	else
	if (SkillReady("Даление воздуха")<=0.4) and (SearchBuff("player","Air Pressure")==false) then CastSpellByName("Давление воздуха");	else
	
	if (UnitMana("player")>=20) and	(SkillReady("Shsdowstab")<=0.4) and (SearchDebuff("target","Кровотечение")==false) then CastSpellByName("Shsdowstab");	else
	
	if (UnitMana("player")>=30) and	 (SkillReady("Low Blow")<=0.4) and (SearchDebuff("target","Кровотечение")==true) and	(SearchDebuff("target","Тяжелое ранение")==false) then CastSpellByName("Low Blow");	else
	
	if (UnitMana("player")>=35) and	(SkillReady("Wound Attack")<=0.4) and (SearchDebuff("target","Кровотечение")==true) and	(SearchDebuff("target","Тяжелое ранение")==true) then CastSpellByName("Wound Attack");	else
	
	
	
	end
	end
	end
	end
	end
	end
	
function RB()

if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
		TargetNearestEnemy()
	else
	if (SkillReady("Энергичные руки")<=0.4) and (SearchBuff("player","Энергичные руки")==false) then CastSpellByName("Энергичные руки");	else
	
	end
	end
	end
	
	
	
function rs()

local Ncombat = GetPlayerCombatState()==false
	--Бафы
	if	( not SearchBuff("player","Мастер сражений"))	then	CastSpellByName("Мастер сражений")	end
	--
	if	( not SearchBuff("player","Ядовитые мучения"))	then	CastSpellByName("Ядовитые мучения")	end
	--
	if	Ncombat	and	(SearchBuff("player","Яд")==false)	then	CastSpellByName("Яд")				end
	
	--автотаргет
	if	(not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target"))	then	TargetNearestEnemy()	else
	-- начало боя
	
	if  (SkillReady("Удар в спину")<=0.4) then CastSpellByName("Удар в спину"); end
	
	if (UnitMana("player")>=20) and (SkillReady("Теневой удар")<=0.4) and (SearchDebuff("target","Кровотечение")==false) then 
		CastSpellByName("Теневой удар");
	else
	if (UnitMana("player")>=35) and (SkillReady("Атака в рану")<=0.4) and (SearchDebuff("target","Кровотечение")==true) and (SearchDebuff("target","Тяжелое ранение")==true) then 
		CastSpellByName("Атака в рану");
	else
	if (UnitMana("player")>=30) and (SkillReady("Подлый удар")<=0.4)  then 
		CastSpellByName("Подлый удар");	
	end
	end
	end
	end
belie()

end
function RWd()

local h = math.floor( UnitHealth("player") / UnitMaxHealth("player") * 100 );
local AS_slot = 2;
local _1, _2, _3, _4, _5, ASon = GetActionInfo(AS_slot);

if (SearchBuff("player","Затягивающиеся раны")==false)									then CastSpellByName("Затягивающиеся раны") 						else

if (SearchBuff("player","Терновый щит")==false)											then CastSpellByName("Терновый щит") 								else

if (SearchBuff("player","Яд")==false)													then CastSpellByName("Яд") 											else
	
	if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
		TargetNearestEnemy()
	else

	if ( h <= 55) and (SkillReady("Возрождение")<=0.4)  then	CastSpellByName("Возрождение");	else

--	if (SkillReady("Бросок")<=0.4) then 			CastSpellByName("Бросок");			else

	if (SearchBuff("player","Кровожадность")==false) then	CastSpellByName("Кровожадный клинок")	else
				
	if (UnitMana("player")>=20) and (SkillReady("Теневой удар")<=0.4) and (SearchDebuff("target","Кровотечение")==false) then 	CastSpellByName("Теневой удар");	else
						
	if (UnitMana("player")>=35) and (SkillReady("Атака в рану")<=0.4) and (SearchDebuff("target","Кровотечение")==true) and (SearchDebuff("target","Тяжелое ранение")==true) then 	CastSpellByName("Атака в рану");	else
							
							
	if (UnitMana("player")>=30) and (SkillReady("Подлый удар")<=0.4) and (SearchDebuff("target","Кровотечение")==true) then 	CastSpellByName("Подлый удар");		else
	
	if  (UnitCanAttack("player","target")) then 	CastSpellByName("Заряженный удар")	else
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
baffdangg()
belie()
end

function WWd()


local AS_slot = 2;
local _1, _2, _3, _4, _5, ASon = GetActionInfo(AS_slot);


	if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
		TargetNearestEnemy()
	else
		if (not ASon) and (UnitCanAttack("player","target")) then 
			CastSpellByName("Заряженный удар")
		else
			if (SkillReady("Свирепый вихрь")<=0.4) then 
				CastSpellByName("Свирепый вихрь");
			else
				if (UnitMana("player")>=10) and (SkillReady("Уязвимость")<=0.4) and (SearchDebuff("target","Уязвимость")==true) then 
					CastSpellByName("Уязвимость");
				else
					if (SkillReady("Ослабление атаки")<=0.4) and (SearchDebuff("target","Уязвимость")==true) then 
						CastSpellByName("Ослабление атаки");
					else
						if (UnitMana("player")>=20) and (SkillReady("Пробный выпад")<=0.4) then 
							CastSpellByName("Пробный выпад");
						else
							if (UnitMana("player")>=15) and (SkillReady("Продуманная атака")<=0.4) and (SearchDebuff("target","Кровотечение")==true) then
								CastSpellByName("Продуманная атака");	
							else
								if (UnitMana("player")>=25) and (SkillReady("Рубящий удар")<=0.4) then
									CastSpellByName("Рубящий удар");
								else
									
								end
							end
						end
					end
				end
			end
		end
	end

Attack()	
BuffWar()	

end
function BuffWar()

	--if( GetActionUsable( 23 ) ) and ( not MLib.SearchBuff( "player", 508526 )) then 
	--	UseAction(23); 
	--end;
	
	if ( not SearchBuff("player","Терновый щит") ) then
		CastSpellByName("Терновый щит")
	end

	if ( not SearchBuff("player","Боевая уверенность")) then
		CastSpellByName("Боевая уверенность")
	end
	
--	if ( not MLib.SearchBuff( "player", 502222 )) then
--		UseItemByName("Обновление усилений премиума");
	--end
	
--	if ( not MLib.SearchBuff( "player", 506062 )) then
--		UseItemByName("Обновление усилений премиума")
	--end
	
end
function rk()

	if (not SearchBuff("player","Улучшенные доспехи"))					then CastSpellByName("Улучшенные доспехи");		end   
	
	if (not SearchBuff("player","Львиная защита"))						then CastSpellByName("Львиная защита");			end
	
	if (not SearchBuff("player","Палящий свет"))						then CastSpellByName("Палящий свет");			end
	
	
	
   if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
		TargetNearestEnemy()
	else

	
	--if (not SearchDebuff("target","Разоружение III"))  then 	CastSpellByName("Разоружение"); end
	
	
	if (UnitMana("player")>=20)		and		(SkillReady("Теневой удар")<=0.4)		and		(SearchDebuff("target","Кровотечение")==false) then 	CastSpellByName("Теневой удар");	else
	
	if (UnitMana("player")>=35)		and		(SkillReady("Атака в рану")<=0.4)		and		(SearchDebuff("target","Кровотечение")==true) and (SearchDebuff("target","Тяжелое ранение")==true) then CastSpellByName("Атака в рану");	else
	
	if (UnitMana("player")>=30)		and		(SkillReady("Подлый удар")<=0.4)		and		(SearchDebuff("target","Кровотечение")==true) then CastSpellByName("Подлый удар");		end


end
end
end
baffdangg()
belie()
end
function GladR() 
	local  h = math.floor( UnitHealth("player") / UnitMaxHealth("player") * 100 );
	
	local  ht = math.floor( UnitHealth("target") / UnitMaxHealth("target") * 100 );
	
	local GetZoneID=GetZoneID;
	zid=GetZoneID()%1000
	
	local combat = GetPlayerCombatState()

	-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	if (SearchDebuff("player","Stun")) 	or 	(SearchDebuff("player","Родственная душа"))	or	(SearchDebuff("player","Пунш пыльцы"))			and		(SkillReady("Указ свыше")<=0.4)							then	CastSpellByName("Указ свыше");				else
	
	--------------------
	
	if	combat	and 	( h < 60 )		then	UseAction(9)							end
	
	if  (SearchBuff("player","Теневой взрыв")==false) 									and		(SkillReady("Теневой взрыв")<=0.4) 						then	CastSpellByName("Теневой взрыв");						else
	
	if  (SearchBuff("player","Кузница")==false) 										and		(SkillReady("Кузница")<=0.4) 							then	CastSpellByName("Кузница");								else
	
	if  combat	and (UnitMana("player")>=45)											and		(SkillReady("Рунический рост")<=0.4)  					then	CastSpellByName("Рунический рост");						else
	
   	if  combat	and (UnitMana("player")>=45)											and		( not MLib.SearchBuff( "player", 500073 )) 				then	CastSpellByName("Атака - лучшая защита")				else	
	
	if  combat	and (UnitMana("player")>=20)											and 	(SkillReady("Приток рунной энергии")<=0.4) 				then	CastSpellByName("Приток рунной энергии");				else
	
	if  combat	and (SearchBuff("player","Зелье бешенства")==false) 					and		(SearchBuff("player","Зелье бешенства")==false)			and 	(BagItemReady("Зелье бешенства")==true)					then 	UseItemByName("Зелье бешенства");						else
	-------------------
	-------------------
	if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 	TargetNearestEnemy()	else
	-------------------	


	-------------------
	--if 	(SkillReady("Шаг в тень")<=0.4)												then	CastSpellByName("Шаг в тень");					end
	--
	--if (SearchBuff("player","Взаимосвязь")==true)										and		(SkillReady("Рунный импульс")<=0.8) 			then	CastSpellByName("Рунный импульс");		else
	
	if	(UnitSkill("player")<=30)													and 	(SkillReady("Бесстрашный удар")<=0.4)  			then	CastSpellByName("Бесстрашный удар");	end
	belie()
	-- импульс теневой
	if (SearchBuff("player","Взаимосвязь")==true)										and		(UnitSkill("player")>=40)						then	CastSpellByName("Теневой импульс")		else
	
--	if (SearchBuff("player","Взаимосвязь")==true)										and		(SkillReady("Рунный импульс")<=0.8)				then	CastSpellByName("Рунный импульс");		else
	
	if (UnitMana("player")<=50)															and		(SkillReady("Бросок")<=0.4)						then 	CastSpellByName("Бросок");				else

	if (UnitSkill("player")>=40)														and		(SkillReady("Теневой удар")<=0.4)				then	CastSpellByName("Теневой удар");		else


	
	
	
	
	 
	--end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	
	baffdangg()
	end
function drh()

	local mainClass, subClass = UnitClass( "player" )
	local playerName =UnitName("player")
	local TrgtMainClass, TrgtSubClass = UnitClass("target")
	local Fizik = ( TrgtMainClass == "Гладиатор" )
	
	a = UnitHealth("target");
    b = UnitMaxHealth("target");
	tt = math.floor((a/b)*100);
 
	
	
	if playerName=="Dixi" and mainClass == "Друид" then

---------------------------Проверка своих бафов-----------------------------------
---------------------------Проверка своих бафов-----------------------------------
	if (not SearchBuff("player","Таинственная награда"))					then CastSpellByName("Таинственная награда");		end   

	if (not SearchBuff("player","Благосклонность леса"))					then CastSpellByName("Благосклонность леса");		end

	if (not SearchBuff("player","Молитва сосредоточенности"))				then CastSpellByName("Молитва сосредоточенности");	end
	-----------------------------------------------
	-----------------------------------------------
	-----------------------------------------------

	if Fizik and	(not SearchBuff("target","Терновый щит"))				then	CastSpellByName("Терновый щит");					end

	if (SearchBuff("target","Целебное семя"))								and		(tt < 50)											then 			CastSpellByName("Восстановление");					end
	
	if (tt < 80) and	(SkillReady("Восстановление")<=0.4)					then	CastSpellByName("Восстановление");					end
	
	if (tt < 90) then	CastSpellByName("Жизнецветение");																				end
	
	if (tt < 50) and	(SkillReady("Целебное семя")<=0.4)					then	CastSpellByName("Целебное семя");					end


--------------------------------------------------------------------
-------------------------------------------------------------------
--------------------------------------------------------------------

end
end
function GladRR() 
	

	if (SearchDebuff("player","Stun")) 	or 	(SearchDebuff("player","Родственная душа"))	or 	(SearchDebuff("player","Пунш пыльцы"))		and 	(SkillReady("Указ свыше")<=0.4)  					then	CastSpellByName("Указ свыше"); 						else
	

	if (SearchBuff("player","Кузница")==false) 								and		(SkillReady("Кузница")<=0.4) 						then	CastSpellByName("Кузница");				else
	
	if (not SearchBuff("player","Теневой взрыв"))							then	CastSpellByName("Теневой взрыв");					else
	
	
	if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 	TargetNearestEnemy()	else

	if (SearchBuff("player","Взаимосвязь")==true) 							and		(SkillReady("Рунный импульс")<=0.8)					then	CastSpellByName("Рунный импульс");	else
	
	
	if (UnitSkill("player")>=70)											and		(SkillReady("Теневой удар")<=0.4)					then	CastSpellByName("Теневой удар");		else
	
	end
	end
	end
	end
	end
	end
	help()
	belie()
	CancelBuffFiz()
	end	
function baffGL()

	if (not SearchBuff("player","Неукротимый энтузиазм")) then UseItemByName("Зелье: неукротимый энтузиазм"); end 
	
--	if (SkillReady("Шаг в тень")<=0.4) then 	CastSpellByName("Шаг в тень");	end
	
	if (not SearchBuff("player","Превращение в щит")) and (SkillReady("Превращение в щит")<=0.4) then	CastSpellByName("Превращение в щит");	end

	if (not SearchBuff("player","Теневой взрыв")) then	CastSpellByName("Теневой взрыв");	end
	
	if (not SearchBuff("player","Кузница")) then	CastSpellByName("Кузница");	end
	
	if (not SearchBuff("player","Руна защиты снаряжения")) then	CastSpellByName("Рунический рост");	end
	
	
end
function GladAgro()
	CancelBuffFiz()
	
    if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
		TargetNearestEnemy()
	else
	   if (SearchBuff("player","Кузница")==false) and (SkillReady("Кузница")<=0.4) then
		   CastSpellByName("Кузница");
		else
		    if (SearchBuff("player","Превращение в щит")==false) and (SkillReady("Превращение в щит")<=0.4) then
		        CastSpellByName("Превращение в щит");
			else
			    if (SkillReady("Рунический рост")<=0.4) then 
                    CastSpellByName("Рунический рост");
				else
--				    if (UnitSkill("player")>=20) and (SkillReady("Игра в ожидание")<=0.4) then 
--		                CastSpellByName("Игра в ожидание");
--					else
--					    if (UnitMana("player")>=10) and (SkillReady("Защитная отдача")<=0.4) then 
--		                    CastSpellByName("Защитная отдача");
--						else
						    if (UnitMana("player")>=10) and (SkillReady("Приток рунной энергии")<=0.4) then 
		                        CastSpellByName("Приток рунной энергии");
							else
							    if (UnitMana("player")>=25) and (SkillReady("Сотрясающий удар")<=0.4) then 
		                            CastSpellByName("Сотрясающий удар");
								else
								    if (SearchBuff("player","Взаимосвязь")==true) and (SkillReady("Рунный импульс")<=0.8) then
		                                CastSpellByName("Рунный импульс");
									else
									    if (UnitSkill("player")>=35) and (SkillReady("Теневой удар")<=0.4) then 
                                            CastSpellByName("Теневой удар");
										else
--										    if (UnitMana("player")>=20) and (SkillReady("Удар током")<=0.4) then 
--		                                        CastSpellByName("Удар током");
--											else
--											   if (UnitMana("player")>=25) and (SkillReady("Удар запасом энергии")<=0.4) then 
--		                                           CastSpellByName("Удар запасом энергии");
--												else
												    if (UnitMana("player")>=20) and (SkillReady("Сильный удар")<=0.4) then 
		                                                CastSpellByName("Сильный удар");
													end
												end
											end
										end
									end
								end
							end
						end
					end
	--			end
	--		end
	--	end
	--end
	help()
	belie()
--	firik()
--	baffdang()
end
function GLV()

	local  h = math.floor( UnitHealth("player") / UnitMaxHealth("player") * 100 );
	
--	if	( h < 80) then	SetTitleRequest(532007) end
	
--	if	( h < 99) then	SetTitleRequest(531893) end
	
	if ( h < 20 )	and		(FFA_IsItemReady("Универсальное зелье"))					then	UseItemByName("Универсальное зелье")	DEFAULT_CHAT_FRAME:AddMessage("|cffFF00FFИспользована универсалка");		end
--	if ( h < 20 )	and		(FFA_IsItemReady("Пирог Лаорского Леса"))					then	UseItemByName("Пирог Лаорского Леса")	DEFAULT_CHAT_FRAME:AddMessage("|cffFF00FFИспользована Лаорка"); 			end
	if ( h < 50 )	then	CastSpellByName("Око за око")								else
	if ( h < 60 )	then	CastSpellByName("Защитная отдача")							else
	if ( h < 70 )	and		(FFA_IsItemReady("Зелье Фириуса - тип В"))					then	UseItemByName("Зелье Фириуса - тип В")	DEFAULT_CHAT_FRAME:AddMessage("|cffFF00FFИспользован фирик 30%");			end
	if ( h < 75 )	then	CastSpellByName("Руна решимости")							else
	if ( h < 80 )	and 	(SkillReady("Оборонительный строй")<=0.4) 					then	CastSpellByName("Оборонительный строй");			else
	if (UnitMana("player")>=45)															and		( not MLib.SearchBuff( "player", 500073 )) 			then	CastSpellByName("Attack Is the Best Defense")			else	

		
    if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
		TargetNearestEnemy()
	else
	
	if	(not SearchBuff("player","Защита Мертвоземья"))			then	CastSpellByName("Защита Мертвоземья");			end

	if (SearchBuff("player","Превращение в щит")==false)		and		(SkillReady("Превращение в щит")<=0.4)			then	CastSpellByName("Превращение в щит");	else

	if (SearchBuff("player","Кузница")==false)					and		(SkillReady("Кузница")<=0.4)					then	CastSpellByName("Кузница");				else

	if (SkillReady("Рунический рост")<=0.4)						then	CastSpellByName("Рунический рост");				else
	
	if (SkillReady("Приток рунной энергии")<=0.4) 				then	CastSpellByName("Приток рунной энергии");		else 
	
	if (SkillReady("Буйство")<=0.4) 							then	CastSpellByName("Буйство");						else

--	if (SkillReady("Сотрясающий удар")<=0.4) 					then	CastSpellByName("Сотрясающий удар");			else

	if (SearchBuff("player","Взаимосвязь")==true)				and		(SkillReady("Рунный импульс")<=0.8)				then	CastSpellByName("Рунный импульс");		else

	

--  if (UnitMana("player")>=70) 								and 	(SkillReady("Вихрь")<=0.4) 						then    CastSpellByName("Вихрь");
		
	

--end
end
end	
end
end
end	
end
end	
end
end
end
end
end
--CancelBuffFiz()

baffdangg()
belie()
end
function GLVV()


    if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
		TargetNearestEnemy()
	else
	
		local  h = math.floor( UnitHealth("player") / UnitMaxHealth("player") * 100 );
	
	
	if ( h < 20 )	and		(FFA_IsItemReady("Универсальное зелье"))					then	UseItemByName("Универсальное зелье")	DEFAULT_CHAT_FRAME:AddMessage("|cffFF00FFИспользована универсалка");		end
	if ( h < 20 )	and		(FFA_IsItemReady("Пирог Лаорского Леса"))					then	UseItemByName("Пирог Лаорского Леса")	DEFAULT_CHAT_FRAME:AddMessage("|cffFF00FFИспользована Лаорка"); 			end
	if ( h < 50 )	then	CastSpellByName("Око за око")								else
	if ( h < 60 )	and		(UnitMana("player")>=10) 									then 	CastSpellByName("Защитная отдача")				else
	if ( h < 70 )	and		(FFA_IsItemReady("Зелье Фириуса - тип В"))					then	UseItemByName("Зелье Фириуса - тип В")	DEFAULT_CHAT_FRAME:AddMessage("|cffFF00FFИспользован фирик 30%");			end
	if ( h < 75 )	then	CastSpellByName("Руна решимости")							else
	if ( h < 80 )	and 	(SkillReady("Оборонительный строй")<=0.4) 					then	CastSpellByName("Оборонительный строй");		else
	
	
	
	
	if (UnitMana("player")>=10) 								and		(not SearchBuff("player","Защита Мертвоземья"))		then	CastSpellByName("Защита Мертвоземья");			end

	if (SearchBuff("player","Превращение в щит")==false)		and		(SkillReady("Превращение в щит")<=0.4)				then	CastSpellByName("Превращение в щит");			else

	if (SearchBuff("player","Кузница")==false)					and		(SkillReady("Кузница")<=0.4)						then	CastSpellByName("Кузница");						else

	if (not SearchBuff("player","Руна защиты снаряжения"))		and		(SkillReady("Рунический рост")<=0.4)				then	CastSpellByName("Рунический рост");				else
	
	if (UnitMana("player")>=10) 								and		(SkillReady("Приток рунной энергии")<=0.4) 			then	CastSpellByName("Приток рунной энергии");		else 
	
	if (SkillReady("Буйство")<=0.4) 							then	CastSpellByName("Буйство");							else

	if (UnitMana("player")>=25) 								and		(SkillReady("Сотрясающий удар")<=0.4) 				then	CastSpellByName("Сотрясающий удар");			else

	if (SearchBuff("player","Взаимосвязь")==true)				and		(SkillReady("Рунный импульс")<=0.8)					then	CastSpellByName("Рунный импульс");				else

--	if (UnitMana("player")>=70) 								and 	(SkillReady("Вихрь")<=0.4) 							then    CastSpellByName("Вихрь");
		
	

--end
end
end	
end
end
end	
end
end	
end
end
end
end
end
CancelBuffFiz()
belie()
end
function RM()

   if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
		TargetNearestEnemy()
	else
		if (UnitMana("player")>=20) and (SkillReady("Теневой удар")<=0.4) and (SearchDebuff("target","Кровотечение")==false) then 
			CastSpellByName("Теневой удар");
		else
			if (UnitMana("player")>=35) and (SkillReady("Атака в рану")<=0.4) and (SearchDebuff("target","Кровотечение")==true) and (SearchDebuff("target","Тяжелое ранение")==true) then 
				CastSpellByName("Атака в рану");
			else
				if (UnitMana("player")>=30) and (SkillReady("Подлый удар")<=0.4) and (SearchDebuff("target","Кровотечение")==true) then 
					CastSpellByName("Подлый удар");	
				end
			end
		end
	end
belie()
--if (not SearchBuff("player","Скоростное движение"))						then	UseEquipmentItem(12); else
--BuffRM()
--Mistika()
--help()
--end
end	
function BuffRM()

 --  	if ( not MLib.SearchBuff( "player", 502222 )) then
--		UseItemByName("Обновление усилений премиума");
--	end
--	if ( not MLib.SearchBuff( "player", 506062 )) then
--		UseItemByName("Обновление усилений премиума");
--	end
	if (not SearchBuff("player","Магический бросок")) then
		CastSpellByName("Магический бросок");
	end
--	if (not SearchBuff("player","Ядовитые мучения")) then
--		CastSpellByName("Ядовитые мучения");
--	end
	if (not SearchBuff("player","Волшебная пудра удачи")) then
		UseItemByName("Зелье: удача");
	end

--	if (not SearchBuff("player","Неукротимый энтузиазм")) then
--		UseItemByName("Зелье: неукротимый энтузиазм");
--	end
	
end	
function help()--проба объединения

local  h = math.floor( UnitHealth("player") / UnitMaxHealth("player") * 100 );

	if	( h < 20 )	and		(BagItemReady("Универсальное зелье")==true)				then	UseItemByName("Универсальное зелье");						end
	
	if	( h < 30 )	and		(BagItemReady("Пирог Лаорского Леса")==true)			then	UseItemByName("Пирог Лаорского Леса");				 		end

	if	( h < 70 )	then	UseAction(9)					 						end	
	
	if  ( h < 75 )	and		(BagItemReady("Hundred Grass Essence")==true)			then	UseItemByName("Hundred Grass Essence");					end

end 


function SR()

local AS_slot = 2;
local _1, _2, _3, _4, _5, ASon = GetActionInfo(AS_slot);
if (not UnitExists("target")) or (UnitIsUnit("player","target")) or (UnitHealth("target")<=0) or (UnitIsDeadOrGhost("target")) or (not UnitCanAttack("player","target")) then 
        TargetNearestEnemy()
    else
    if (not ASon) and (UnitCanAttack("player","target")) then CastSpellByName("Автовыстрел")    else




end
end 
end