local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"};
local bgCharOffsets = {
	{{23, 9}, {2, -12}, {-2, 48}, {-8, 9}}, -- Mr P
	{{6, 3}, {0, -2}, {0, 9}, {0, 3}}, -- Bunny
	{{9, 2}, {0, -5}, {0, 10}, {0, 4}}, -- Willow
	{{7, 3}, {0, -3}, {0, 7}, {-4, 2}}, -- Beary
	{{6, 1}, {0, -5}, {0, 9}, {0, 3}} -- Colton
};
local bgCharPositions = {
	{x = 525, y = 185, scaleX = 0.4, scaleY = 0.4},
	{x = 750, y = 270, scaleX = 0.5, scaleY = 0.5},
	{x = 850, y = 285, scaleX = 0.5, scaleY = 0.5},
	{x = 940, y = 225, scaleX = 0.5, scaleY = 0.5},
	{x = 1075, y = 325, scaleX = 0.5, scaleY = 0.5}
}

function onCreatePost()
	for i = 1, 5 do
		makeAnimatedLuaSprite('bgChar'..i, 'stages/facility/background/bgchar'..i, bgCharPositions[i].x, bgCharPositions[i].y);
		addAnimationByPrefix('bgChar'..i, 'idle', 'idle', 24, true);

		addAnimationByPrefix('bgChar'..i, 'singLEFT', 'left', 24, false);
		addAnimationByPrefix('bgChar'..i, 'singDOWN', 'down', 24, false);
		addAnimationByPrefix('bgChar'..i, 'singUP', 'up', 24, false);
		addAnimationByPrefix('bgChar'..i, 'singRIGHT', 'right', 24, false);

		scaleObject('bgChar'..i, bgCharPositions[i].scaleX, bgCharPositions[i].scaleY)
		setProperty('bgChar'..i..'.visible', false)
		addLuaSprite('bgChar'..i, false)
	end
	setObjectOrder('bgChar1', 2)
	setObjectOrder('bgChar5', 3)
	setObjectOrder('bgChar2', 4)
	setObjectOrder('bgChar4', 5)
	setObjectOrder('bgChar3', 6)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' then
		for i = 1, 5 do
			objectPlayAnimation('bgChar'..i, singAnims[direction + 1], true);
			setProperty('bgChar'..i..'.offset.x', bgCharOffsets[i][direction + 1][1]);
			setProperty('bgChar'..i..'.offset.y', bgCharOffsets[i][direction + 1][2]);
		end
	end
end
