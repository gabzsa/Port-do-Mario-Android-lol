
local xx = 380;
local yy = 580;
local xx2 = 1600;
local yy2 = 590;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeAnimatedLuaSprite('animatedCloud1', 'crossStage/Cloud-1', 1250, -300);
	setScrollFactor('animatedCloud1', 0.6, 0.6);
	addAnimationByPrefix('animatedCloud1', 'float', 'Cloud Float', 24, true)
	objectPlayAnimation('animatedCloud1', 'float', true)
	addLuaSprite('animatedCloud1', false);

	makeLuaSprite('hills', 'crossStage/theHills', -1000, -800);
	setScrollFactor('hills', 0.8, 0.8);
	addLuaSprite('hills', false);

	makeLuaSprite('bg', 'crossStage/bg', -1000, -800);
	setScrollFactor('bg', 1, 1);
	addLuaSprite('bg', false);

	makeLuaSprite('ground', 'crossStage/floor', -1000, -800);
	setScrollFactor('ground', 1, 1);
	addLuaSprite('ground', false);

end
	

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
	end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end