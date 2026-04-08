doIdle = true;
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"};
local singOffsets = {{-9, 10}, {0, -30}, {-6, 50}, {0, 27}};

function onCreate()
	makeAnimatedLuaSprite('Fergus', 'characters/DADDY_DEAREST', getProperty('dad.x') - 50, getProperty('dad.y') - 400);
	addAnimationByPrefix('Fergus', 'idle', 'Dad idle dance', 24, false);
	for i, anim in ipairs(singAnims) do
		addAnimationByPrefix('Fergus', anim, 'Dad Sing Note ' .. anim:sub(5), 24, false);
	end
end

function handleFergusNoteHit(direction)
	doIdle = false;
	objectPlayAnimation('Fergus', singAnims[direction + 1], true);
	setProperty('Fergus.offset.x', singOffsets[direction + 1][1]);
	setProperty('Fergus.offset.y', singOffsets[direction + 1][2]);
end
function noteHit(id, direction, noteType, isSustainNote)
	if noteType == 'FergusNotes' then
		handleFergusNoteHit(direction);
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
		objectPlayAnimation('Fergus', 'idle', false);
		setProperty('Fergus.offset.x', 0);
		setProperty('Fergus.offset.y', 0);
	--end
end
