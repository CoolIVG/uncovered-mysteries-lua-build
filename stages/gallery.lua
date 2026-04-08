function onCreate()
	makeLuaSprite('Shading', 'stages/gallery/Shading', -500, -350);
	scaleObject('Shading', 1.7, 1.7);
	setScrollFactor('Shading', 1, 1);
	addLuaSprite('Shading',false);

	makeLuaSprite('Globe', 'stages/gallery/Relic', -500, -350);
	scaleObject('Globe', 1.7, 1.7);
	setScrollFactor('Globe', 1, 1);
	addLuaSprite('Globe', false);

	makeLuaSprite('Ocean', 'stages/gallery/Ocean', -500, -400);
	scaleObject('Ocean', 1.7, 1.7);
	setScrollFactor('Ocean', 1, 1);
	addLuaSprite('Ocean', false);

	makeLuaSprite('Gallery', 'stages/gallery/Gallery', -500, -400);
	scaleObject('Gallery', 1.7, 1.7);
	setScrollFactor('Gallery', 1, 1);
	addLuaSprite('Gallery', false);

	makeAnimatedLuaSprite('Binary', 'stages/gallery/Binary', 0, -10);
	addAnimationByPrefix('Binary', 'Binar', 'idle', 12, true);
	scaleObject('Binary', 3.56, 3);
	setObjectCamera('Binary', 'other');
	setProperty('Binary.alpha', 0)
	addLuaSprite('Binary', false);
end

function onCreatePost()
	setObjectOrder('Ocean', 1)
	setObjectOrder('Gallery', 2)
	setObjectOrder('gfGroup', 3)
	setObjectOrder('boyfriendGroup', 5)
	setObjectOrder('dadGroup', 6)
	setObjectOrder('Globe', 7)
	setObjectOrder('Shading', 8)
end