function onCreatePost()
	makeLuaSprite('CULO', 'stages/CULO', -700, -650)
	scaleObject('CULO', 1.25, 1.25);
	addLuaSprite('CULO', false)

	setObjectOrder('CULO', 1)
	setObjectOrder('dadGroup', 2)
	setObjectOrder('gfGroup', 3)
	setObjectOrder('boyfriendGroup', 4)
end