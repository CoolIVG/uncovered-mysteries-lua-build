function onCreate()
	makeLuaSprite('House', 'stages/house/house', -500, -350);
	scaleObject('House', 1.7, 1.7);
	setScrollFactor('House', 1, 1);
	addLuaSprite('House',false);

	makeLuaSprite('LightFloor', 'stages/house/litfloor', -500, -350);
	scaleObject('LightFloor', 1.7, 1.7);
	setScrollFactor('LightFloor', 1, 1);
	addLuaSprite('LightFloor', false);

	makeLuaSprite('RedLight', 'stages/house/redlight', -500, -350);
	scaleObject('RedLight', 1.7, 1.7);
	setScrollFactor('RedLight', 1, 1);
	addLuaSprite('RedLight', false);

	makeLuaSprite('Spooky', 'stages/house/spooks', -500, -400);
	scaleObject('Spooky', 1.7, 1.7);
	setScrollFactor('Spooky', 1, 1);
	addLuaSprite('Spooky', false);

	makeLuaSprite('SpookyLights', 'stages/house/overlay', -500, -400);
	scaleObject('SpookyLights', 1.7, 1.7);
	setScrollFactor('SpookyLights', 1, 1);
	addLuaSprite('SpookyLights', false);

	makeAnimatedLuaSprite('Static', 'stages/Static', -500, -200);
	addAnimationByPrefix('Static','staticglitch','idle', 24, true);
	scaleObject('Static', 5, 5);
	--setObjectCamera('Static', 'other');
	addLuaSprite('Static', false);
end

function onCreatePost()
	setProperty('Spooky.visible', false)
	setProperty('RedLight.visible', false)
	setProperty('SpookyLights.visible', false)

	setObjectOrder('House', 1)
	setObjectOrder('LightFloor', 2)
	setObjectOrder('Spooky', 3)
	setObjectOrder('Static', 4)
	setObjectOrder('gfGroup', 5)
	setObjectOrder('boyfriendGroup', 7)
	setObjectOrder('RedLight', 8)
	setObjectOrder('dadGroup', 9)
	setObjectOrder('SpookyLights', 10)
	setProperty('Static.alpha', 0);
end