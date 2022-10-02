local keepScroll = false

function onCreate()
	makeLuaSprite('bg','FUCKING high',0,0)
	setObjectCamera('bg', 'hud')
	addLuaSprite('bg')
	setGraphicSize('iconP1', 2, 2)
	keepScroll = getPropertyFromClass('ClientPrefs', 'middleScroll');
	setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	makeLuaText('balls', 'Original Song made by Philiplol', 0, 0, 0)
	makeLuaText('balls2thesequel', 'Song from the Tails Get Trolled mod', 0, 0, 20)
	addLuaText('balls', false)
	addLuaText('balls2thesequel', false)
end

function onDestroy()
	if not keepScroll then
	        setPropertyFromClass('ClientPrefs', 'middleScroll', false);
        end
end