
basezoom = 0
dadxorigin = 0
FUCKINGFOCUS = false
camon = boyfriend
ocean1 = true

function onCreatePost()
	dadxorigin = getProperty('dad.x')
	basezoom = getProperty('defaultCamZoom')

	doTweenColor('icon', 'iconP2', '000000', 0.001, 'linear')
	setProperty('camHUD.alpha', 0)	
	setProperty('camGame.alpha', 0)

	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'maginaryjumpscae')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'DiscardedGameOver')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'discardedretry')

	makeAnimatedLuaSprite('Dead', 'stages/gallery/MaginaryGameover', 0, 0);
end

function onSongStart()
	doTweenAlpha('BAR', 'Binary', 0.5, 6.1, 'linear')
	setProperty('defaultCamZoom', 1.25)
	doTweenX('OceanMove0', 'Ocean', getProperty('Ocean.x') - 50, bpm/60, 'cubeInOut')
end

function onStepHit()
	if curStep == 64 then
		cameraFlash('camGame', '00FF01', 1, true)
		doTweenAlpha('HUD', 'camHUD', 1, 7.18, 'linear')
		setProperty('Binary.alpha', 0)
	elseif curStep == 128 or curStep == 512 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		doTweenColor('icon', 'iconP2', 'FFFFFF', 0.001, 'linear')
		setProperty('camGame.alpha', 1)
		setProperty('defaultCamZoom', 0.75)
		FUCKINGFOCUS = false
		setProperty('cameraSpeed', 3)
		doTweenZoom('camera', 'camGame', 0.75, 1.5, 'quadInOut')
	elseif curStep == 256 or curStep == 320 then
		doTweenZoom('camera', 'camGame', 0.9, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 304 or curStep == 308 or curStep == 312 or curStep == 316 or curStep == 368 or curStep == 372 or curStep == 376 or curStep == 380 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 384 then
		cameraFlash('camOther', 'FFFFFF', 0.25, true)
		setProperty('defaultCamZoom', 1.1)
		FUCKINGFOCUS = true
		setProperty('cameraSpeed', 1000000)
	elseif curStep == 640 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('cameraSpeed', 4)
		setProperty('defaultCamZoom', 1)
	elseif curStep == 656 then
		doTweenZoom('camera', 'camGame', 1.1, 0.25, 'quadInOut')
		setProperty('defaultCamZoom', 1.1)
	elseif curStep == 688 then
		doTweenZoom('camera', 'camGame', 0.9, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 704 or curStep == 720 or curStep == 736 or curStep == 752 then
		cameraFlash('camGame', '00FF01', 1, true)
		setProperty('Binary.alpha', getProperty('Binary.alpha') + 0.075)
		setProperty('camGame.angle', getRandomInt(-1, 1))
		setProperty('cameraSpeed', 3)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
		doTweenAlpha('GalleryA', 'Gallery', getProperty('Gallery.alpha') - 0.25, 0.1, 'linear')
		doTweenAlpha('GlobeA', 'Globe', getProperty('Globe.alpha') - 0.25, 0.1, 'linear')
		doTweenAlpha('OceanA', 'Ocean', getProperty('Ocean.alpha') - 0.25, 0.1, 'linear')
		doTweenAlpha('GFA', 'gf', getProperty('gf.alpha') - 0.25, 0.1, 'linear')
	elseif curStep == 768 then
		cameraFlash('camOther', '000000', 0.5, true)
		setProperty('cameraSpeed', 2)
		setProperty('Binary.alpha', 0)
		setProperty('camGame.angle', 0)
		setProperty('Gallery.alpha', 1)
		setProperty('Globe.alpha', 1)
		setProperty('Ocean.alpha', 1)
		setProperty('gf.alpha', 1)
		doTweenZoom('camera', 'camGame', 0.75, 1.5, 'quadInOut')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 896 or curStep == 928 or curStep == 960 or curStep == 992 or curStep == 1280 or curStep == 1312 or curStep == 1344 or curStep == 1376 then
		if curStep == 896 or curStep == 960 or curStep == 1344 or curStep == 1280 then
			cameraFlash('camOther', '000000', 1, true)
		end
		setProperty('cameraSpeed', 3.5)
		doTweenZoom('camera', 'camGame', 1, 1, 'quadInOut')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 912 or curStep == 976 or curStep == 1296 or curStep == 1360 then
		doTweenZoom('camera', 'camGame', 0.85, 1, 'quadInOut')
		setProperty('defaultCamZoom', 0.85)
	elseif curStep == 944 or curStep == 952 or curStep == 1008 or curStep == 1016 or curStep == 1328 or curStep == 1336 or curStep == 1392 or curStep == 1400 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 1024 or curStep == 1408 then
		cameraFlash('camOther', '000000', 1, true)
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 1040 or curStep == 1072 or curStep == 1104 or curStep == 1424 or curStep == 1456 or curStep == 1488 then
		doTweenAlpha('BinaryV', 'Binary', 0.15, 0.5, 'linear')
		doTweenColor('BackgroundD', 'Gallery', '000000', 0.5, 'linear')
		doTweenColor('OceanD', 'Ocean', '000000', 0.5, 'linear')
		doTweenColor('GlobeD', 'Globe', '000000', 0.5, 'linear')
		doTweenColor('dadD', 'dad', '000000', 0.5, 'linear')
		doTweenColor('gfD', 'gf', '000000', 0.5, 'linear')
		doTweenColor('bfD', 'boyfriend', '000000', 0.5, 'linear')
		doTweenX('MoveTowards', 'dad', getProperty('dad.x') + 110, 1.53, 'linear')
	elseif curStep == 1056 or curStep == 1088 or curStep == 1120 or curStep == 1440 or curStep == 1472 or curStep == 1504 then
		doTweenAlpha('BinaryIV', 'Binary', 0, 0.5, 'linear')
		doTweenColor('BackgroundL', 'Gallery', 'FFFFFF', 0.5, 'linear')
		doTweenColor('OceanL', 'Ocean', 'FFFFFF', 0.5, 'linear')
		doTweenColor('GlobeL', 'Globe', 'FFFFFF', 0.5, 'linear')
		doTweenColor('dadL', 'dad', 'FFFFFF', 0.5, 'linear')
		doTweenColor('gfL', 'gf', 'FFFFFF', 0.5, 'linear')
		doTweenColor('bfL', 'boyfriend', 'FFFFFF', 0.5, 'linear')
	elseif curStep == 1144 or curStep == 1528 then
		triggerEvent('Play Animation', 'idle-alt', 'dad')
	elseif curStep == 1148 or curStep == 1532 then
		cameraFlash('camOther', '000000', 0.5, true)
		--setProperty('dad.x', dadxorigin)
		doTweenX('omgisthatfather', 'dad', dadxorigin, 0.35, 'cubeInOut')
		setProperty('defaultCamZoom', basezoom)
	elseif curStep == 1152 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		doTweenZoom('camera', 'camGame', 0.9, 1, 'quadInOut')
		setProperty('defaultCamZoom', 0.9)
		setProperty('cameraSpeed', 5)
	elseif curStep == 1184 or curStep == 1248 then
		doTweenZoom('camera', 'camGame', 1, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 1216 then
		doTweenZoom('camera', 'camGame', 0.9, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 1536 then
		cameraFlash('camOther', '000000', 0.5, true)
		triggerEvent('Play Animation', 'idle', 'dad')
		setProperty('cameraSpeed', 1000000)
		camon = "theboyfriend"
		setProperty('defaultCamZoom', 1.25)
	elseif curStep == 1540 then
		camon = "thedad"
	elseif curStep == 1544 then
		camon = "thegirlfriend"
	elseif curStep == 1548 then
		camon = "fuck off"
		setProperty('defaultCamZoom', basezoom)
	elseif curStep == 1552 then
		doTweenAlpha('HUD', 'camHUD', 0, 1.54, 'linear')
		doTweenAlpha('game', 'camGame', 0, 1.54, 'linear')
		triggerEvent('Alt Idle Animation', 'boyfriend', '-loopup')
	elseif curStep == 1562 or curStep == 1563 or curStep == 1564 then
		cancelTween('game', false)
		cameraFlash('camGame', '000000', 0.25, true)
	elseif curStep == 1568 then
		doTweenZoom('camera', 'camGame', 0.675, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.7)
	elseif curStep == 1571 then
		doTweenZoom('camera', 'camGame', 0.9, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 1572 then
		setProperty('Binary.alpha', 1)
	elseif curStep == 1576 then
		setProperty('camGame.alpha', 0)
		doTweenAlpha('game', 'Binary', 0, 0.25, 'cubeIn')
	elseif curStep == 1579 then
		doTweenAlpha('game', 'Binary', 1, 0.25, 'cubeOut')
	elseif curStep == 1580 then
		setProperty('Binary.visible', false)
		setProperty('camGame.alpha', 0.75)
		doTweenAlpha('game', 'camGame', 0, 1, 'linear')
	elseif curStep == 1584 then
		cancelTween('game', false)
		setProperty('camHUD.alpha', 0.25)
	elseif curStep == 1588 then
		doTweenAlpha('game', 'camGame', 0, 2, 'linear')
		doTweenAlpha('hude', 'camHUD', 0, 2, 'linear')
	elseif curStep == 1632 then
		triggerEvent('Alt Idle Animation', 'boyfriend', '')

		setProperty('Binary.alpha', 0)
		setProperty('camGame.angle', 0)
		setProperty('camHUD.angle', 0)

		cancelTween('game', false)
		setProperty('camGame.alpha', 0)
		
		removeLuaSprite('Shading', true)
		removeLuaSprite('Gallery', true)
		removeLuaSprite('Ocean', true)

		makeLuaSprite('Gallery2', 'stages/gallery/GalleryGlitch', -500, -400);
		scaleObject('Gallery2', 1.7, 1.7);
		setObjectOrder('Gallery2', 2)
		addLuaSprite('Gallery2', false);

		makeLuaSprite('Shading2', 'stages/gallery/ShadingGlitch', -500, -350);
		scaleObject('Shading2', 1.7, 1.7);
		setObjectOrder('Shading2', 8)
		addLuaSprite('Shading2',false);		

		setProperty('cameraSpeed', 1)
		setProperty('dad.color', getColorFromHex('B5B5B5'))
		setProperty('gf.color', getColorFromHex('B5B5B5'))
		setProperty('boyfriend.color', getColorFromHex('B5B5B5'))

		setProperty('defaultCamZoom', 1)
		setProperty('Binary.visible', true)
		doTweenAlpha('hude', 'camHUD', 1, 5, 'linear')
	elseif curStep == 1648 then
		doTweenAlpha('gamer', 'camGame', 1, 5, 'linear')
	elseif curStep == 1792 or curStep == 1808 or curStep == 1824 or curStep == 1840 or curStep == 1856 or curStep == 1872 or curStep == 1888 or curStep == 1904 then
		cameraFlash('camHUD', '000000', 0.75, true)
		setProperty('dad.x', dadxorigin)
		doTweenX('MoveTowards', 'dad', getProperty('dad.x') + 330, 2.25, 'linear')
	elseif curStep == 1920 then
		setProperty('boyfriend.stunned', true);
		makeLuaSprite('err', 'stages/gallery/disconnect', 550, 350);
		scaleObject('err', 0.5, 0.5);
		setObjectCamera('err', 'other');
		addLuaSprite('err',false);
	
		doTweenX('errx', 'err.scale', 1.1, 0.1, 'linear')
		doTweenY('erry', 'err.scale', 1.1, 0.1, 'linear')
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Hey!' then
		doTweenZoom('camera', 'camGame', 1.25, 0.01, 'linear')
	elseif noteType == 'No Animation' then
		triggerEvent('Play Animation', 'attack', 'boyfriend')
		triggerEvent('Play Animation', 'hit', 'dad')
		cameraShake('camHUD', 0.05, 0.05)
		cameraShake('camGame', 0.05, 0.05)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' then
		setProperty('health', getProperty('health') - 1)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') >= 0.01 then
		setProperty('health', getProperty('health') - 0.01)
	end
	if curStep > 1551 and curStep < 1648 then
		cameraShake('camHUD', 0.05, 0.05)
		cameraShake('camGame', 0.05, 0.05)
		setProperty('camGame.angle', getRandomInt(-1, 1))
		setProperty('camHUD.angle', getRandomInt(-1, 1))
	end
end

function onTweenCompleted(tag)
	if tag == 'BackgroundD' then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.025)
	end 
end

function onTimerCompleted(tag)
	if tag == 'nofuckoff' then
		doTweenAlpha('deadgone', 'Dead', 0, 1, 'linear')
		doTweenAlpha('died2', 'retry', 1, 3, 'linear')
	end
end

function onUpdate()
	if FUCKINGFOCUS == true then
		if mustHitSection then
			setProperty('camFollow.x', 900)
			setProperty('camFollow.y', 450)
		else
			setProperty('camFollow.x', 200)
			setProperty('camFollow.y', 425)
		end
	end
	if curStep > 1023 and curStep < 1152 or curStep > 1407 and curStep < 1535 or curStep > 1791 then	
		setProperty('camFollow.x', 515)
		setProperty('camFollow.y', 425)
	elseif curStep > 1535 and curStep < 1632 then
		if camon == 'thegirlfriend' then
			setProperty('camFollow.x', 625)
			setProperty('camFollow.y', 200)
		elseif camon == 'thedad' then
			setProperty('camFollow.x', 200)
			setProperty('camFollow.y', 400)
		elseif camon == 'theboyfriend' then
			setProperty('camFollow.x', 900)
			setProperty('camFollow.y', 450)
		else
			setProperty('camFollow.x', 650)
			setProperty('camFollow.y', 375)
		end
	end
end

function onBeatHit()
	if curBeat %2 == 0 and curStep < 1632 then
		if ocean1 == true then
			doTweenX('OceanMove2', 'Ocean', getProperty('Ocean.x') + 100, bpm/60, 'cubeInOut')
			cancelTween('OceanMove1')
			ocean1 = false
		else
			doTweenX('OceanMove1', 'Ocean', getProperty('Ocean.x') - 100, bpm/60, 'cubeInOut')
			cancelTween('OceanMove2')
			ocean1 = true
		end
	end
end

function onGameOverStart()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
	setProperty('boyfriend.visible', false);

	makeAnimatedLuaSprite('Dead', 'stages/gallery/MaginaryGameover', 0, 0);
	addAnimationByPrefix('Dead', 'slice', 'UhOh instance', 30, false);
	setObjectCamera('Dead', 'other');
	scaleObject('Dead', 1.7, 1.7)
	setObjectOrder('Dead', 2);
	runTimer('nofuckoff', 3.5)

	makeLuaSprite('retry', 'stages/gallery/retry', 100, 0)
	setObjectCamera('retry', 'other');
	setProperty('retry.alpha', 0)
	setObjectOrder('retry', 1)
	addLuaSprite('retry', false)
end

function onGameOverConfirm(retry)
	cameraFlash('camOther', 'FFFFFF', 1, true)
	setProperty('Dead.visible', false)
	doTweenAlpha('Death', 'retry', 0, 2, 'linear')
end