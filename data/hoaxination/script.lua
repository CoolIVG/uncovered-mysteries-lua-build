
basezoom = 0
dadxorigin = 0
FUCKINGFOCUS = false

camon = boyfriend

function onCreatePost()
	dadxorigin = getProperty('dad.x')
	basezoom = getProperty('defaultCamZoom')

	doTweenColor('icon', 'iconP2', '000000', 0.001, 'linear')
	setProperty('camHUD.alpha', 0)	
	setProperty('camGame.alpha', 0)
end

function onSongStart()
	doTweenAlpha('HUD', 'camHUD', 1, 12.38, 'linear')
end

function onStepHit()
	if curStep == 128 or curStep == 512 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		doTweenColor('icon', 'iconP2', 'FFFFFF', 0.001, 'linear')
		setProperty('camGame.alpha', 1)
		setProperty('defaultCamZoom', basezoom)
		FUCKINGFOCUS = false
		setProperty('cameraSpeed', 2)
	elseif curStep == 384 then
		cameraFlash('camOther', 'FFFFFF', 0.25, true)
		setProperty('defaultCamZoom', 1.1)
		FUCKINGFOCUS = true
		setProperty('cameraSpeed', 1000000)
	elseif curStep == 704 or curStep == 720 or curStep == 736 or curStep == 752 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.1, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
		doTweenAlpha('GalleryA', 'Gallery', getProperty('Gallery.alpha') - 0.25, 0.1, 'linear')
		doTweenAlpha('GlobeA', 'Globe', getProperty('Globe.alpha') - 0.25, 0.1, 'linear')
		doTweenAlpha('OceanA', 'Ocean', getProperty('Ocean.alpha') - 0.25, 0.1, 'linear')
		doTweenAlpha('GFA', 'gf', getProperty('gf.alpha') - 0.25, 0.1, 'linear')
	elseif curStep == 768 then
		cameraFlash('camOther', '000000', 0.5, true)
		setProperty('Gallery.alpha', 1)
		setProperty('Globe.alpha', 1)
		setProperty('Ocean.alpha', 1)
		setProperty('gf.alpha', 1)
		doTweenZoom('camera', 'camGame', bazezoom, 0.1, 'linear')
		setProperty('defaultCamZoom', basezoom)
	elseif curStep == 1040 or curStep == 1072 or curStep == 1104 or curStep == 1424 or curStep == 1456 or curStep == 1488 then
		doTweenColor('BackgroundD', 'Gallery', '000000', 0.5, 'linear')
		doTweenColor('OceanD', 'Ocean', '000000', 0.5, 'linear')
		doTweenColor('GlobeD', 'Globe', '000000', 0.5, 'linear')
		doTweenColor('dadD', 'dad', '000000', 0.5, 'linear')
		doTweenColor('gfD', 'gf', '000000', 0.5, 'linear')
		doTweenColor('bfD', 'boyfriend', '000000', 0.5, 'linear')
		doTweenX('MoveTowards', 'dad', getProperty('dad.x') + 110, 1.53, 'linear')
	elseif curStep == 1056 or curStep == 1088 or curStep == 1120 or curStep == 1440 or curStep == 1472 or curStep == 1504 then
		doTweenColor('BackgroundL', 'Gallery', 'FFFFFF', 0.5, 'linear')
		doTweenColor('OceanL', 'Ocean', 'FFFFFF', 0.5, 'linear')
		doTweenColor('GlobeL', 'Globe', 'FFFFFF', 0.5, 'linear')
		doTweenColor('dadL', 'dad', 'FFFFFF', 0.5, 'linear')
		doTweenColor('gfL', 'gf', 'FFFFFF', 0.5, 'linear')
		doTweenColor('bfL', 'boyfriend', 'FFFFFF', 0.5, 'linear')
	elseif curStep == 1148 or curStep == 1532 then
		cameraFlash('camOther', '000000', 0.5, true)
		setProperty('dad.x', dadxorigin)
		setProperty('defaultCamZoom', basezoom)
	elseif curStep == 1536 then
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
	elseif curStep == 1568 then
		setProperty('camGame.angle', 0)
		setProperty('camHUD.angle', 0)
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Hey!' then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.1, 'linear')
	elseif noteType == 'No Animations' then
		triggerEvent('Play Animation', 'attack', 'boyfriend')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') >= 0.01 then
		setProperty('health', getProperty('health') - 0.01)
	end
	if curStep > 1551 and curStep < 1568 then
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

function onUpdate()
	if FUCKINGFOCUS == true then
		if mustHitSection then
			setProperty('camFollow.x', 900)
			setProperty('camFollow.y', 450)
		else
			setProperty('camFollow.x', 200)
			setProperty('camFollow.y', 300)
		end
	end
	if curStep > 1023 and curStep < 1152 or curStep > 1407 and curStep < 1535 then	
		setProperty('camFollow.x', 575)
		setProperty('camFollow.y', 375)
	elseif curStep > 1535 then
		if camon == 'thegirlfriend' then
			setProperty('camFollow.x', 700)
			setProperty('camFollow.y', 150)
		elseif camon == 'thedad' then
			setProperty('camFollow.x', 200)
			setProperty('camFollow.y', 300)
		elseif camon == 'theboyfriend' then
			setProperty('camFollow.x', 900)
			setProperty('camFollow.y', 450)
		else
			setProperty('camFollow.x', 650)
			setProperty('camFollow.y', 375)
		end
	end
end