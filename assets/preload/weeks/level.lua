local gameOver = 0;
local MX = 0
local red = 0

function onCreate()
	precacheImage('characters/dead')
	setPropertyFromClass('GameOverSubstate', 'gameover', 'gameOver');
	
	if lowQuality then
		red = -999
	end

	makeLuaSprite("floor","floor",-600,-220)
	setLuaSpriteScrollFactor("floor",1,1)

	if not lowQuality then
		makeLuaSprite("sky","sky",-700,-350)
		setLuaSpriteScrollFactor("sky",0.4,0.4)

		makeAnimatedLuaSprite("cloud","cloud",2000,math.random(-300,300))
		addAnimationByPrefix("cloud","cloudlaugh","nobe",24,true)
		addLuaSprite("cloud",false)
		scaleObject('cloud', math.random(0.6,0.8))
		setLuaSpriteScrollFactor("cloud",math.random(0.4,0.8),math.random(0.5,0.8))
		objectPlayAnimation("cloud","cloudlaugh",true)
	end

	addLuaSprite("sky",false)
	addLuaSprite("floor",false)
	addLuaSprite("cloud",false)
end

function onUpdate()	
	setProperty('cloud.x',getProperty('cloud.x')-3)
	if getProperty('cloud.x') == -900 then
		removeLuaSprite('cloud', false)
		makeAnimatedLuaSprite("cloud","cloud",2000,math.random(-300,300))
		addAnimationByPrefix("cloud","cloudlaugh","nobe",24,true)
		addLuaSprite("cloud",false)
		setLuaSpriteScrollFactor("cloud",0.7,0.7)
		setObjectOrder('sky', 1);
		setObjectOrder('cloud', 2);
		setObjectOrder('floor', 3);
	elseif red == 1 then
		setProperty('sky.color', getColorFromHex('FF0000'));
		red = 2
		runTimer('nvm go back',0.5)
	elseif gameOver == 1 then
		makeLuaSprite('black','idk',0,0)
		makeGraphic('black', 3000, 3000, '000000')
		setObjectCamera('black', 'other')
		makeAnimatedLuaSprite('dead','characters/dead',35,-200)
		addAnimationByPrefix('dead','firstDeath','BF dies',24,false)
		addAnimationByPrefix('dead','deathLoop','BF Dead Loop',24,false)
		addAnimationByPrefix('dead','deathConfirm','BF Dead confirm',24,false)
		setObjectCamera('dead', 'other')
		scaleObject('dead', 0.9, 0.9)
		addLuaSprite('black',true)
		addLuaSprite('dead',true)
		gameOver = 2
	elseif gameOver == 2 then
		if keyJustPressed('accept') then
			setProperty('dead.y',-500)
			setProperty('dead.x',-350)
			objectPlayAnimation("dead","deathConfirm",false)
			gameOver = 3
		end
	end
end


function onBeatHit()
	if curBeat == 96 then
		runTimer("bgmarioDies", 5)
		doTweenAlpha("skyscene", "sky", 0, 1,"quartInOut")
		doTweenAlpha("floorscene", "floor", 0, 1, "quartInOut")
		doTweenAlpha("cloudscene", "cloud", 0, 1, "quartInOut")
	end

	if curBeat == 644 then
		red = 1
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'bgmarioDies' then
		doTweenAlpha("skyend", "sky", 1, 1, "quartInOut")
		doTweenAlpha("floorend", "floor", 1, 1, "quartInOut")
		doTweenAlpha("cloudend", "cloud", 1, 1, "quartInOut")
		MX = 1
	elseif tag == 'nvm go back' then
		setProperty('sky.color', getColorFromHex('FFFFFF'));
		runTimer('oh nvm',0.5)
	elseif tag == 'oh nvm' then
		setProperty('sky.color', getColorFromHex('FF0000'));
		runTimer('nvm go back',0.5)
	end
end

function onGameOver()
	gameOver = 1
	return Function_Continue;
end