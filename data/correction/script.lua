uistuff = {'iconP2', 'iconP1', 'iconsq2', 'iconsq1', 'healthBar', 'healthBarBG', 'timeTxt', 'scoreTxt'}

function onCreatePost()
	setProperty('GlowFlash.visible', false)
	--for i = 1, #uistuff do
		--setProperty(uistuff[i]..'.visible', false)
	--end

	makeLuaSprite('Studio', 'stages/desolate/robloxstudio', 0, 0);
	scaleObject('Studio', 0.67, 0.71);
	setObjectCamera('Studio', 'other');
	setProperty('Studio.visible', false)
	addLuaSprite('Studio', false);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	--cameraShake('camHUD', 1, 1)
	--cameraShake('camGame', 1, 1)
end

function onStepHit()
	if curStep == 688 then
		triggerEvent('Alt Idle Animation', 'dad', '-alt')

		--THIS IS ALL THE STUDIO GUI THING FOR DESOLATE--
		setProperty('Studio.visible', true)
		setProperty('camZooming', false)
		setProperty('camZoomingMult', 0)
		setProperty('camZoomingDecay', 0)

		doTweenZoom('camera', 'camHUD', 0.75, 0.01, 'linear')
		doTweenZoom('camerat', 'camGame', 0.7, 0.01, 'linear')

		setProperty('camHUD.x', -150)
		setProperty('camGame.x', -150)

		for i = 0, 3 do
    			setPropertyFromGroup('playerStrums', i, 'x', _G['defaultPlayerStrumX'..i] + 100)
    			setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultOpponentStrumX'..i] + 90)
		end

		setProperty('timeTxt.x', getProperty('timeTxt.x') + 110)
		setProperty('scoreTxt.x', getProperty('scoreTxt.x') + 110)
		setTextSize('timeTxt', 75);
		setTextSize('scoreTxt', 75);
		-------------------------------------------------

	end
end