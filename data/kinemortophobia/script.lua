dodrain = false
ammo = 0
debounce = true
prevCamSpeed = nil
currentOdds = 100
local readMechanic = false

function quickCamSwap()
	prevCamSpeed = getProperty('cameraSpeed')
	setProperty('cameraSpeed', 100000000)
	runTimer('returnCamSpeed', 0.05)
end

function onCreate()
	addCharacterToList('Zompiggy', 'dad')
	addCharacterToList('ZompiggyAngry', 'dad')
	addCharacterToList('ZompiggyOG', 'dad')
	addCharacterToList('ZompiggyStunnedOG', 'dad')
	addCharacterToList('ZompiggyFinale', 'dad')

	addCharacterToList('BunnyNormal', 'boyfriend')
	addCharacterToList('BunnyAngry', 'boyfriend')
	addCharacterToList('BunnyOG', 'boyfriend')
	addCharacterToList('BunnyHalfInfected', 'boyfriend')
	addCharacterToList('BunnyInfected', 'boyfriend')

	setProperty('camZooming', false)
	setProperty('camZoomingMult', 0)

	setProperty('showRating', false)
	setProperty('showComboNum', false)

	makeLuaSprite('Explain', 'loading/kinemortophobiamechanic', -25, 0)
	setObjectCamera('Explain', 'camOther')
	setObjectOrder('Explain', 15)
	scaleObject('Explain', 0.85, 0.925)
	addLuaSprite('Explain', true)

	makeLuaSprite('DeathFinal', 'stages/metro/Death2', 0, 25)
	setObjectCamera('DeathFinal', 'other');
	setProperty('DeathFinal.alpha', 0)
	addLuaSprite('DeathFinal', false)
end

function onCreatePost()
	precacheSound('Crossbow')
	precacheSound('confirmMenu')

	makeLuaSprite('Wake', 'stages/metro/Wake', 255, 125)
	setObjectCamera('Wake', 'camOther')
	setProperty('Wake.alpha', 0)
	setObjectOrder('Wake', 12)
	addLuaSprite('Wake', true)

	makeLuaSprite('Gone', 'stages/metro/Gone', 320, 122)
	setObjectCamera('Gone', 'camOther')
	setProperty('Gone.alpha', 0)
	setObjectOrder('Gone', 13)
	addLuaSprite('Gone', true)

	makeLuaSprite('Blood', 'stages/metro/bloodeffect', 0, 0)
	setObjectCamera('Blood', 'camOther')
	scaleObject('Blood', 0.525, 0.515)
	setObjectOrder('Blood', 14)
	addLuaSprite('Blood', true)

	makeLuaSprite('Carrot', 'stages/metro/carrot', 95, 365)
	setObjectCamera('Carrot', 'hud')
	scaleObject('Carrot', 0.65, 0.65)
	addLuaSprite('Carrot', true)

	makeAnimatedLuaSprite('zompigicon', 'stages/metro/icon-ZompiggyPillar', 75, 200);
	addAnimationByPrefix('zompigicon','iconchomp', 'ZompiggyPillar instance', 24, true);
	scaleObject('zompigicon', 0.2, 0.2);
	setObjectCamera('zompigicon', 'HUD');
	setObjectOrder('zompigicon', 19)
	setProperty('zompigicon.visible', false)
	addLuaSprite('zompigicon', false);

	makeLuaText('AmmoCount', ammo, 0, getProperty('Carrot.x') + 25, getProperty('Carrot.y') + 20)
	setTextSize('AmmoCount', 65)
	setTextFont('AmmoCount', 'msmincho.ttf')
	setObjectCamera('AmmoCount', 'camHUD')
	setTextBorder('AmmoCount', 1.5, '000000')
	setTextAlignment('AmmoCount', 'center')
	addLuaText('AmmoCount', true)

	setObjectOrder('Carrot', 1)
	setObjectOrder('AmmoCount', 2)
	setProperty('Carrot.visible', false)
	setProperty('AmmoCount.visible', false)

	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'ZompiggyJS')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Zombunny')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'KinemortoRetry')
	setProperty('gf.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('iconsq2.visible', false)
	setProperty('iconsq1.y', getProperty('iconsq1.y') - 134)
	setProperty('healthBar.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconsq1.visible', false)	
	
	setProperty('camHUD.alpha', 0)

	setProperty('metrostart.color', getColorFromHex('000000'))
	setProperty('dad.color', getColorFromHex('000000'))
	setProperty('boyfriend.color', getColorFromHex('000000'))

	setProperty('Static.alpha', 0.9)
end

function onSongStart()
	runTimer('RemoveOdds', 2.5775)
end

function onStepHit()
	if curStep == 1 then
		for i = 0, 7 do
			setProperty('strumLineNotes.members['..i..'].alpha', 0)
		end
		if not middlescroll then
			for i = 0, 3 do
				setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i] - 10)
			end
		end
		doTweenAlpha('GUI', 'camHUD', 1, 17.31, 'linear')
		noteTweenAlpha('Note7', 7, 1, 0.67, 'linear');
	elseif curStep == 33 then
		noteTweenAlpha('Note6', 6, 1, 0.67, 'linear');
	elseif curStep == 65 then
		noteTweenAlpha('Note5', 5, 1, 0.67, 'linear');
	elseif curStep == 97 then
		noteTweenAlpha('Note4', 4, 1, 0.67, 'linear');
	elseif curStep == 128 then
		cameraFlash('camOther', 'FFFFFF', 2.5, true)
		setProperty('camZooming', true)
		setProperty('camZoomingMult', 1)
		doTweenZoom('camera', 'camGame', 0.75, 2.5, 'cubeInOut')
		setProperty('defaultCamZoom', 0.75)
		setProperty('iconsq1.visible', true)
		setProperty('healthBar.visible', true)
		setProperty('iconP1.visible', true)
		setProperty('scoreTxt.visible', true)
		setProperty('metrostart.color', getColorFromHex('FFFFFF'))
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('dad.visible', false)
	elseif curStep == 144 or curStep == 160 or curStep == 208 or curStep == 224 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.025, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.025)
	elseif curStep == 176 or curStep == 178 or curStep == 180 or curStep == 240 or curStep == 242 or curStep == 244 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.02, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.02)
	elseif curStep == 192 then
		cameraFlash('camGame', 'FFFFFF', 2.5, true)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 256 then
		cameraFlash('camOther', '000000', 2.5, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1)
		removeLuaSprite('metrostart', true)
		setProperty('metro.visible', true)
		setProperty('dad.visible', true)
		triggerEvent('Change Character', 'boyfriend', 'BunnyNormal')
		setProperty('iconsq1.y', getProperty('iconsq1.y') + 134)
		setProperty('iconP2.visible', true)
		setProperty('iconsq2.visible', true)
	elseif curStep == 276 or curStep == 280 or curStep == 284 or curStep == 340 or curStep == 344 or curStep == 348 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 288 then
		cameraFlash('camOther', '000000', 1.5, true)
		doTweenZoom('camera', 'camGame', 1.1, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.1)
	elseif curStep == 308 or curStep == 312 or curStep == 316 or curStep == 372 or curStep == 376 or curStep == 380 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 320 or curStep == 448 then
		cameraFlash('camOther', '000000', 1, true)
		quickCamSwap()
		if curStep == 448 then
			doTweenZoom('camera', 'camGame', 0.85, 1, 'quadInOut')
			setProperty('defaultCamZoom', 0.85)
		else
			doTweenZoom('camera', 'camGame', 0.75, 1, 'quadInOut')
			setProperty('defaultCamZoom', 0.75)
		end
	elseif curStep == 384 then
		cameraFlash('camOther', '000000', 2.5, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.95, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 390 or curStep == 396 or curStep == 454 or curStep == 460 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 402 or curStep == 466 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.15, 1.63, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.15)
	elseif curStep == 416 or curStep == 422 or curStep == 428 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.02, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.02)
	elseif curStep == 480 or curStep == 486 or curStep == 492 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.01, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.01)
	elseif curStep == 496 or curStep == 504 or curStep == 512 then
		setProperty('cameraSpeed', 10000000)
		setProperty('defaultCamZoom', 1.1)
		setProperty('camGame.visible', false)
	elseif curStep == 500 or curStep == 508 then
		setProperty('camGame.visible', true)
	elseif curStep == 520 then
		setProperty('defaultCamZoom', 0.65)
		setProperty('camGame.visible', true)
		triggerEvent('Play Animation', 'Reveal', 'dad')
		triggerEvent('Play Animation', 'Stand Up', 'boyfriend')
	elseif curStep == 528 then
		cameraFlash('camOther', 'FFFFFF', 2, true)
		setProperty('Wake.alpha', 1)
		doTweenAlpha('WakeGo', 'Wake', 0, 3, 'linear')
		setProperty('songSpeed', 3)
		setProperty('cameraSpeed', 2.5)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
		triggerEvent('Change Character', 'dad', 'Zompiggy')
		triggerEvent('Change Character', 'boyfriend', 'BunnyAngry')
		dodrain = true
		ammo = 8
		setProperty('Carrot.visible', true)
		setProperty('AmmoCount.visible', true)
	elseif curStep == 544 or curStep == 560 or curStep == 576 or curStep == 608 or curStep == 624 or curStep == 640 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 592 then
		cameraFlash('camOther', 'FFFFFF', 2, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 656 then
		cameraFlash('camOther', '000000', 2.5, true)
		doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 672 or curStep == 678 or curStep == 736 or curStep == 742 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 684 or curStep == 748 then
		doTweenZoom('camera', 'camGame', 0.775, 0.45, 'quadInOut')
		setProperty('defaultCamZoom', 0.775)
	elseif curStep == 704 or curStep == 710 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.075, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 716 or curStep == 718 then
		cameraFlash('camGame', '000000', 0.75, true)
	elseif curStep == 720 then
		cameraFlash('camOther', '000000', 3, true)
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
		quickCamSwap()
	elseif curStep == 768 then
		setProperty('cameraSpeed', 1)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.25, 'cubeInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 775 then
		triggerEvent('Play Animation', 'Anger', 'dad')
	elseif curStep == 784 then
		cameraFlash('camOther', 'FF0000', 1, true)
		doTweenZoom('camera', 'camGame', 0.95, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.95)
		setProperty('songSpeed', 3.4)
		setProperty('cameraSpeed', 5)
		triggerEvent('Change Character', 'dad', 'ZompiggyAngry')
	elseif curStep == 822 or curStep == 830 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 840 then
		cameraFlash('camOther', 'FF0000', 1, true)
		doTweenZoom('camera', 'camGame', 0.95, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.95)
	elseif curStep == 912 then
		cameraFlash('camOther', 'FF0000', 1, true)
		quickCamSwap()
	elseif curStep == 928 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.075, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.075)
	elseif curStep == 934 or curStep == 944 or curStep == 950 or curStep == 992 or curStep == 1008 or curStep == 1014 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 976 then
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 0.85, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.85)
	elseif curStep == 1022 then
		doTweenZoom('camera', 'camGame', 0.9, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 1040 then
		cameraFlash('camOther', '000000', 1, true)
		triggerEvent('Change Character', 'dad', 'Zompiggy')
		setProperty('cameraSpeed', 3)
		setProperty('songSpeed', 3)
	elseif curStep == 1050 or curStep == 1082 or curStep == 1178 or curStep == 1210 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.38, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 1056 or curStep == 1060 or curStep == 1088 or curStep == 1138 or curStep == 1139 or curStep == 1140 or curStep == 1184 or curStep == 1188 or curStep == 1204 or curStep == 1206 or curStep == 1268 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 1064 or curStep == 1096 or curStep == 1128 or curStep == 1160 or curStep == 1192 or curStep == 1224 or curStep == 1256 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 1104 or curStep == 1168 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		doTweenZoom('camera', 'camGame', 0.9, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.9)
	elseif curStep == 1296 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('camGame.visible', false)
		setProperty('metro.visible', false)
		setProperty('metroOG.visible', true)
		triggerEvent('Change Character', 'dad', 'ZompiggyOG')
		triggerEvent('Change Character', 'boyfriend', 'BunnyOG')
	elseif curStep == 1312 then
		cameraFlash('camOther', 'FFFFFF', 2.5, true)
		setProperty('cameraSpeed', 4)
		setProperty('songSpeed', 3.35)
		doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.75)
		setProperty('camGame.visible', true)
	elseif curStep == 1320 or curStep == 1328 or curStep == 1336 or curStep == 1384 or curStep == 1392 or curStep == 1400 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 1344 or curStep == 1352 or curStep == 1360 or curStep == 1408 or curStep == 1416 or curStep == 1424 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 1368 or curStep == 1370 or curStep == 1372 or curStep == 1374 or curStep == 1432 or curStep == 1434 or curStep == 1436 or curStep == 1438 then
		if getProperty('camGame.visible') == false then
			setProperty('camGame.visible', true)
		else
			setProperty('camGame.visible', false)
		end
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.075, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.075)
	elseif curStep == 1376 then
		cameraFlash('camOther', 'FFFFFF', 0.25, true)
		doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.75)
		quickCamSwap()
	elseif curStep == 1440 or curStep == 1504 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
		setProperty('cameraSpeed', 3)
		setProperty('songSpeed', 3.15)
		quickCamSwap()
	elseif curStep == 1452 or curStep == 1468 or curStep == 1484 or curStep == 1516 or curStep == 1532 or curStep == 1548 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.055, 0.25, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.055)
	elseif curStep == 1498 or curStep == 1500 or curStep == 1502 or curStep == 1562 or curStep == 1564 or curStep == 1566 then
		cameraFlash('camGame', '000000', 0.75, true)
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 1568 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('Gone.alpha', 1)
		doTweenAlpha('GoneGo', 'Gone', 0, 3, 'linear')	
		triggerEvent('Change Character', 'dad', 'ZompiggyStunnedOG')
		setProperty('songSpeed', 3.25)
		setProperty('cameraSpeed', 5)
		setProperty('boyfriend.color', getColorFromHex('C1C1C1'))
		setProperty('dad.color', getColorFromHex('C1C1C1'))
		setProperty('metroOG.color', getColorFromHex('C1C1C1'))
		setProperty('Static.alpha', 1)
		doTweenZoom('camera', 'camGame', 0.7, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.7)
	elseif curStep == 1584 or curStep == 1590 or curStep == 1648 or curStep == 1654 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.055, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.055)
	elseif curStep == 1616 or curStep == 1622 or curStep == 1680 or curStep == 1686 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.025, 0.15, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.025)
	elseif curStep == 1696 then
		cameraFlash('camOther', '000000', 1, true)
		doTweenZoom('camera', 'camGame', 0.75, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.75)
	elseif curStep == 1712 or curStep == 1714 or curStep == 1776 or curStep == 1778 then 
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 1720 or curStep == 1722 or curStep == 1724 or curStep == 1726 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 1728 then
		cameraFlash('camOther', '000000', 1, true)
		doTweenZoom('camera', 'camGame', 0.8, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.8)
	elseif curStep == 1738 or curStep == 1739 or curStep == 1746 or curStep == 1747 or curStep == 1782 or curStep == 1783 or curStep == 1802 or curStep == 1803 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.025, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.025)
	elseif curStep == 1756 or curStep == 1758 or curStep == 1760 then
		cameraFlash('camGame', '000000', 0.75, true)
	elseif curStep == 1806 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.1, 0.34, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
		doTweenAlpha('metroOGG', 'metroOG', 0, 0.17, 'linear')
		doTweenAlpha('dadG', 'dad', 0, 0.17, 'linear')
	elseif curStep == 1810 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
		setProperty('metroOG.alpha', 1)
		setProperty('dad.alpha', 1)
	elseif curStep == 1820 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.25, 0.1, 'quadInOut')
	elseif curStep == 1824 then
		cameraFlash('camOther', '000000', 2.5, true)
		setProperty('camGame.visible', false)
		setProperty('camZooming', false)
		setProperty('camZoomingMult', 0)
		doTweenZoom('camera', 'camGame', 0.7, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.7)
		ammo = 0
		triggerEvent('Change Character', 'dad', 'Zompiggy')
		triggerEvent('Change Character', 'boyfriend', 'BunnyHalfInfected')
		removeLuaSprite('metroOG', true)
		setProperty('metro.visible', true)
		setProperty('cameraSpeed', 1)
		setProperty('Carrot.visible', false)
		setProperty('AmmoCount.visible', false)
	elseif curStep == 1828 then
		cameraFlash('camOther', '000000', 2.5, true)
		setProperty('camGame.visible', true)
		quickCamSwap()
	elseif curStep == 1844 or curStep == 1860 or curStep == 1876 or curStep == 1892 then
		quickCamSwap()
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.01, 'linear')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curSteep == 1924 then
		doTweenColor('dadDark', 'dad', '000000', 1, 'linear')
		doTweenColor('bgDark', 'metro', '000000', 1, 'linear')
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 1, 'quadInOut')
	elseif curStep == 1936 then
		cameraFlash('camOther', '000000', 2, true)
		setProperty('defaultCamZoom', 0.9)
		setProperty('camGame.visible', false)
		removeLuaSprite('metro', true)
		setProperty('metroEnd.visible', true)
		triggerEvent('Change Character', 'dad', 'ZompiggyFinale')
		triggerEvent('Change Character', 'boyfriend', 'BunnyInfected')
		setProperty('zompigicon.visible', true)
		setProperty('iconP2.visible', false)
		setProperty('camZooming', true)
		setProperty('camZoomingMult', 1)
	elseif curStep == 1952 then
		cameraFlash('camOther', 'FFFFFF', 1, true)
		setProperty('cameraSpeed', 5)
		setProperty('songSpeed', 3.45)
		setProperty('camGame.visible', true)
	elseif curStep == 1990 or curStep == 2062 or curStep == 2112 or curStep == 2118 or curStep == 2166 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.075, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.075)
	elseif curStep == 1998 or curStep == 2054 or curStep == 2160 or curStep == 2190 or curStep == 2196 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.075, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.075)
	elseif curStep == 2096 or curStep == 2102 or curStep == 2176 or curStep == 2182 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.05, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	elseif curStep == 2126 or curStep == 2132 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') - 0.05, 0.05, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.05)
	elseif curStep == 2208 then
		cameraFlash('camOther', '000000', 0.5, true)
		quickCamSwap()
		doTweenZoom('camera', 'camGame', 1.05, 0.01, 'linear')
		setProperty('defaultCamZoom', 1.05)
	elseif curStep == 2224 or curStep == 2232 then
		doTweenZoom('camera', 'camGame', getProperty('defaultCamZoom') + 0.1, 0.1, 'quadInOut')
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	elseif curStep == 2240 then
		cameraFlash('camOther', '000000', 0.5, true)
		doTweenZoom('camera', 'camGame', 0.9, 0.01, 'linear')
		setProperty('defaultCamZoom', 0.9)
		quickCamSwap()
		doTweenAlpha('camgame', 'camGame', 0, 1.3, 'linear')
	elseif curStep == 2256 then
		cameraFlash('camOther', '000000', 1, true)
		setProperty('deathAnim.visible', true)
		objectPlayAnimation('deathAnim', 'grab', false);
	elseif curStep == 2264 then
		cameraFlash('camOther', '000000', 1, true)
		objectPlayAnimation('deathAnim', 'lift', false);
	elseif curStep == 2272 then
		cameraFlash('camOther', 'FF0000', 1, true)
		setProperty('health', 0.001)
		objectPlayAnimation('deathAnim', 'bite', false);
		setObjectCamera('deathAnim', 'camOther')
		doTweenAlpha('fadedeath1', 'camHUD', 0, 2.83, 'linear')
		doTweenAlpha('fadedeath', 'deathAnim', 0, 5, 'linear')
		doTweenAlpha('finalCam', 'camOther', 0, 2.83, 'linear')
	elseif curStep == 2336 then
		setProperty('DeathFinal.alpha', 1)
		setProperty('Blood.visible', false)
		setProperty('Static.visible', false)
		doTweenAlpha('finalCam', 'camOther', 1, 3, 'linear')
	elseif curStep == 2384 then
		doTweenAlpha('finalCam', 'camOther', 0, 1.5, 'linear')
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if dodrain then
		if boyfriendName == 'BunnyHalfInfected' or boyfriendName == 'BunnyInfected' then
			if getProperty('health') > 0.03 then
				setProperty('health', getProperty('health') - 0.03)
			end
		else
			setProperty('health', getProperty('health') - 0.03)
		end
	end
	if dadName == 'ZompiggyAngry' or dadName == 'ZompiggyFinale' or (curStep > 1311 and curStep < 1440) then
		setProperty('camGame.angle', getRandomFloat(-1, 1))
		setProperty('camHUD.angle', getRandomFloat(-0.75, 0.75))
		doTweenAngle('returncam1', 'camHUD', 0, 0.1, 'linear')
		doTweenAngle('returncam2', 'camGame', 0, 0.1, 'linear')
		cameraShake('camHUD', 0.0125, 0.0125)
		cameraShake('camGame', 0.0125, 0.0125)
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	setProperty('health', health - 0.035625);
end

function onUpdatePost()
	if keyJustPressed('space') then
		if not readMechanic then
			cameraFlash('camOther', 'FFFFFF', 1, true)
			playSound('confirmMenu', 1)
			readMechanic = true
			doTweenAlpha('MechanicGo', 'Explain', 0, 3, 'linear')
			runTimer('BeginCountdown', 3)
		elseif ammo > 0 and debounce then
			debounce = false
			playSound('Crossbow', 1)
			runTimer('AnimDelay', 0.26)
		end
	end
	setTextString('AmmoCount', ammo)
	setProperty('Blood.alpha', 0.5 * (2 - (2 * getProperty('health'))))
	setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Miscalculations: ' .. misses .. ' | Survival Odds: ' .. currentOdds .. '% | Rating: ' .. ratingFC)
	if curStep > 495 and curStep < 504 then
		setProperty('camFollow.x', 1125)
		setProperty('camFollow.y', 500)
	elseif curStep > 503 and curStep < 512 then
		setProperty('camFollow.x', 475)
		setProperty('camFollow.y', 700)
	elseif curStep > 511 and curStep < 528 then
		setProperty('camFollow.x', 800)
		setProperty('camFollow.y', 625)
	end
end


function onTimerCompleted(tag)
	if tag == 'resume' then
		dodrain = true
		debounce = true
	elseif tag == 'AnimDelay' then

		playAnim('boyfriend', 'attack', false)
		setProperty('boyfriend.specialAnim', true)

		dodrain = false
		setProperty('IconP2.color', getColorFromHex('FF0000'))
		doTweenColor('ReturnIcon', 'IconP2', 'FFFFFF', 2.5, 'linear');
		ammo = ammo - 1
		setProperty('health', getProperty('health') + 0.65)
		runTimer('resume', 2.5)
	elseif tag == 'DeathFlash' then
		cameraFlash('camOther', '950028', 1, true)
		setProperty('DeathScreen.visible', true)
		setProperty('RetryText.visible', true)
		setProperty('Static.visible', true)
	elseif tag == 'Jumpscare' then
		doTweenAlpha('FadeDeath', 'DeathScreen', 0, 1, 'linear')
		runTimer('ActualJumpscare', 2.5)
	elseif tag == 'ActualJumpscare' then
		objectPlayAnimation('Zompiggy', 'Jumpscare', false)
	elseif tag == 'returnCamSpeed' then
		setProperty('cameraSpeed', prevCamSpeed)
	elseif tag == 'RemoveOdds' then
		if currentOdds > 0 then
			runTimer('RemoveOdds', 2.5775)
			currentOdds = currentOdds - 1
		end
	elseif tag == 'BeginCountdown' then
		removeLuaSprite('Mechanic', false)
	end
end


function onGameOverStart()
	setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
	setProperty('boyfriend.visible', false);
	runTimer('DeathFlash', 0.92)

	makeLuaSprite('DeathScreen', 'stages/metro/Death', 0, 25)
	setObjectCamera('DeathScreen', 'other');
	addLuaSprite('DeathScreen', false)

	makeAnimatedLuaSprite('RetryText', 'stages/metro/RetryLoop', 70, 35);
	addAnimationByPrefix('RetryText', 'RetryBop', 'RetryLoop instance', 24, true);
	setObjectCamera('RetryText', 'other');
	addLuaSprite('RetryText', false);

	makeAnimatedLuaSprite('Static', 'stages/metro/Static', 0, 0);
	addAnimationByPrefix('Static', 'StaticIdle', 'Static instance', 24, true);
	scaleObject('Static', 1, 0.975);
	setObjectCamera('Static', 'other');
	addLuaSprite('Static', false);
	
	setObjectOrder('DeathScreen', 1)
	setObjectOrder('RetryText', 2)
	setObjectOrder('Static', 3)

	setProperty('DeathScreen.visible', false)
	setProperty('RetryText.visible', false)
	setProperty('Static.visible', false)
end

function onGameOverConfirm(retry)
	cameraFlash('camOther', '000000', 1, true)
	doTweenAlpha('Death', 'DeathScreen', 0, 2, 'linear')
	doTweenAlpha('thetext', 'RetryText', 0, 2.5, 'linear')
	doTweenAlpha('thestatic', 'Static', 0, 2.5, 'linear')	
	makeLuaSprite('Eye', 'stages/metro/eye', 0, 25)
	setObjectCamera('Eye', 'other');
	addLuaSprite('Eye', false)
	doTweenAlpha('Eyeb', 'Eye', 0, 3, 'linear')
end

function onPause()
	if boyfriendName == 'BunnyHalfInfected' or boyfriendName == 'BunnyInfected' then
		return Function_Stop;
	else
		return Function_Continue;
	end
end