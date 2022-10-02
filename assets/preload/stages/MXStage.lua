
local xx = 490;
local yy = -150;
local xx2 = 1200;
local yy2 = 350;
local xx3 = 1000;
local yy3 = 300;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeAnimatedLuaSprite('animatedCloud1', 'MXStage/Cloud-1', -1060, -840);
	setScrollFactor('animatedCloud1', 0.6, 0.6);
	addAnimationByPrefix('animatedCloud1', 'float', 'Cloud Float', 24, true)
	objectPlayAnimation('animatedCloud1', 'float', true)
	addLuaSprite('animatedCloud1', false);
	scaleObject('animatedCloud1', 0.9, 0.9);

	makeAnimatedLuaSprite('animatedCloud2', 'MXStage/Cloud-1', -500, -690);
	setScrollFactor('animatedCloud2', 0.6, 0.6);
	addAnimationByPrefix('animatedCloud2', 'float', 'Cloud Float', 24, true)
	objectPlayAnimation('animatedCloud2', 'float', true)
	addLuaSprite('animatedCloud2', false);
	scaleObject('animatedCloud2', 0.9, 0.9);

	makeAnimatedLuaSprite('hills', 'MXStage/Hill-1', -900, -650);
	setScrollFactor('hills', 0.6, 0.6);
	addAnimationByPrefix('hills', 'blink', 'Hill', 24, true)
	objectPlayAnimation('hills', 'blink', true)
	addLuaSprite('hills', false);
	scaleObject('hills', 0.9, 0.9);

	makeAnimatedLuaSprite('animatedCloud3', 'MXStage/Cloud-1', 1300, -870);
	setScrollFactor('animatedCloud3', 0.6, 0.6);
	addAnimationByPrefix('animatedCloud3', 'float', 'Cloud Float', 24, true)
	objectPlayAnimation('animatedCloud3', 'float', true)
	addLuaSprite('animatedCloud3', false);
	scaleObject('animatedCloud3', 0.9, 0.9);

	makeLuaSprite('castle', 'MXStage/mxbg', -1000, -800);
	setScrollFactor('castle', 0.7, 0.7);
	addLuaSprite('castle', false);
	scaleObject('castle', 0.9, 0.9);

	makeLuaSprite('ground', 'MXStage/ground', -1000, -800);
	setScrollFactor('ground', 1, 1);
	addLuaSprite('ground', false);
	scaleObject('ground', 0.9, 0.9);

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
 if followchars == true then
        if mustHitSection == false then
            if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end
	    if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)        
		end
	end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
end