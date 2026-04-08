function onCreatePost()
	for i = 1, 8 do
		makeLuaSprite('scary'..i, 'stages/trenches/spooky/spooky'..i, 0, 0)
		setProperty('scary'..i..'.alpha', 0.25)
		setObjectCamera('scary'..i, 'other')
		scaleObject('scary'..i, 1.425, 1.45)
		setProperty('scary'..i..'.visible', false)
		addLuaSprite('scary'..i, false)
	end
end


--function onSongStart()
	--doTweenAlpha('BAR', 'Binary', 0.5, 6.1, 'linear')
--end

function spookyImages(image)
	for i = 1, 8 do
		setProperty('scary'..i..'.visible', false)
	end
	setProperty('scary'..image..'.visible', true)
end

local pluh = 1
function onBeatHit()
	if curBeat %2 == 0 then
		if curStep > 703 and curStep < 800 then
			spookyImages(getRandomInt(1, 8))
		elseif curStep > 287 and curStep < 528 or curStep > 799 and curStep < 912 then
			if pluh == 1 then
				setProperty('camHUD.angle', 2)
				setProperty('camGame.angle', 1)
				pluh = 2
			elseif pluh == 2 then
				setProperty('camHUD.angle', -2)
				setProperty('camGame.angle', -1)
				pluh = 1
			end
			doTweenAngle('cameragame', 'camGame', 0, 60 / bpm, 'linear')
			doTweenAngle('cameragui', 'camHUD', 0, 60 / bpm, 'linear')
		end
	end
end

function onStepHit()
	if curStep == 32 or curStep == 48 or curStep == 64 or curStep == 80 or curStep == 96 or curStep == 112 or curStep == 128 or curStep == 144 then
		if curStep == 32 then
			cameraFlash('camHUD', 'FFFFFF', 1, true)
		else
			cameraFlash('camGame', 'FFFFFF', 0.5, true)
		end
		doTweenZoom('camera', 'camGame', 1.2, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.2)
		setProperty('forest.alpha', 0.5)
		setProperty('frost.alpha', 0.5)
	elseif curStep == 38 or curStep == 54 or curStep == 70 or curStep == 86 or curStep == 102 or curStep == 118 or curStep == 134 or curStep == 150 then
		doTweenZoom('camera', 'camGame', 0.9, 0.3, 'quadInOut')
		setProperty('defaultCamZoom', 0.9)
		doTweenAlpha('for', 'forest', 1, 0.3, 'linear')
		doTweenAlpha('frost', 'frost', 0.25, 0.3, 'linear')
	elseif curStep == 280 or curStep == 536 then
		doTweenZoom('camera', 'camGame', 1, 0.65, 'quadInOut')
		setProperty('defaultCamZoom', 1)
		doTweenColor('laura', 'dad', '000000', 0.65, 'linear')
		doTweenAlpha('bg', 'forest', 0, 0.65, 'linear')
		doTweenAlpha('fr', 'frost', 0, 0.65, 'linear')
	elseif curStep == 288 then
		cameraFlash('camHUD', 'FFFFFF', 1, true)
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('frost.alpha', 0.5)
		setProperty('forest.alpha', 1)
		doTweenZoom('camera', 'camGame', 0.775, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.775)
		for i = 1, 1000 do
			setProperty('Particle'..i..'.visible', true)
		end
	elseif curStep == 544 then
		cameraFlash('camHUD', 'FFFFFF', 1, true)
		setProperty('whiteBg.alpha', 1)
		doTweenZoom('camera', 'camGame', 0.6, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.6)
	elseif curStep == 608 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('frost.alpha', 0.65)
		doTweenZoom('camera', 'camGame', 1.25, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.25)
		setProperty('forest.alpha', 0.5)
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('dad.alpha', 0.75)
		for i = 1, 1000 do
			setProperty('Particle'..i..'.velocity.y', getRandomInt(2000, 2500))
			setProperty('Particle'..i..'.velocity.x', 750)
			setProperty('Particle'..i..'.angle', getRandomInt(35, 60))
		end
	elseif curStep == 704 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		for i = 1, 1000 do
			setProperty('Particle'..i..'.visible', false)
		end
		spookyImages(getRandomInt(1, 8))
		setProperty('camHUD.visible', false)
		setProperty('camGame.visible', false)
		setProperty('frost.visible', false)
	elseif curStep == 800 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('camHUD.visible', true)
		setProperty('camGame.visible', true)
		setProperty('frost.visible', true)
		for i = 1, 8 do
			setProperty('scary'..i..'.visible', false)
		end
	elseif curStep == 1056 then
		for i = 1, 1000 do
			setProperty('Particle'..i..'.visible', false)
		end
		setProperty('frost.visible', false)
	elseif curStep == 1312 then
		cameraFlash('camOther', 'FFFFFF', 1, true)

		doTweenX('camsway0', 'camHUD', getProperty('camHUD.x') + 25, (bpm/60) / 2, 'sineInOut')
		doTweenX('camssway0', 'camOther', getProperty('camOther.x') + 25, (bpm/60) / 2, 'sineInOut')
		doTweenX('camsssway0', 'camGame', getProperty('camGame.x') + 25, (bpm/60) / 2, 'sineInOut')

		setProperty('frost.visible', true)
		setProperty('frost.alpha', 0.35)
		removeLuaSprite('forest', true)
		setProperty('pit.visible', true)
		setProperty('gf.visible', false)
		setProperty('dad.visible', true)
		doTweenAlpha('frosty', 'frost', 0.75, 21.5, 'linear')
		doTweenAlpha('pit', 'pit', 0.25, 21.5, 'linear')
	elseif curStep == 1554 then
		doTweenY('daddown', 'dad', getProperty('dad.y') + 300, 1.15, 'cubeIn')
		doTweenZoom('camera', 'camGame', 1.3, 1.15, 'quadInOut')
		setProperty('defaultCamZoom', 1.3)
	elseif curStep == 1564 then
		doTweenAlpha('pitgo', 'pit', 0, 0.35, 'linear')
		doTweenAlpha('dadgo', 'dad', 0, 0.35, 'linear')
	elseif curStep == 1568 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		cancelTween('camsway1')
		cancelTween('camssway1')
		cancelTween('camsssway1')

		setProperty('camHUD.x', 0)
		setProperty('camGame.x', 0)
		setProperty('camOther.x', 0)
	elseif curStep == 1822 then
		setProperty('camGame.visible', false)
		setProperty('camHUD.visible', false)
	elseif curStep == 1824 then
		doTweenAlpha('nomore', 'camOther', 0, 1.25, 'linear')
	end
end

function onTweenCompleted(tag)
	if curStep > 1311 and curStep < 1568 then
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