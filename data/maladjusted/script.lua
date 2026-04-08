local mainhealthbar = {'iconsq1', 'iconsq2', 'healthBarBroken', 'healthBar'}
local dadXOrigin = nil

local prevCamSpeed = nil
function quickCamSwap()
	prevCamSpeed = getProperty('cameraSpeed')
	setProperty('cameraSpeed', 100000000)
	runTimer('returnCamSpeed', 0.05)
end

function onCreate()
	makeLuaSprite('healthBarBroken', 'stages/maladjusted/healthbar', 15, 220)
	setObjectCamera ('healthBarBroken', 'camHUD')
	setObjectOrder('healthBarBroken', 11)
	setProperty('healthBarBroken.alpha', 0.001)
	addLuaSprite('healthBarBroken', true)

	addCharacterToList('3DSawbones2', 'dad')
	addCharacterToList('Sawbones', 'dad')
	addCharacterToList('Sawbeast', 'dad')
	addCharacterToList('3DSawbeast', 'dad')

	addCharacterToList('3DOfficer2', 'boyfriend')
	addCharacterToList('Officer', 'boyfriend')

	setProperty('gf.visible', false)
	setProperty('cameraSpeed', 0.5)

	setProperty('dad.color', getColorFromHex('000000'))
	setProperty('iconP2.color', getColorFromHex('000000'))

	makeLuaSprite('CinemaTop', nil, -50, -720)
	makeGraphic('CinemaTop', screenWidth + 100, screenHeight, '000000')
	setObjectCamera('CinemaTop', 'camHUD')
	addLuaSprite('CinemaTop', false)

	makeLuaSprite('CinemaBottom', nil, -50, 720)
	makeGraphic('CinemaBottom', screenWidth + 100, screenHeight, '000000')
	setObjectCamera('CinemaBottom', 'camHUD')
	addLuaSprite('CinemaBottom', false)

	setProperty('camHUD.alpha', 0)
	setProperty('camGame.visible', false)
end

function onStepHit()
	if curStep == 16 then
		doTweenAlpha('gam', 'camHUD', 1, 2.5, 'linear')
	elseif curStep == 32 then
		cameraFlash('camOther', '000000', 5, true)
		setProperty('camGame.visible', true)
	elseif curStep == 160 or curStep == 224 then
		cameraFlash('camOther', '000000', 2.5, true)
		quickCamSwap()
	elseif curStep == 288 then
		setProperty('defaultCamZoom', 0.7)
		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 1850)
		setProperty('camFollow.y', 900)
	elseif curStep == 304 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		doTweenAlpha('gamego', 'camGame', 0, 1.5, 'linear')
	elseif curStep == 344 then
		cameraFlash('camOther', 'FFFFFF', 0.15, true)
		setProperty('isCameraOnForcedPos', false)
		setProperty('defaultCamZoom', 0.55)
		setProperty('camGame.alpha', 1)
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('iconP2.color', getColorFromHex('FFFFFF'))
		setProperty('cameraSpeed', 1.25)
		setProperty('songSpeed', 2.9)
		quickCamSwap()
	elseif curStep == 408 then
		quickCamSwap()
	elseif curStep == 432 or curStep == 440 then
		if curStep == 432 then
			doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
			setProperty('defaultCamZoom', 1)
		else
			doTweenZoom('camera', 'camGame', 0.55, 0.01, 'linear')
			setProperty('defaultCamZoom', 0.55)
		end
		quickCamSwap()
	elseif curStep == 450 then
        	characterPlayAnim('dad', 'reveal', false)
        	setProperty('dad.specialAnim', true)
		doTweenAlpha('Hospital3D', 'Hospital3D', 0.5, 0.5, 'linear')
	elseif curStep == 456 or curStep == 460 or curStep == 464 or curStep == 468 then
		setProperty('Hospital3D.alpha', 1)
		setProperty('bgFlash.alpha', 0.25)
		doTweenAlpha('Flashy', 'bgFlash', 0, 0.2, 'linear')

		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.15, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.15)
		doTweenAngle('camhudturn', 'camHUD', getProperty('camHUD.angle') + 0.3, 0.1, 'quadInOut')
		doTweenAngle('camgameturn', 'camGame', getProperty('camGame.angle') + 0.6, 0.1, 'quadInOut')
	elseif curStep == 472 then
		setProperty('camHUD.visible', false)
		setProperty('camGame.visible', false)

		triggerEvent('Change Character', 'dad', '3DSawbones2')
		triggerEvent('Change Character', 'boyfriend', '3DOfficer2')
		setProperty('camHUD.angle', 0)
		setProperty('camGame.angle', 0)
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.5)
	elseif curStep == 476 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('camHUD.visible', true)
		setProperty('cameraSpeed', 2)
		setProperty('camGame.visible', true)
		setProperty('songSpeed', 3.25)	

		setProperty('healthBarBroken.alpha', 1)
		setProperty('healthBarBG.visible', false)
		scaleObject('healthBar', 0.7, 1)
		setProperty('healthBar.x', -107.5)
		setProperty('healthBar.y', 472.5)
		setProperty('iconsq1.visible', false)
		setProperty('iconsq2.visible', false)
		setProperty('iconsq1.x', 35)
		setProperty('iconsq2.x', -20)

		setProperty('iconP2.flipX', true)

		setObjectOrder('healthBar', 9)
		setObjectOrder('healthBarBroken', 10)
		setObjectOrder('iconP2', 30)  --Opponent
		setObjectOrder('iconP1', 31)  --Player

		for i = 1, #mainhealthbar do
			setProperty(mainhealthbar[i]..'.x', getProperty(mainhealthbar[i]..'.x') + 40)
		end
	elseif curStep == 504 or curStep == 568 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.2)
		doTweenAlpha('ggtr', 'Hospital3D', 0.5, 0.1, 'linear')
	elseif curStep == 520 or curStep == 584 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.2)
		doTweenAlpha('ggtr', 'Hospital3D', 1, 0.1, 'linear')
	elseif curStep == 600 or curStep == 664 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('camGame.alpha', 1)
		quickCamSwap()
		setProperty('defaultCamZoom', 0.65)
	elseif curStep == 616 or curStep == 632 or curStep == 648 or curStep == 680 or curStep == 696 or curStep == 712 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 660 or curStep == 724 or curStep == 1106 then
		doTweenAlpha('camGa', 'camGame', 0.5, 0.3, 'linear')
	elseif curStep == 728 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('camGame.alpha', 1)
		dadXOrigin = getProperty('dad.x')
		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 2350)
		setProperty('camFollow.y', 900)
		setProperty('defaultCamZoom', 0.9)
		quickCamSwap()

		doTweenX('dadda', 'dad', dadXOrigin + 1550, 10.95, 'linear')
		setProperty('dad.alpha', 0.25)
		setProperty('Hospital3D.visible', false)
	elseif curStep == 856 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('CinemaTop.y', -660)
		setProperty('CinemaBottom.y', 660)

		cancelTween('dadda', false) --failsafe for if game lags

		setProperty('isCameraOnForcedPos', false)
		setProperty('defaultCamZoom', 0.8)
		setProperty('dad.x', dadXOrigin)
		setProperty('dad.alpha', 1)
		setProperty('Hospital3D.visible', true)
		quickCamSwap()

	elseif curStep == 880 or curStep == 912 or curStep == 944 or curStep == 958 then
		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 2350)
		setProperty('camFollow.y', 900)
		setProperty('defaultCamZoom', 1)
		quickCamSwap()
	elseif curStep == 888 or curStep == 920 then
		setProperty('isCameraOnForcedPos', false)
		setProperty('defaultCamZoom', 0.8)
		quickCamSwap()
	elseif curStep == 952 or curStep == 964 then
		setProperty('camFollow.x', 1350)
		setProperty('defaultCamZoom', 0.9)
		quickCamSwap()
	elseif curStep == 968 then
		setProperty('camFollow.x', 1900)
		setProperty('camFollow.y', 850)
		setProperty('defaultCamZoom', 1.3)
	elseif curStep == 976 then
		setProperty('camGame.visible', false)
	elseif curStep == 984 then
		cameraFlash('camOther', 'FFFFFF', 0.25, true)
		setProperty('camGame.visible', true)
		triggerEvent('Change Character', 'dad', 'Sawbones')
		triggerEvent('Change Character', 'boyfriend', 'Officer')

		setProperty('defaultCamZoom', 0.55)
		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 1900)
		setProperty('camFollow.y', 900)
		quickCamSwap()

		setProperty('CinemaTop.y', -720)
		setProperty('CinemaBottom.y', 720)

	elseif curStep == 1000 or curStep == 1032 or curStep == 1064 or curStep == 1096 then
		setProperty('defaultCamZoom', 0.7)
	elseif curStep == 1016 or curStep == 1048 or curStep == 1080 then
		setProperty('defaultCamZoom', 0.55)
	elseif curStep == 1112 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('camGame.alpha', 1)
		setProperty('cameraSpeed', 5)
		setProperty('isCameraOnForcedPos', false)

		setProperty('Hospital3D.alpha', 0.5)

		setProperty('CinemaTop.y', -600)
		setProperty('CinemaBottom.y', 600)
		setProperty('defaultCamZoom', 1.05)
		quickCamSwap()
	elseif curStep == 1240 then
		cameraFlash('camOther', '000000', 0.1, true)
		triggerEvent('playVideo', 'Maladjusted', 'camOther')
	elseif curStep == 1304 then
		cameraFlash('camOther', '000000', 0.25, true)
		removeLuaSprite('videoSprite', false)

		setProperty('defaultCamZoom', 0.6)

		removeLuaSprite('Hospital3D', false)
		setProperty('Hospital3DG.visible', true)

		removeLuaSprite('CinemaTop', false)
		removeLuaSprite('CinemaBottom', false)
		triggerEvent('Change Character', 'dad', 'Sawbeast')

		setProperty('boyfriendGroup.x', getProperty('boyfriendGroup.x') + 250)
		setProperty('dadGroup.x', getProperty('dadGroup.x') - 250)

		setProperty('iconP2.flipX', false)
		setProperty('iconP2.offset.y', -5)
		setProperty('iconP2.offset.x', -5)

		setProperty('cameraSpeed', 3)
		setProperty('songSpeed', 3.6)
		setProperty('Maladjusted.alpha', 0)
	elseif curStep == 1312 or curStep == 1320 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 1336 then
		cameraFlash('camOther', '000000', 0.5, true)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 1344 or curStep == 1348 then
		cameraFlash('camGame', '000000', 0.75, true)
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.2)
		cameraShake('camHUD', 0.05, 0.05)
		cameraShake('camGame', 0.05, 0.05)
	elseif curStep == 1352 then
		cameraFlash('camOther', '000000', 0.75, true)
		doTweenZoom('camera', 'camGame', 0.6, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.6)
	elseif curStep == 1368 or curStep == 1384 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 1400 or curStep == 1406 or curStep == 1412 or curStep == 1418 or curStep == 1424 or curStep == 1456 or curStep == 1458 or curStep == 1460 or curStep == 1462 then
		if curStep == 1456 then
			setProperty('Hospital3DG.visible', true)
		end
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
		cancelTween('Flashy')
		setProperty('bgFlash.alpha', 0.15)
		doTweenAlpha('Flashy', 'bgFlash', 0, (bpm/60)/2, 'linear')
	elseif curStep == 1432 then
		setProperty('defaultCamZoom', 1.05)
		quickCamSwap()
	elseif curStep == 1440 then
		setProperty('defaultCamZoom', 1.15)
	elseif curStep == 1444 then
		setProperty('defaultCamZoom', 1)
	elseif curStep == 1448 then
		cameraFlash('camGame', '000000', 0.25, true)
		setProperty('Hospital3DG.visible', false)
	elseif curStep == 1464 then
		setProperty('defaultCamZoom', 0.65)
	elseif curStep == 1480 or curStep == 1496 or curStep == 1512 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.125)
	elseif curStep == 1528 then
		cameraFlash('camGame', 'FFFFFF', 0.5, true)
		setProperty('isCameraOnForcedPos', true)
		setProperty('camFollow.x', 1350)
		setProperty('camFollow.y', 900)
		setProperty('defaultCamZoom', 0.65)
		quickCamSwap()
	elseif curStep == 1534 then
		setProperty('defaultCamZoom', 0.9)
		setProperty('camFollow.x', 2350)
		setProperty('camFollow.y', 900)
		quickCamSwap()
	elseif curStep == 1540 then
		setProperty('defaultCamZoom', 0.45)
		setProperty('camFollow.x', 1900)
		setProperty('camFollow.y', 900)
		quickCamSwap()
	elseif curStep == 1544 then
		setProperty('camGame.visible', false)
	elseif curStep == 1560 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		setProperty('camGame.visible', true)
		triggerEvent('Change Character', 'dad', '3DSawbeast')
		triggerEvent('Change Character', 'boyfriend', '3DOfficer2')
		setProperty('defaultCamZoom', 0.5)
		setProperty('bgFlash.alpha', 0.2)
		doTweenAlpha('Flashy', 'bgFlash', 0, (bpm/60)/2, 'linear')
	elseif curStep == 1566 or curStep == 1592 or curStep == 1598 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
		cancelTween('Flashy')
		setProperty('bgFlash.alpha', 0.2)
		doTweenAlpha('Flashy', 'bgFlash', 0, (bpm/60)/2, 'linear')
	elseif curStep == 1576 or curStep == 1608 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.025)
	elseif curStep == 1784 then
		triggerEvent('playVideo', 'MaladjustedEnding', 'camOther')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') > 0.05 then
		setProperty('health', getProperty('health') - 0.015)
	end
end

function onUpdatePost()
	if curStep > 475 then
		scaleObject('iconP2', 0.8, 0.8)
		scaleObject('iconP1', 0.7, 0.7)
		local icony = 425 - ((getProperty('health') - 1) * 150);
		setProperty('iconsq2.y', icony)
		setProperty('iconsq1.y', getProperty('iconsq2.y') + 35)	
	else
		scaleObject('iconP2', 0.6, 0.6)
		scaleObject('iconP1', 0.6, 0.6)
	end
end

function onBeatHit()
	if curStep < 476 then
		if curBeat % 2 == 0 then
			doTweenAngle('player', 'iconP1', 20, 0.025, 'linear')
			doTweenAngle('opponent', 'iconP2', -20, 0.025, 'linear')
		else
			doTweenAngle('player', 'iconP1', -20, 0.025, 'linear')
			doTweenAngle('opponent', 'iconP2', 20, 0.025, 'linear')
		end
		runTimer('ReturnAngle', 0.1)
	elseif curStep > 983 and curStep < 1112 then
		if curBeat % 2 == 0 then
			setProperty('camHUD.angle', -0.5)
			setProperty('camGame.angle', -0.25)
		else
			setProperty('camHUD.angle', 0.5)
			setProperty('camGame.angle', 0.25)
		end
		doTweenAngle('CA', 'camHUD', 0, (bpm/60)/2, 'cubeInOut')
		doTweenAngle('CAC', 'camGame', 0, (bpm/60)/2, 'cubeInOut')
	elseif curStep > 1111 and curStep < 1240 then
		setProperty('bgFlash.alpha', 0.1)
		doTweenAlpha('Flashy', 'bgFlash', 0, (bpm/60)/2, 'linear')
	end
end

function onTimerCompleted(tag)
	if tag == 'returnCamSpeed' then
		setProperty('cameraSpeed', prevCamSpeed)
	end
end