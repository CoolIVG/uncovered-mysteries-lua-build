function onCreate()
	makeLuaSprite('lightMall', 'stages/mall/malllight', 0, 0)
	--scaleObject('lightMall', 1.2, 1.2);
	addLuaSprite('lightMall', false)

	makeLuaSprite('darkMall', 'stages/mall/mallpurp', 0, 0)
	--scaleObject('darkMall', 1.2, 1.2);
	addLuaSprite('darkMall', false)

	makeLuaSprite('bench', 'stages/mall/bench', 0, 0)
	--scaleObject('bench', 1.2, 1.2);
	addLuaSprite('bench', false)

	makeLuaSprite('shading', 'stages/mall/shading', 0, 0)
	--scaleObject('shading', 1.2, 1.2);
	addLuaSprite('shading', false)
end

function onCreatePost()
	setObjectOrder('lightMall', 1)
	setObjectOrder('darkMall', 2)
	setObjectOrder('bench', 3)
	setObjectOrder('shading', 4)
	setObjectOrder('gfGroup', 5)
	setObjectOrder('boyfriendGroup', 6)
	setObjectOrder('dadGroup', 7)

	--setProperty('darkMall.visible', false)
	setProperty('shading.visible', false)
end