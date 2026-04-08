doIdle = true;
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"};
local singOffsets = {{-9, 10}, {0, -30}, {-6, 50}, {0, 27}};

function onCreate()
	makeAnimatedLuaSprite('Russel', 'characters/DADDY_DEAREST', getProperty('dad.x') + 350, getProperty('dad.y') - 400);
	addAnimationByPrefix('Russel', 'idle', 'Dad idle dance', 24, false);
	for i, anim in ipairs(singAnims) do
		addAnimationByPrefix('Russel', anim, 'Dad Sing Note ' .. anim:sub(5), 24, false);
	end
end

function handleRusselNoteHit(direction)
	doIdle = false;
	objectPlayAnimation('Russel', singAnims[direction + 1], true);
	setProperty('Russel.offset.x', singOffsets[direction + 1][1]);
	setProperty('Russel.offset.y', singOffsets[direction + 1][2]);
end
function noteHit(id, direction, noteType, isSustainNote)
	if noteType == 'RusselNotes' then
		handleRusselNoteHit(direction);
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
		objectPlayAnimation('Russel', 'idle', false);
		setProperty('Russel.offset.x', 0);
		setProperty('Russel.offset.y', 0);
	--end
end
