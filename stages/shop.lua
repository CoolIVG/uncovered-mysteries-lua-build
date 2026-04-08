function onCreate()
	makeLuaSprite('behind', 'stages/maplebg', 0, 0)
	setProperty('behind.color', getColorFromHex('4F2A00'))
	addLuaSprite('behind', false)

	makeLuaSprite('shop', 'stages/maple', 0, 0)
	addLuaSprite('shop', false)
end

function onCreatePost()
	setObjectOrder('behind', 2)
	setObjectOrder('dadGroup', 3)
	setObjectOrder('shop', 4)
	setObjectOrder('gfGroup', 5)
	setObjectOrder('boyfriendGroup', 6)

	setProperty('boyfriendGroup.visible', false)
end



