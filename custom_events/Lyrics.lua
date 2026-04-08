function onCreatePost()
	if songName == 'Spectator' or songName == 'Linkbait' or songName == 'Gelotology' then

		makeLuaSprite('TextBox', 'textbox', 235, 487.5);
		scaleObject('TextBox', 0.45, 0.4);
		setObjectCamera('TextBox', 'camHUD');
		setProperty('TextBox.visible', false);
		addLuaSprite('TextBox', false);

		if songName == 'Gelotology' then
			makeLuaText('captions', 'Lyrics go here', 1000, 150, 510)
			setTextSize('captions', 50);
			setObjectCamera('captions', 'camOther');
			setTextFont('captions', 'orbitron.ttf')
			setTextColor('captions', 'CDC200')
		else
			makeLuaText('captions', 'Lyrics go here', 1000, 150, 560)
			setTextSize('captions', 40);
			setObjectCamera('captions', 'camHUD');
			setTextFont('captions', 'msmincho.ttf')
			setTextColor('captions', 'FFFFFF')
		end
		setTextString('captions',  '')
		addLuaText('captions')
		setTextAlignment('captions', 'center')
		setProperty('captions.visible', false)

		--setTextBorder('captions', 3, 'black')


		makeLuaText('Singer', dadName, 250, 190, 500)
		setTextSize('Singer', 22.5);
		setObjectCamera('Singer', 'camHUD');
		setTextAlignment('Singer', 'center')
		setProperty('Singer.visible', false)
		setTextFont('Singer', 'msmincho.ttf')
		setTextColor('Singer', 'FFFFFF')
		addLuaText('Singer')
	end
end

function onEvent(name, value1, value2)
	if name == "Lyrics" then
		if songName == 'Spectator' or songName == 'Linkbait' or songName == 'Gelotology' then
			if value1 ~= '' then
				setProperty('captions.visible', true)
				setProperty('TextBox.visible', true)
				setProperty('Singer.visible', true)
				setTextString('captions',  '' .. value1)
				setTextColor('captions', value2)
				setTextColor('Singer', value2)
			else
				setProperty('captions.visible', false)
				setProperty('TextBox.visible', false)
				setProperty('Singer.visible', false)
			end
		end
	end
end

