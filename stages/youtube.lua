function onCreate()
	makeLuaSprite('Mansion', 'stages/linkbait/Mansion', -500, -300)
	scaleObject('Mansion', 1.5, 1.5);
	setScrollFactor('Mansion', 1, 1)
	addLuaSprite('Mansion', false)

	makeLuaSprite('MansionUI', 'stages/linkbait/MansionUI', -800, -300)
	scaleObject('MansionUI', 1.5, 1.5);
	setScrollFactor('MansionUI', 1, 1)
	addLuaSprite('MansionUI', false)

	makeLuaSprite('MonoMansionUI', 'stages/linkbait/MonoMansionUI', -800, -300)
	scaleObject('MonoMansionUI', 1.5, 1.5);
	setScrollFactor('MonoMansionUI', 1, 1)
	addLuaSprite('MonoMansionUI', false)

	makeLuaSprite('Void', 'stages/linkbait/Void', -500, -300)
	scaleObject('Void', 1.6, 1.6);
	setScrollFactor('Void', 1, 1)
	addLuaSprite('Void', false)

	makeLuaSprite('bslick', 'stages/linkbait/bslick', 0, 0)
	scaleObject('bslick', 1, 1);
	setObjectCamera('bslick', 'camOther')
	addLuaSprite('bslick', false)

	makeAnimatedLuaSprite('Static', 'stages/Static', -435, -270)
	addAnimationByPrefix('Static','staticglitch','idle', 24, true)
	scaleObject('Static', 4, 4)
	setScrollFactor('Static', 1, 1)
	addLuaSprite('Static', false)

	makeLuaSprite('NoTextMansionUI', 'stages/linkbait/NoTextMansionUI', -800, -300)
	scaleObject('NoTextMansionUI', 1.5, 1.5);
	setScrollFactor('MonoMansionUI', 1, 1)
	addLuaSprite('NoTextMansionUI', false)
end

function onCreatePost()
	setObjectOrder('Mansion', 1)
	setObjectOrder('Void', 2)
	setObjectOrder('Static', 3)
	setObjectOrder('gfGroup', 4)
	setObjectOrder('dadGroup', 5)
	setObjectOrder('MansionUI', 6)
	setObjectOrder('MonoMansionUI', 7)
	setObjectOrder('NoTextMansionUI', 8)
	setObjectOrder('boyfriendGroup', 9)

	setProperty('MansionUI.visible', false)
	setProperty('NoTextMansionUI.visible', false)
	setProperty('Mansion.visible', false)
	setProperty('Void.visible', false)
	setProperty('Static.visible', false)
	setProperty('MonoMansionUI.visible', false)
	setProperty('gfGroup.visible', false)
	setProperty('bslick.alpha', 0)
end

function onSongStart()
	--setPropertyFromGroup('strumLineNotes', 0, 'x', -1000)
	--setPropertyFromGroup('strumLineNotes', 1, 'x', -1000)
	--setPropertyFromGroup('strumLineNotes', 2, 'x', -1000)
	--setPropertyFromGroup('strumLineNotes', 3, 'x', -1000)

	setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 + 1000)
	setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 + 1000)
	setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 + 1000)
	setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 + 1000)

	for i = 0, 3 do
		noteTweenAlpha('Note' .. i, i, 0, 0.001, 'linear')
	end
end