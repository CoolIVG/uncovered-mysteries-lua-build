minitoonhealththing = false

function onUpdate()
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.M') then
		if not minitoonhealththing then
			minitoonhealththing = true
		else
			minitoonhealththing = false
		end
	end
	if minitoonhealththing then
		setProperty('health', 2)
	end
end


function onCreatePost()
	makeLuaSprite('iconsq1', 'IconSquare', 90, 500)
	scaleObject('iconsq1', 0.6, 0.6)
	setObjectCamera ('iconsq1', 'camHUD')
	addLuaSprite('iconsq1', false)

	makeLuaSprite('iconsq2', 'IconSquare', 90, 230)
	scaleObject('iconsq2', 0.6, 0.6)
	setObjectCamera ('iconsq2', 'camHUD')
	addLuaSprite('iconsq2', false)

	setObjectOrder('strumLineNotes', 3)
	setObjectOrder('healthBar', 4)
	setObjectOrder('healthBarBG', 5)
	setObjectOrder('iconsq2', 6)  --Opponent Square
	setObjectOrder('iconP2', 7)  --Opponent
	setObjectOrder('iconsq1', 8)  --Player Square
	setObjectOrder('iconP1', 9)  --Player

	setObjectCamera ('iconP1', 'camHUD')
	setObjectCamera ('iconP2', 'camHUD')


	setProperty('healthBarBG.x', -180)
	if downscroll then
		setProperty('healthBarBG.y', 350)
	else
		setProperty('healthBarBG.y', 400)
	end
	setProperty('healthBar.y', (getProperty('healthBarBG.y') + 4))
	setProperty('healthBar.x', (getProperty('healthBarBG.x') + 2))

	setProperty('healthBarBG.angle', 90)
	setProperty('healthBar.angle', 90)
	scaleObject('iconP2', 0.65, 0.65)
	scaleObject('iconP1', 0.65, 0.65)

	setProperty('iconP1.flipX', true)

	if songName ~= "Hallow's Warmup" then
		setTextSize('timeTxt', 50);
		setProperty('timeBar.visible', false);
		setProperty('timeBarBG.visible', false);
		setPropertyFromClass('ClientPrefs', 'timeBarType', 'TimeLeft')
		setTextFont('scoreTxt', 'msmincho.ttf')
		setTextFont('timeTxt', 'msmincho.ttf')
		setTextFont('botplayTxt', 'msmincho.ttf')
		setProperty('botplayTxt.x', getProperty('botplayTxt.x') - 5)

		if downscroll then
			setProperty('timeTxt.y', getProperty('scoreTxt.y') - 100)
			setProperty('scoreTxt.y', getProperty('scoreTxt.y') - 35)
			setProperty('iconsq1.y', 450)
			setProperty('iconsq2.y', 180)
		end
	end
end

function onUpdatePost()
	setProperty('iconP1.x', (getProperty('iconsq1.x') - 18))
	setProperty('iconP2.x', (getProperty('iconsq2.x') - 18))
	setProperty('iconP1.y', (getProperty('iconsq1.y') - 18))
	setProperty('iconP2.y', (getProperty('iconsq2.y') - 18))

	if botPlay then
		setProperty('scoreTxt.visible', false)
	end

	if songName ~= 'Maladjusted' then
		scaleObject('iconP2', 0.6, 0.6)
		scaleObject('iconP1', 0.6, 0.6)
	end
end

function onBeatHit()
	if songName ~= 'Maladjusted' then
		if curBeat %2 == 0 then
			doTweenAngle('player', 'iconP1', 20, 0.025, 'linear')
			doTweenAngle('opponent', 'iconP2', -20, 0.025, 'linear')
		else
			doTweenAngle('player', 'iconP1', -20, 0.025, 'linear')
			doTweenAngle('opponent', 'iconP2', 20, 0.025, 'linear')
		end
		runTimer('ReturnAngle', 0.1)
	end
end

function onTimerCompleted(tag)
	if tag == 'ReturnAngle' then
		doTweenAngle('player', 'iconP1', 0, 0.1, 'linear')
		doTweenAngle('opponent', 'iconP2', 0, 0.1, 'linear')
	end
end