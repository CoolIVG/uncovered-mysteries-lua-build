function onCreate()
	makeLuaSprite('Floor', 'stages/facility/stationfloor', -225, -125)
	scaleObject('Floor', 1.25, 1.25);
	addLuaSprite('Floor', false)

	makeLuaSprite('Train', 'stages/facility/train', -1725, -125)
	scaleObject('Train', 1.25, 1.25);
	setProperty('Train.visible', false)
	addLuaSprite('Train', false)

	makeLuaSprite('Station', 'stages/facility/station', -225, -125)
	scaleObject('Station', 1.25, 1.25);
	addLuaSprite('Station', false)

	makeAnimatedLuaSprite('Static', 'stages/Static', 0, 0)
	addAnimationByPrefix('Static','staticglitch','idle', 24, true)
	scaleObject('Static', 2.7, 2.4)
	setObjectCamera('Static', 'other')
	setProperty('Static.alpha', 0)
	addLuaSprite('Static', false)

	makeLuaSprite('Smile', 'stages/facility/face', 325, 100)
	scaleObject('Smile', 1, 1);
	setObjectCamera('Smile', 'other')
	setProperty('Smile.alpha', 0)
	addLuaSprite('Smile', false)

	makeLuaSprite('Spiral', 'stages/facility/spiral', -110, -390)
	scaleObject('Spiral', 1.45, 1.45);
	setObjectCamera('Spiral', 'other')
	setProperty('Spiral.alpha', 0)
	addLuaSprite('Spiral', false)

	makeAnimatedLuaSprite('Spiral2', 'stages/facility/spiral2', -435, -720)
	addAnimationByPrefix('Spiral2','mono','mono', 1, true)
	addAnimationByPrefix('Spiral2','saturated','colour', 1, true)
	scaleObject('Spiral2', 2, 2);
	setScrollFactor('Spiral2', 0, 0)
	addLuaSprite('Spiral2', false)
	objectPlayAnimation('Spiral2', 'mono', false)

	makeLuaSprite('GlowFlash', 'stages/facility/glow', 25, 10)
	setObjectCamera('GlowFlash', 'other')
	addLuaSprite('GlowFlash', false)
end

function onCreatePost()
	setObjectOrder('Spiral2', 0)
	setObjectOrder('Station', 1)

	setObjectOrder('Train', 7)
	setObjectOrder('Floor', 8)
	setObjectOrder('gfGroup', 9)
	setObjectOrder('dadGroup', 10)
	setObjectOrder('boyfriendGroup', 11)

	setObjectOrder('GlowFlash', 12)
	setObjectOrder('Spiral', 13)
	setObjectOrder('Static', 14)
	setObjectOrder('Smile', 15)

	doTweenAngle('hypnotiseStart', 'Spiral', 360, 5, 'linear')
	doTweenAngle('hypnotiseStarte', 'Spiral2', -360, 7.5, 'linear')
end
function onTweenCompleted(tag)
	if tag == 'hypnotiseStart' or tag == 'hypnotise1' then
		setProperty('Spiral.angle', 0)
		doTweenAngle('hypnotise1', 'Spiral', 360, 5, 'linear')
	elseif tag == 'hypnotiseStarte' or tag == 'hypnotise2' then
		setProperty('Spiral2.angle', 0)
		doTweenAngle('hypnotise2', 'Spiral2', -360, 7.5, 'linear')
	end
end