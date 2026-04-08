local stagealleys = {'Alleys', 'Spotlight', 'BGLight', 'StitchLightFloor', 'Shading', 'CarOff', 'CarOn', 'Viginette'}
local stageportals = {'Inbetween', 'Flooring', 'Portals', 'Hue'}
local chars = {'gf', 'dad', 'boyfriend'}
function onCreatePost()

	addCharacterToList('Stitchy_Floating', 'dad')
	addCharacterToList('Boyfriend_Spectator', 'boyfriend')
	addCharacterToList('GF_Spectator', 'gf')
	setProperty('health', 2)

	setProperty('Alleys.color', getColorFromHex('000000'))
	setProperty('CarOff.color', getColorFromHex('000000'))
	setProperty('boyfriend.color', getColorFromHex('000000'))
	setProperty('gf.color', getColorFromHex('000000'))
	setProperty('iconP2.color', getColorFromHex('000000'))
	setProperty('dad.color', getColorFromHex('000000'))

	setProperty('healthBarBG.alpha', 0)
	setProperty('healthBar.alpha', 0)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('iconsq1.alpha', 0)
	setProperty('iconsq2.alpha', 0)

	makeLuaSprite('Wake', 'stages/alleys/Wake', 250, 300);
	scaleObject('Wake', 0.5, 0.5);
	setObjectCamera('Wake', 'other');
	setProperty('Wake.alpha', 0);
	setObjectOrder('Wake', 3);
	addLuaSprite('Wake', false);

	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'stitchyspectatorjumpscaresound')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'SpectatorGameover')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'SpectatorRetry')
	makeAnimatedLuaSprite('jumpscare', 'stages/alleys/SpectatorGameOver', 0, 0);

	setTextString('Singer',  '???')
end

currentdrain = 0

function onSongStart()
	setProperty('StitchLightFloor.alpha', 1)
	doTweenAlpha('StitchyLight', 'StitchLightFloor', 0, 0.42, 'linear')
	setProperty('Spotlight.alpha', 1)
	doTweenAlpha('Spotlig', 'Spotlight', 0, 0.42, 'linear')
	setProperty('BGLight.alpha', 1)
	doTweenAlpha('BGLightt', 'BGLight', 0, 0.42, 'linear')
end

function onStepHit()
	if curStep == 4 or curStep == 8 or curStep == 12 then
		setProperty('StitchLightFloor.alpha', 1)
		doTweenAlpha('StitchyLight', 'StitchLightFloor', 0, 0.42, 'linear')
		setProperty('Spotlight.alpha', 1)
		doTweenAlpha('Spotlig', 'Spotlight', 0, 0.42, 'linear')
		setProperty('BGLight.alpha', 1)
		doTweenAlpha('BGLightt', 'BGLight', 0, 0.42, 'linear')
	elseif curStep == 16 then
		cameraFlash('camOther', '000000', 0.57, true)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'quadInOut')
		setProperty('defaultCamZoom', 1)
		setProperty('healthBarBG.alpha', 1)
		setProperty('healthBar.alpha', 1)
		setProperty('iconP1.alpha', 1)
		setProperty('iconP2.alpha', 1)
		setProperty('iconsq1.alpha', 1)
		setProperty('iconsq2.alpha', 1)
		setProperty('Alleys.color', getColorFromHex('FFFFFF'))
		setProperty('CarOff.color', getColorFromHex('FFFFFF'))
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
	elseif curStep == 278 or curStep == 281 or curStep == 284 then
		setProperty('defaultCamZoom', 1.15)
		setProperty('StitchLightFloor.alpha', 1)
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('Shading.alpha', 0)
		setProperty('iconP2.color', getColorFromHex('FFFFFF'))
		doTweenAlpha('StitchyLight', 'StitchLightFloor', 0, 0.42, 'linear')
		doTweenColor('Stitchy', 'dad', '000000', 0.42, 'linear')
		doTweenColor('StitchyIcon', 'iconP2', '000000', 0.42, 'linear')
		doTweenAlpha('Shading', 'Shading', 1, 0.42, 'linear')
	elseif curStep == 288 then
		setProperty('defaultCamZoom', 0.7)
		cameraFlash('camOther', '000000', 0.57, true)
		setTextString('Singer',  dadName)
		setProperty('Shading.x', -1150)
		setObjectOrder('Shading', 3)
		setProperty('cameraSpeed', 0.75)
		currentdrain = 0.003125
		setProperty('health', 1)
		setProperty('Wake.alpha', 1)
		doTweenAlpha('wakey wakey sleepyhead', 'Wake', 0, 3, 'linear')	
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('iconP2.color', getColorFromHex('FFFFFF'))
		setProperty('StitchLightFloor.alpha', 1)

	elseif curStep == 608 or curStep == 640 or curStep == 656 or curStep == 736 or curStep == 768 or curStep == 784 then
		--zoom in
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.75, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 624 or curStep == 664 or curStep == 752 or curStep == 792 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.75, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 672 then
		setProperty('defaultCamZoom', 0.7)

	elseif curStep == 800 then
		cameraFlash('camOther', '948862', 1.5, true)
		for i = 1, #stagealleys do
			if stagealleys[i] ~= 'Spotlight' and stagealleys[i] ~= 'StitchLightFloor' then
				setProperty(stagealleys[i]..'.color', getColorFromHex('321932'))
			end
		end
		for i = 1, #chars do
			setProperty(chars[i]..'.color', getColorFromHex('969696'))
		end
		setProperty('Static.alpha', 0.15)
		setProperty('defaultCamZoom', 1)
	elseif curStep == 928 then
		cameraFlash('camOther', '948862', 1.5, true)
		for i = 1, #stagealleys do
			setProperty(stagealleys[i]..'.color', getColorFromHex('FFFFFF'))
		end
		for i = 1, #chars do
			setProperty(chars[i]..'.color', getColorFromHex('FFFFFF'))
		end
		setProperty('Static.alpha', 0.1)
		doTweenZoom('camera', 'camGame', 0.7, 0.75, 'quadInOut')
		setProperty('defaultCamZoom', 0.7)
	elseif curStep == 934 or curStep == 937 or curStep == 940 then
		if curStep == 934 then
			doTweenZoom('camera', 'camGame', 1.15, 1, 'quadInOut')
			setProperty('defaultCamZoom', 1.15)
		end
		setProperty('StitchLightFloor.alpha', 0)
		setProperty('dad.color', getColorFromHex('000000'))
		setProperty('iconP2.color', getColorFromHex('000000'))
		doTweenAlpha('StitchyDark', 'StitchLightFloor', 1, 0.42, 'linear')
		doTweenColor('Stitchy', 'dad', 'FFFFFF', 0.42, 'linear')
		doTweenColor('StitchyIcon', 'iconP2', 'FFFFFF', 0.42, 'linear')
	elseif curStep == 944 then
		cameraFlash('camOther', '000000', 1, true)
		triggerEvent('Change Character', 'dad', 'Stitchy_Floating')
		triggerEvent('Change Character', 'boyfriend', 'Boyfriend_Spectator')
		triggerEvent('Change Character', 'gf', 'GF_Spectator')

		doTweenY('StitchyFloatStart', 'dad', getProperty('dad.y') + 6.25, (bpm/60) / 2, 'cubeInOut')

		for i = 1, #stagealleys do
			setProperty(stagealleys[i]..'.visible', false)
		end
		for i = 1, #stageportals do
			setProperty(stageportals[i]..'.visible', true)
		end

		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
		triggerEvent('Change Scroll Speed', 1.125, 0.001)
		currentdrain = 0.00625
		setProperty('Static.alpha', 0.075)
	elseif curStep == 1200 then
		cameraFlash('camOther', '000000', 0.57, true)
		triggerEvent('Change Character', 'dad', 'Mr. Stitchy')
		triggerEvent('Change Character', 'boyfriend', 'BoyfriendCouple')
		triggerEvent('Change Character', 'gf', 'gf')

		for i = 1, #stagealleys do
			setProperty(stagealleys[i]..'.visible', true)
		end
		for i = 1, #stageportals do
			removeLuaSprite(stageportals[i], true);
		end


		setProperty('Shading.x', -500)


		setProperty('Static.alpha', 0.125)
		doTweenZoom('camera', 'camGame', 0.7, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.7)
		setProperty('cameraSpeed', 1.5)
	elseif curStep == 1472 then	
		currentdrain = 0
		cameraFlash('camOther', '000000', 1.93, true)
		playAnim('dad', 'shush', false)
		setProperty('dad.specialAnim', true)
		setProperty('defaultCamZoom', 0.9)
		setProperty('CarOn.alpha', 1)
		doTweenAlpha('Mr Stitchy', 'dad', 0, 1.93, 'linear')
		doTweenAlpha('the light', 'StitchLightFloor', 0, 1.93, 'linear')
		doTweenAlpha('the fuck', 'Shading', 0, 1.93, 'linear')
		doTweenAlpha('HUD', 'camHUD', 0, 1.93, 'linear')
		doTweenAlpha('game', 'camGame', 0, 1.93, 'linear')
		doTweenAlpha('effect', 'Static', 0, 1.93, 'linear')
		for i = 0, 3 do
			noteTweenAlpha('Note' .. i, i, 0, 1.93, 'linear')
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	setProperty('health', getProperty('health') - currentdrain)
end

chance = 0
function onMoveCamera(focus)
	if curStep > 15 then
		chance = getRandomFloat(0, 1)
		if chance > 0.5 then
			if getProperty('BGLight.alpha') == 1 then
				doTweenAlpha('light', 'BGLight', 0, 0.15, 'linear')
			else
				doTweenAlpha('light', 'BGLight', 1, 0.15, 'linear')	
			end
		end
	end	
end

function onUpdate()
	if curStep < 16 then
		setProperty('camFollow.x', 700)
		setProperty('camFollow.y', 350)
	end
	if getProperty('health') < 0.4 then
		doTweenAlpha('BG', 'Spotlight', 1, 0.15, 'linear')
	else
		doTweenAlpha('BG', 'Spotlight', 0, 0.15, 'linear')
	end
end

function onGameOverStart()
	setProperty('boyfriend.visible', false);
	makeAnimatedLuaSprite('jumpscare', 'stages/alleys/SpectatorGameOver', 0, 0);
	addAnimationByPrefix('jumpscare', 'Jumpscare', 'Jacksepticeye', 24, false);
	setObjectCamera('jumpscare', 'other');
	scaleObject('jumpscare', 1.3, 1.3)
	addLuaSprite('jumpscare', false);
	setObjectOrder('jumpscare', 2);
	runTimer('GOGOGOGO', 3)

	makeLuaSprite('die2', 'stages/alleys/gameover2', 100, 0)
	setObjectCamera('die2', 'other');
	addLuaSprite('die2', false);
	setProperty('die2.alpha', 0)
	setObjectOrder('die2', 1);
end

function onTimerCompleted(tag)
	if tag == 'GOGOGOGO' then
		doTweenAlpha('jus', 'jumpscare', 0, 1, 'linear')
		doTweenAlpha('diee2', 'die2', 1, 3, 'linear')
	end
end

function onGameOverConfirm(retry)
	cameraFlash('camOther', 'FFFFFF', 1, true)
	setProperty('jumpscare.visible', false)
	doTweenAlpha('Deathgo', 'die2', 0, 2, 'linear')
	doTweenY('DETT', 'die2', 400, 3, 'cubeInOut')
end

function onTweenCompleted(tag)
	if dadName == 'Stitchy_Floating' then
		if tag == 'StitchyFloatStart' or tag == 'StitchyFloat2' then
			doTweenY('StitchyFloat1', 'dad', getProperty('dad.y') - 12.5, bpm/60, 'cubeInOut')
		elseif tag == 'StitchyFloat1' then
			doTweenY('StitchyFloat2', 'dad', getProperty('dad.y') + 12.5, bpm/60, 'cubeInOut')
		end
	end
end