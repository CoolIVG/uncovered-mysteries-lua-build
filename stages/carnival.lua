function onCreate()
	makeLuaSprite('carnival', 'stages/carnival/carnival', -500, -300)
	scaleObject('carnival', 2, 2);
	setScrollFactor('carnival', 1, 1)
	addLuaSprite('carnival', false)

	makeLuaSprite('light', 'stages/carnival/light', -500, -300)
	scaleObject('light', 2, 2);
	setScrollFactor('light', 1, 1)
	addLuaSprite('light', false)

	makeLuaSprite('shelf', 'stages/carnival/shelf', -500, -300)
	scaleObject('shelf', 2, 2);
	setScrollFactor('shelf', 1, 1)
	addLuaSprite('shelf', false)

	makeAnimatedLuaSprite('carnivalTwisted', 'stages/carnival/twistedcarnival', -500, -300);
	addAnimationByPrefix('carnivalTwisted','warpeffect','idle', 5, true);
	scaleObject('carnivalTwisted', 2, 2);
	setScrollFactor('carnivalTwisted', 1, 1)
	addLuaSprite('carnivalTwisted', false);

	makeLuaSprite('carnival3D', 'stages/carnival/carnival3D', 0, -150)
	scaleObject('carnival3D', 1, 1);
	addLuaSprite('carnival3D', false)
end

function onCreatePost()
	setObjectOrder('carnival3D', 1)
	setObjectOrder('carnivalTwisted', 2)
	setObjectOrder('carnival', 3)
	setObjectOrder('light', 4)
	setObjectOrder('gfGroup', 5)
	setObjectOrder('boyfriendGroup', 6)
	setObjectOrder('dadGroup', 7)
	setObjectOrder('shelf', 8)

	setProperty('carnivalTwisted.visible', false)
	setProperty('carnival3D.visible', false)
end

function onSongStart()
	if not middlescroll then
		for i = 0, 3 do
    			setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
    			setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i] + 10)
		end
	end
end