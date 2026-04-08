local bgChars = {'Ghosty', 'Owell', 'Stitchy', 'Crove', 'Weimin'}

function onCreate()
	local order = {'sky', 'darkbush', 'floor', 'lights', 'bushBG', 'treeBG', 'pumpkins', 'seat', 'Ghosty', 'Weimin', 'Owell', 'Crove', 'Stitchy', 'dadGroup', 'boyfriendGroup', 'be', 'frontbush'}

	for i = 1, 5 do
		makeAnimatedLuaSprite(bgChars[i], 'stages/forest/characters/sweettooth'..bgChars[i], 600 + 250*i, 850);
		addAnimationByPrefix(bgChars[i], 'idle', '1'..bgChars[i], 24, false);
	end
	addAnimationByPrefix('Ghosty', 'idle2', '2Ghosty', 24, false);
	addAnimationByPrefix('Stitchy', 'idle2', '2Stitchy', 24, false);
	setProperty('Ghosty.alpha', 0.75)
	setProperty('Ghosty.y', 600)
	setProperty('Owell.y', 775)

	makeLuaSprite('sky', 'stages/forest/sky', 0, 0)
	makeLuaSprite('darkbush', 'stages/forest/DARKBUSH', 0, 0)
	makeLuaSprite('floor', 'stages/forest/FLOOR', 0, 0)
	makeLuaSprite('lights', 'stages/forest/LIGHTS', 0, 0)
	makeLuaSprite('bushBG', 'stages/forest/BGBUSH', 0, 0)
	makeLuaSprite('treeBG', 'stages/forest/BGTREE', 0, 0)
	makeLuaSprite('pumpkins', 'stages/forest/PUMPKINS', 0, 0)
	makeLuaSprite('seat', 'stages/forest/SEAT', 0, 0)
	makeLuaSprite('be', 'stages/forest/BE', 0, 0)
	makeLuaSprite('frontbush', 'stages/forest/FRONTBUSH', 0, 0)

	for i = 1, #order do
		setObjectOrder(order[i], i)
		if i < 9 or i > 15 then
			scaleObject(order[i], 0.75, 0.75)
		end
	end
end

function onBeatHit()
	if curBeat%2==0 then
		if curBeat%4==0 then
			objectPlayAnimation('Ghosty', 'idle2', true);
			objectPlayAnimation('Stitchy', 'idle2', true);
		else
			objectPlayAnimation('Ghosty', 'idle', true);
			objectPlayAnimation('Stitchy', 'idle', true);
		end
		objectPlayAnimation('Owell', 'idle', true);
		objectPlayAnimation('Crove', 'idle', true);
		objectPlayAnimation('Weimin', 'idle', true);
	end
end