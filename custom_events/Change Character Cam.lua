function onEvent(name, value1, value2)
	if name == 'Change Character Cam' then
		local xChange, yChange = value2:match('^%s*(-?%d+)%s*,%s*(-?%d+)%s*$')
		xChange = tonumber(xchange)
		yChange = tonumber(ychange)
		if xChange and yChange then
			setProperty(value1..'.cameraPosition[0]', getProperty(value1..'.cameraPosition[0]') + xchange)
			setProperty(value1..'.cameraPosition[1]', getProperty(value1..'.cameraPosition[1]') + ychange)
		else
			debugPrint('Error: Invalid offset format in value2. Expected format: "x, y"')
		end
	end
end
