curshake = 0.015

fuckshit = 1
base = 10

function onCreatePost()
	precacheSound('ZompiggyJS')

	makeLuaSprite('flashfaint', '', 0, 0)
	makeGraphic('flashfaint', 1280, 720,'FF0000')
	addLuaSprite('flashfaint', true)
	setObjectCamera ('flashfaint', 'camHUD')
	setObjectOrder('flashfaint', getObjectOrder('strumLineNotes')-2)
	setProperty('flashfaint.alpha', 0)
end


function onStepHit()
	--playSound('ZompiggyJS', 1)
	if curStep == 168 or curStep == 336 or curStep == 504 or curStep == 672 or curStep == 840 or curStep == 1008 or curStep == 1176 then
		setProperty('flashfaint.alpha', getProperty('flashfaint.alpha') + 0.1)
		curshake = curshake + 0.01
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 2, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
		setProperty('cameraSpeed', getProperty('cameraSpeed') + 2.5)
		setProperty('songSpeed', getProperty('songSpeed') + 0.5)
		playSound('ZompiggyJS', base)
		base = base + 10
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') > 0.05 then
		setProperty('health', getProperty('health') - 0.025)
	end
	cameraShake('camHUD', curshake, curshake)
	cameraShake('camGame', curshake, curshake)
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if direction == 0 then
		setProperty('boyfriend.x', getProperty('boyfriend.x') - 50)
	elseif direction == 1 then
		setProperty('boyfriend.y', getProperty('boyfriend.y') + 50)
	elseif direction == 2 then
		setProperty('boyfriend.y', getProperty('boyfriend.y') - 50)
	elseif direction == 3 then
		setProperty('boyfriend.x', getProperty('boyfriend.x') + 50)
	end
end
