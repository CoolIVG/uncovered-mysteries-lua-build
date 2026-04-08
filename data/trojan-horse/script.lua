function onCreate()
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'TryHarder')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'TrojanGameOver')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'TrojanJS')
	addCharacterToList('PonyFaker3D', 'dad')
end
died = false

function onCreatePost()
	setProperty('camHUD.alpha', 0)	
	setProperty('camGame.visible', false)
	setProperty('carnival.visible', false)
	setProperty('shelf.alpha', 0)

	setProperty('dad.color', getColorFromHex('000000'))
	setProperty('boyfriend.color', getColorFromHex('000000'))
	setProperty('gf.color', getColorFromHex('000000'))
	setProperty('iconP1.color', getColorFromHex('000000'))
	setProperty('iconP2.color', getColorFromHex('000000'))
	setProperty('healthBar.alpha', 0)

	makeLuaSprite('Wake', 'stages/carnival/spookytext', 250, 300);
	scaleObject('Wake', 0.5, 0.5);
	setObjectCamera('Wake', 'other');
	setProperty('Wake.alpha', 0);
	setObjectOrder('Wake', 3);
	addLuaSprite('Wake', false);
end

function onSongStart()
	doTweenAlpha('camHUD', 'camHUD', 1, 2.05, 'linear')
end

function onStepHit()
	if curStep == 15 then
		doTweenZoom('camera', 'camGame', 0.7, 3.5, 'cubeInOut')
		setProperty('defaultCamZoom', 0.7)
	elseif curStep == 16 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		setProperty('camGame.visible', true)
		doTweenAlpha('theshelf', 'shelf', 1, 2, 'linear')
	elseif curStep == 144 or curStep == 208 or curStep == 256 or curStep == 260 or curStep == 264 or curStep == 336 then
		cameraFlash('camGame', 'FFFFFF', 1.5, true)
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 268 then
		cameraFlash('camGame', 'FFFFFF', 1.5, true)
		setProperty('light.visible', false)
	elseif curStep == 276 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		setProperty('Wake.alpha', 1)
		setProperty('defaultCamZoom', 0.7)
		doTweenAlpha('ahhhh scary horse peter the horse is here', 'Wake', 0, 3, 'linear')	
		setProperty('carnival.visible', true)
		setProperty('light.visible', true)
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
		setProperty('iconP1.color', getColorFromHex('FFFFFF'))
		setProperty('iconP2.color', getColorFromHex('FFFFFF'))
		setProperty('healthBar.alpha', 1)
	elseif curStep == 336 or curStep == 344 or curStep == 352 or curStep == 360 or curStep == 363 or curStep == 366 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.75, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 368 then
		doTweenZoom('camera', 'camGame', 0.7, 0.45, 'quadInOut')
		setProperty('defaultCamZoom', 0.7)
	elseif curStep == 384 or curStep == 388 or curStep == 392 or curStep == 512 or curStep == 516 or curStep == 520 then
		cameraFlash('camOther', 'FFFFFF', 0.75, true)
		setProperty('cameraSpeed', 1000000)
		setProperty('defaultCamZoom', 1.1)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.1, 'linear')
	elseif curStep == 396 or curStep == 524 then
		cameraFlash('camOther', 'FFFFFF', 0.75, true)
		setProperty('defaultCamZoom', 0.85)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.1, 'linear')
	elseif curStep == 400 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		doTweenZoom('camera', 'camGame', 1, 0.001, 'linear')
		setProperty('defaultCamZoom', 1)
		setProperty('cameraSpeed', 2)
	elseif curStep == 528 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		setProperty('cameraSpeed', 1.38)
		doTweenZoom('camera', 'camGame', 1.15, 1.38, 'linear')
		setProperty('defaultCamZoom', 1.15)
		doTweenAlpha('bg', 'carnival', 0, 1.38, 'linear')
		doTweenAlpha('fg', 'shelf', 0, 1.38, 'linear')
		doTweenAlpha('bg2', 'light', 0, 1.38, 'linear')
		doTweenColor('gfcolourr', 'gf', '000000', 1.38, 'linear')
		doTweenColor('bfcolourr', 'boyfriend', '000000', 1.38, 'linear')
	elseif curStep == 592 or curStep == 720 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		doTweenColor('dadcolourr', 'dad', '000000', 1.38, 'linear')
		doTweenColor('bfcolourr', 'boyfriend', 'FFFFFF', 1.38, 'linear')
	elseif curStep == 656 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		doTweenColor('dadcolourr', 'dad', 'FFFFFF', 1.38, 'linear')
		doTweenColor('bfcolourr', 'boyfriend', '000000', 1.38, 'linear')
	elseif curStep == 784 then
		cameraFlash('camOther', '000000', 1, true)
		triggerEvent('Alt Idle Animation', 'dad', '-alt')
		doTweenColor('dadcolourrer', 'dad', 'FFFFFF', 0.001, 'linear')
		doTweenColor('gfcolourrer', 'gf', 'FFFFFF', 0.001, 'linear')
		setProperty('carnival.alpha', 1)
		setProperty('shelf.alpha', 1)
		setProperty('light.alpha', 1)
		setProperty('cameraSpeed', 2)
		doTweenZoom('camera', 'camGame', 0.8, 2, 'linear')
		setProperty('defaultCamZoom', 0.8)
		setProperty('carnivalTwisted.visible', true)
		setProperty('light.visible', false)
		doTweenAlpha('carnivaldroop', 'carnival', 0.5, 13.91, 'linear')
		doTweenAngle('playergui1', 'camHUD', -3, 10, 'linear')
	elseif curStep == 848 or curStep == 904 or curStep == 908 then
		cameraFlash('camGame', '000000', 1, true)
	elseif curStep == 912 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('light.visible', true)
		setProperty('cameraSpeed', 5)
		triggerEvent('Change Scroll Speed', '1.2', '0.01')
		doTweenZoom('camera', 'camGame', 1.15, 0.001, 'linear')
		setProperty('defaultCamZoom', 1.15)
	elseif curStep == 920 or curStep == 928 or curStep == 936 or curStep == 944 or curStep == 952 or curStep == 960 or curStep == 968 or curStep == 976 or curStep == 984 or curStep == 992 or curStep == 1000 or curStep == 1008 or curStep == 1016 or curStep == 1024 then
		cameraFlash('camGame', '000000', 0.25, true)
		if getProperty('defaultCamZoom') == 1.15 then
			doTweenZoom('camera', 'camGame', 0.8, 0.001, 'linear')
			setProperty('defaultCamZoom', 0.8)
		else
			doTweenZoom('camera', 'camGame', 1.15, 0.001, 'linear')
			setProperty('defaultCamZoom', 1.15)
		end
	elseif curStep == 1004 or curStep == 1096 then
		cameraFlash('camGame', '000000', 0.25, true)
		triggerEvent('Alt Idle Animation', 'dad', '')
		doTweenZoom('camera', 'camGame', 0.75, 0.001, 'linear')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 1032 or curStep == 1034 or curStep == 1036 or curStep == 1038 or curStep == 1040 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.08, 0.001, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.08)
	elseif curStep == 1088 then
		cameraFlash('camGame', '000000', 0.25, true)
		triggerEvent('Alt Idle Animation', 'dad', '-alt')
		doTweenZoom('camera', 'camGame', 1.25, 0.001, 'linear')
		setProperty('defaultCamZoom', 1.25)
	elseif curStep == 1136 or curStep == 1156 or curStep == 1160 or curStep == 1164 then
		cameraFlash('camGame', '000000', 0.25, true)
	elseif curStep == 1152 then
		cameraFlash('camGame', '000000', 0.25, true)
		setProperty('cameraSpeed', 1.5)
		doTweenZoom('camera', 'camGame', 1.5, 3.5, 'linear')
	elseif curStep == 1167 then
		cameraFlash('camOther', '000000', 2.5, true)
		doTweenAlpha('theguii', 'camHUD', 0, 1.5, 'linear')
		doTweenAlpha('eljuego', 'camGame', 0, 1.5, 'linear')
	elseif curStep == 1182 then
		triggerEvent('Change Scroll Speed', '0.825', '0.01')
		removeLuaSprite('carnivalTwisted', true)
		removeLuaSprite('carnival', true)
		removeLuaSprite('light', true)
		removeLuaSprite('shelf', true)
		setProperty('boyfriend.visible', false)
		setProperty('gf.visible', false)
		setProperty('defaultCamZoom', 0.5)
		triggerEvent('Change Character', 'dad', 'PonyFaker3D')
		doTweenX('boyfmovex', 'boyfriend', getProperty('boyfriend.x') + 800, 0.25, 'linear')
		doTweenY('boyfmovey', 'boyfriend', getProperty('boyfriend.y') - 50, 0.25, 'linear')
		setProperty('carnival3D.visible', true)
		setProperty('camHUD.angle', 0)
	elseif curStep == 1187 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('camHUD.alpha', 1)
		setProperty('camGame.alpha', 1)
	elseif curStep == 1247 or curStep == 1255 or curStep == 1263 or curStep == 1271 or curStep == 1274 or curStep == 1277 then
		cameraFlash('camGame', '000000', 0.75, true)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.75, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
		doTweenAlpha('3dcarnival', 'carnival3D', getProperty('carnival3D.alpha') - (1/6), 0.75, 'linear')
	elseif curStep == 1279 then
		doTweenZoom('camera', 'camGame', 0.5, 1.5, 'cubeOut')
		doTweenAlpha('3dcarnival2', 'carnival3D', 1, 1.5, 'cubeOut')
		setProperty('defaultCamZoom', 0.5)
	elseif curStep == 1295 or curStep == 1299 or curStep == 1303 or curStep == 1307 then
		cameraFlash('camGame', 'FFFFFF', 0.75, true)
	elseif curStep == 1311 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		setProperty('defaultCamZoom', 0.65)
		setProperty('cameraSpeed', 1000000)
	elseif curStep == 1375 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		setProperty('cameraSpeed', 1.5)
	elseif curStep == 1423 or curStep == 1428 or curStep == 1432 or curStep == 1436 or curStep == 1440 then
		cameraFlash('camOther', '000000', 0.3, true)
	elseif curStep == 1442 then
		cameraFlash('camOther', '000000', 2, true)
		doTweenAlpha('cameragame', 'camGame', 0, 3, 'linear')
		doTweenAlpha('cameraHUD', 'camHUD', 0, 4, 'linear')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep > 783 and curStep < 1004 or curStep > 1087 and curStep < 1095 then
		if getProperty('health') > 0.025 then
			setProperty('health', getProperty('health') - 0.025)
		end
	end
end

function onUpdate()
	if curStep > 383 and curStep < 388 or curStep > 511 and curStep < 516 then
		setProperty('defaultCamZoom', 1.1)
		setProperty('camFollow.x', 450)
		setProperty('camFollow.y', 750)
	elseif curStep > 387 and curStep < 392 or curStep > 515 and curStep < 520 or curStep > 1151 and curStep < 1183 then
		setProperty('camFollow.x', 1150)
		setProperty('camFollow.y', 700)
	elseif curStep > 391 and curStep < 396 or curStep > 519 and curStep < 524 then
		setProperty('camFollow.x', 835)
		setProperty('camFollow.y', 635)
	elseif curStep > 395 and curStep < 400 or curStep > 523 and curStep < 528 then
		setProperty('camFollow.x', 835)
		setProperty('camFollow.y', 660)
	end
	if died == true then
		if getProperty('ScaryFace.visible') == true then
			setProperty('ScaryFace.angle', getRandomInt(-5, 5))
			cameraShake('camOther', 0.05, 0.05)
		end
	end
end

function onBeatHit()
	if curStep > 911 and curStep < 1040 then
		if curBeat %2 == 0 then
			setProperty('camHUD.angle', 5)
			doTweenAngle('hudTween', 'camHUD', 0, 0.4, 'backOut')
			setProperty('camGame.angle', 5)
			doTweenAngle('gameTween', 'camGame', 0, 0.5, 'backOut')
			triggerEvent('Add Camera Zoom', '0.02', '0.04')
			setProperty('light.alpha', 1)
			doTweenAlpha('lightoff', 'light', 0, 0.1, 'cubeInOut')
		else
			setProperty('camHUD.angle', 5)
			doTweenAngle('hudTween', 'camHUD', 0, 0.4, 'backOut')
			setProperty('camGame.angle', 5)
			doTweenAngle('gameTween', 'camGame', 0, 0.5, 'backOut')
			triggerEvent('Add Camera Zoom', '0.0175', '0.035')
			setProperty('light.alpha', 0)
			doTweenAlpha('lightoff', 'light', 1, 0.1, 'cubeInOut')
		end
	elseif curStep > 1039 and curStep < 1104 then
		if curBeat %2 == 0 then
			triggerEvent('Add Camera Zoom', '0.02', '0.04')
		else
			triggerEvent('Add Camera Zoom', '0.0175', '0.035')
		end
	elseif curStep > 527 and curStep < 784 then
		if curBeat %2 == 0 then
			triggerEvent('Add Camera Zoom', '0.01', '0.02')
		else
			triggerEvent('Add Camera Zoom', '0.0125', '0.025')
		end
	end
end

previouschar = nil
function onMoveCamera(focus)
	if curStep > 399 and curStep < 528 then
		if previouschar ~= focus then
			previouschar = focus
			setProperty('cameraSpeed', 3000000)
			runTimer('fuck off', 0.05)
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'fuck off' then
		setProperty('cameraSpeed', 2)
	elseif tag == 'blinky' then
		objectPlayAnimation('Blinking', 'Blink', false);
		runTimer('starey', 0.0832)
		runTimer('blinky', getRandomInt(1, 10))
	elseif tag == 'starey' then
		objectPlayAnimation('Blinking', 'Stare', false);
	end
end

function onGameOverStart()
	died = true
	setProperty('boyfriend.visible', false)		

	makeAnimatedLuaSprite('Blinking', 'stages/carnival/GameoverBlink', 350, 0);
	addAnimationByPrefix('Blinking', 'Stare', 'Idle', 24, true);
	--addAnimationByIndices('Blinking', 'Stare', 'Idle', '0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,2,3,0,1')
	addAnimationByPrefix('Blinking', 'Blink', 'Blink', 24, false);
	objectPlayAnimation('Blinking', 'Stare', false);
	scaleObject('Blinking', 0.5, 0.5);
	setObjectCamera('Blinking', 'other');
	setProperty('Blinking.alpha', 0);
	setObjectOrder('Blinking', 4);

	makeLuaSprite('ScaryFace', 'stages/carnival/GameoverFace', 255, 30);
	scaleObject('ScaryFace', 0.65, 0.65);
	setObjectCamera('ScaryFace', 'other');
	setProperty('ScaryFace.visible', false);
	setObjectOrder('ScaryFace', 5);

	doTweenAlpha('facefade', 'Blinking', 1, 0.92, 'linear')
	runTimer('blinky', getRandomInt(1, 10))
end

function onGameOverConfirm(retry)
	--cameraFlash('camOther', 'FF0000', 0.5, true)
	setProperty('Blinking.alpha', 0)
	setProperty('ScaryFace.visible', true);
	doTweenAlpha('FaceGo', 'ScaryFace', 0, 1, 'linear')
	doTweenX('FaceX', 'ScaryFace.scale', 1, 1.5, 'linear')
	doTweenY('FaceY', 'ScaryFace.scale', 1, 1.5, 'linear')
end