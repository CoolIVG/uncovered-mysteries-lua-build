doIdle = true;
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"};
local singOffsets = {{-9, 10}, {0, -30}, {-6, 50}, {0, 27}};

function onCreate()
	makeAnimatedLuaSprite('Shardantus', 'characters/DADDY_DEAREST', getProperty('dad.x') + 750, getProperty('dad.y') - 400);
	addAnimationByPrefix('Shardantus', 'idle', 'Dad idle dance', 24, false);
	for i, anim in ipairs(singAnims) do
		addAnimationByPrefix('Shardantus', anim, 'Dad Sing Note ' .. anim:sub(5), 24, false);
	end
end

function handleShardantusNoteHit(direction)
	doIdle = false;
	objectPlayAnimation('Shardantus', singAnims[direction + 1], true);
	setProperty('Shardantus.offset.x', singOffsets[direction + 1][1]);
	setProperty('Shardantus.offset.y', singOffsets[direction + 1][2]);
end
function noteHit(id, direction, noteType, isSustainNote)
	if noteType == 'ShardantusNotes' then
		handleShardantusNoteHit(direction);
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
		objectPlayAnimation('Shardantus', 'idle', false);
		setProperty('Shardantus.offset.x', 0);
		setProperty('Shardantus.offset.y', 0);
	--end
end
