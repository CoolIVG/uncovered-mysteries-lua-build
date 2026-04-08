function onCreatePost()
	doTweenColor('FUCK MR STITCHY', 'dad', '000000', 0.001, 'linear')
	doTweenColor('im joking stitchy i love you :(', 'iconP2', '000000', 0.001, 'linear')
	setProperty('health', 2)

	doTweenColor('startdarkt', 'Alleys', '000000', 0.001, 'linear')
	doTweenColor('startdark', 'CarOff', '000000', 0.001, 'linear')
	doTweenColor('startdarkbf', 'boyfriend', '000000', 0.001, 'linear')
	doTweenColor('startdarkgf', 'gf', '000000', 0.001, 'linear')

	setProperty('healthBarBG.alpha', 0)
	setProperty('healthBar.alpha', 0)
	setProperty('iconP1.alpha', 0)
	setProperty('iconsq1.alpha', 0)
	setProperty('iconsq2.alpha', 0)
end

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
		doTweenZoom('camera', 'camGame', 0.7, 0.1, 'linear')
		setProperty('defaultCamZoom', 0.7)
		setProperty('healthBarBG.alpha', 1)
		setProperty('healthBar.alpha', 1)
		setProperty('iconP1.alpha', 1)
		setProperty('iconP2.alpha', 1)
		setProperty('iconsq1.alpha', 1)
		setProperty('iconsq2.alpha', 1)
		for i = 0, 3 do
			noteTweenAlpha('Note' .. i, i, 1, 0.01, 'linear')
		end
		doTweenColor('nowlightt', 'Alleys', 'FFFFFF', 0.001, 'linear')
		doTweenColor('nowlight', 'CarOff', 'FFFFFF', 0.001, 'linear')
		doTweenColor('nowlightbf', 'boyfriend', 'FFFFFF', 0.001, 'linear')
		doTweenColor('nowlightgf', 'gf', 'FFFFFF', 0.001, 'linear')
	elseif curStep == 278 or curStep == 281 or curStep == 284 then
		setProperty('defaultCamZoom', 0.9)
		setProperty('StitchLightFloor.alpha', 1)
		doTweenColor('StitchyL', 'dad', 'FFFFFF', 0.001, 'linear')
		doTweenColor('StitchyIconL', 'iconP2', 'FFFFFF', 0.001, 'linear')
		doTweenAlpha('StitchyLight', 'StitchLightFloor', 0, 0.42, 'linear')
	end
end

function onTweenCompleted(tag)
	if tag == 'im joking stitchy i love you :(' then
		setProperty('iconP2.alpha', 0)
		for i = 0, 3 do
			noteTweenAlpha('Note' .. i, i, 0, 0.001, 'linear')
		end		
	elseif tag == 'StitchyL' then
		doTweenColor('StitchyD', 'dad', '000000', 0.42, 'linear')
		doTweenColor('StitchyIconD', 'iconP2', '000000', 0.42, 'linear')
	end
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
		setProperty('camFollow.x', 400)
		setProperty('camFollow.y', 400)
	end
	if getProperty('health') < 0.4 then
		doTweenAlpha('BG', 'Spotlight', 1, 0.15, 'linear')
	else
		doTweenAlpha('BG', 'Spotlight', 0, 0.15, 'linear')
	end
end