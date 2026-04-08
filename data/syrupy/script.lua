basedadx = nil
function onCreatePost()
	basedadx = getProperty('dad.x')
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') > 0.05 then
		setProperty('health', getProperty('health') - 0.01)
	end
	if isSustainNote then
		if direction == 0 then
			setProperty('dad.x', getProperty('dad.x') - 15)
		elseif direction == 3 then
			setProperty('dad.x', getProperty('dad.x') + 15)
		end
	end
	if noteType == 'No Animation' then
		triggerEvent('Play Animation', 'laugh', 'gf')
	end
end

function onUpdate()
	if getProperty('dad.animation.finished') and (getProperty('dad.animation.name') == 'singLEFT' or getProperty('dad.animation.name') == 'singRIGHT') then
		setProperty('dad.x', basedadx)
	end
end

function onStepHit()
	if curStep == 132 then
		triggerEvent('Play Animation', 'talking', 'dad')
	elseif curStep == 244 or curStep == 372 or curStep == 1844 then
		doTweenAlpha('faded', 'behind', 0, 0.9, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.25, 0.9, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.25)
	elseif curStep == 256 or curStep == 384 or curStep == 1856 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.25, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.25)
		setProperty('behind.alpha', 1)
	elseif curStep == 760 then
		doTweenY('hiduocara', 'gf', 1000, 0.35, 'linear')
	elseif curStep == 768 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('gf.visible', false)
	elseif curStep == 1856 then
		setProperty('behind.alpha', 1)
	elseif curStep > 1791 and curStep < 1856 and curStep % 4 == 0 then
		setProperty('behind.color', getColorFromHex(string.format("%02X%02X%02X", getRandomInt(0, 255), getRandomInt(0, 255), getRandomInt(0, 255))))
	end
end

--function onBeatHit()
