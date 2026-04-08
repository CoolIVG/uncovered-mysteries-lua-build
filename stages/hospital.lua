function onCreate()
	makeLuaSprite('Hospital3D', 'stages/maladjusted/Hospital3D', 0, 0);
	addLuaSprite('Hospital3D', false);

	makeLuaSprite('Hospital3DG', 'stages/maladjusted/Hospital3DGreen', 0, 0);
	addLuaSprite('Hospital3DG', false);

	makeLuaSprite('bgFlash', nil, 0, 0)
	makeGraphic('bgFlash', 4000, 1750, 'FFFFFF')
	setProperty('bgFlash.alpha', 0)
	addLuaSprite('bgFlash', false)
end

function onCreatePost()
	setObjectOrder('Hospital3DG', 1)
	setObjectOrder('Hospital3D', 2)
	setObjectOrder('bgFlash', 3)
	setObjectOrder('gfGroup', 4)
	setObjectOrder('dadGroup', 5)
	setObjectOrder('boyfriendGroup', 6)

	setProperty('Hospital3DG.visible', false)
end