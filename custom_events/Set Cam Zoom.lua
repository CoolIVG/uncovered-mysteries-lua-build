function onEvent(name, value1, value2)
	if name == "Set Cam Zoom" then
		local props = Split(value1, ', ')

		zoom = props[1]
		time = props[2]
		ease = props[3]

		doTweenZoom('camZoom', 'camGame', zoom, time, ease)
		setProperty('defaultCamZoom', zoom)
	end
end

