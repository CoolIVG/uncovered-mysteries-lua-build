mainzoom = nil
prevCamSpeed = nil
currenStage = 1
bopScreen = false
duet = false
stage = {'Floor', 'Train', 'Station'}


function staticFlash(startTransparency, time, staticTo, smileTo)
	setProperty('Static.alpha', startTransparency)
	setProperty('Smile.alpha', startTransparency * 0.35)
	doTweenAlpha('StaticFlashFade', 'Static', staticTo, time, 'linear')
	doTweenAlpha('SmileFlashFade', 'Smile', smileTo, time, 'linear')
end

function quickCamSwap()
	prevCamSpeed = getProperty('cameraSpeed')
	setProperty('cameraSpeed', 100000000)
	runTimer('returnCamSpeed', 0.05)
end

function onCreatePost()

	makeLuaSprite('CinemaTop', nil, 0, -720)
	makeGraphic('CinemaTop', screenWidth, screenHeight, '000000')
	setObjectCamera('CinemaTop', 'camOther')
	setObjectOrder('CinemaTop', getObjectOrder('strumLineNotes')-2)
	addLuaSprite('CinemaTop', false)

	makeLuaSprite('CinemaBottom', nil, 0, 720)
	makeGraphic('CinemaBottom', screenWidth, screenHeight, '000000')
	setObjectCamera('CinemaBottom', 'camOther')
	setObjectOrder('CinemaBottom', getObjectOrder('strumLineNotes')-3)
	addLuaSprite('CinemaBottom', false)

	makeAnimatedLuaSprite('marMeter', 'stages/facility/marmeter', getProperty('iconsq2.x'), getProperty('iconsq2.y') + 135)
	for i = 0, 15 do
		addAnimationByIndices('marMeter', 'fill'..i, 'fill', i)
	end
	scaleObject('marMeter', 0.88, 0.88)
	setObjectCamera('marMeter', 'camHUD')
	setObjectOrder('CinemaBottom', getObjectOrder('strumLineNotes')-1)
	addLuaSprite('marMeter', true)

	makeLuaSprite('flashfaint', '', 0, 0)
	makeGraphic('flashfaint', 1280, 720,'ffffff')
	addLuaSprite('flashfaint', true)
	setObjectCamera ('flashfaint', 'other')
	setProperty('flashfaint.alpha', 0)

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'No Animation' then
				setPropertyFromGroup('unspawnNotes', i, 'visible', false);
			end
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/SmileNotes');
		end
	end

	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'GelotologyDie')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'GelotologyGameover')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'GelotologyRetry')

	mainzoom = getProperty('defaultCamZoom')
	setTextFont('scoreTxt', 'orbitron.ttf')
	setTextFont('timeTxt', 'orbitron.ttf')
	setTextFont('botplayTxt', 'orbitron.ttf')

	setProperty('camGame.alpha', 0)
	setProperty('camHUD.visible', false)

	setProperty('dad.color', getColorFromHex('000000'))
	setProperty('boyfriend.color', getColorFromHex('000000'))
	setProperty('gf.visible', false)
	for i = 1, 3 do
		setProperty(stage[i]..'.visible', false)
	end

	setProperty('Spiral.color', getColorFromHex('000000'))
	setProperty('Spiral.alpha', 1)

	addCharacterToList('MilesMarmalised', 'boyfriend')
	addCharacterToList('Miles3D', 'boyfriend')

	addCharacterToList('Clowny3D', 'dad')
end

function onSongStart()
	runTimer('marmett', 14.75)
	setProperty('Spiral.alpha', 0.6)
	doTweenAlpha('glowgo', 'Spiral', 1, 0.5, 'linear')

	setProperty('GlowFlash.scale.x', 1.1)
	setProperty('GlowFlash.scale.y', 1.1)
	doTweenX('FUCKty', 'GlowFlash.scale', 1, 0.5, 'linear')
	doTweenY('FYUC2', 'GlowFlash.scale', 1, 0.5, 'linear')
end

function onStepHit()
	if curStep == 6 or curStep == 22 or curStep == 38 or curStep == 54 then
		setProperty('Spiral.alpha', 0.8)
		doTweenAlpha('glowgii', 'Spiral', 1, 0.65, 'linear')

		setProperty('GlowFlash.scale.x', 1.01)
		setProperty('GlowFlash.scale.y', 1.01)
		doTweenX('FUCKty', 'GlowFlash.scale', 1, 0.65, 'linear')
		doTweenY('FYUC2', 'GlowFlash.scale', 1, 0.65, 'linear')
	elseif curStep == 16 or curStep == 32 or curStep == 48 then
		if curStep == 48 then
			doTweenColor('bp', 'GlowFlash', 'CDC200', 1.5, 'linear')
		end
		setProperty('Spiral.alpha', 0.6)
		doTweenAlpha('glowgo', 'Spiral', 1, 0.5, 'linear')

		setProperty('GlowFlash.scale.x', 1.1)
		setProperty('GlowFlash.scale.y', 1.1)
		doTweenX('FUCKty', 'GlowFlash.scale', 1, 0.5, 'linear')
		doTweenY('FYUC2', 'GlowFlash.scale', 1, 0.5, 'linear')
	elseif curStep == 64 then
		cameraFlash('camOther', '3F3F00', 3, true)
		setProperty('Spiral.visible', false)
		removeLuaSprite('GlowFlash', true);
		doTweenAlpha('gamre', 'camGame', 1, 3, 'linear')

		doTweenY('TopBar1', 'CinemaTop', -585, 2.5, 'cubeInOut')
		doTweenY('BottomBar1', 'CinemaBottom', 585, 2.5, 'cubeInOut')
	elseif curStep == 112 then
		doTweenZoom('camera', 'camGame', mainzoom + 0.35, 2, 'linear')
		setProperty('defaultCamZoom', mainzoom + 0.35)
		doTweenY('TopBar2', 'CinemaTop', -475, 1.5, 'linear')
		doTweenY('BottomBar2', 'CinemaBottom', 475, 1.5, 'linear')
		doTweenColor('uh', 'Spiral2', 'CDC200', 1.5, 'linear')
		doTweenAlpha('camGG', 'camGame', 0, 1.5, 'linear')
	elseif curStep == 124 then
		doTweenY('TopBar3', 'CinemaTop', -360, 0.5, 'cubeIn')
		doTweenY('BottomBar3', 'CinemaBottom', 360, 0.5, 'cubeIn')
	elseif curStep == 128 then
		cameraFlash('camOther', '000000', 5, true)
		quickCamSwap()
		setProperty('camGame.alpha', 1)
		setObjectCamera('CinemaTop', 'camHUD')
		setObjectCamera('CinemaBottom', 'camHUD')
		setProperty('camHUD.visible', true)
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		for i = 1, 3 do
			setProperty(stage[i]..'.visible', true)
		end
		cancelTween('TopBar3')
		cancelTween('BottomBar3')
		doTweenZoom('camera', 'camGame', 0.95, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.95)
		setProperty('CinemaTop.y', -625)
		setProperty('CinemaBottom.y', 625)
	elseif curStep == 192 or curStep == 256 or curStep == 320 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		quickCamSwap()
	elseif curStep == 264 or curStep == 267 or curStep == 328 or curStep == 331 then
		if curStep == 264 or curStep == 267 then
			cameraShake('camHUD', 0.025, 0.025)
			cameraShake('camGame', 0.025, 0.025)
		end
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 270 or curStep == 334 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.1, 0.35, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	elseif curStep == 288 or curStep == 291 or curStep == 294 or curStep == 310 or curStep == 352 or curStep == 355 or curStep == 358 or curStep == 374 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 298 or curStep == 314 or curStep == 362 or curStep == 378 then
		doTweenZoom('camera', 'camGame', 0.95, 0.65, 'quadInOut')
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 304 or curStep == 307 or curStep == 368 or curStep == 371 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 378 then
		doTweenY('TopBar3', 'CinemaTop', -360, 0.5, 'cubeIn')
		doTweenY('BottomBar3', 'CinemaBottom', 360, 0.5, 'cubeIn')
		doTweenAlpha('nomore', 'camGame', 0, 0.5, 'linear')
	elseif curStep == 384 then
		cameraFlash('camOther', 'FFFFFF', 0.25, true)
		triggerEvent('Alt Idle Animation', 'dad', '-alt')
		bopScreen = true
		setProperty('camGame.alpha', 1)
		setProperty('cameraSpeed', 5)
		quickCamSwap()
		setProperty('songSpeed', 3)
		staticFlash(1, 1, 0, 0)
		setProperty('defaultCamZoom', 0.75)
		doTweenY('TopBar3', 'CinemaTop', -720, 1.5, 'quadInOut')
		doTweenY('BottomBar3', 'CinemaBottom', 720, 1.5, 'quadInOut')
	elseif curStep == 416 or curStep == 424 or curStep == 480 or curStep == 488 then
		cameraFlash('camGame', '000000', 0.25, true)
		doTweenZoom('camera', 'camGame', 1.15, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.15)
	elseif curStep == 420 or curStep == 432 or curStep == 484 or curStep == 496 then
		cameraFlash('camGame', '000000', 0.25, true)
		doTweenZoom('camera', 'camGame', 0.9, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 428 or curStep == 444 or curStep == 492 or curStep == 508 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 448 then
		cameraFlash('camOther', 'FFFFFF', 0.25, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 512 then
		quickCamSwap()
		staticFlash(1, 1, 0, 0)
		doTweenZoom('camera', 'camGame', 1.3, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.3)
	elseif curStep == 520 or curStep == 584 then
		doTweenZoom('camera', 'camGame', 1, 0.25, 'quadInOut')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 528 or curStep == 532 or curStep == 536 or curStep == 592 or curStep == 596 or curStep == 600 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.1, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	elseif curStep == 544 or curStep == 608 then
		cameraFlash('camGame', '000000', 0.15, true)
		setProperty('CinemaTop.y', -685)
		setProperty('CinemaBottom.y', 685)

		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 547 or curStep == 611 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 550 or curStep == 614 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 554 or curStep == 618 then
		doTweenY('TopBar3', 'CinemaTop', -720, 0.15, 'quadInOut')
		doTweenY('BottomBar3', 'CinemaBottom', 720, 0.15, 'quadInOut')

		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.1, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	elseif curStep == 560 or curStep == 564 or curStep == 624 or curStep == 628 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 568 then
		for i = 1, 3 do
			doTweenAlpha('fuck'..i, stage[i], 0.25, 0.8, 'linear')
		end
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.25, 0.8, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.25)
	elseif curStep == 576 then
		staticFlash(1, 1, 0, 0)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 1.3, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.3)
		for i = 1, 3 do
			setProperty(stage[i]..'.alpha', 1)
		end
	elseif curStep == 632 then
		duet = true
		doTweenX('enterStation', 'Train', -125, 1.5, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.15, 0.8, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.15)
	elseif curStep == 640 then
		cameraFlash('camOther', 'FFFFFF', 0.25, true)
		setProperty('Train.visible', false)
		setProperty('Train.x', -225)
		for i = 1, 3 do
			setProperty(stage[i]..'.alpha', 1)
		end
		triggerEvent('Change Character', 'boyfriend', 'MilesMarmalised')
		bopScreen = false
		--for i = 0, 3 do
			--setProperty('strumLineNotes.members['..i..'].alpha', 0)
		--end
		for i = 1, 5 do
			setProperty('bgChar'..i..'.visible', true)
		end
		triggerEvent('Alt Idle Animation', 'dad', '')
		staticFlash(1, 1, 0.25, 0.075)
		setProperty('Spiral.color', getColorFromHex('FFFFFF'))
		setProperty('Spiral.visible', true)
		setProperty('Spiral.alpha', 0.125)
		duet = false

		setProperty('defaultCamZoom', 1.25)
		setProperty('cameraSpeed', 1.5)
		quickCamSwap()

		setProperty('CinemaTop.y', -635)
		setProperty('CinemaBottom.y', 635)


		doTweenX('camsway0', 'camHUD', getProperty('camHUD.x') + 25, (bpm/60) / 2, 'sineInOut')
		doTweenX('camssway0', 'camOther', getProperty('camOther.x') + 25, (bpm/60) / 2, 'sineInOut')
		doTweenX('camsssway0', 'camGame', getProperty('camGame.x') + 25, (bpm/60) / 2, 'sineInOut')
	elseif curStep == 704 then
		staticFlash(1, 1, 0.25, 0.075)
		quickCamSwap()
	elseif curStep == 764 then
		setProperty('defaultCamZoom', 1.5)
		quickCamSwap()
	elseif curStep == 768 then
		staticFlash(1, 1, 0.25, 0.075)
		duet = true
		setProperty('defaultCamZoom', 0.7)
		setProperty('CinemaTop.y', -720)
		setProperty('CinemaBottom.y', 720)
	elseif curStep == 832 then
		staticFlash(1, 1, 0.25, 0.075)
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 896 then --3d part
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		staticFlash(1, 1, 0, 0)

		for i = 1, 5 do
			setProperty('bgChar'..i..'.visible', false)
		end
		for i = 1, 3 do
			setProperty(stage[i]..'.visible', false)
		end
		staticFlash(1, 1, 0, 0)
		setProperty('Spiral.visible', false)

		for i = 1, 2 do
			cancelTween('camsway'..i)
			cancelTween('camssway'..i)
			cancelTween('camsssway'..i)
		end
		setProperty('camHUD.x', 0)
		setProperty('camGame.x', 0)
		setProperty('camOther.x', 0)

		triggerEvent('Change Character', 'dad', 'Clowny3D')
		triggerEvent('Change Character', 'boyfriend', 'Miles3D')

		quickCamSwap()
		objectPlayAnimation('Spiral2', 'saturated', false)
		setProperty('Spiral2.color', getColorFromHex('FFFFFF'))
		bopScreen = true
		duet = false

		setProperty('CinemaTop.y', -635)
		setProperty('CinemaBottom.y', 635)

		setProperty('defaultCamZoom', 0.95)
		setProperty('cameraSpeed', 5)
		quickCamSwap()
	elseif curStep == 1024 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		staticFlash(1, 1, 0, 0)
		setProperty('defaultCamZoom', 0.75)
		duet = true
		quickCamSwap()

	elseif curStep == 1152 then
		cameraFlash('camOther', '000000', 1, true)
		staticFlash(1, 1, 0, 0)

		setProperty('Floor.visible', true)
		--for i = 1, 3 do
			--setProperty(stage[i]..'.visible', true)
		--end

		triggerEvent('Change Character', 'dad', 'Clowny')
		triggerEvent('Change Character', 'boyfriend', 'MilesMarmalised')
		triggerEvent('Alt Idle Animation', 'boyfriend', '-alt')

		setProperty('Spiral2.color', getColorFromHex('FFFFFF'))
		setProperty('Station.visible', false)

		duet = false
		setProperty('cameraSpeed', 2)
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
		bopScreen = false
		setProperty('Spiral.visible', true)
	elseif curStep == 1160 or curStep == 1224 then
		doTweenZoom('camera', 'camGame', 0.75, 0.4, 'linear')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 1168 or curStep == 1232 then
		doTweenZoom('camera', 'camGame', 1, 1.3, 'quadInOut')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 1184 or curStep == 1192 or curStep == 1196 or curStep == 1248 or curStep == 1256 or curStep == 1260 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.4, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 1188 or curStep == 1190 or curStep == 1252 or curStep == 1254 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.1, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	elseif curStep == 1200 or curStep == 1264 then
		doTweenZoom('camera', 'camGame', 0.75, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 1216 or curStep == 1280 or curStep == 1344 then
		cameraFlash('camOther', '000000', 1, true)
		staticFlash(1, 1, 0, 0)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 1288 or curStep == 1352 then
		doTweenZoom('camera', 'camGame', 0.9, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 1296 or curStep == 1300 or curStep == 1304 or curStep == 1360 or curStep == 1364 or curStep == 1368 then
		cameraFlash('camGame', '000000', 0.35, true)
		if curStep == 1296 or curStep == 1304 or curStep == 1360 or curStep == 1368 then
			doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
			setProperty('defaultCamZoom', 0.75)
		else
			doTweenZoom('camera', 'camGame', 1.05, 0.01, 'linear')
			setProperty('defaultCamZoom', 1.05)
		end
	elseif curStep == 1308 or curStep == 1372 then
		setProperty('defaultCamZoom', 0.7)
	elseif curStep == 1316 or curStep == 1380 then
		doTweenZoom('camera', 'camGame', 1, 1.1, 'quadInOut')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 1328 or curStep == 1332 or curStep == 1336 or curStep == 1340 or curStep == 1392 or curStep == 1396 or curStep == 1400 or curStep == 1404 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.075, 0.3, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.075)
		if curStep == 1392 then
			doTweenColor('uh', 'Spiral2', 'CDC200', 1.5, 'linear')
		end
	elseif curStep == 1408 then
		cameraFlash('camOther', '000000', 1, true)

		setProperty('CinemaTop.visible', false)
		setProperty('CinemaBottom.visible', false)
		bopScreen = true
		triggerEvent('Change Character', 'boyfriend', 'Miles')
		triggerEvent('Alt Idle Animation', 'dad', '-alt')
		setProperty('Spiral.alpha', 0)

		for i = 1, 3 do
			setProperty(stage[i]..'.visible', true)
		end

		setProperty('defaultCamZoom', 1)
		setProperty('cameraSpeed', 5)
		quickCamSwap()
	elseif curStep == 1420 or curStep == 1484 then
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 1424 or curStep == 1428 or curStep == 1488 or curStep == 1452 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.1, 'linear')
	elseif curStep == 1434 or curStep == 1498 then
		setProperty('defaultCamZoom', 1)
	elseif curStep == 1440 or curStep == 1448 or curStep == 1504 or curStep == 1512 then
		cameraFlash('camGame', '000000', 0.25, true)
		doTweenZoom('camera', 'camGame', 1.15, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.1)
	elseif curStep == 1444 or curStep == 1508 then
		cameraFlash('camGame', '000000', 0.25, true)
		doTweenZoom('camera', 'camGame', 0.95, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 1450 or curStep == 1514 then
		doTweenZoom('camera', 'camGame', 0.975, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', 0.975)
	elseif curStep == 1456 or curStep == 1460 or curStep == 1520 or curStep == 1524 then
		staticFlash(0.15, 0.1, 0, 0)
		setProperty('Station.alpha', 0.5)
		doTweenAlpha('grah', 'Station', 1, 0.1, 'linear')
		doTweenZoom('camera', 'camGame', 1, 0.1, 'linear')
	elseif curStep == 1462 or curStep == 1526 then
		doTweenZoom('camera', 'camGame', 0.95, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 1464 or curStep == 1528 then 
		cameraFlash('camGame', '000000', 0.25, true)
		doTweenZoom('camera', 'camGame', 1.05, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.05)
	elseif curStep == 1468 or curStep == 1532 then
		cameraFlash('camGame', '000000', 0.25, true)
		doTweenZoom('camera', 'camGame', 1.15, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.15)
	elseif curStep == 1472 or curStep == 1536 or curStep == 1600 then
		cameraFlash('camOther', '000000', 1, true)
		staticFlash(0.5, 1, 0, 0)
		if curStep == 1536 or curStep == 1600 then
			setProperty('defaultCamZoom', 1.15)
			setProperty('cameraSpeed', 5)
		else
			setProperty('defaultCamZoom', 1)
		end
		quickCamSwap()
	elseif curStep == 1544 or curStep == 1548 or curStep == 1608 or curStep == 1612 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	elseif curStep == 1552 or curStep == 1556 or curStep == 1560 or curStep == 1616 or curStep == 1620 or curStep == 1624 then
		cameraFlash('camGame', '000000', 0.5, true)
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.01, 'linear')
	elseif curStep == 1562 or curStep == 1626 then
		doTweenZoom('camera', 'camGame', 0.8, 0.44, 'quadInOut')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 1566 or curStep == 1567 or curStep == 1630 or curStep == 1631 then
		staticFlash(0.15, 0.25, 0, 0)
	elseif curStep == 1568 or curStep == 1571 or curstep == 1574 or curStep == 1632 or curStep == 1635 or curStep == 1638 then
		staticFlash(0.1, 0.25, 0, 0)
		if curStep == 1571 or curStep == 1635 then
			setProperty('defaultCamZoom', 0.95)
		else
			setProperty('defaultCamZoom', 0.85)
		end
		quickCamSwap()
	elseif curStep == 1578 or curStep == 1642 then
		cameraFlash('camGame', '000000', 0.15, true)
		setProperty('defaultCamZoom', 0.75)
		quickCamSwap()
	elseif curStep == 1584 or curStep == 1588 or curStep == 1648 or curStep == 1652 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.01, 'linear')
	elseif curStep == 1592 or curStep == 1656 then
		doTweenZoom('camera', 'camGame', 1.2, 0.89, 'quadInOut')
		setProperty('cameraSpeed', 7.5)
	elseif curStep == 1664 then
		cameraFlash('camOther', '000000', 1.5, true)
		bopScreen = false
		triggerEvent('Alt Idle Animation', 'dad', '')
		setProperty('cameraSpeed', 2)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.8, 1.25, 'quadInOut')
		setProperty('defaultCamZoom', 0.8)
		doTweenX('leaveStation', 'Train', 2250, 1.5, 'linear')
	elseif curStep == 1680 or curStep == 1744 then
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 1696 or curStep == 1760 then
		setProperty('defaultCamZoom', 0.85)
	elseif curStep == 1712 or curStep == 1776 then
		duet = true
		doTweenZoom('camera', 'camGame', 0.65, 1, 'quadInOut')
		setProperty('defaultCamZoom', 0.7)
	elseif curStep == 1728 then
		cameraFlash('camOther', '000000', 1.5, true)
		duet = false
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.8, 1.25, 'quadInOut')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 1792 or curStep == 1856 then
		cameraFlash('camOther', '000000', 1.5, true)
		duet = false
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 1.2, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.2)
	elseif curStep == 1800 or curStep == 1803 or curStep == 1864 or curStep == 1867 then
		if curStep == 1800 or curStep == 1803 then
			cameraShake('camHUD', 0.025, 0.025)
			cameraShake('camGame', 0.025, 0.025)
		end
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 1808 or curStep == 1872 then
		doTweenZoom('camera', 'camGame', 1.1, 0.88, 'quadInOut')
		setProperty('defaultCamZoom', 1.1)
	elseif curStep == 1824 or curStep == 1827 or curStep == 1830 or curStep == 1847 or curStep == 1888 or curStep == 1891 or curStep == 1894 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 1834 or curStep == 1898 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.15, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.15)
	elseif curStep == 1840 or curStep == 1843 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 1904 then
		quickCamSwap()
		duet = true
		doTweenZoom('camera', 'camGame', 0.65, 1, 'quadInOut')
		setProperty('defaultCamZoom', 0.7)
	elseif curStep == 1920 then
		cameraFlash('camOther', '000000', 2.5, true)
		doTweenAlpha('guigo', 'camHUD', 0, 2.5, 'linear')

	elseif curStep == 1984 then
		cameraFlash('camOther', '000000', 2.5, true)
		staticFlash(1, 2.5, 0.35, 0.2)
		doTweenAlpha('spiralBack', 'Spiral', 1, 5, 'linear')
	elseif curStep == 2048 then
		cameraFlash('camOther', '000000', 1, true)
		duet = false
		setProperty('Smile.alpha', 1)
		setProperty('camGame.alpha', 0)
		setProperty('camHUD.alpha', 0)
		doTweenAlpha('goGame', 'camOther', 0, 5, 'linear')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType ~= 'No Animation' then
		if getProperty('health') > 0.02 then
			setProperty('health', getProperty('health') - 0.02);
		end
	else
		callMethod('opponentStrums.members['..direction..'].playAnim', {'static'})
	end
end

function onTimerCompleted(tag)
	if tag == 'returnCamSpeed' then
		setProperty('cameraSpeed', prevCamSpeed)
	elseif tag == 'marmett' then
		objectPlayAnimation('marMeter', 'fill'..currenStage, false)
		currenStage = currenStage + 1
		runTimer('marmett', 14.75)
	end
end

function onUpdate()
	if curStep < 128 or duet == true then
		if dadName == 'Clowny3D' then
			setProperty('camFollow.x', 775)
			setProperty('camFollow.y', 725)
		else
			setProperty('camFollow.x', 1000)
			setProperty('camFollow.y', 650)
		end
	elseif curStep > 763 and curStep < 768 then
		setProperty('camFollow.x', 840)
		setProperty('camFollow.y', 585)
	elseif curStep > 2047 and curStep < 2064 then
		setProperty('Smile.angle', getRandomInt(-2.5, 2.5))
		cameraShake('camHUD', 0.05, 0.05)
		cameraShake('camGame', 0.05, 0.05)
	end
end

function onBeatHit()
	setProperty('marMeter.scale.x', 0.93)
	setProperty('marMeter.scale.y', 0.93)
	if curBeat %2 == 0 then
		setProperty('marMeter.angle', 5)
	else
		setProperty('marMeter.angle', -5)
	end
	doTweenAngle('marMeterb', 'marMeter', 0, 0.5, 'linear')
	doTweenX('marMeterb2', 'marMeter.scale', 0.88, 0.5, 'linear')
	doTweenY('marMeterb3', 'marMeter.scale', 0.88, 0.5, 'linear')

	if bopScreen == true then
		doTweenAngle('swaygame', 'camGame', 0, 0.5, 'quadInOut') --quadInOut
		doTweenAngle('swayhud', 'camHUD', 0, 0.5, 'quadInOut')
		setProperty('flashfaint.alpha', 0.1)
		doTweenAlpha('fuckoffffplease', 'flashfaint', 0, 0.5, 'quadInOut')
		if guhh == 0 then
			setProperty('camGame.angle', 1.5)
			setProperty('camHUD.angle', 1.5)
			guhh = 1
		else
			setProperty('camGame.angle', -1.5)
			setProperty('camHUD.angle', -1.5)
			guhh = 0
		end
		if dadName == 'Clowny3D' then
			setProperty('Spiral2.color', getColorFromHex('FFFFFF'))
			doTweenColor('Sprr', 'Spiral2', '3F3F00', 0.5, 'quadInOut')
		end
	end
end

function onTweenCompleted(tag)
	if curStep > 639 and curStep < 896 then
		if tag == 'camsssway0' or tag == 'camsssway2' then
			doTweenX('camsway1', 'camHUD', getProperty('camHUD.x') - 50, bpm/60, 'sineInOut')
			doTweenX('camssway1', 'camOther', getProperty('camOther.x') - 50, bpm/60, 'sineInOut')
			doTweenX('camsssway1', 'camGame', getProperty('camGame.x') - 50, bpm/60, 'sineInOut')
		elseif tag == 'camsssway1' then
			doTweenX('camsway2', 'camHUD', getProperty('camHUD.x') + 50, bpm/60, 'sineInOut')
			doTweenX('camssway2', 'camOther', getProperty('camOther.x') + 50, bpm/60, 'sineInOut')
			doTweenX('camsssway2', 'camGame', getProperty('camGame.x') + 50, bpm/60, 'sineInOut')
		end
	end
end