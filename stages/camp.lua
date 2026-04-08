pCount = 0

function onCreatePost()
	makeLuaSprite('whiteBg', '', -1000, -500)
	setScrollFactor('whiteBg', 0, 0)
	makeGraphic('whiteBg', 5000, 5000, 'FFFFFF')
	addLuaSprite('whiteBg', false)
	setProperty('whiteBg.alpha', 0)

	makeLuaSprite('forest', 'stages/trenches/camp', -750, -200)
	scaleObject('forest', 1.5, 1.5);
	addLuaSprite('forest', false)

	makeAnimatedLuaSprite('pit', 'stages/trenches/slate', -750, -200);
	addAnimationByPrefix('pit', 'idle', 'idle', 30, true);
	scaleObject('pit', 4.1, 2.4);
	setProperty('pit.visible', false)
	addLuaSprite('pit', false);

	makeLuaSprite('frost', 'stages/trenches/frost', 0, 0)
	scaleObject('frost', 0.95, 0.9);
	setProperty('frost.alpha', 0.5)
	setObjectCamera('frost', 'camOther')
	addLuaSprite('frost', false)

	for i = 1, 1000 do
		SnowParticle = ('Particle'..i);
		makeLuaSprite(SnowParticle, 'stages/trenches/particle', getRandomInt(-500, 1250), -250)
		setBlendMode(SnowParticle, 'add')
		addLuaSprite(SnowParticle, true)
		setObjectCamera(SnowParticle, 'other')
		--setProperty(SnowParticle..'.alpha', getRandomFloat(0.1, 1))
		setProperty(SnowParticle..'.visible', false)
		runTimer('SnowDelay', 0.0001, 0)
	end

	setObjectOrder('whiteBg', 1)
	setObjectOrder('pit', 2)
	setObjectOrder('forest', 3)
	setObjectOrder('dadGroup', 4)
	setObjectOrder('gfGroup', 5)
	setObjectOrder('boyfriendGroup', 6)

	
	setProperty('boyfriendGroup.visible', false)
end


function onTimerCompleted(tag)
	if tag == 'SnowDelay' then
		pCount = pCount + 1
		if pCount > 1000 then
			pCount = 1
		end
		SnowParticle = ('Particle'..pCount);
		setProperty(SnowParticle..'.y', -250)
		setProperty(SnowParticle..'.x', getRandomInt(-500, 1250))
		if curStep < 608 then
			setProperty(SnowParticle..'.velocity.y', getRandomInt(1000, 1500))
			setProperty(SnowParticle..'.velocity.x', 500)
			setProperty(SnowParticle..'.angle', getRandomInt(20, 40))
		else	
			setProperty(SnowParticle..'.velocity.y', getRandomInt(2000, 2500))
			setProperty(SnowParticle..'.velocity.x', 750)
			setProperty(SnowParticle..'.angle', getRandomInt(35, 60))
		end		
	end
end