function onCreate()
	makeLuaSprite('Shading', 'stages/lab/Shading', -500, -400)
	scaleObject('Shading', 1.4, 1.4);
	addLuaSprite('Shading',false);

	makeLuaSprite('CutOff', 'stages/lab/ComicBars', -500, -400) 
	scaleObject('CutOff', 1.4, 1.4);
	addLuaSprite('CutOff', false)

	makeLuaSprite('Box', 'stages/lab/Box', -500, -400)
	scaleObject('Box', 1.4, 1.4);
	addLuaSprite('Box', false)

	makeLuaSprite('LightBack', 'stages/lab/BackLight', -500, -400)
	scaleObject('LightBack', 1.4, 1.4);
	addLuaSprite('LightBack', false)

	makeLuaSprite('LightFront', 'stages/lab/FrontLight', -500, -400)
	scaleObject('LightFront', 1.4, 1.4);
	addLuaSprite('LightFront', false)

	makeLuaSprite('PillarDark', 'stages/lab/Pillar', -500, -400)
	scaleObject('PillarDark', 1.4, 1.4);
	addLuaSprite('PillarDark', false)

	makeLuaSprite('PillarLight', 'stages/lab/PillarLight', -500, -400)
	scaleObject('PillarLight', 1.4, 1.4);
	addLuaSprite('PillarLight', false)

	makeLuaSprite('LabDark', 'stages/lab/LabDark', -500, -400)
	scaleObject('LabDark', 1.4, 1.4);
	addLuaSprite('LabDark', false)

	makeLuaSprite('LabLight', 'stages/lab/LabLight', -500, -400)
	scaleObject('LabLight', 1.4, 1.4);
	addLuaSprite('LabLight', false)

	makeAnimatedLuaSprite('Static', 'stages/Static', -330, -200)
	addAnimationByPrefix('Static','staticglitch','idle', 24, true)
	scaleObject('Static', 4.25, 4)
	setObjectCamera('Static', 'other');
	addLuaSprite('Static', false)
end

function onCreatePost()
	setObjectOrder('LabLight', 1)
	setObjectOrder('LabDark', 2)
	setObjectOrder('LightBack', 3)
	setObjectOrder('gfGroup', 4)
	setObjectOrder('dadGroup', 5)
	setObjectOrder('LightFront', 6)
	setObjectOrder('PillarLight', 7)
	setObjectOrder('PillarDark', 8)
	setObjectOrder('boyfriendGroup', 9)
	setObjectOrder('Box', 10)
	setObjectOrder('CutOff', 11)
	setObjectOrder('Shading', 12)
	setObjectOrder('Static', 20)

	setProperty('Static.visible', false)
end