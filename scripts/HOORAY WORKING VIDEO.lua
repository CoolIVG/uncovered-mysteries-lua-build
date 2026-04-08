function onEvent(name, v1, v2)
	if name == 'playVideo' then
		makeLuaSprite('videoSprite','',0,0)
		setProperty('videoSprite.alpha', 1)
		setObjectCamera('videoSprite', v2);
		addLuaSprite('videoSprite', false)

		runHaxeCode([[
			var name = "]] .. v1 .. [[";
			var filepath = Paths.video(name);
			var video = new MP4Handler();
			video.playVideo(filepath);
			video.visible = false;
			setVar('video',video);
		]])
	end
end


function onCreate()
	addHaxeLibrary('MP4Handler','vlc')
	addHaxeLibrary('Event','openfl.events')
end

function onSongStart()
	playVideo('Preload', 'camOther')
	setProperty('videoSprite.alpha', 0.001)
end

function onUpdatePost()
	runHaxeCode([[
		var video = getVar('video');
		game.getLuaObject('videoSprite').loadGraphic(video.bitmapData);
		video.volume = FlxG.sound.volume;
		if(game.paused)video.pause();
	]])
end


function onResume()
	runHaxeCode([[
		var video = getVar('video');
		video.resume();
	]])
end