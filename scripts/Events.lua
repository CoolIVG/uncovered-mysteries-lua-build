local prevCamSpeed = nil

function onCreate()
	makeLuaSprite('CinemaTop', nil, -100, -720)
	makeGraphic('CinemaTop', screenWidth + 200, screenHeight, '000000')
	setObjectCamera('CinemaTop', 'camHUD')
	addLuaSprite('CinemaTop', false)

	makeLuaSprite('CinemaBottom', nil, -100, 720)
	makeGraphic('CinemaBottom', screenWidth + 200, screenHeight, '000000')
	setObjectCamera('CinemaBottom', 'camHUD')
	addLuaSprite('CinemaBottom', false)
end

function onEvent(name, value1, value2)
	if name == 'quickCamSwap' then
		prevCamSpeed = getProperty('cameraSpeed')
		setProperty('cameraSpeed', 100000000)
		runTimer('returnCamSpeed', 0.05)
	elseif name == 'setCamPos' then
		if value1 ~= nil and value2 ~= nil then
			setProperty('isCameraOnForcedPos', true)
			setProperty('camFollow.x', value1)
			setProperty('camFollow.y', value2)			
		else
			setProperty('isCameraOnForcedPos', false)
		end
	end
end


function onTimerCompleted(tag)
	if tag == 'returnCamSpeed' then
		setProperty('cameraSpeed', prevCamSpeed)
	end
end