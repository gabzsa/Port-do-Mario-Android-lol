local curMovePlayer = false

function opponentNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
	if dadName == 'mario' then
		camMove(direction, false);
		if getProperty('health') > 0.02 then
			setProperty('health', health- 0.015);
		end
	elseif dadName == 'normal-mario' then
		camMove(direction, false);
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	camMove(direction, true);
end

function camMove(dir, player)
    if ((dir ~= lastDir and mustHitSection == player) or (mustHitSection ~= curMovePlayer)) then -- Makes sure not to keep adding forever
        curMovePlayer = player 
        lastDir = dir
        doTweenX('camFollowPosX', getProperty('camFollow'), getProperty('camFollow.x') + (dir == 0 and -40 or dir == 3 and 40 or 0), 0.01, 'linear') --If direction is 0, then add 40, if direction is 3 subtract 40
        doTweenY('camFollowPosY', getProperty('camFollow'), getProperty('camFollow.y') + (dir == 1 and 40 or dir == 2 and -40 or 0), 0.01, 'linear') --If direction is 1, then add 40, if direction is 2 subtract 40
	end
end

function onMoveCamera(focus)
	--doTweenX('RcamFollowPosX', getProperty('camFollow'), getProperty('camFollow.x') + (dir == 0 and 40 or dir == 3 and -40 or 0), 0.2, 'linear')
	--doTweenY('RcamFollowPosY', getProperty('camFollow'), getProperty('camFollow.y') + (dir == 1 and -40 or dir == 2 and 40 or 0), 0.2, 'linear')
end

function onTweenCompleted(tag)
	if tag == 'camFollowPosX' then
		doTweenX('RcamFollowPosX', getProperty('camFollow'), getProperty('camFollow.x') + (dir == 0 and 40 or dir == 3 and -40 or 0), 0.01, 'linear')
	elseif tag == 'camFollowPosY' then
		doTweenY('RcamFollowPosY', getProperty('camFollow'), getProperty('camFollow.y') + (dir == 1 and -40 or dir == 2 and 40 or 0), 0.01, 'linear')
	end
end
local lastDir = 0; -- Last direction