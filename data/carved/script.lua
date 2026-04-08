function onCreate()
	local order = {'sky', 'darkbush', 'floor', 'lights', 'bushBG', 'treeBG', 'pumpkins', 'seat', 'gfGroup', 'dadGroup', 'boyfriendGroup', 'be', 'frontbush'}

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
		if i ~= 9 and i ~= 10 and i ~= 11 then
			scaleObject(order[i], 0.75, 0.75)
		end
	end
end


function onCreatePost()
	addCharacterToList('Carver2', 'dad')
end

function onStepHit()
	if curStep == 208 then
		triggerEvent('Change Character', 'dad', 'Carver2')
	end
end