function onCreatePost()
	precacheSound('MemoryJumpscare')

	makeLuaSprite('FlashFX', nil, 0, 0)
	makeGraphic('FlashFX', 1280, 720, 'FFFFFF')
	setProperty('FlashFX.alpha', 0)
	setObjectCamera('FlashFX', 'camHUD')
	addLuaSprite('FlashFX', false);

	makeLuaSprite('CinemaTop', nil, 0, -720)
	makeGraphic('CinemaTop', screenWidth, screenHeight, '000000')
	setObjectCamera('CinemaTop', 'camHUD')
	--setObjectOrder('CinemaTop', getObjectOrder('strumLineNotes')-2)
	addLuaSprite('CinemaTop', false)

	makeLuaSprite('CinemaBottom', nil, 0, 720)
	makeGraphic('CinemaBottom', screenWidth, screenHeight, '000000')
	setObjectCamera('CinemaBottom', 'camHUD')
	--setObjectOrder('CinemaBottom', getObjectOrder('strumLineNotes')-3)
	addLuaSprite('CinemaBottom', false)

	setProperty('whiteBg.color', getColorFromHex('000000'))

	addCharacterToList('MemoryPhase2', 'dad')
	addCharacterToList('Memory1stPerson', 'dad')
	addCharacterToList('Memory1stPersonTwo', 'dad')
	addCharacterToList('PennyWhereTo', 'dad')
	addCharacterToList('GeorgiePhase2', 'boyfriend')

	setProperty('Garden.alpha', 0.5)
	setProperty('GardenLight.alpha', 0)
	setProperty('boyfriend.color', getColorFromHex('000000'))
	setProperty('dad.visible', false)

	setProperty('camHUD.alpha', 0.01)
	setProperty('camGame.alpha', 0.01)
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'No Animation' then
			setPropertyFromGroup('unspawnNotes', i, 'alpha', 0);
		end
	end
end

local stageGarden = {'Garden', 'GardenLight', 'GardenEyes'}
local stageLaser = {'LaserRoom', 'pillar', 'laser', 'litlaser'}
local uibits = {'iconsq1', 'iconsq2', 'healthBar', 'healthBarBG', 'iconP1', 'iconP2'}
local prevCamSpeed = nil
local count = 0

function quickCamSwap()
	prevCamSpeed = getProperty('cameraSpeed')
	setProperty('cameraSpeed', 100000000)
	runTimer('returnCamSpeed', 0.05)
end

function lightning(time, colour)
	local oldcolour = getProperty('whiteBg.color')
	setProperty('whiteBG.color', getColorFromHex(colour))
	doTweenColor('lightningflash', 'whiteBg', oldcolour, time, 'linear')
end

function onSongStart()
	cameraFlash('camOther', 'FFFFFF', 5, true)
	for i = 1, #uibits do
		setProperty(uibits[i]..'.visible', false)
	end
end

function onStepHit()
	if curStep == 32 then
		doTweenAlpha('camGame', 'camGame', 0.75, 17.45, 'linear')
		doTweenAlpha('camHUD', 'camHUD', 1, 17.45, 'linear')
	elseif curStep == 160 then
		cameraFlash('camGame', '000000', 3, true)
		doTweenZoom('b', 'camGame', 2, 0.01, 'linear')
		doTweenColor('boyf', 'boyfriend', 'FFFFFF', 3.5, 'linear')
		doTweenAlpha('gar', 'GardenLight', 1, 2.5, 'linear')
	elseif curStep == 176 or curStep == 208 or curStep == 224 or curStep == 256 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.075)
	elseif curStep == 192 or curStep == 240 or curStep == 272 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 284 then
		doTweenAlpha('camGame', 'camGame', 1, 0.5, 'linear')
	elseif curStep == 288 then
		cameraFlash('camOther', '000000', 1.5, true)
		setProperty('camGame.alpha', 0)
		doTweenAlpha('gameFade', 'camHUD', 0, 1.5,'linear')
	elseif curStep == 300 or curStep == 301 or curStep == 302 or curStep == 303 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
	elseif curStep == 304 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		doTweenZoom('mem', 'camGame', 2, 0.01, 'linear')
		setProperty('CinemaTop.y', -630)
		setProperty('CinemaBottom.y', 630)	

		triggerEvent('Change Character', 'boyfriend', 'GeorgiePhase2')
		setProperty('Garden.alpha', 1)
		setProperty('dad.visible', true)
		setProperty('defaultCamZoom', 0.95)
		setProperty('songSpeed', 3)
		setProperty('cameraSpeed', 3.5)
		setProperty('camGame.alpha', 1)
		setProperty('camHUD.alpha', 1)
		quickCamSwap()
	elseif curStep == 310 or curStep == 326 or curStep == 342 or curStep == 358 or curStep == 374 or curStep == 390 or curStep == 406 or curStep == 422 then
		doTweenAngle('el videojuego', 'camGame', 0, 1, 'quadInOut')
	elseif curStep == 320 or curStep == 336 or curStep == 352 or curStep == 384 or curStep == 400 or curStep == 416 then
		cameraFlash('camGame', 'FFFFFF', 0.5, true)
		if count == 0 then
			count = 1
			doTweenAngle('game', 'camGame', getRandomFloat(-5, -2.5), 0.25, 'quadOut')
		else
			count = 0
			doTweenAngle('game', 'camGame', getRandomFloat(2.5, 5), 0.25, 'quadOut')
		end
		doTweenZoom('mem', 'camGame', getProperty('defaultCamZoom') + 0.3, 0.01, 'linear')
		setProperty('GardenLight.alpha', 1)
		doTweenAlpha('lightgo2', 'GardenLight', 0, 0.25, 'linear')
		setProperty('Garden.alpha', 0.75)
		doTweenAlpha('GardenFlash', 'Garden', 1, 0.25, 'quadOut')
	elseif curStep == 360 or curStep == 424 then
		doTweenAngle('game', 'camGame', 40, 0.75, 'quadInOut')
		doTweenAlpha('g', 'camGame', 0, 0.65, 'linear')
		doTweenZoom('g2', 'camGame', getProperty('defaultCamZoom')+1, 0.75, 'quadInOut')
	elseif curStep == 364 or curStep == 365 then
		cameraFlash('camGame', 'FFFFFF', 0.5, true)
	elseif curStep == 368 or curStep == 432 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		setProperty('camGame.alpha', 1)
		if curStep == 368 then
			doTweenZoom('camera', 'camGame', 1.25, 0.01, 'linear')
			setProperty('defaultCamZoom', 1.25)	
		else
			doTweenZoom('camera', 'camGame', 0.95, 0.01, 'linear')
			setProperty('defaultCamZoom', 0.95)
		end
		setProperty('GardenLight.alpha', 1)
		doTweenAlpha('lightgo2', 'GardenLight', 0, 0.25, 'linear')
		quickCamSwap()
	elseif curStep == 528 then
		setProperty('defaultCamZoom', 0.575)
		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 950)
		setProperty('camFollow.y', 600)
	elseif curStep == 540 then
		doTweenAlpha('g', 'camGame', 0.6, 0.375, 'linear')
	elseif curStep == 544 then
		cameraFlash('camOther', '000000', 0.5, true)
		setProperty('defaultCamZoom', 0.95)
		doTweenZoom('GRAH', 'camGame', 1.3, 0.01, 'linear')
		setProperty('isCameraOnForcedPos', false)
		quickCamSwap()
	elseif curStep == 552 then
		doTweenAlpha('spin1', 'camGame', 0, 0.65, 'linear')
		doTweenAngle('spin2', 'camGame', 15, 0.75, 'quadInOut')
		doTweenZoom('spin3', 'camGame', 1.45, 0.75, 'quadInOut')
	elseif curStep == 560 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('defaultCamZoom', 0.8)
		setProperty('camGame.alpha', 1)
		setProperty('camGame.angle', 0)
		doTweenZoom('spin3', 'camGame', 0.6, 0.01, 'linear')		
	elseif curStep == 816 or curStep == 944 then
		cameraFlash('camGame', 'FFFFFF', 1.5, true)
		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 950)
		setProperty('camFollow.y', 600)
		quickCamSwap()
		setProperty('defaultCamZoom', 0.6)
	elseif curStep == 880 or curStep == 1008 then
		cameraFlash('camGame', '000000', 1, true)
		setProperty('isCameraOnForcedPos', false)
		setProperty('defaultCamZoom', 1.2)
		quickCamSwap()
	elseif curStep == 1064 then
		cameraFlash('camGame', '000000', 1.5, true)
		doTweenY('goGame', 'camGame', 1000, 1.5, 'cubeIn')
		setProperty('defaultCamZoom', 0.6)	
	elseif curStep == 1072 then
		cameraFlash('camGame', '000000', 5, true)
		cancelTween('goGame')
		setProperty('camGame.y', 0)
		triggerEvent('Change Character', 'dad', 'Memory1stPerson')
		setProperty('dad.color', getColorFromHex('000000'))

		setProperty('defaultCamZoom', 0.725)
		setProperty('camFollow.x', 950)
		setProperty('camFollow.y', 550)
		setProperty('camGame.angle', 0)
		setProperty('songSpeed', 3.25)

		for i = 1, #stageGarden do
			setProperty(stageLaser[i]..'.visible', true)
			setProperty(stageGarden[i]..'.visible', false)
		end
		for i = 1, 1000 do
			setProperty('Particle'..i..'.visible', false)
		end
		for i = 1, #uibits do
			setProperty(uibits[i]..'.visible', false)
		end

		setProperty('isCameraOnForcedPos', true)
		setProperty('whiteBg.visible', false)

		setProperty('boyfriend.alpha', 0)
	elseif curStep == 1192 or curStep == 1196 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.01, 'linear')
	elseif curStep == 1200 then
		setProperty('camGame.visible', false)
	elseif curStep == 1204 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		setProperty('defaultCamZoom', 0.7)
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('camGame.visible', true)
	elseif curStep == 1328 then
		cameraFlash('camGame', '000000', 3, true)
		setProperty('isCameraOnForcedPos', false)
		triggerEvent('Change Character', 'dad', 'MemoryPhase2')
		setProperty('boyfriend.alpha', 1)
		for i = 1, #stageGarden do
			removeLuaSprite(stageLaser[i], false)
		end
		setProperty('Inside.visible', true)
		setProperty('InsidePillar.visible', true)
		setProperty('Cellar.visible', true)
		for i = 1, #uibits do
			setProperty(uibits[i]..'.visible', true)
		end
		setProperty('whiteBg.visible', true)
		setProperty('defaultCamZoom', 0.4)
	elseif curStep == 1584 then
		cameraFlash('camOther', '000000', 1.5, true)
		doTweenAlpha('c', 'camGame', 0.5, 0.15, 'linear')
	elseif curStep == 1588 then
		cameraFlash('camOther', '000000', 1.5, true)
		setProperty('Inside.alpha', 0.5)
		setProperty('Cellar.alpha', 0.5)
		doTweenAlpha('InsidePillar', 'InsidePillar', 0, 0.15, 'linear')
		doTweenAlpha('c', 'camGame', 1, 0.15, 'linear')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 1712 then
		cameraFlash('camGame', '000000', 3, true)
		doTweenZoom('camera', 'camGame', 1.05, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.05)
		for i = 1, 1000 do
			setProperty('Particle'..i..'.visible', true)
		end

		removeLuaSprite('Inside', true)
		removeLuaSprite('InsidePillar', true)
		removeLuaSprite('Cellar', true)
		for i = 1, #stageGarden do
			setProperty(stageGarden[i]..'.visible', true)
		end
	elseif curStep == 1744 then
		cameraFlash('camGame', '000000', 1, true)
		doTweenZoom('camera', 'camGame', 1.2, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.2)	
	elseif curStep == 1754 then
		cameraFlash('camGame', '000000', 1, true)
		lightning(0.1, 980002)
		doTweenZoom('camera', 'camGame', 0.9, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.9)
		setProperty('CinemaTop.y', -635)
		setProperty('CinemaBottom.y', 635)
		for i = 1, #stageGarden do
			setProperty(stageGarden[i]..'.visible', false)
		end
	elseif curStep == 1756 then
		lightning(0.1, 980002)	
	elseif curStep == 1760 then
		cameraFlash('camGame', '000000', 1, true)
		doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.1)
		setProperty('CinemaTop.visible', false)
		setProperty('CinemaBottom.visible', false)
		for i = 1, #stageGarden do
			setProperty(stageGarden[i]..'.visible', true)
		end
	elseif curStep == 1968 then
		cameraFlash('camOther', 'FFFFFF', 2, true)
		doTweenAlpha('camHUD', 'camHUD', 0, 1.25, 'linear')
		doTweenAlpha('camgHUD', 'camGame', 0, 1.25, 'linear')
	elseif curStep == 1984 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('cameraSpeed', 4)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
		setProperty('camHUD.alpha', 1)
		setProperty('camGame.alpha', 1)
	elseif curStep == 2108 then
		doTweenZoom('camera', 'camGame', 0.9, 0.25, 'quadInOut')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 2112 then
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.1)
	elseif curStep == 2240 then
		cameraFlash('camGame', '000000', 3, true)
		doTweenAlpha('camGamee', 'camGame', 0, 1, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.35, 0.01, 'linear')
	elseif curStep == 2256 then
		cameraFlash('camGame', 'FFFFFF', 3, true)
		setProperty('camGame.alpha', 1)
		setProperty('whiteBg.color', getColorFromHex('FFFFFF'))

		for i = 1, #stageGarden do
			removeLuaSprite(stageGarden[i], true)
		end

		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 950)
		setProperty('camFollow.y', 550)

		triggerEvent('Change Character', 'dad', 'Memory1stPersonTwo')
		setProperty('dad.alpha', 0.5)
		setProperty('Forest.alpha', 0.25)
		setProperty('defaultCamZoom', 0.5)
		setProperty('boyfriend.visible', false)
	elseif curStep == 2368 or curStep == 2372 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.1, 'quadOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
		doTweenAngle('camer', 'camGame', getProperty('camGame.angle') + 0.5, 0.1, 'quadOut')
	elseif curStep == 2376 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 2380 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.1, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	elseif curStep == 2384 then
		setProperty('camGame.visible', false)
		for i = 1, #uibits do
			setProperty(uibits[i]..'.visible', false)
		end
	elseif curStep == 2388 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('dad.colorTransform.greenOffset', 0)
		setProperty('dad.colorTransform.redOffset', 0)
		setProperty('dad.colorTransform.blueOffset', 0)
		setProperty('dad.alpha', 1)
		setProperty('Forest.alpha', 1)
		setProperty('cameraSpeed', 5)
		setProperty('camGame.visible', true)
		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 950)
		setProperty('camFollow.y', 550)
	elseif curStep == 2464 or curStep == 2480 or curStep == 2496 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.09)
	elseif curStep == 2784 then
		triggerEvent('Alt Idle Animation', 'boyfriend', '-alt')
		doTweenAlpha('camGame', 'camGame', 0, 2.1, 'linear')
		doTweenAlpha('mem', 'dad', 0, 1.6, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.3, 2.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.3)
	elseif curStep == 2816 then
		cameraFlash('camOther', 'FFFFFF', 3, true)
		setProperty('isCameraOnForcedPos', false)
		setProperty('boyfriend.visible', true)
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		for i = 1, #uibits do
			doTweenAlpha('uigo'..i, uibits[i], 0, 3, 'linear')
		end
		setProperty('Street.visible', true)
		removeLuaSprite('Forest', true)
		triggerEvent('Change Character', 'dad', 'PennyWhereTo')
		setProperty('dad.alpha', 1)
		setProperty('whiteBg.visible', false)
		setProperty('cameraSpeed', 1)
		doTweenAlpha('camGame', 'camGame', 1, 10, 'linear')
		setProperty('defaultCamZoom', 1.2)
	elseif curStep == 2944 then
		doTweenAlpha('camHUD', 'camHUD', 0, 5, 'linear')
		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 950)
		setProperty('camFollow.y', 550)
		setProperty('defaultCamZoom', 0.6)
	end
end

function onEvent(name, v1, v2)
	if name == 'Add Camera Zoom' then
		if curStep > 303 and curStep < 423 then
			setProperty('FlashFX.alpha', v1*5)
			doTweenAlpha('FlashGo', 'FlashFX', 0, 60/bpm, 'linear')
		end
	end
end

function onBeatHit()
	if curStep > 1071 and curStep < 1328 then
		setProperty('litlaser.alpha', 1)
		doTweenAlpha('lasereffect', 'litlaser', 0, 0.15, 'linear')	
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' then
		if not isSustainNote then
			setProperty('camGame.angle', getRandomInt(-1, 1))
			setProperty('camHUD.angle', getRandomInt(-1, 1))
			doTweenAngle('returnhud', 'camHUD', 0, 0.1, 'circOut')
			doTweenAngle('returngame', 'camGame', 0, 0.1, 'circOut')
		else
			cameraShake('camHUD', 0.02, 0.02)
			cameraShake('camGame', 0.02, 0.02)
		end
	end
	if getProperty('health') > 0.02 then
		setProperty('health', getProperty('health')- 0.02);
	end
end

local lagging = false
local deathTime = nil

function onGameOver()
	if not lagging then
		lagging = true
		playSound('MemoryJumpscare')

		makeLuaSprite('redDeath', nil, 0, 0)
		makeGraphic('redDeath', 1280, 720, '980002')
		addLuaSprite('redDeath', true)
		setObjectCamera ('redDeath', 'other')
		setProperty('redDeath.alpha', 0)

		deathTime = getPropertyFromClass('Conductor', 'songPosition')
		runTimer('gameoverLag', 0.05, 0)
		runTimer('untilDead', 2)

		runHaxeCode("game.dad.animation.curAnim.pause();")
		runHaxeCode("game.boyfriend.animation.curAnim.pause();")
		return Function_Stop
	else
		return Function_Stop
	end
end

function onTimerCompleted(tag)
	if tag == 'returnCamSpeed' then
		setProperty('cameraSpeed', prevCamSpeed)
	elseif tag == 'untilDead' then
		setPropertyFromClass('Playstate', 'deathCounter', getPropertyFromClass('PlayState', 'deathCounter') + 1)
		loadSong('Where To')
	elseif tag == 'gameoverLag' then
		setPropertyFromClass('Conductor', 'songPosition', deathTime)
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', deathTime)
		setProperty('vocals.time', deathTime)
		setProperty('redDeath.alpha', getProperty('redDeath.alpha') + 0.05)
	end
end

function onPause()
	if lagging then
		return Function_Stop
	end
end