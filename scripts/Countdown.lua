local readMechanic = true

function onCreate()
	precacheSound('intro2');
	precacheSound('intro1');
	precacheSound('introGo');

	makeLuaSprite('loadready', 'loading/ready', 170, 150)
	setObjectCamera('loadready', 'other')
	setProperty('loadready.alpha', 0)
	scaleObject('loadready', 0.5, 0.5)
	addLuaSprite('loadready', true)

	makeLuaSprite('loadset', 'loading/set', 170, 150)
	setObjectCamera('loadset', 'other')
	setProperty('loadset.alpha', 0)
	scaleObject('loadset', 0.5, 0.5)
	addLuaSprite('loadset', true)

	makeLuaSprite('loadgo', 'loading/go', 170, 150)
	setObjectCamera('loadgo', 'other')
	setProperty('loadgo.alpha', 0)
	scaleObject('loadgo', 0.5, 0.5)
	addLuaSprite('loadgo', true)

	setObjectOrder('loadready', 6)
	setObjectOrder('loadset', 7)
	setObjectOrder('loadgo', 8)

	setProperty('skipCountdown', true);
end
			
function onCreatePost()
	if songName ~= 'Kinemortophobia' then
		runTimer('BeginCountdown', 3)
	end
	if songName == 'Where To?' then
		makeLuaSprite('SongName', 'songTitles/WhereTo', -410, 80)
	else
		makeLuaSprite('SongName', 'songTitles/' .. songName, -410, 80)
	end
	setObjectCamera('SongName', 'other')
	scaleObject('SongName', 0.7, 0.7)
	addLuaSprite('SongName', true)
end

CanPause = false
Countdown = false
Current = 1

function onSongStart()
	doTweenX('MoveTag1', 'SongName', 0, 1, 'cubeInOut')
end

function onPause()
	if CanPause == false then
		return Function_Stop;
	elseif CanPause == true then
		return Function_Continue;
	end
end

function onStartCountdown()
	if Countdown == false then
		return Function_Stop
	elseif Countdown == true then
		return Function_Continue;
	end
end

function onTimerCompleted(tag)
	if tag == 'BeginSong' then
		Countdown = true
		removeLuaSprite('loadgo', true)
		startCountdown();
	elseif tag == 'BeginCountdown' then
		runTimer('NextNumber', (120 / bpm), 4)
	elseif tag == 'NextNumber' then
		if Current == 1 then
			playSound('intro2', 1)
			setProperty('loadready.alpha', 1)
			setProperty('loadready.scale.x', 0.8)
			setProperty('loadready.scale.y', 0.8)
			doTweenX('ReadyScaleX', 'loadready.scale', 0.5, 0.5 ,'circOut')
			doTweenY('ReadyScaleY', 'loadready.scale', 0.5, 0.5 ,'circOut')
			doTweenAlpha('loadingready', 'loadready', 0, 1, 'quadInOut')
			Current = 2
		elseif Current == 2 then
			playSound('intro1', 1)
			removeLuaSprite('loadready', true)
			setProperty('loadset.alpha', 1)
			setProperty('loadset.scale.x', 0.8)
			setProperty('loadset.scale.y', 0.8)
			doTweenX('SetScaleX', 'loadset.scale', 0.5, 0.5 ,'circOut')
			doTweenY('SetScaleY', 'loadset.scale', 0.5, 0.5 ,'circOut')
			doTweenAlpha('loadingset', 'loadset', 0, 1, 'quadInOut')
			Current = 3
		elseif Current == 3 then
			playSound('introGo', 1)
			runTimer('IsPauseable', 1.5)
			removeLuaSprite('loadset', true)
			setProperty('loadgo.alpha', 1)
			setProperty('loadgo.scale.x', 0.8)
			setProperty('loadgo.scale.y', 0.8)
			doTweenX('goScaleX', 'loadgo.scale', 0.5, 0.5 , 'circOut')
			doTweenY('goScaleY', 'loadgo.scale', 0.5, 0.5 , 'circOut')
			doTweenAlpha('loadinggo', 'loadgo', 0, 1, 'quadInOut')
			Current = 0
			runTimer('BeginSong', 1)
		end
	elseif tag == 'IsPauseable' then
		CanPause = true
	elseif tag == 'SongNameBye' then
		doTweenX('MoveTag2', 'SongName', -410, 1, 'cubeInOut')	
	end
end

function onTweenCompleted(tag)
	if tag == 'MoveTag1' then
		runTimer('SongNameBye', 1)
	elseif tag == 'MoveTag2' then
		removeLuaSprite('SongName', true)
	end
end