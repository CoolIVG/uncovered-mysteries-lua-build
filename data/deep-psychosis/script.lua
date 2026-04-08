duet = true
flashinglight = false
stage = {'Shading', 'CutOff', 'Box', 'LightBack', 'LightFront', 'PillarDark', 'PillarLight', 'LabDark', 'LabLight'}
darkstuff = {'Shading', 'PillarDark', 'LabDark'}
uistuff = {'iconP2', 'iconP1', 'iconsq2', 'iconsq1', 'healthBar', 'healthBarBG', 'timeTxt', 'scoreTxt'}
prevCamSpeed = 0
guh = 0


function quickCamSwap()
	prevCamSpeed = getProperty('cameraSpeed')
	setProperty('cameraSpeed', 100000000)
	runTimer('returnCamSpeed', 0.05)
end

function onCreatePost()
	addCharacterToList('TheUnion', 'dad')

	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'DPJumpscare')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'deeppsychosisdeathnoise')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'deeppsychosiretry')

	makeLuaSprite('WakeS', 'stages/labmap/school', 250, 300);
	scaleObject('WakeS', 0.5, 0.5);
	setObjectCamera('WakeS', 'other');
	setProperty('WakeS.alpha', 0);
	setObjectOrder('WakeS', 3);
	addLuaSprite('WakeS', false);

	makeLuaSprite('WakeO', 'stages/labmap/outpost', 250, 300);
	scaleObject('WakeO', 0.5, 0.5);
	setObjectCamera('WakeO', 'other');
	setProperty('WakeO.alpha', 0);
	setObjectOrder('WakeO', 3);
	addLuaSprite('WakeO', false);

	makeLuaSprite('WakeB', 'stages/labmap/both', 100, 300);
	scaleObject('WakeB', 0.5, 0.5);
	setObjectCamera('WakeB', 'other');
	setProperty('WakeB.alpha', 0);
	setObjectOrder('WakeB', 3);
	addLuaSprite('WakeB', false);
	

	setProperty('dad.visible', false)
	setProperty('gf.visible', false)
	setProperty('camGame.visible', false)
	setProperty('camHUD.alpha', 0)

	setProperty('iconP2.color', getColorFromHex('000000'))
	setProperty('dad.color', getColorFromHex('B5B5B5'))
	setProperty('boyfriend.color', getColorFromHex('B5B5B5'))
	for i = 1, #uistuff do
		setProperty(uistuff[i]..'.visible', false)
	end

	makeLuaSprite('flashfaint', '', 0, 0)
	makeGraphic('flashfaint', 1280, 720,'ffffff')
	addLuaSprite('flashfaint', true)
	setObjectCamera ('flashfaint', 'other')
	setProperty('flashfaint.alpha', 0)

	makeAnimatedLuaSprite('laughOutpost', 'stages/labmap/ChuckleFuck1', 0, 0);
	addAnimationByPrefix('laughOutpost', 'laughBunny', 'BunnyLaugh', 28, false);
	scaleObject('laughOutpost', 2.325, 2.325);
	setObjectCamera('laughOutpost', 'other')
	setProperty('laughOutpost.alpha', 0)
	addLuaSprite('laughOutpost', false);

	makeAnimatedLuaSprite('laughSchool', 'stages/labmap/ChuckleFuck2', 0, 0);
	addAnimationByPrefix('laughSchool', 'laughDoggy', 'DoggyLaugh', 24, false);
	scaleObject('laughSchool', 4.55, 4.55);
	setObjectCamera('laughSchool', 'other')
	setProperty('laughSchool.alpha', 0)
	addLuaSprite('laughSchool', false);
end

function onSongStart()
	doTweenAlpha('GuiStuffs', 'camHUD', 1, 14.77, 'linear');
end

function singleFlash(length, brightness)
	for i = 1, #darkstuff do
		setProperty(darkstuff[i]..'.alpha', 0)
		doTweenAlpha('singleflash'..i, darkstuff[i], 1, length, 'linear')
	end
	setProperty('LightBack.alpha', 1)
	setProperty('LightFront.alpha', 1)
	setProperty('flashfaint.alpha', brightness)
	doTweenAlpha('singleFlash0', 'flashfaint', 0, length, 'linear');
	doTweenAlpha('singleFlash00', 'LightFront', 0, length, 'linear');
	doTweenAlpha('singleFlash000', 'LightBack', 0, length, 'linear');
end

function lightFlash()
	singleFlash(0.25, 0.05)
	if guh == 1 then
		setProperty('camHUD.angle', -5)
		setProperty('camGame.angle', -2.5)
		guh = 2
	else
		setProperty('camHUD.angle', 5)
		setProperty('camGame.angle', 2.5)
		guh = 1
	end
	doTweenAngle('cameragame', 'camGame', 0, 0.25, 'linear')
	doTweenAngle('cameragui', 'camHUD', 0, 0.25, 'linear')
end
 
function onEvent(name, val1, val2)
	if curStep < 256 then
		singleFlash(0.5, 0.1)
	end
end

function onBeatHit()
	if flashinglight == true then
		lightFlash()
	else
		setProperty('Shading.alpha', 1);
		setProperty('LabDark.alpha', 1);
		setProperty('LightFront.alpha', 0)
		setProperty('LightBack.alpha', 0)
		setProperty('PillarDark.alpha', 1)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == "GF Sing" then
		if getProperty('health') >= 0.015 then
			setProperty('health', getProperty('health') - 0.015)
		end
	else
		if getProperty('health') >= 0.01 then
			setProperty('health', getProperty('health') - 0.01)
		end
	end
end

function onStepHit()
	if curStep == 128 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('health', 2)
		for i = 1, #uistuff do
			setProperty(uistuff[i]..'.visible', true)
		end
		setProperty('camGame.visible', true)
	elseif curStep == 144 or curStep == 160 or curStep == 176 or curStep == 192 or curStep == 208 or curStep == 224 or curStep == 240 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.15, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.15)
	elseif curStep == 252 then
		setProperty('Static.visible', true)
	elseif curStep == 256 then
		setProperty('Static.alpha', 0)
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('health', 1)
		setProperty('iconP2.color', getColorFromHex('FFFFFF'))
		duet = false
		singleFlash(0.5, 0.1)
		doTweenZoom('camera', 'camGame', 1.25, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.25)
		setProperty('dad.visible', true)
		setProperty('WakeS.alpha', 1)
		doTweenAlpha('WakeUpSchool', 'WakeS', 0, 3, 'linear')
	elseif curStep == 288 or curStep == 352 or curStep == 368 or curStep == 372 or curStep == 376 or curStep == 380 or curStep == 416 or curStep == 436 or curStep == 440 or curStep == 480 or curStep == 496 or curStep == 500 or curStep == 504 or curStep == 508 or curStep == 564 or curStep == 568 or curStep == 572 or curStep == 672 or curStep == 692 or curStep == 696 or curStep == 700 or curStep == 756 or curStep == 764 or curStep == 928 or curStep == 944 or curStep == 948 or curStep == 952 or curStep == 956 or curStep == 992 or curStep == 1008 or curStep == 1012 or curStep == 1016 or curStep == 1020 or curStep == 1076 or curStep == 1080 or curStep == 1084 or curStep == 1140 or curStep == 1144 or curStep == 1148 or curStep == 2176 or curStep == 2192 or curStep == 2196 or curStep == 2200 or curStep == 2204 or curStep == 2240 or curStep == 2256 or curStep == 2260 or curStep == 2264 or curStep == 2268 or curStep == 2304 or curStep == 2320 or curStep == 2324 or curStep == 2328 or curStep == 2332 or curStep == 2368 or curStep == 2384 or curStep == 2388 or curStep == 2392 or curStep == 2396 or curStep == 3024 or curStep == 3028 or curStep == 3032 or curStep == 3036 or curStep == 3284 or curStep == 3288 or curStep == 3292 then
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
		singleFlash(0.5, 0.1)
	elseif curStep == 320 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		quickCamSwap()
		singleFlash(0.5, 0.1)
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
	elseif curStep == 384 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('cameraSpeed', 3.5)
		quickCamSwap()
		singleFlash(0.5, 0.1)
		doTweenZoom('camera', 'camGame', 1.6, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.6)
	elseif curStep == 448 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		quickCamSwap()
		singleFlash(0.5, 0.1)
		doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.85)
	elseif curStep == 512 or curStep == 528 or curStep == 544 or curStep == 560 or curStep == 592 or curStep == 608 or curStep == 624 or curStep == 1024 or curStep == 1040 or curStep == 1056 or curStep == 1072 or curStep == 1104 or curStep == 1120 or curStep == 1136 then
		if curStep == 512 or curStep == 544 or curStep == 560 or curStep == 608 or curStep == 624 or curStep == 1024 or curStep == 1056 or curStep == 1072 or curStep == 1120 or curStep == 1136 then
			singleFlash(0.5, 0.1)
			triggerEvent('Add Camera Zoom', '0.02', '0.035')
		end
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 576 then
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 640 then
		cameraFlash('camOther', '000000', 1, true)
		doTweenZoom('camera', 'camGame', 1.6, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.6)
	elseif curStep == 656 or curStep == 658 or curStep == 660 or curStep == 662 then
		if curStep == 656 then
			doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
			setProperty('defaultCamZoom', 0.85)			
		else
			doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.01, 'linear')
			setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
		end
	elseif curStep == 672 then
		cameraFlash('camOther', '000000', 0.5, true)
		singleFlash(0.5, 0.1)
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 688 then
		cameraFlash('camOther', '000000', 0.5, true)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
		singleFlash(0.5, 0.1)
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
	elseif curStep == 704 then
		cameraFlash('camOther', 'FFFFFF', 0.5, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.1)
		singleFlash(0.5, 0.1)
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
	elseif curStep == 720 or curStep == 736 or curStep == 739 then
		if curStep == 736 then
			singleFlash(0.5, 0.1)
			triggerEvent('Add Camera Zoom', '0.02', '0.035')
		end
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 752 then
		cameraFlash('camOther', '000000', 0.25, true)
		singleFlash(0.5, 0.1)
		doTweenZoom('camera', 'camGame', 1.15, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.15)
	elseif curStep == 760 then
		cameraFlash('camOther', '000000', 0.25, true)
		doTweenZoom('camera', 'camGame', 0.9, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 768 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('gf.visible', true)
		setProperty('Static.alpha', 0.1)
		for i = 1, #stage do
			setProperty(stage[i]..'.visible', false)
		end
		setProperty('boyfriend.alpha', 0)
		doTweenZoom('camera', 'camGame', 1.15, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.45)
	elseif curStep == 800 or curStep == 808 or curStep == 864 or curStep == 872 then
		if curStep == 800 or curStep == 864 then
			setProperty('flashfaint.alpha', 0.1)
			doTweenAlpha('fadeflashfaint', 'flashfaint', 0, 0.5,'linear')
			triggerEvent('Add Camera Zoom', '0.02', '0.035')
		end
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 816 or curStep == 820 or curStep == 824 or curStep == 828 or curStep == 880 or curStep == 884 or curStep == 888 or curStep == 892 then
		if curStep == 880 then
			doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
			setProperty('defaultCamZoom', 1.1)
		end
		setProperty('flashfaint.alpha', 0.1)
		doTweenAlpha('fadeflashfaint', 'flashfaint', 0, 0.5,'linear')
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
	elseif curStep == 832 then
		doTweenZoom('camera', 'camGame', 0.9, 0.01, 'linear')
		quickCamSwap()
		setProperty('defaultCamZoom', 0.9)	
		doTweenAlpha('gopapa', 'dad', 0, 0.25, 'linear')
		doTweenAlpha('gopuico', 'boyfriend', 1, 0.25, 'linear')
		doTweenAlpha('gogf', 'gf', 0, 0.25, 'linear')
	elseif curStep == 896 or curStep == 960 then
		cameraFlash('camOther', '000000', 1.5, true)
		for i = 1, #stage do
			setProperty(stage[i]..'.visible', true)
		end
		setProperty('Static.alpha', 0)
		setProperty('dad.alpha', 1)
		doTweenZoom('camera', 'camGame', 0.8, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', 0.8)
		singleFlash(0.5, 0.1)
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
	elseif curStep == 904 or curStep == 912 or curStep == 968 or curStep == 976 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.15, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.15)
	elseif curStep == 930 or curStep == 994 then
		cameraFlash('camOther', '000000', 0.5, true)
		doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.85)
	elseif curStep == 1088 then
		doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.85)
		singleFlash(0.5, 0.1)
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
	elseif curStep == 1152 or curStep == 1156 or curStep == 1184 or curStep == 1188 or curStep == 1280 or curStep == 1284 or curStep == 1312 or curStep == 1316 then
		setProperty('defaultCamZoom', 1)
		if curStep == 1152 or curStep == 1184 or curStep == 1280 or curStep == 1312 then
			cameraFlash('camOther', 'FFFFFF', 0.5, true)
			doTweenZoom('camera', 'camGame', 1.05, 0.01, 'linear')
		else
			doTweenZoom('camera', 'camGame', 1.05, 0.15, 'quadInOut')
		end
		singleFlash(0.5, 0.1)
		cameraShake('camHUD', 0.025, 0.025)
		cameraShake('camGame', 0.025, 0.025)
	elseif curStep == 1160 or curStep == 1192 or curStep == 1288 or curStep == 1320 then
		doTweenZoom('camera', 'camGame', 0.85, 0.75, 'quadInOut')
		setProperty('defaultCamZoom', 0.85)
	elseif curStep == 1208 or curStep == 1304 or curStep == 1336 or curStep == 1340 then
		doTweenZoom('camera', 'camGame', 0.5, 1.5, 'quadInOut')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 1216 or curStep == 1220 or curStep == 1248 or curStep == 1252 or curStep == 1344 or curStep == 1348 or curStep == 1376 or curStep == 1380 then
		setProperty('defaultCamZoom', 0.95)
		singleFlash(0.5, 0.1)
		if curStep == 1212 or curStep == 1248 or curStep == 1344 or curStep == 1376 then
			cameraFlash('camOther', 'FFFFFF', 0.5, true)
			doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		else
			doTweenZoom('camera', 'camGame', 1, 0.15, 'quadInOut')
		end
	elseif curStep == 1230 or curStep == 1262 or curStep == 1358 or curStep == 1390 then
		setProperty('defaultCamZoom', 0.8)
		doTweenZoom('camera', 'camGame', 0.8, 0.75, 'quadInOut')
	elseif curStep == 1272 or curStep == 1276 or curStep == 1400 or curStep == 1404 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.01, 'linear')


	--START OF OUTPOST SEGMENT
	elseif curStep == 1408 then
		doTweenAlpha('gogame', 'camGame', 0, 1.54, 'linear')
		doTweenAlpha('gogui', 'camHUD', 0, 1.54, 'linear')
		doTweenAlpha('OMGHIOUTPOSTT!!!', 'laughOutpost', 1, 1.54, 'linear')
		objectPlayAnimation('laughOutpost', 'laughBunny', false);
	elseif curStep == 1440 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('defaultCamZoom', 1.1)
		doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
		removeLuaSprite('laughOutpost')
		setProperty('cameraSpeed', 1)
		setProperty('Static.alpha', 0.5)
		doTweenAlpha('StaticFade', 'Static', 0, 0.35, 'linear')
		singleFlash(0.5, 0.1)
		setProperty('camGame.alpha', 1)
		setProperty('camHUD.alpha', 1)
		setProperty('gf.alpha', 1)
		setProperty('dad.visible', false)
		setProperty('WakeO.alpha', 1)
		doTweenAlpha('WakeUpOutpost', 'WakeO', 0, 3, 'linear')

	elseif curStep == 1456 then
		setProperty('defaultCamZoom', 1)
		doTweenZoom('camera', 'camGame', 1, 0.25, 'quadInOut')
	elseif curStep == 1472 or curStep == 1504 or curStep == 1536 then
		singleFlash(0.5, 0.1)
		setProperty('Static.alpha', 0.35)
		doTweenAlpha('StaticFade', 'Static', 0, 0.35, 'linear')
		setProperty('defaultCamZoom', 1.1)
		doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
	elseif curStep == 1488 or curStep == 1492 or curStep == 1496 or curStep == 1500 then
		setProperty('Static.alpha', 0.35)
		doTweenAlpha('StaticFade', 'Static', 0, 0.35, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.25, 'cubeInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 1552 or curStep == 1556 or curStep == 1560 or curStep == 1564 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.25, 'cubeInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)

		singleFlash(0.5, 0.1)
		for i = 1, #stage do
			if stage[i] ~= 'Shading' then
				setProperty(stage[i]..'.alpha', getProperty(stage[1]..'.alpha' - 0.25))
			end
		end
	elseif curStep == 1568 or curStep == 1632 then
		cameraFlash('camOther', '000000', 0.5, true)
		setProperty('cameraSpeed', 2)
		for i = 1, #stage do
			setProperty(stage[i]..'.alpha', 1)
		end
		quickCamSwap()
		singleFlash(0.5, 0.1)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 1600 or curStep == 1664 then
		cameraFlash('camOther', '000000', 0.5, true)
		singleFlash(0.5, 0.1)
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 1616 or curStep == 1620 or curStep == 1624 or curStep == 1628 then
		singleFlash(0.5, 0.1)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.25, 'cubeInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 1680 or curStep == 1684 or curStep == 1688 or curStep == 1692 then
		singleFlash(0.35, 0.15)
		duet = true
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.85)
	elseif curStep == 1696 then
		cameraFlash('camOther', '000000', 1, true)
		doTweenZoom('camera', 'camGame', 0.9, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.9)
		setProperty('cameraSpeed', 5)
		duet = false
		singleFlash(0.35, 0.15)
	elseif curStep == 1712 or curStep == 1728 or curStep == 1776 or curStep == 1792 then
		if curStep == 1728 or curStep == 1792 then
			singleFlash(0.35, 0.15)
		end
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 1760 then
		cameraFlash('camOther', '000000', 1, true)
		singleFlash(0.35, 0.15)
		doTweenZoom('camera', 'camGame', 0.6, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.6)

	elseif curStep == 1824 or curStep == 1840 or curStep == 1856 then
		setProperty('cameraSpeed', 3)
		setProperty('Static.alpha', 0.25)
		doTweenAlpha('StaticFade', 'Static', 0, 0.15, 'linear')
		doTweenZoom('camera', 'camGame', 1.2, 0.1, 'linear')
		setProperty('defaultCamZoom', 1.15)
		cameraShake('camHUD', 0.05, 0.05)
		cameraShake('camGame', 0.05, 0.05)
		if curStep == 1824 or curStep == 1856 then
			singleFlash(0.35, 0.15)
		end
	elseif curStep == 1830 or curStep == 1846 or curStep == 1862 then
		doTweenZoom('camera', 'camGame', 0.95, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 1872 or curStep == 1876 or curStep == 1880 or curStep == 1884 then
		setProperty('Static.alpha', 0.5)
		doTweenAlpha('StaticFadee2', 'Static', 0, 0.35, 'linear')
		for i = 1, #stage do
			setProperty(stage[i]..'.alpha', getProperty('boyfriend.alpha') - 0.25)
		end
		setProperty('boyfriend.alpha', getProperty('boyfriend.alpha') - 0.25)

		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
		cameraShake('camHUD', 0.05, 0.05)
		cameraShake('camGame', 0.05, 0.05)
	elseif curStep == 1888 or curStep == 1904 or curStep == 1920 then
		if curStep == 1888 then
			singleFlash(0.35, 0.15)
			setProperty('Static.alpha', 0.9)
			doTweenAlpha('StaticFadee2', 'Static', 0, 0.35, 'linear')
			setProperty('boyfriend.alpha', 1)
			for i = 1, #stage do
				setProperty(stage[i]..'.alpha', 1)
			end
		elseif curStep == 1920 then
			singleFlash(0.35, 0.15)
		end
		doTweenZoom('camera', 'camGame', 1, 0.1, 'linear')
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 1894 or curStep == 1910 or curStep == 1926 then
		doTweenZoom('camera', 'camGame', 0.8, 0.5, 'quadInOut')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 1936 or curStep == 1940 or curStep == 1944 or curStep == 1948 then
		triggerEvent('Add Camera Zoom', '0.035', '0.035')
	elseif curStep == 1952 or curStep == 1970 or curStep == 1984 or curStep == 2004 or curStep == 2006 then
		setProperty('Static.alpha', 0.4)
		doTweenAlpha('StaticFadeGUHHPURPLEMOUSYUIHHH', 'Static', 0, 0.35, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.025, 0.15, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.025)
		cameraShake('camHUD', 0.025, 0.025)
		cameraShake('camGame', 0.025, 0.025)
		setProperty('camGame.angle', 2.5)
		setProperty('camHUD.angle', -2.5)
		doTweenAngle('fuck1', 'camHUD', 0, 0.15, 'linear')
		doTweenAngle('fuck2', 'camGame', 0, 0.15, 'linear')
		triggerEvent('Add Camera Zoom', '0.05', '0.05')
		doTweenAlpha('LabGo', 'LabDark', getProperty('LabDark.alpha') - 0.1, 0.15, 'linear')	
	elseif curStep == 1954 or curStep == 1968 or curStep == 1986 or curStep == 2000 or curStep == 2002 then
		setProperty('Static.alpha', 0.15)
		doTweenAlpha('StaticFadeGUHHPURPLEMOUSYUIHHH', 'Static', 0, 0.15, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.15, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.025)
		cameraShake('camHUD', 0.025, 0.025)
		cameraShake('camGame', 0.025, 0.025)
		setProperty('camGame.angle', -5)
		setProperty('camHUD.angle', 5)
		doTweenAngle('fuck1', 'camHUD', 0, 0.15, 'linear')
		doTweenAngle('fuck2', 'camGame', 0, 0.15, 'linear')
		triggerEvent('Add Camera Zoom', '0.05', '0.05')
	elseif curStep == 2016 or curStep == 2018 or curStep == 2032 or curStep == 2034 or curStep == 2048 or curStep == 2050 or curStep == 2064 or curStep == 2066 then
		if curStep == 2016 then
			setProperty('Static.alpha', 1)
			doTweenAlpha('StaticFadeGUHHPURPLEMOUSYUIHHH', 'Static', 0, 0.15, 'linear')
			doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
			setProperty('defaultCamZoom', 0.8)
		end
		setProperty('LabDark.alpha', 1)
		setProperty('Shading.alpha', 1)
		doTweenAlpha('bringbackthedarkbackgroundplease', 'LabDark', 1, 0.5, 'linear')
		doTweenAlpha('bringbackthedarkbackgroundshadeplease', 'Shading', 1, 0.5, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.0125, 0.15, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.0125)
		triggerEvent('Add Camera Zoom', '0.025', '0.025')



	elseif curStep == 2080 then
		doTweenAlpha('OMGHIIISCHOOOOL', 'laughSchool', 1, 1.54, 'linear')
		objectPlayAnimation('laughSchool', 'laughDoggy', false);
		doTweenAlpha('gogame', 'camGame', 0, 1.54, 'linear')
		doTweenAlpha('gogui', 'camHUD', 0, 1.54, 'linear')
	elseif curStep == 2112 then
		setProperty('Static.alpha', 1)
		setProperty('dad.visible', true)
		setProperty('camGame.alpha', 1)
		doTweenAlpha('StaticFadeGUHHPURPLEMOUSYUIHHH', 'Static', 0, 1, 'linear')
		doTweenAlpha('StaticFadeGUHHPURPLEMOUSYUIHHTH', 'camGame', 0, 0.85, 'linear')
	elseif curStep == 2144 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		removeLuaSprite('laughSchool')
		setProperty('camGame.alpha', 1)
		setProperty('camHUD.alpha', 1)
		setProperty('WakeB.alpha', 1)
		doTweenAlpha('WakeUpDuo', 'WakeB', 0, 3, 'linear')	
		doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.1)
	elseif curStep == 2152 or curStep == 2160 or curStep == 2216 or curStep == 2224 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.1, 0.25, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	elseif curStep == 2178 or curStep == 2192 or curStep == 2242 or curStep == 2256 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 2208 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.1)
	elseif curStep == 2272 or curStep == 2336 then
		doTweenZoom('camera', 'camGame', 0.8, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 2288 or curStep == 2304 or curStep == 2320 or curStep == 2352 or curStep == 2368 or curStep == 2384 or curStep == 2416 or curStep == 2432 or curStep == 2496 or curStep == 2502 or curStep == 2508 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 2400 or curStep == 2464 or curStep == 2528 or curStep == 2592 then
		cameraFlash('camOther', '000000', 1, true)
		if curStep == 2528 then
			setProperty('Static.alpha', 0)
		end
		doTweenZoom('camera', 'camGame', 1.15, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.15)
		flashinglight = true
	elseif curStep == 2448 or curStep == 2454 or curStep == 2460 or curStep == 2576 or curStep == 2582 or curStep == 2588 or curStep == 2598 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.1, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	elseif curStep == 2470 or curStep == 2480 or curStep == 2544 or curStep == 2560 or curStep == 2608 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.065, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.065)
	elseif curStep == 2512 or curStep == 2640 then
		if curStep == 2640 then
			setProperty('Static.color', getColorFromHex('000000'))
		end
		doTweenAlpha('backstat', 'Static', 1, 1.5, 'linear')
		doTweenZoom('camera', 'camGame', 1.5, 1.52, 'linear')
		setProperty('defaultCamZoom', 1.5)
	elseif curStep == 2592 then
		doTweenZoom('camera', 'camGame', 1, 0.25, 'quadInOut')
		setProperty('defaultCamZoom', 1)
	elseif curStep == 2624 or curStep == 2630 or curStep == 2636 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 2656 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		triggerEvent('Change Character', 'dad', 'TheUnion')

		for i = 1, #stage do
			setProperty(stage[i]..'.visible', false)
		end
		for i = 1, #uistuff do
			setProperty(uistuff[i]..'.visible', false)
		end
		setProperty('gf.visible', false)
		setProperty('boyfriend.visible', false)

		doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.85)
		setProperty('Static.alpha', 0)
		setProperty('Static.color', getColorFromHex('FFFFFF'))
		duet = true
	elseif curStep == 2704 or curStep == 2710 or curStep == 2716 or curStep == 2832 or curStep == 2838 or curStep == 2844 then
		setProperty('Static.alpha', 0.25)
		doTweenAlpha('FUCKOFFSTATIC', 'Static', 0, 0.3, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.3, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 2720 or curStep == 2848 then
		doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.85)
	elseif curStep == 2752 or curStep == 2758 or curStep == 2764 or curStep == 2880 or curStep == 2886 or curStep == 2892 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.3, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 2768 or curStep == 2896 then
		doTweenZoom('camera', 'camGame', 1.5, 1.5, 'linear')
		setProperty('Static.color', getColorFromHex('000000'))
		doTweenAlpha('backstat', 'Static', 1, 1.5, 'linear')
	elseif curStep == 2784 then
		setProperty('Static.alpha', 0)
		setProperty('Static.color', getColorFromHex('FFFFFF'))		
		doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.85)
	elseif curStep == 2912 or curStep == 2976 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		triggerEvent('Change Character', 'dad', 'School')
		for i = 1, #stage do
			setProperty(stage[i]..'.visible', true)
		end
		for i = 1, #uistuff do
			setProperty(uistuff[i]..'.visible', true)
		end
		setProperty('gf.visible', true)
		setProperty('boyfriend.visible', true)
		doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.1)
		setProperty('Static.alpha', 0)
		duet = false
		flashinglight = false
		setProperty('cameraSpeed', 5)
	elseif curStep == 2944 or curStep == 3008 then
		doTweenZoom('camera', 'camGame', 1.25, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', 1.25)
		if curStep == 3008 then
			setProperty('Static.color', getColorFromHex('FFFFFF'))	
			setProperty('Static.alpha', 0.5)
		end
		setProperty('flashfaint.alpha', 0.1)
		setProperty('LabDark.alpha', 0)
		doTweenAlpha('fadeflashfaint', 'flashfaint', 0, 0.5,'linear')
		doTweenAlpha('fadeflashLab', 'LabDark', 1, 0.5,'linear')
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
	elseif curStep == 3040 or curStep == 3072 or curStep == 3104 or curStep == 3136 then
		if curStep == 3040 or curStep == 3104 then
			doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
			setProperty('defaultCamZoom', 1)
		end	
		triggerEvent('Add Camera Zoom', '0.05', '0.05')
		setProperty('Static.alpha', 1)
		doTweenAlpha('FUCKOFFSTATIC', 'Static', 0, 0.15, 'linear')
	elseif curStep == 3088 or curStep == 3092 or curStep == 3096 or curStep == 3100 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 3152 or curStep == 3156 or curStep == 3160 or curStep == 3164 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.035, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.035)
		setProperty('flashfaint.alpha', 0.1)
		setProperty('LabDark.alpha', 0)
		doTweenAlpha('fadeflashfaint', 'flashfaint', 0, 0.5,'linear')
		doTweenAlpha('fadeflashLab', 'LabDark', 1, 0.5,'linear')
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
	elseif curStep == 3168 or curStep == 3200 or curStep == 3232 then
		cameraFlash('camOther', '000000', 1, true)
		if getProperty('defaultCamZoom') == 1.2 then
			doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
			setProperty('defaultCamZoom', 1)
		else
			doTweenZoom('camera', 'camGame', 1.2, 0.01, 'linear')
			setProperty('defaultCamZoom', 1.2)
		end
	elseif curStep == 3280 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		duet = true
		doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.85)
		setProperty('flashfaint.alpha', 0.1)
		setProperty('LabDark.alpha', 0)
		doTweenAlpha('fadeflashfaint', 'flashfaint', 0, 0.5,'linear')
		doTweenAlpha('fadeflashLab', 'LabDark', 1, 0.5,'linear')
		triggerEvent('Add Camera Zoom', '0.02', '0.035')
	elseif curStep == 3296 then
		doTweenAlpha('camGame', 'camGame', 0, 3.5, 'linear')
		doTweenAlpha('camGh', 'camHUD', 0, 4.5, 'linear')
		doTweenAlpha('bye1', 'dad', 0, 3, 'linear')
		doTweenAlpha('bye2', 'gf', 0, 3, 'linear')
		doTweenZoom('camera', 'camGame', 3.5, 5, 'linear')
		setProperty('defaultCamZoom', 3.5)
	elseif curStep == 3392 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('camGame.alpha', 1)
		doTweenZoom('camera', 'camGame', 0.95, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 3408 or curStep == 3424 or curStep == 3440 or curStep == 3456 or curStep == 3472 or curStep == 3488 or curStep == 3504 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.15, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.15)
		if curStep == 3408 then
			doTweenAlpha('FUCKOFFGAMEAGAINPLEASE', 'camGame', 0, 15, 'linear')
		end
		setProperty('Static.alpha', 1)
		setProperty('dad.alpha', 1)
		setProperty('gf.alpha', 1)
		doTweenAlpha('dadgoagaDDFin', 'dad', 0, 1, 'linear')
		doTweenAlpha('gfdgoagain', 'gf', 0, 1, 'linear')
		doTweenAlpha('gstatdgoagain', 'Static', 0, 0.75, 'linear')
	end
end

function onUpdate()
	if duet == true then
		setProperty('camFollow.x', 650)
		setProperty('camFollow.y', 450)
	end
end

function onTweenCompleted(tag)
	if tag == 'WakeUpSchool' then
		removeLuaSprite('WakeS', true);
	elseif tag == 'WakeUpOutpost' then
		removeLuaSprite('WakeO', true);
	elseif tag == 'WakeUpDuo' then
		removeLuaSprite('WakeB', true);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'fuck off' then
		setProperty('cameraSpeed', 2)
	elseif tag == 'returnCamSpeed' then
		setProperty('cameraSpeed', prevCamSpeed)
	end
end

function onGameOverStart()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
	setProperty('boyfriend.visible', false);

	cameraFlash('camOther', 'FFFFFF', 1, true)
	makeLuaSprite('DeathScreen', 'stages/labmap/gameover', 0, 0)
	setObjectCamera('DeathScreen', 'other');
	scaleObject('DeathScreen', 1.35, 1.35);
	addLuaSprite('DeathScreen', false)
end

function onGameOverConfirm(retry)
	cameraFlash('camOther', '000000', 1, true)
	doTweenAlpha('Death', 'DeathScreen', 0, 2, 'linear')
	doTweenY('DETT', 'DeathScreen', 400, 3, 'cubeInOut')
end