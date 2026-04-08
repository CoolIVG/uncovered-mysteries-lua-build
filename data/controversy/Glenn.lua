doIdle = true;
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"};
local singOffsets = {{-9, 10}, {0, -30}, {-6, 50}, {0, 27}};

function onCreate()
	makeAnimatedLuaSprite('Glenn', 'characters/DADDY_DEAREST', getProperty('dad.x') + 150, getProperty('dad.y') - 400);
	addAnimationByPrefix('Glenn', 'idle', 'Dad idle dance', 24, false);
	for i, anim in ipairs(singAnims) do
		addAnimationByPrefix('Glenn', anim, 'Dad Sing Note ' .. anim:sub(5), 24, false);
	end
end

function handleGlennNoteHit(direction)
	doIdle = false;
	objectPlayAnimation('Glenn', singAnims[direction + 1], true);
	setProperty('Glenn.offset.x', singOffsets[direction + 1][1]);
	setProperty('Glenn.offset.y', singOffsets[direction + 1][2]);
end
function noteHit(id, direction, noteType, isSustainNote)
	if noteType == 'GlennNotes' then
		handleGlennNoteHit(direction);
	end
end
opponentNoteHit = noteHit
goodNoteHit = noteHit

function onBeatHit()
	if doIdle then
		idleDance(curBeat);
	end
	doIdle = true;
end
function idleDance(beat)
	--if beat % 2 == 0 then
		objectPlayAnimation('Glenn', 'idle', false);
		setProperty('Glenn.offset.x', 0);
		setProperty('Glenn.offset.y', 0);
	--end
end
