message("Are you ready for Mad Matt's Wargames?!")
PlaySoundFile("Interface\\AddOns\\DaddysWargame\\Lyder\\honk.ogg")



local ADDON_ID = 'DaddysWargame'
local BAM_SOUND = 'Interface/AddOns/DaddysWargame/Lyder/horse.ogg'
local BAAAM_SOUND = 'Interface/AddOns/DaddysWargame/Lyder/honk.ogg'
local alban = 'Interface/AddOns/DaddysWargame/Lyder/alban.ogg'
local boing = 'Interface/AddOns/DaddysWargame/Lyder/boing.ogg'
local boing2 = 'Interface/AddOns/DaddysWargame/Lyder/boing2.ogg'
local boing3 = 'Interface/AddOns/DaddysWargame/Lyder/boing3.ogg'
local boing4 = 'Interface/AddOns/DaddysWargame/Lyder/boing4.ogg'
local borat = 'Interface/AddOns/DaddysWargame/Lyder/borat.ogg'
local bowling = 'Interface/AddOns/DaddysWargame/Lyder/bowling.ogg'
local drunk1 = 'Interface/AddOns/DaddysWargame/Lyder/drunk1.ogg'
local slap = 'Interface/AddOns/DaddysWargame/Lyder/slap.ogg'
local woop = 'Interface/AddOns/DaddysWargame/Lyder/woop.ogg'
local woopwoop = 'Interface/AddOns/DaddysWargame/Lyder/woopwoop.ogg'

local ele = 'Interface/AddOns/DaddysWargame/Lyder/elephant.ogg'
local huw = 'Interface/AddOns/DaddysWargame/Lyder/huwawa.ogg'
local pig = 'Interface/AddOns/DaddysWargame/Lyder/pig.ogg'
local ohyes = 'Interface/AddOns/DaddysWargame/Lyder/ohyes.ogg'

local mario = 'Interface/AddOns/DaddysWargame/Lyder/mario.ogg'
local sus = 'Interface/AddOns/DaddysWargame/Lyder/sus.ogg'
local beer = 'Interface/AddOns/DaddysWargame/Lyder/beer.ogg'
local kids = 'Interface/AddOns/DaddysWargame/Lyder/kids.ogg'
local nice = 'Interface/AddOns/DaddysWargame/Lyder/nice.ogg'

local THROTTLE_SECONDS = 2


local ADDON_TITLE = GetAddOnMetadata(ADDON_ID, 'Title')
local PLAYER_GUID = UnitGUID('player')

local function ends_with(str, ending)
  return ending == "" or str:sub(-#ending) == ending
end

local function printBam(...)
  print('|cFF9BDBF5'..ADDON_TITLE)
end

local function formatBlue(msg)
  return format('|cFF9BDBF5%s|r', msg)
end

local function formatSetting(setting)
  if (setting) then
    return '|cFF4caf50ENABLED|r'
  else
    return '|cFFf44336DISABLED|r'
  end
end

local function throttle(func, seconds)
  local lastCalled = 0

  return function(...)
    if (time() - lastCalled < seconds) then
      return
    end
    
    lastCalled = time()
    return func(...)
  end
end

local throttledBamSound = throttle(function() PlaySoundFile(BAM_SOUND, 'Master') end, THROTTLE_SECONDS)
local throttledBaaamSound = throttle(function() PlaySoundFile(BAAAM_SOUND, 'Master') end, THROTTLE_SECONDS)



-- Application Code

local f = CreateFrame("Frame")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:SetScript("OnEvent", function(self, event)
  self:OnEvent(event, CombatLogGetCurrentEventInfo())
end)

function f:OnEvent(event, ...)
  local timestamp, subevent, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...
  local spellId, spellName, spellSchool
  local environmentalType
  local amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand
  
  if (subevent == "SWING_DAMAGE") then
    amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, ...)
  elseif (subevent == "ENVIRONMENTAL_DAMAGE") then
    environmentalType, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, ...)
  else  
    spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = select(12, ...)
  end
  
  if (ends_with(subevent, '_DAMAGE') and critical and sourceGUID == PLAYER_GUID) then
    if (BamCharSettings['TRIGGER_ON_SWING'] or spellId) then
      if (overkill and overkill > 0) and BamCharSettings['BAAAM_ON_OVERKILL'] then
        if (BamCharSettings['THROTTLE_SOUNDS']) then
          throttledBaaamSound()
        else
		local t = math.random(1,22)
		if (t ==1 ) then
				PlaySoundFile(BAAAM_SOUND, 'Master')
			elseif (t ==2 ) then
				PlaySoundFile(BAM_SOUND, 'Master')
			elseif (t ==3 ) then
				PlaySoundFile(alban, 'Master')
			elseif (t ==4 ) then
				PlaySoundFile(boing, 'Master')
			elseif (t ==5 ) then
				PlaySoundFile(boing2, 'Master')
			elseif (t ==6 ) then
				PlaySoundFile(boing3, 'Master')
			elseif (t ==7 ) then
				PlaySoundFile(boing4, 'Master')
			elseif (t ==8 ) then
				PlaySoundFile(borat, 'Master')
			elseif (t ==9 ) then
				PlaySoundFile(bowling, 'Master')
			elseif (t ==10 ) then
				PlaySoundFile(drunk1, 'Master')
			elseif (t ==11 ) then
				PlaySoundFile(slap, 'Master')
			elseif (t ==12 ) then
				PlaySoundFile(woop, 'Master')
			elseif (t ==13 ) then
				PlaySoundFile(woopwoop, 'Master')
			elseif (t ==14 ) then
				PlaySoundFile(ele, 'Master')
			elseif (t ==15 ) then
				PlaySoundFile(huw, 'Master')	
			elseif (t ==16 ) then
				PlaySoundFile(pig, 'Master')	
			elseif (t ==17 ) then
				PlaySoundFile(ohyes, 'Master')
			elseif (t ==18 ) then
				PlaySoundFile(mario, 'Master')
			elseif (t ==19 ) then
				PlaySoundFile(sus, 'Master')
			elseif (t ==20 ) then
				PlaySoundFile(beer, 'Master')
			elseif (t ==21 ) then
				PlaySoundFile(kids, 'Master')
			elseif (t ==22 ) then
				PlaySoundFile(nice, 'Master')	
			end
        end
      else
        if (BamCharSettings['THROTTLE_SOUNDS']) then
          throttledBamSound()
        else
		local r = math.random(1,22)
			if (r ==1 ) then
				PlaySoundFile(BAAAM_SOUND, 'Master')
			elseif (r ==2 ) then
				PlaySoundFile(BAM_SOUND, 'Master')
			elseif (r ==3 ) then
				PlaySoundFile(alban, 'Master')
			elseif (r ==4 ) then
				PlaySoundFile(boing, 'Master')
			elseif (r ==5 ) then
				PlaySoundFile(boing2, 'Master')
			elseif (r ==6 ) then
				PlaySoundFile(boing3, 'Master')
			elseif (r ==7 ) then
				PlaySoundFile(boing4, 'Master')
			elseif (r ==8 ) then
				PlaySoundFile(borat, 'Master')
			elseif (r ==9 ) then
				PlaySoundFile(bowling, 'Master')
			elseif (r ==10 ) then
				PlaySoundFile(drunk1, 'Master')
			elseif (r ==11 ) then
				PlaySoundFile(slap, 'Master')
			elseif (r ==12 ) then
				PlaySoundFile(woop, 'Master')
			elseif (r ==13 ) then
				PlaySoundFile(woopwoop, 'Master')
			elseif (r ==14 ) then
				PlaySoundFile(ele, 'Master')
			elseif (r ==15 ) then
				PlaySoundFile(huw, 'Master')	
			elseif (r ==16 ) then
				PlaySoundFile(pig, 'Master')	
			elseif (r ==17 ) then
				PlaySoundFile(ohyes, 'Master')	
			elseif (r ==18 ) then
				PlaySoundFile(mario, 'Master')
			elseif (r ==19 ) then
				PlaySoundFile(sus, 'Master')
			elseif (r ==20 ) then
				PlaySoundFile(beer, 'Master')
			elseif (r ==21 ) then
				PlaySoundFile(kids, 'Master')
			elseif (r ==22 ) then
				PlaySoundFile(nice, 'Master')	
			
			end
			
        end
      end
    end
  end
end

SLASH_BAM1 = '/harderdaddy'
SlashCmdList['BAM'] = function(command)
  if (command == 'swing') then
    BamCharSettings['TRIGGER_ON_SWING'] = not BamCharSettings['TRIGGER_ON_SWING']
    printBam('-- Sound trigger on Weapon(swing) crits', formatSetting(BamCharSettings['TRIGGER_ON_SWING']))
	printBam('kuk')
  elseif (command == 'overkill') then
    BamCharSettings['BAAAM_ON_OVERKILL'] = not BamCharSettings['BAAAM_ON_OVERKILL']
    printBam('-- Different sound for Overkill crits', formatSetting(BamCharSettings['BAAAM_ON_OVERKILL']))
  elseif (command == 'throttle') then
    BamCharSettings['THROTTLE_SOUNDS'] = not BamCharSettings['THROTTLE_SOUNDS']
    printBam('-- Only play sounds every ' .. THROTTLE_SECONDS .. ' seconds (because dots and caruzzos are a thing)', formatSetting(BamCharSettings['THROTTLE_SOUNDS']))
  else
    throttledBamSound()
    printBam('Config')
    print('  Plays effects! sounds every time you crit!|n|n')
    print('/daddy swing|n-- Toggle Sound trigger on Weapon(Swing) crits.', 'Currently', formatSetting(BamCharSettings['TRIGGER_ON_SWING']))
    print('/daddy overkill|n-- Toggle Different Baaam! sound for Overkill crits.', 'Currently', formatSetting(BamCharSettings['BAAAM_ON_OVERKILL']))
    print('/daddy throttle|n-- Toggle Only play sounds every 2 seconds!', 'Currently', formatSetting(BamCharSettings['THROTTLE_SOUNDS']))
  end
end

local loadingFrame = CreateFrame("FRAME")
loadingFrame:RegisterEvent("ADDON_LOADED")
loadingFrame:SetScript("OnEvent", function(self, event, name)
  if (name == ADDON_ID) then 
    if (BamCharSettings == nil) then
      printBam('Welcome! Setting defaults...')
      BamCharSettings = {}
    end

    if (BamCharSettings['TRIGGER_ON_SWING'] == nil) then
      BamCharSettings['TRIGGER_ON_SWING'] = true
      print('-- Trigger on Weapon Swings', formatSetting(BamCharSettings['TRIGGER_ON_SWING']))
    end

    if (BamCharSettings['BAAAM_ON_OVERKILL'] == nil) then
      BamCharSettings['BAAAM_ON_OVERKILL'] = true
      print('-- Play BAAAM sound on Overkill', formatSetting(BamCharSettings['BAAAM_ON_OVERKILL']))
    end
    if (BamCharSettings['THROTTLE_SOUNDS'] == nil) then
      BamCharSettings['THROTTLE_SOUNDS'] = false
      print('-- Only play sounds every ' .. THROTTLE_SECONDS .. ' seconds (ANTI-BLIZZARD MODE! NO BABABABABABAM!)', formatSetting(BamCharSettings['THROTTLE_SOUNDS']))
    end
  end
end)