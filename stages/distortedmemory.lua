pCount = 0

function onCreate()
	makeLuaSprite('whiteBg', nil, -1000, -500)
	setScrollFactor('whiteBg', 0, 0)
	makeGraphic('whiteBg', 5000, 5000, 'FFFFFF')
	addLuaSprite('whiteBg', false)
	setProperty('whiteBg.visible', true)


	--GARDEN--
	makeLuaSprite('Garden', 'stages/distortedhouse/garden', -150, -160);
	scaleObject('Garden', 1.25, 1.25);
	addLuaSprite('Garden', false);
	--
	makeLuaSprite('GardenLight', 'stages/distortedhouse/gardenlight', -150, -160);
	scaleObject('GardenLight', 1.25, 1.25);
	setBlendMode('GardenLight', 'add')
	addLuaSprite('GardenLight',false);
	--
	makeLuaSprite('GardenEyes', 'stages/distortedhouse/eyes', -590, -190);
	scaleObject('GardenEyes', 1.25, 1.25);
	setScrollFactor('GardenEyes', 0, 1);
	addLuaSprite('GardenEyes',false);
	----------

	--FIRST PERSON--
	makeLuaSprite('LaserRoom', 'stages/distortedhouse/laserroom', 0, 0);
	scaleObject('LaserRoom', 1.7, 1.7);
	addLuaSprite('LaserRoom',false);
	--
	makeLuaSprite('pillar', 'stages/distortedhouse/pillar', 0, 0);
	scaleObject('pillar', 1.7, 1.7);
	addLuaSprite('pillar',false);
	--
	makeLuaSprite('laser', 'stages/distortedhouse/laser', 0, 0);
	scaleObject('laser', 1.7, 1.7);
	addLuaSprite('laser',false);
	--
	makeLuaSprite('litlaser', 'stages/distortedhouse/laserlit', 0, 0);
	scaleObject('litlaser', 1.7, 1.7);
	addLuaSprite('litlaser', false);
	----------------
	--SECOND PART--
	makeLuaSprite('Inside', 'stages/distortedhouse/secondpart', -350, -165);
	scaleObject('Inside', 1.5, 1.5);
	addLuaSprite('Inside', false);

	makeLuaSprite('InsidePillar', 'stages/distortedhouse/pillar2', -350, -165);
	scaleObject('InsidePillar', 1.5, 1.5);
	setScrollFactor('InsidePillar', 0.8, 0.8)
	addLuaSprite('InsidePillar', false);

	makeLuaSprite('Cellar', 'stages/distortedhouse/cell', -350, -165);
	scaleObject('Cellar', 1.5, 1.5);
	setScrollFactor('Cellar', 0.9, 0.9)
	addLuaSprite('Cellar', false);
	---------------
	--ENDING--
	makeLuaSprite('Forest', 'stages/distortedhouse/forest', -300, -150);
	scaleObject('Forest', 1.8, 1.8);
	addLuaSprite('Forest',false);

	makeLuaSprite('Street', 'stages/distortedhouse/street', -475, 90);
	scaleObject('Street', 1.7, 1.7);
	addLuaSprite('Street', false);
	----------

	for i = 1, 1000 do
		RainParticle = ('Particle'..i);
		makeLuaSprite(RainParticle, 'stages/trenches/particle', getRandomInt(-500, 1250), -250)
		setBlendMode(RainParticle, 'add')
		addLuaSprite(RainParticle, true)
		setObjectCamera(RainParticle, 'other')
		setProperty(RainParticle..'.color', getColorFromHex('980002'))
		scaleObject(RainParticle, 0.2, 1.1)
		runTimer('RainDelay', 0.0001, 0)
	end

end

function onCreatePost()
	setProperty('LaserRoom.visible', false)
	setProperty('pillar.visible', false)
	setProperty('laser.visible', false)
	setProperty('litlaser.visible', false)

	setProperty('Street.visible', false)
	setProperty('Inside.visible', false)
	setProperty('InsidePillar.visible', false)
	setProperty('Cellar.visible', false)
	setProperty('Forest.alpha', 0)

	setObjectOrder('whiteBg', 1)
	setObjectOrder('Garden', 2)
	setObjectOrder('GardenLightFloor', 3)
	setObjectOrder('GardenLight', 4)
	setObjectOrder('GardenEyes', 5)
	setObjectOrder('LaserRoom', 6)
	setObjectOrder('laser', 7)
	setObjectOrder('laserlit', 8)
	setObjectOrder('Inside', 9)
	setObjectOrder('Forest', 10)
	setObjectOrder('Street', 11)
	setObjectOrder('gfGroup', 12)
	setObjectOrder('boyfriendGroup', 13)
	setObjectOrder('dadGroup', 14)
	setObjectOrder('pillar', 15)

	setObjectOrder('InsidePillar', 16)
	setObjectOrder('Cellar', 17)
end

function onTimerCompleted(tag)
	if tag == 'RainDelay' then
		pCount = pCount + 1
		if pCount > 1000 then
			pCount = 1
		end
		RainParticle = ('Particle'..pCount);
		setProperty(RainParticle..'.y', -250)
		setProperty(RainParticle..'.x', getRandomInt(-500, 1250))
			setProperty(RainParticle..'.angle', getRandomInt(-10, -30))		

		if curStep < 1712 or curStep > 2547 then
			setProperty(RainParticle..'.velocity.y', getRandomInt(1000, 1500))
			setProperty(RainParticle..'.velocity.x', 500)
		else
			setProperty(RainParticle..'.velocity.y', getRandomInt(2000, 2500))
			setProperty(RainParticle..'.velocity.x', 750)
		end	
	end
end