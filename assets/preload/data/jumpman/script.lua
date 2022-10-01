local time = 204

function onCreate()
	-- triggered when the lua file is started
	precacheImage('clock')
	addVCREffect('game')
	addChromaticAbberationEffect('game')
	addBloomEffect('game')
	addChromaticAbberationEffect('hud')
	addBloomEffect('hud')
	setTextFont('scoreTxt', 'nes.otf');
	setProperty('timeTxt.visible',false)
	setProperty('timeBar.visible',false)
	setProperty('timeBarBG.visible',false)
	if not lowQuality then
		if not downscroll then
			makeAnimatedLuaSprite('time','timeCrazy',385,15)
			scaleObject('time', 2, 2.1)
			addAnimationByPrefix('time', 'omg', 'crazy', 24, true)
			setObjectCamera('time', 'hud')
			addLuaSprite('time')
		elseif downscroll then
			makeAnimatedLuaSprite('time','timeCrazy',385,615)
			scaleObject('time', 2, 2.1)
			addAnimationByPrefix('time', 'omg', 'crazy', 24, true)
			setObjectCamera('time', 'hud')
			addLuaSprite('time')
		end
	end
	doTweenAlpha("start", "boyfriend", 1, 1, "quartInOut")
   	setPropertyFromClass("openfl.Lib", "application.window.title", "REAL MARIO BROS!!!!1!!")
	addCharacterToList('mario', 'dad');
	addCharacterToList('normal-mario', 'dad');
	addCharacterToList('mario-win', 'dad');
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		runTimer('lowEnd',1,1)
		allowCountdown = true;
		return Function_Stop;
	end
	setProperty('camGame.visible',true)
	setProperty('camHUD.visible',true)

	return Function_Continue;
end


local allowEnd = false
function onEndSong()
	if not allowEnd and isStoryMode and not seenCutscene then --Block the first countdown
		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		runTimer('lowEndB',1,1)

		allowEnd = true;
		return Function_Stop;
	end
	setProperty('camGame.visible',true)
	setProperty('camHUD.visible',true)

	return Function_Continue;
end

function onBeatHit()
	if curBeat == 96 then
		runTimer("marioDies", 5)
   		setPropertyFromClass("openfl.Lib", "application.window.title", "REAL... mario... bros?")
		doTweenAlpha("picoscene", "boyfriend", 0, 1,"quartInOut")
		doTweenAlpha("hudscene", "camHUD", 0, 1, "quartInOut")
		doTweenZoom("camscene", "camGame", 1, 5, "quartInOut")
	end

	if curBeat == 464 then
		doTweenZoom("dropcam", "camGame", 0.8, 22, "quartInOut")
	end
	
	if curBeat == 644 then
		clock = 1
		if not lowQuality then
			if not downscroll then
				makeLuaSprite('clocky','clock',0,950)
				scaleObject('clocky', 7, 7)
				setObjectCamera('clocky', 'hud')
				makeLuaText('time', time, 0, 135, 985)
				setTextSize('time', 80)
				setTextFont('time', 'nes.otf')
				addLuaSprite('clocky')
				addLuaText('time')
				doTweenY('balls1', 'clocky', 550, 1, 'circInOut')
				doTweenY('balls2', 'time', 585, 1, 'circInOut')
			elseif downscroll then
				makeLuaSprite('clocky','clock',0,-250)
				scaleObject('clocky', 7, 7)
				setObjectCamera('clocky', 'hud')
				makeLuaText('time', time, 0, 135, -285)
				setTextSize('time', 80)
				setTextFont('time', 'nes.otf')
				addLuaSprite('clocky')
				addLuaText('time')
				doTweenY('balls1', 'clocky', 35, 1, 'circInOut')
				doTweenY('balls2', 'time', 65, 1, 'circInOut')
			end
		end
	elseif clock == 1 then
		time = time - 1
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'marioDies' then
		doTweenAlpha("hudend", "camHUD", 1, 1, "quartInOut")
		doTweenAlpha("picoend", "boyfriend", 1, 1, "quartInOut")
		isMarioDead = 1
		mov = 1
   		setPropertyFromClass("openfl.Lib", "application.window.title", "INNOCENCE WON'T GET YOU FAR")
	elseif tag == 'lowEnd' then
		startVideo('cut1');
	elseif tag == 'lowEndB' then
		startVideo('cut2');
	end
end

function onGameOver()
	doTweenAlpha("te moriste flaco", "boyfriend", 0, 1, "quartInOut")
	return Function_Continue;
end

function onUpdate(elapsed)
	if isMarioDead == 1 then
		if getProperty('health') > 0.6 and getProperty('health') < 1.4 then
			triggerEvent('Change Character', 1, 'mario');
		elseif getProperty('health') > 0 and getProperty('health') <= 0.6 then
			triggerEvent('Change Character', 1, 'mario-win');
		end
	end
end

function onUpdatePost()
	angle = math.random(-20,20)
	setTextString('time', time)
	local currBeat = (getSongPosition()/1000) * (bpm/60)
	if mov == 1 then
		if not lowQuality then
			if not downscroll then
				for i=0,7 do
					setPropertyFromGroup('strumLineNotes',i,'y', 45 + (math.sin(currBeat + (0.5*i)) * 15))
				end
			elseif downscroll then
				for i=0,7 do
					setPropertyFromGroup('strumLineNotes',i,'y', 560 + (math.sin(currBeat + (0.5*i)) * 15))
				end
			end
		end
	elseif mov == 2 then
		noteTweenAngle('wow', 0, 360, 0.25, 'circInOut')
		noteTweenAngle('wow1', 1, 360, 0.25, 'circInOut')
		noteTweenAngle('wow2', 2, 360, 0.25, 'circInOut')
		noteTweenAngle('wow3', 3, 360, 0.25, 'circInOut')
		noteTweenAngle('wow4', 4, 360, 0.25, 'circInOut')
		noteTweenAngle('wow5', 5, 360, 0.25, 'circInOut')
		noteTweenAngle('wow6', 6, 360, 0.25, 'circInOut')
		noteTweenAngle('wow7', 7, 360, 0.25, 'circInOut')
	end
end