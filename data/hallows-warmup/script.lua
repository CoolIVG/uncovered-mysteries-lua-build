local mainthing = {'attic', 'box', 'gfGroup', 'dadGroup', 'boyfriendGroup'}
local prevCamSpeed = nil

function onCreate()
	local order = {'attic', 'candle1', 'candle2', 'stitchy', 'gfGroup', 'boyfriendGroup', 'dadGroup', 'box', 'candle3', 'candle4', 'candle5' }
	local candlePlaces = {{1090,940},{1400,970},{455,1080},{1250,1350},{1820,985}}

	makeLuaSprite('attic', 'stages/realworld/attic', 0, 0);
	scaleObject('attic', 1.25, 1.25);

	for i = 1, 5 do
		local spriteNum = getRandomInt(1, 2)
		makeAnimatedLuaSprite('candle'..i, 'stages/realworld/Candle'..spriteNum, candlePlaces[i][1], candlePlaces[i][2]);
		addAnimationByPrefix('candle'..i, 'LightUp', 'Candle_LitUp', 12, false);
		addAnimationByPrefix('candle'..i, 'Idle', 'Candle_idle', 12, true);
		addAnimationByPrefix('candle'..i, 'Unlit', 'Candle_Unlit', 1, true);
		scaleObject('candle'..i, 0.2+(i*0.01), 0.2+(i*0.01));
	end

	makeLuaSprite('box', 'stages/realworld/box', 1749, 1054);

	makeLuaSprite('stitchy', 'stages/realworld/stitchy', 1005, 350);
	scaleObject('stitchy', 0.9, 0.9);
	setProperty('stitchy.color', getColorFromHex('000000'))
	setProperty('stitchy.alpha', 0)

	--makeAnimatedLuaSprite('lights', 'stages/realworld/lights', 0, 0);
	--addAnimationByPrefix('lights', 'odd', 'oddlight', 1, false);
	--addAnimationByPrefix('lights', 'even', 'evenlight', 1, false);
	--scaleObject('lights', 1.25, 1.25);


	makeLuaSprite('shading', 'stages/realworld/lightning', 0, 0);
	setObjectCamera('shading', 'HUD');
	setProperty('shading.alpha', 0.75);
	setProperty('shading.color', getColorFromHex('000000'))

	addLuaSprite('shading', true);

	for i = 1, #order do
		setObjectOrder(order[i], i)
	end
end

function onCreatePost()
	for i = 1, #mainthing do
		setProperty(mainthing[i]..'.color', getColorFromHex('CCCCCC'))
	end

	setProperty('healthBarBG.alpha', 0)
	setProperty('healthBar.alpha', 0)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('iconsq1.alpha', 0)
	setProperty('iconsq2.alpha', 0)

	setProperty('camGame.alpha', 0)
	setProperty('camHUD.alpha', 0)

	triggerEvent('setCamPos', 1255, 650)
	triggerEvent('quickCamSwap', nil, nil)
end

function onSongStart()
	doTweenAlpha('camGamee', 'camGame', 1, 9.14, 'linear')
	for i = 1, 5 do
		objectPlayAnimation('candle'..i, 'Candle_Unlit', true);
	end
end

function onStepHit()
	if curStep == 64 then
		doTweenAlpha('camhudd', 'camHUD', 1, 2, 'linear')
	elseif curStep == 68 then
		triggerEvent('setCamPos', nil, nil)
		doTweenZoom('camera', 'camGame', 1, 1.5, 'quadInOut')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 160 or curStep == 440 then
		doTweenZoom('camera', 'camGame', 0.65, 1.25, 'quadInOut')
		setProperty('defaultCamZoom', 0.65)
		triggerEvent('setCamPos', 1255, 950)
	elseif curStep == 192 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		triggerEvent('setCamPos', nil, nil)
		triggerEvent('quickCamSwap', nil, nil)
		doTweenZoom('camera', 'camGame', 1.25, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.25)
	elseif curStep == 312 then
		doTweenZoom('camera', 'camGame', 1.3, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.3)
	elseif curStep == 320 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		triggerEvent('quickCamSwap', nil, nil)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 448 then
		doTweenAlpha('nogui', 'camHUD', 0, 1.25, 'linear')
	elseif curStep == 576 then
		triggerEvent('setCamPos', nil, nil)
		doTweenAlpha('yesgui', 'camHUD', 1, 1.25, 'linear')
		doTweenZoom('camera', 'camGame', 1.2, 1.25, 'quadInOut')
		setProperty('defaultCamZoom', 1.15)
	elseif curStep == 700 then
		for i = 1, #mainthing do
			doTweenColor('gocolo'..i, mainthing[i], '000000', 0.5, 'linear')
		end
		doTweenAlpha('hud', 'camHUD', 0, 0.5, 'linear')
	elseif curStep == 704 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('camHUD.alpha', 1)
		setProperty('cameraSpeed', 0.75)
		doTweenZoom('camera', 'camGame', 1.35, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.35)
		triggerEvent('quickCamSwap', nil, nil)
		setProperty('shading.color', getColorFromHex('210021'))
		setProperty('attic.alpha', 0.25)
		for i = 1, #mainthing do
			setProperty(mainthing[i]..'.color', getColorFromHex('B580B5'))
		end
	elseif curStep == 800 then
		triggerEvent('setCamPos', 1255, 800)
		doTweenAlpha('sticcc', 'stichy', 1, 1, 'linear')
		doTweenZoom('camera', 'camGame', 0.65, 3, 'linear')
		setProperty('defaultCamZoom', 0.65)
	elseif curStep == 816 then
		doTweenY('sticc', 'stichy', 150, 3, 'linear')
		doTweenColor('stic', 'stitchy', 'FFFFFF', 2, 'linear')
	elseif curStep == 824 then
		doTweenZoom('camera', 'camGame', 0.875, 1.25, 'quadInOut')
		setProperty('defaultCamZoom', 0.875)
		triggerEvent('setCamPos', 1255, 600)
	elseif curStep == 832 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		triggerEvent('setCamPos', nil, nil)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
		setProperty('attic.alpha', 1)
		setProperty('box.color', getColorFromHex('FFFFFF'))
		setProperty('shading.color', getColorFromHex('000000'))
		setProperty('shading.alpha', 1)
		removeLuaSprite('stitchy', true)
	elseif curStep == 1080 then
		triggerEvent('setCamPos', 1255, 950)
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 1092 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		doTweenAlpha('camGamee', 'camGame', 0, 1.5, 'linear')
		doTweenAlpha('camhudd', 'camHUD', 0, 2, 'linear')
		doTweenZoom('camera', 'camGame', 1.25, 2, 'linear')
		setProperty('defaultCamZoom', 1.25)
	end
end

function onUpdate()
	setProperty('health', 2)
end