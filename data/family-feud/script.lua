prevCamSpeed = nil
duet = false

function quickCamSwap()
	prevCamSpeed = getProperty('cameraSpeed')
	setProperty('cameraSpeed', 100000000)
	runTimer('returnCamSpeed', 0.05)
end

function opponentNoteHit()
	health = getProperty('health')
	if getProperty('health') > 0.02 then
		setProperty('health', health- 0.02);
	end
end

function onTimerCompleted(tag)
	if tag == 'returnCamSpeed' then
		setProperty('cameraSpeed', prevCamSpeed)
	end
end