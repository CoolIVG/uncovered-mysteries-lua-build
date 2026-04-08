doIdle = true;
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"};
local singOffsets = {{-9, 10}, {0, -30}, {-6, 50}, {0, 27}};

function onCreate()
	makeAnimatedLuaSprite('Jakayla', 'characters/DADDY_DEAREST', getProperty('dad.x') + 550, getProperty('dad.y') - 400);
	addAnimationByPrefix('Jakayla', 'idle', 'Dad idle dance', 24, false);
	for i, anim in ipairs(singAnims) do
		addAnimationByPrefix('Jakayla', anim, 'Dad Sing Note ' .. anim:sub(5), 24, false);
	end
end

function handleJakaylaNoteHit(direction)
	doIdle = false;
	objectPlayAnimation('Jakayla', singAnims[direction + 1], true);
	setProperty('Jakayla.offset.x', singOffsets[direction + 1][1]);
	setProperty('Jakayla.offset.y', singOffsets[direction + 1][2]);
end
function noteHit(id, direction, noteType, isSustainNote)
	if noteType == 'JakaylaNotes' then
		handleJakaylaNoteHit(direction);
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
		objectPlayAnimation('Jakayla', 'idle', false);
		setProperty('Jakayla.offset.x', 0);
		setProperty('Jakayla.offset.y', 0);
	--end
end
