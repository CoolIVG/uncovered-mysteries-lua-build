--this code is all old af an not at all optimised mb lol
currentdrain = 0
dobeat = false
glitchthisfucker = false
glitchlevel = 0
pausetimer = false
antialiasing = false
defaultdadx = nil
defaultboyx = nil
inCamSwap = false
seconds = 37
minutes = 0

function onCreatePost()
	addCharacterToList('LittleBrotherBlind', 'dad')
	addCharacterToList('P0RK', 'dad')

	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'piggyjumpscare')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'playthinggameover')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'PlaythingRetry')
	if getPropertyFromClass('ClientPrefs', 'globalAntialiasing') == true then
		antialiasing = true
	else
		antialiasing = false
	end
	setProperty('timeTxt.visible', false)
	makeLuaText('FakeTime', 'hi!!!', getProperty('timeTxt.width'), getProperty('timeTxt.x'), getProperty('timeTxt.y'))
	setTextFont('FakeTime', 'msmincho.ttf')
	setTextColor('FakeTime', 'FFFFFF')
	setTextSize('FakeTime', 50);
	addLuaText('FakeTime')
	setObjectCamera('FakeTime', 'camHUD');
	setTextAlignment('FakeTime', 'center')
	makeAnimatedLuaSprite('Game', 'stages/house/PlayingIntro', -50, 0);
	addAnimationByPrefix('Game', 'greeting', 'PlayingWithMyThing', 20, false);
	setObjectCamera('Game', 'other');
	setProperty('Game.alpha', 0);
	setObjectOrder('Game', 3);
	addLuaSprite('Game', false);
	makeLuaSprite('Laugh', 'stages/house/Laughter', 285, 300);
	scaleObject('Laugh', 0.6, 0.6);
	setObjectCamera('Laugh', 'other');
	setProperty('Laugh.alpha', 0);
	setObjectOrder('Laugh', 4);
	addLuaSprite('Laugh', false);
	makeLuaSprite('Matter', 'stages/house/Matter', 285, 300);
	scaleObject('Matter', 0.6, 0.6);
	setObjectCamera('Matter', 'other');
	setProperty('Matter.alpha', 0);
	setObjectOrder('Matter', 5);
	addLuaSprite('Matter', false);
	makeLuaSprite('Afraid', 'stages/house/Darkness', 285, 250);
	scaleObject('Afraid', 0.6, 0.6);
	setObjectCamera('Afraid', 'other');
	setProperty('Afraid.alpha', 0);
	setObjectOrder('Afraid', 6);
	addLuaSprite('Afraid', false);
	makeLuaSprite('Wake', 'stages/house/Wake1', 255, 125)
	setObjectCamera('Wake', 'camOther')
	setProperty('Wake.alpha', 0)
	setObjectOrder('Wake', 7)
	addLuaSprite('Wake', true)
	makeLuaSprite('Wake2', 'stages/house/Wake2', 255, 125)
	setObjectCamera('Wake2', 'camOther')
	setProperty('Wake2.alpha', 0)
	setObjectOrder('Wake2', 8)
	addLuaSprite('Wake2', true)
	makeAnimatedLuaSprite('jumpscare', 'stages/house/p0rkjump', -150, 0);
	makeAnimatedLuaSprite('retry', 'stages/house/P0rkGameOver', 0, 0);
	setProperty('jumpscare.visible', false)
	setProperty('retry.visible', false)
	setProperty('camHUD.alpha', 0)	
	setProperty('healthBarBG.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('iconsq1.visible', false)
	setProperty('iconsq2.visible', false)
	setProperty('dad.color', getColorFromHex('000000'))
	setProperty('boyfriend.color', getColorFromHex('000000'))
	setProperty('gf.color', getColorFromHex('000000'))
	setProperty('House.visible', false)
	setProperty('LightFloor.visible', false)
	makeLuaSprite('CinemaTop', nil, 0, -720)
	makeGraphic('CinemaTop', screenWidth, screenHeight, '000000')
	setObjectCamera('CinemaTop', 'camHUD')
	setObjectOrder('CinemaTop', getObjectOrder('strumLineNotes')-1)
	addLuaSprite('CinemaTop', false)
	makeLuaSprite('CinemaBottom', nil, 0, 720)
	makeGraphic('CinemaBottom', screenWidth, screenHeight, '000000')
	setObjectCamera('CinemaBottom', 'camHUD')
	setObjectOrder('CinemaBottom', getObjectOrder('strumLineNotes')-2)
	addLuaSprite('CinemaBottom', false)

end
function onBeatHit()
	if dobeat == true then
		if curBeat %2 == 0 then
			setProperty('RedLight.visible', true)
		else
			setProperty('RedLight.visible', false)	
		end
	end
end
function quickCamSwap()
	inCamSwap = true
	prevCamSpeed = getProperty('cameraSpeed')
	setProperty('cameraSpeed', 100000000)
	runTimer('returnCamSpeed', 0.05)
end

function onSongStart()
	callScript('scripts/VideoSpriteHandler', 'makeVideoSprite', {'videotag', 'Plaything', -320, -180, 'camOther', false})
	scaleObject('videotag', 0.65, 0.65)
end

function onStepHit()
	if glitchlevel == 1 and glitchthisfucker == true then
		setProperty ('iconP2.angle', getRandomInt(-15, 15))
	end
	if curStep == 64 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		setProperty('videotag.visible', false)
		runTimer('timershit', 1)
		doTweenAlpha('HUD', 'camHUD', 1, 3.99, 'linear')
	elseif curStep == 112 then
		cameraFlash('camOther', '000000', 0.25, true)
		setProperty('camHUD.visible', false)
		setProperty('Game.alpha', 1);
		objectPlayAnimation('Game', 'greeting', false);
	elseif curStep == 128 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('CinemaTop.y', -600)
		setProperty('CinemaBottom.y', 600)
		doTweenZoom('camera', 'camGame', 1.05, 1, 'quadInOut')
		setProperty('defaultCamZoom', 1.05)
		setProperty('Wake.alpha', 1)
		doTweenAlpha('WakeGo1', 'Wake', 0, 3, 'linear')
		setProperty('camHUD.visible', true)
		setProperty('healthBarBG.visible', true)
		setProperty('healthBar.visible', true)
		setProperty('iconP1.visible', true)
		setProperty('iconP2.visible', true)
		setProperty('iconsq1.visible', true)
		setProperty('iconsq2.visible', true)
		removeLuaSprite('Game', true);
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
		setProperty('House.visible', true)
		setProperty('LightFloor.visible', true)
	elseif curStep == 192 or curStep == 320 or curStep == 448 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		quickCamSwap()
	elseif curStep == 256 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		doTweenZoom('camera', 'camGame', 0.95, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.95)
		quickCamSwap()
	elseif curStep == 384 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.75)
		doTweenY('TopBar1', 'CinemaTop', -720, 1.5, 'quadInOut')
		doTweenY('BottomBar1', 'CinemaBottom', 720, 1.5, 'quadInOut')
	elseif curStep == 511 then
		glitchthisfucker = true
		glitchlevel = 1
		setProperty('dad.antialiasing', false);
		doTweenAngle('gamecamera', 'camGame', -1, 0.5, 'quadInOut')
		doTweenAngle('screencamera', 'camHUD', 1, 0.5, 'quadInOut')
		doTweenZoom('camera', 'camGame', 1, 0.5, 'linear')
		doTweenAlpha('girlf', 'gf', 0, 0.5, 'linear')
		setProperty('defaultCamZoom', 1)
		doTweenAlpha('static', 'Static', 0.25, 0.5, 'linear')
		doTweenAlpha('bglight', 'LightFloor', 0.4, 0.5, 'linear')
		doTweenAlpha('house', 'House', 0.5, 0.5, 'linear')
	elseif curStep == 520 then
		setProperty('camGame.alpha', 0)
		setProperty('camHUD.alpha', 0)
		setProperty('Laugh.alpha', 1);
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 528 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('CinemaTop.y', -600)
		setProperty('CinemaBottom.y', 600)
		doTweenZoom('camera', 'camGame', 1.05, 1, 'quadInOut')
		setProperty('defaultCamZoom', 1.05)
		setProperty('Wake.alpha', 1)
		doTweenAlpha('WakeGo1', 'Wake', 0, 3, 'linear')
		setProperty('LightFloor.visible', false)
		setProperty('camGame.alpha', 1)
		setProperty('camHUD.alpha', 1)
		setProperty('camGame.angle', 0)
		setProperty('camHUD.angle', 0)
		removeLuaSprite('Laugh', true);
		setProperty('Static.alpha', 1)
		doTweenAlpha('static', 'Static', 0, 0.5, 'linear')
		setProperty('House.alpha', 1)
		setProperty('gf.alpha', 1)
		pausetimer = false
		doTweenColor('uhohtimer', 'FakeTime', 'FFFFFF', 0.001, 'linear');
		currentdrain = 0.005
		seconds = 32
		runTimer('timershit', 1)
	elseif curStep == 592 or curStep == 1008 or curStep == 848 or curStep == 1136 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		setProperty('Static.alpha', 1)
		doTweenAlpha('static', 'Static', 0, 0.5, 'linear')
		quickCamSwap()
	elseif curStep == 608 then
		setProperty('defaultCamZoom', 0.6)
		doTweenAlpha('static', 'Static', 0.15, 0.48, 'linear')
		doTweenZoom('camera', 'camGame', 0.75, 0.48, 'quadInOut')
		doTweenColor('houseD', 'House', '000000', 0.48, 'linear')
		doTweenAlpha('gfD', 'gf', 0, 0.48, 'linear')
		doTweenAlpha('dadD', 'dad', 0, 0.48, 'linear')
	elseif curStep == 616 then
		setProperty('defaultCamZoom', 1.05)
		setProperty('Static.alpha', 0)
		doTweenZoom('camera', 'camGame', 1.05, 0.0001, 'linear')
		doTweenColor('houseD', 'House', 'FFFFFF', 0.0001, 'linear')
		setProperty('dad.alpha', 1)
		setProperty('gf.alpha', 1)
	elseif curStep == 656 or curStep == 1072 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		quickCamSwap()
		setProperty('Static.alpha', 1)
		doTweenAlpha('static', 'Static', 0, 0.5, 'linear')
		doTweenZoom('camera', 'camGame', 0.95, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 720 or curStep == 848 or curStep == 1264 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		quickCamSwap()
		setProperty('Static.alpha', 1)
		doTweenAlpha('static', 'Static', 0, 0.5, 'linear')
	elseif curStep == 784 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.75)
		doTweenY('TopBar1', 'CinemaTop', -720, 1.5, 'quadInOut')
		doTweenY('BottomBar1', 'CinemaBottom', 720, 1.5, 'quadInOut')
		setProperty('Static.alpha', 1)
		doTweenAlpha('static', 'Static', 0, 0.5, 'linear')
	elseif curStep == 912 then
		setProperty('defaultCamZoom', 0.7)
		setProperty('Static.alpha', 1)
		setProperty('House.alpha', 0)
		setProperty('gf.alpha', 0)
		doTweenColor('dadD', 'dad', '000000', 0.0001, 'linear')
		doTweenColor('bfD', 'boyfriend', '000000', 0.0001, 'linear')
	elseif curStep == 928 then
		setProperty('camGame.alpha', 0)
		setProperty('camHUD.alpha', 0)
	elseif curStep == 933 then
		setProperty('Matter.alpha', 1)
		triggerEvent('Change Character', 'dad', 'LittleBrotherBlind')
	elseif curStep == 944 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		quickCamSwap()
		setProperty('CinemaTop.y', -600)
		setProperty('CinemaBottom.y', 600)
		setProperty('Wake.alpha', 1)
		doTweenAlpha('WakeGo1', 'Wake', 0, 3, 'linear')
		setProperty('camGame.alpha', 1)
		setProperty('camHUD.alpha', 1)
		doTweenColor('dadF', 'dad', 'FFFFFF', 0.0001, 'linear')
		doTweenColor('bfF', 'boyfriend', 'FFFFFF', 0.0001, 'linear')
		removeLuaSprite('Matter', true);
		doTweenAlpha('static', 'Static', 0, 0.5, 'linear')
		pausetimer = false
		doTweenColor('uhohtimer', 'FakeTime', 'FFFFFF', 0.001, 'linear');
		seconds = 30
		runTimer('timershit', 1)
		glitchlevel = 2
		setProperty('RedLight.visible', true)
		if not middleScroll then
			setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
			setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
			setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
			setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

			setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
		end
		triggerEvent('Alt Idle Animation', 'gf', '-alt')
		setProperty('House.alpha', 1)
		currentdrain = 0.0075
		setProperty('gf.alpha', 1)
		doTweenZoom('camera', 'camGame', 1.05, 1, 'quadInOut')
		setProperty('defaultCamZoom', 1.05)
	elseif curStep == 1024 then
		setProperty('defaultCamZoom', 0.6)
		doTweenAlpha('static', 'Static', 0.15, 0.48, 'linear')
		doTweenZoom('camera', 'camGame', 0.75, 0.48, 'quadInOut')
		doTweenColor('redlight', 'RedLight', '000000', 0.48, 'linear')
		doTweenColor('houseD', 'House', '000000', 0.48, 'linear')
		doTweenAlpha('gfD', 'gf', 0, 0.48, 'linear')
		doTweenAlpha('dadD', 'dad', 0, 0.48, 'linear')
	elseif curStep == 1032 then
		setProperty('defaultCamZoom', 1.05)
		setProperty('Static.alpha', 0)
		doTweenZoom('camera', 'camGame', 1.05, 0.0001, 'linear')
		doTweenColor('houseD', 'House', 'FFFFFF', 0.0001, 'linear')
		doTweenColor('redlight', 'RedLight', 'FFFFFF', 0.0001, 'linear')
		setProperty('dad.alpha', 1)
		setProperty('gf.alpha', 1)
	elseif curStep == 1200 then
		cameraFlash('camOther', 'FFFFFF', 1.5, true)
		doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.75)
		quickCamSwap()
		setProperty('Static.alpha', 1)
		doTweenAlpha('static', 'Static', 0, 0.5, 'linear')
		doTweenY('TopBar1', 'CinemaTop', -720, 1.5, 'quadInOut')
		doTweenY('BottomBar1', 'CinemaBottom', 720, 1.5, 'quadInOut')
	elseif curStep == 1280 then
		setProperty('camGame.visible', false)
	elseif curStep == 1292 then
		setProperty('Afraid.alpha', 1)
		setProperty('camHUD.visible', false)
	elseif curStep == 1316 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('camHUD.visible', true)
		removeLuaSprite('Afraid', true)
		setProperty('Static.alpha', 1)
		setProperty('gf.alpha', 0)
		doTweenColor('dadD', 'dad', '000000', 0.0001, 'linear')
		doTweenColor('bfD', 'boyfriend', '000000', 0.0001, 'linear')
		setProperty('camGame.visible', true)
	elseif curStep == 1321 then
		doTweenAngle('gamecamera', 'camGame', 1, 0.025, 'linear')
		doTweenAngle('screencamera', 'camHUD', 1.5, 0.02, 'linear')
	elseif curStep == 1324 then
		doTweenAngle('gamecamera', 'camGame', -1, 0.025, 'linear')
		doTweenAngle('screencamera', 'camHUD', -1.5, 0.02, 'linear')
		doTweenAlpha('HUD', 'camHUD', 0, 3, 'linear')
		doTweenAlpha('game', 'camGame', 0, 3, 'linear')
	elseif curStep == 1360 then
		setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0)
		setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1)
		setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2)
		setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3)
		setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0)
		setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1)
		setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2)
		setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3)
		setProperty('FakeTime.visible', false)
		setProperty('timeTxt.visible', true)
		setProperty('health', 1)
		triggerEvent('Change Character', 'dad', 'P0RK')
		doTweenColor('bfF', 'boyfriend', 'FFFFFF', 0.0001, 'linear')
		setProperty('camGame.angle', 0)
		setProperty('camHUD.angle', 0)
		setProperty('Static.alpha', 0)
		glitchthisfucker = false
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
		triggerEvent('Alt Idle Animation', 'gf', '')
		currentdrain = 0.01
		setProperty ('iconP2.visible', true)
		setProperty('cameraSpeed', 3.5);
		setProperty('dad.antialiasing', true);
		setProperty('Spooky.visible', true)
		setProperty('Spooky.alpha', 0.5)
		setProperty('SpookyLights.visible', true)
		setProperty('House.alpha', 0.15)
		setProperty('defaultCamZoom', 1)
		setProperty('songSpeed', 3.4)
		setProperty('CinemaTop.y', -600)
		setProperty('CinemaBottom.y', 600)
	elseif curStep == 1392 then
		doTweenAlpha('HUD', 'camHUD', 1, 3, 'linear')
	elseif curStep == 1424 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('Wake2.alpha', 1)
		doTweenAlpha('WakeGo2', 'Wake2', 0, 3, 'linear')
		setProperty('camGame.alpha', 1)
		defaultdadx = getProperty('dad.x')
		setProperty('boyfriend.alpha', 0.5)
		setProperty('LightFloor.visible', true)
	elseif curStep == 1488 then
		cameraFlash('camOther', 'FF0000', 1, true)
		doTweenAlpha('dadgo', 'dad', 0.5, 0.25, 'linear')
		doTweenAlpha('boyback', 'boyfriend', 1, 0.25, 'linear')
		quickCamSwap()
	elseif curStep == 1552 then
		cameraFlash('camOther', '000000', 2, true)
		quickCamSwap()
		setProperty('CinemaTop.y', -720)
		setProperty('CinemaBottom.y', 720)		
		setProperty('dad.alpha', 1)
		setProperty('gf.alpha', 1)
		setProperty('Spooky.alpha', 1)
		setProperty('House.alpha', 1)
		setProperty('defaultCamZoom', 0.8)
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
	elseif curStep == 1616 then
		cameraFlash('camOther', '000000', 2, true)
		cancelTween('TopBar2')
		cancelTween('BottomBar2')
		setProperty('CinemaTop.y', -660)
		setProperty('CinemaBottom.y', 660)
		quickCamSwap()
		setProperty('defaultCamZoom', 0.8)
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
	elseif curStep == 1568 or curStep == 1584 or curStep == 1632 or curStep == 1648 then
		doTweenY('TopBar2', 'CinemaTop', getProperty('CinemaTop.y') + 40, 0.5, 'quadInOut')
		doTweenY('BottomBar2', 'CinemaBottom', getProperty('CinemaBottom.y') - 40, 0.5, 'quadInOut')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.25, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 1600 or curStep == 1664 then
		doTweenY('TopBar1', 'CinemaTop', -720, 0.5, 'quadInOut')
		doTweenY('BottomBar1', 'CinemaBottom', 720, 0.5, 'quadInOut')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.15, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.15)
	elseif curStep == 1604 or curStep == 1608 or curStep == 1612 or curStep == 2244 or curStep == 2248 or curStep == 2252 then
		setProperty('LightFloor.alpha', getProperty('House.alpha'))
		doTweenAlpha('Chime', 'LightFloor', 0, 0.75, 'linear')
	elseif curStep == 1680 then
		cameraFlash('camOther', '000000', 1.5, true)
		setProperty('CinemaTop.y', -660)
		setProperty('CinemaBottom.y', 660)
		setProperty('gf.alpha', 0.1)
		setProperty('Spooky.alpha', 0.25)
		setProperty('House.alpha', 0.1)
		setProperty('Static.alpha', 0.25)
		doTweenZoom('camera', 'camGame', 1.3, 0.001, 'linear')
		setProperty('defaultCamZoom', 1.3)
	elseif curStep == 1744 then
		cameraFlash('camOther', '000000', 1.5, true)
		quickCamSwap()
	elseif curStep == 1808 then
		cameraFlash('camOther', '000000', 0.75, true)
		setProperty('CinemaTop.y', -720)
		setProperty('CinemaBottom.y', 720)
		setProperty('Spooky.alpha', 1)
		setProperty('House.alpha', 1)
		setProperty('gf.alpha', 1)
		setProperty('Static.alpha', 0)
		doTweenZoom('camera', 'camGame', 0.75, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 1824 or curStep == 1828 or curStep == 1832 or curStep == 1836 or curStep == 1888 or curStep == 1892 or curStep == 1896 or curStep == 1900 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.025, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.025)
	elseif curStep == 1872 then
		cameraFlash('camOther', '000000', 0.75, true)
		doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 1936 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('cameraSpeed', 5)
		setProperty('boyfriend.alpha', 0.1)
		setProperty('RedLight.alpha', 0.05)
		setProperty('Spooky.alpha', 0.05)
		setProperty('House.alpha', 0.1)
		setProperty('gf.alpha', 0.1)
		setProperty('Static.alpha', 0.1)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 2000 then
		doTweenAlpha('jerboa', 'boyfriend', 1, 0.1, 'linear')
		doTweenAlpha('pork', 'dad', 0.1, 0.1, 'linear')
	elseif curStep == 2064 then
		cameraFlash('camOther', '000000', 0.5, true)
		setProperty('House.alpha', 0)
		setProperty('gf.alpha', 0)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
		setObjectOrder('boyfriendGroup', 7)
		setObjectOrder('dadGroup', 9)
		setProperty('dad.alpha', 1)
		setProperty('boyfriend.alpha', 0.25)
		defaultboyx = getProperty('boyfriend.x')
		setProperty('dad.x', -450)
		setProperty('boyfriend.x', 650)
		doTweenX('MoveTowardss', 'boyfriend', getProperty('boyfriend.x') - 1250, 5.32, 'linear')
	elseif curStep == 2128 then
		cameraFlash('camOther', '000000', 0.5, true)
		cancelTween('MoveTowardss')
		setObjectOrder('boyfriendGroup', 9)
		setObjectOrder('dadGroup', 7)
		setProperty('dad.alpha', 0.25)
		setProperty('boyfriend.alpha', 1)
		setProperty('boyfriend.x', 325)
		setProperty('dad.x', -800)
		doTweenX('MoveTowards', 'dad', getProperty('dad.x') + 1250, 5.32, 'linear')
	elseif curStep == 2192 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('House.alpha', 1)
		setProperty('gf.alpha', 1)
		setProperty('Spooky.alpha', 1)
		setProperty('Static.alpha', 0.01)
		setProperty('RedLight.alpha', 1)
		doTweenZoom('camera', 'camGame', 0.75, 0.75, 'quadInOut')
		setProperty('defaultCamZoom', 0.75)
		cancelTween('MoveTowards')
		setProperty('dad.alpha', 1)
		setProperty('boyfriend.x', defaultboyx)
		setProperty('dad.x', defaultdadx)
		setProperty('cameraSpeed', 3.5)
	elseif curStep == 2240 or curStep == 2244 or curStep == 2248 or curStep == 2252 or curStep == 2304 or curStep == 2308 or curStep == 2312 or curStep == 2316 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 2256 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.75, 0.75, 'quadInOut')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 2320 then
		cameraFlash('camOther', '000000', 1, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.925, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.925)
		dobeat = true
		setProperty('House.alpha', 0.5)
		setProperty('gf.alpha', 0.5)
		setProperty('Static.alpha', 0.1)
		setProperty('CinemaTop.y', -660)
		setProperty('CinemaBottom.y', 660)
	elseif curStep == 2364 or curStep == 2428 then
		doTweenY('TopBar32', 'CinemaTop', getProperty('CinemaTop.y') + 60, 0.5, 'quadInOut')
		doTweenY('BottomBar32', 'CinemaBottom', getProperty('CinemaBottom.y') - 60, 0.5, 'quadInOut')
		doTweenZoom('camera', 'camGame', 0.95, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 2384 then
		cameraFlash('camOther', '000000', 1, true)
		quickCamSwap()
		setProperty('CinemaTop.y', -660)
		setProperty('CinemaBottom.y', 660)
		doTweenZoom('camera', 'camGame', 0.925, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.925)
	elseif curStep == 2380 or curStep == 2444 then
		doTweenZoom('camera', 'camGame', 0.925, 0.1, 'quadInOut')
		doTweenY('TopBar32', 'CinemaTop', getProperty('CinemaTop.y') - 20, 0.25, 'quadInOut')
		doTweenY('BottomBar32', 'CinemaBottom', getProperty('CinemaBottom.y') + 20, 0.25, 'quadInOut')
		setProperty('defaultCamZoom', 0.925)
	elseif curStep == 2448 or curStep == 2512 or curStep == 2576 or curStep == 2640 then
		cameraFlash('camOther', 'FF0000', 1, true)
		quickCamSwap()
		setProperty('house.alpha', getProperty('house.alpha') - 0.15)
		setProperty('gf.alpha', getProperty('gf.alpha') - 0.15)
		setProperty('static.alpha', getProperty('static.alpha') + 0.1)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
		setProperty('CinemaTop.y', getProperty('CinemaTop.y') + 40)
		setProperty('CinemaBottom.y', getProperty('CinemaBottom.y') - 40)
	elseif curStep == 2704 then
		cameraFlash('camOther', 'FFFFFF', 2, true)
		doTweenAlpha('HUD', 'camHUD', 0, 2, 'linear')
		doTweenAlpha('juego', 'camGame', 0, 2, 'linear')
	end
end
local poses = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function onUpdatePost(elapsed)
	for a = 0, getProperty('notes.length') - 1 do
		local noteData = getPropertyFromGroup('notes', a, 'noteData')
		local strumTime = getPropertyFromGroup('notes', a, 'strumTime')
		if glitchthisfucker then
			local isMustPress = getPropertyFromGroup('notes', a, 'mustPress')
			local alphaRange = (glitchlevel == 1) and {0.5, 1} or {0.1, 1}
			local offsetRange = (glitchlevel == 1) and {-5, 5} or {-30, 30}
			local angleRange = (glitchlevel == 1) and {-5, 5} or {-30, 30}
			if not isMustPress then
				setPropertyFromGroup('notes', a, 'alpha', getRandomFloat(unpack(alphaRange)))
				setPropertyFromGroup('notes', a, 'offset.x', getRandomFloat(unpack(offsetRange)))
				setPropertyFromGroup('notes', a, 'angle', getRandomInt(unpack(angleRange)))
				if strumTime - getSongPosition() < getRandomFloat(-30, 75) then
					characterPlayAnim('dad', poses[(noteData % 4) + 1], false)
					if glitchlevel == 1 then
						setProperty('health', getProperty('health') - currentdrain)
					else
						local chance = getRandomFloat(0, 1)
						setPropertyFromClass('flixel.FlxG', 'mouse.visible', chance > 0.5)
						setProperty('iconP2.visible', chance > 0.5)
						setProperty('iconP1.angle', chance > 0.5 and getRandomInt(-175, 175) or 0)
						setProperty('health', getProperty('health') + (chance > 0.5 and -0.015 or currentdrain))
					end
					removeFromGroup("notes", a, false)
					if glitchlevel == 2 and not inCamSwap then
						setProperty('cameraSpeed', getRandomFloat(0.05, 3.5))
					end
				end
			elseif curStep > 910 and curStep < 929 or curStep > 510 and curStep < 521 then
				if strumTime - getSongPosition() < 100 then
					characterPlayAnim('bf', poses[(noteData % 4) + 1], false)
					removeFromGroup('notes', a, false)
				end
			end
		end
	end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if glitchlevel == 2 and glitchthisfucker then
		if not inCamSwap then
			setProperty('cameraSpeed', getRandomFloat(0.05, 3.5));
		end
		local visible = getRandomFloat(0, 1) > 0.5
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', visible)
		setProperty ('iconP2.visible', visible)
		setProperty(visible and 'iconP2.angle' or 'iconP1.angle', getRandomInt(-175, 175))
	end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') >= currentdrain then
		setProperty('health', getProperty('health') - currentdrain)
	end
end
function noteMiss(id, direction, noteType, isSustainNote)
	if glitchlevel == 2 and glitchthisfucker then
		setProperty('boyfriend.color', getColorFromHex('000000'))
		doTweenColor('justBOYFRIEND', 'bf', 'FFFFFF', 0.5, 'linear');
		setProperty('static.alpha', 1)
	end
end
function onTweenCompleted(tag)
	if tag == 'FUCKINGBOYFRIEND' then
		doTweenColor('justBOYFRIEND', 'bf', 'FFFFFF', 0.5, 'linear');
		doTweenAlpha('thestatico', 'Static', 0, 0.5, 'linear')
	end
end
function onTimerCompleted(tag)
	if tag == 'timershit' then
		if not pausetimer then
			if seconds == 0 then
				minutes = minutes - 1
				seconds = 59
			else
				seconds = seconds - 1
			end
			runTimer('timershit', 1)
		end
	elseif tag == 'starescare' then
		doTweenAlpha('faderetry', 'jumpscare', 0, 5, 'linear')
		setProperty('retry.visible', true)
	elseif tag == 'returnCamSpeed' then
		setProperty('cameraSpeed', prevCamSpeed)
		inCamSwap = false
	end
end
function onPause()
	return (glitchlevel == 2 and glitchthisfucker) and Function_Stop or Function_Continue
end

function onGameOverStart()
	setProperty('camGame.visible', false)
	setProperty('camHUD.visible', false)
	setPropertyFromClass('ClientPrefs', 'globalAntialiasing', antialisaing);
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
	setProperty('boyfriend.visible', false);
	makeAnimatedLuaSprite('jumpscare', 'stages/house/p0rkjump', -150, 0);
	addAnimationByPrefix('jumpscare', 'Jumpscare', 'p0rkjump', 24, false);
	setObjectCamera('jumpscare', 'other');
	addLuaSprite('jumpscare', false);
	makeAnimatedLuaSprite('retry', 'stages/house/P0rkGameOver', 350, -50);
	addAnimationByPrefix('retry', 'CamStare', 'Stare', 1, false);
	addAnimationByPrefix('retry', 'Idleloop', 'Idle', 24, true);
	setObjectCamera('retry', 'other');
	scaleObject('retry', 0.5, 0.5);
	setProperty('retry.visible', false)
	addLuaSprite('retry', false);
	setObjectOrder('retry', 1);
	setObjectOrder('jumpscare', 2);
	runTimer('starescare', 2.5)
	objectPlayAnimation('retry', 'Idleloop', true);
end
function onGameOverConfirm(retry)
	cameraFlash('camOther', '000000', 1.5, true)
	setProperty('retry.alpha', 1)
	objectPlayAnimation('retry', 'CamStare', false);
	doTweenAlpha('retrybyekevingabor', 'retry', 0, 3, 'linear')
end
function onUpdate()
	if minutes == 0 and seconds == 0 then
		setProperty('FakeTime.color', getColorFromHex('870000'))
		pausetimer = true
		setTextString('FakeTime', '0:00')
	end
	if not pausetimer then
		setTextString('FakeTime', string.format('%d:%02d', minutes, seconds))
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
		setProperty('health', 0)
	end
	if curStep > 2063 and curStep < 2192 then
		setProperty('camFollow.x', 550)
		setProperty('camFollow.y', 420)
	end
end
function onMoveCamera(focus)
	if curStep > 1423 then
		setProperty('LightFloor.alpha', getProperty('House.alpha'))
		doTweenAlpha('Chime', 'LightFloor', 0, 0.75, 'linear')
	end
end