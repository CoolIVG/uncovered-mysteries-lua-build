duocarapos = 0

function onCreatePost()
	--setProperty('dad.color', getColorFromHex('000000'))
	setProperty('healthBar.color', getColorFromHex('000000'))
	setProperty('healthbar.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconsq1.visible', false)
	setProperty('iconsq2.visible', false)
	duocarapos = getProperty('dad.x')
	setProperty('boyfriend.visible', false)

	setProperty('camHUD.alpha', 0)

	setProperty('camZooming', false)
	setProperty('camZoomingMult', 0)

	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'laugh');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'reallinkbait');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'linkbaitretry');
end

function onStepHit()
	if curStep == 1 then
		doTweenAlpha('slick', 'bslick', 1, 23.05, 'linear')
		doTweenAlpha('gui', 'camHUD', 1, 23.05, 'linear')
	elseif curStep == 208 then
		setProperty('bslick.visible', false)
		removeLuaSprite('bslick', true);
		setProperty('MansionUI.visible', true)
		setProperty('healthbar.visible', true)
		setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0)
		setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1)
		setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2)
		setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3)
	elseif curStep == 212 then
		setProperty('healthBar.color', getColorFromHex('FFFFFF'))
		setProperty('boyfriend.visible', true)
		setProperty('Mansion.visible', true)
	elseif curStep == 216 then
		doTweenY('ohshitherehecomes', 'dad', getProperty('dad.y') - 1400, 0.96, 'linear')
	elseif curStep == 224 then
		cameraFlash('camOther', 'ffffff', 0.8, true)
		--setProperty('dad.color', getColorFromHex('FFFFFF'))

		setProperty('iconP2.visible', true)
		setProperty('iconP1.visible', true)
		setProperty('iconsq1.visible', true)
		setProperty('iconsq2.visible', true)
	elseif curStep == 1008 then
		cameraFlash('camOther', 'ffffff', 0.8, true)
		triggerEvent('Alt Idle Animation', 'dad', '-alt')	
		setProperty('MansionUI.visible', false)
		setProperty('Mansion.visible', false)
		setProperty('Static.visible', true)
		setProperty('MonoMansionUI.visible', true)
	elseif curStep == 1404 then
		triggerEvent('Alt Idle Animation', 'dad', '')
		setProperty('NoTextMansionUI.visible', true)
		setProperty('Static.visible', false)
		setProperty('MonoMansionUI.visible', false)
		setProperty('Void.visible', true)
	elseif curStep == 1537 then
		doTweenX('therehegoes', 'dad', getProperty('dad.x') - 2000, 2, 'linear')
		doTweenAlpha('nomoreicon', 'iconP2', 0, 2, 'linear')
	elseif curStep == 1552 then
		triggerEvent('Alt Idle Animation', 'boyfriend', '-alt')
	elseif curStep == 1685 then
		triggerEvent('Play Animation', 'wait', 'dad')		
	elseif curStep == 1792 then
		doTweenX('welcome back', 'dad', duocarapos, 1, 'linear')
		doTweenAlpha('returnicon', 'iconP2', 1, 1, 'linear')
		triggerEvent('Alt Idle Animation', 'boyfriend', '')
	elseif curStep == 1924 then
		cameraFlash('camOther', 'ffffff', 1, true)
		doTweenAlpha('goGame', 'camGame', 0, 2.5, 'linear')
		doTweenAlpha('goHud', 'camHUD', 0, 3, 'linear')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') >= 0.0125 then
		setProperty('health', getProperty('health') - 0.0125)
	end
	if noteType == 'No Animation' then
		if curStep < 224 then
			triggerEvent('Play Animation', 'scream', 'dad')
		else
			triggerEvent('Play Animation', 'laugh', 'dad')
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'therehegoes' then
		setProperty('dad.x', duocarapos + 3000)
	end
end

function onGameOverStart()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
	setProperty('boyfriend.visible', false);
	startVideo('Linkbait');
	setProperty('inCutscene', false)
end