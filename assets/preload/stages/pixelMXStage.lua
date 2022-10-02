

function onCreate()
	-- background shit
	makeLuaSprite('sky', 'pixelMXStage/bg', 350, 650);
	addLuaSprite('sky', false);
	
	makeAnimatedLuaSprite('animatedCloud1', 'pixelMXStage/Cloud1', 350, 950);
	addAnimationByPrefix('animatedCloud1', 'float', 'Cloud1 Cloud', 12, true)
	objectPlayAnimation('animatedCloud1', 'float', true)
	addLuaSprite('animatedCloud1', false);


	makeAnimatedLuaSprite('animatedCloud2', 'pixelMXStage/Cloud2', 1300, 950);
	addAnimationByPrefix('animatedCloud2', 'float', 'Cloud2 Cloud2', 12, true)
	objectPlayAnimation('animatedCloud2', 'float', true)
	addLuaSprite('animatedCloud2', false);

	makeAnimatedLuaSprite('hills', 'pixelMXStage/Mountains', 350, 650);
	addAnimationByPrefix('hills', 'float', 'Mountains Mountain Blink', 12, true)
	objectPlayAnimation('hills', 'float', true)
	addLuaSprite('hills', false);

	makeLuaSprite('castle', 'pixelMXStage/pixelCastle', 350, 650);
	addLuaSprite('castle', false);

	makeLuaSprite('ground', 'pixelMXStage/pixelGround', 350, 650);
	addLuaSprite('ground', false);

end
	