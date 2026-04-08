function onCreate()
	makeLuaSprite('Alleys', 'stages/alleys/background', -500, -400);
	scaleObject('Alleys', 1.9, 1.9);
	addLuaSprite('Alleys', false);

	makeLuaSprite('Spotlight', 'stages/alleys/bfspotlight', -500, -400);
	scaleObject('Spotlight', 1.9, 1.9);
	addLuaSprite('Spotlight', false);
	setBlendMode('Spotlight', 'add')

	makeLuaSprite('BGLight', 'stages/alleys/backgroundlight', -500, -400);
	scaleObject('BGLight', 1.9, 1.9);
	addLuaSprite('BGLight', false);

	makeLuaSprite('StitchLightFloor', 'stages/alleys/lightfloor', -500, -400);
	scaleObject('StitchLightFloor', 1.9, 1.9);
	addLuaSprite('StitchLightFloor', false);
	setBlendMode('StitchLightFloor', 'add')

	makeLuaSprite('Shading', 'stages/alleys/shading', -500, -400);
	scaleObject('Shading', 1.9, 1.9);
	addLuaSprite('Shading', false);
	setBlendMode('Shading', 'overlay')

	makeLuaSprite('CarOff', 'stages/alleys/caroff', -500, -400);
	scaleObject('CarOff', 1.9, 1.9);
	addLuaSprite('CarOff', false);

	makeLuaSprite('CarOn', 'stages/alleys/caron', -500, -400);
	scaleObject('CarOn', 1.9, 1.9);
	addLuaSprite('CarOn', false);

	makeAnimatedLuaSprite('Static', 'stages/Static', -330, -200);
	addAnimationByPrefix('Static','staticglitch','idle', 24, true);
	scaleObject('Static', 4.25, 4);
	setObjectCamera('Static', 'other');
	addLuaSprite('Static', false);

	makeLuaSprite('Viginette', 'stages/alleys/viginette', 0, 0);
	scaleObject('Viginette', 0.63, 0.6);
	setObjectCamera('Viginette', 'other');
	addLuaSprite('Viginette', false);

	makeLuaSprite('Inbetween', 'stages/alleys/portal/background', -300, -200);
	scaleObject('Inbetween', 1.5, 1.5);
	addLuaSprite('Inbetween', false);

	makeLuaSprite('Flooring', 'stages/alleys/portal/floor', -300, -200);
	scaleObject('Flooring', 1.5, 1.5);
	addLuaSprite('Flooring', false);

	makeLuaSprite('Portals', 'stages/alleys/portal/portals', -300, -200);
	scaleObject('Portals', 1.5, 1.5);
	addLuaSprite('Portals', false);

	makeLuaSprite('Hue', 'stages/alleys/portal/hue', 0, 0);
	setProperty('Hue.alpha', 0.5)
	setObjectCamera('Hue', 'other');
	addLuaSprite('Hue', false);
end

function onCreatePost()
	setObjectOrder('Alleys', 1)
	setObjectOrder('Spotlight', 2)
	setObjectOrder('StitchLightFloor', 3)
	setObjectOrder('Inbetween', 4)
	setObjectOrder('Portals', 5)
	setObjectOrder('Flooring', 6)
	setObjectOrder('dadGroup', 7)
	setObjectOrder('gfGroup', 8)
	setObjectOrder('boyfriendGroup', 9)
	setObjectOrder('Shading', 10)
	setObjectOrder('BGLight', 11)
	setObjectOrder('CarOff', 12)
	setObjectOrder('CarOn', 13)

	setObjectOrder('Static', 1)
	setObjectOrder('Viginette', 2)
	setObjectOrder('Hue', 3)

	setProperty('CarOn.alpha', 0)
	setProperty('Spotlight.alpha', 0)
	setProperty('BGLight.alpha', 0)
	setProperty('StitchLightFloor.alpha', 0)
	setProperty('Static.alpha', 0.1);

	setProperty('Inbetween.visible', false)
	setProperty('Portals.visible', false)
	setProperty('Flooring.visible', false)
	setProperty('Hue.visible', false)
end