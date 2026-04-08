function onCreate()
	makeLuaSprite('metrostart', 'stages/metro/MetroStart', -700, 50)
	scaleObject('metrostart', 2, 2);
	addLuaSprite('metrostart', false)

	makeLuaSprite('metro', 'stages/metro/Metro', -500, 50)
	scaleObject('metro', 2, 2);
	setProperty('metro.visible', false)
	addLuaSprite('metro', false)

	makeLuaSprite('metroOG', 'stages/metro/MetroOG', -700, 50)
	scaleObject('metroOG', 2, 2)
	setProperty('metroOG.visible', false)
	addLuaSprite('metroOG', false)

	makeLuaSprite('metroEnd', 'stages/metro/MetroEnd', -700, 50)
	scaleObject('metroEnd', 2, 2);
	setProperty('metroEnd.visible', false)
	addLuaSprite('metroEnd', false)

	makeAnimatedLuaSprite('Static', 'stages/metro/Static', 0, 0);
	addAnimationByPrefix('Static', 'StaticIdle', 'Static instance', 24, true);
	scaleObject('Static', 1, 0.975);
	setObjectCamera('Static', 'other');
	addLuaSprite('Static', false);
end

function onCreatePost()
	makeAnimatedLuaSprite('deathAnim', 'stages/metro/DeathAnim', 360, 0);
	addAnimationByPrefix('deathAnim','grab','Grab', 1, true);
	addAnimationByPrefix('deathAnim','lift','Lift', 1, true);
	addAnimationByPrefix('deathAnim','bite','Bite', 1, true);
	setObjectCamera('deathAnim', 'camHUD');
	setObjectOrder('deathAnim', getObjectOrder('strumLineNotes')-1)
	addLuaSprite('deathAnim', false);

	setObjectOrder('metrostart', 1)
	setObjectOrder('metro', 2)
	setObjectOrder('metroOG', 3)
	setObjectOrder('metroEnd', 4)
	setObjectOrder('gfGroup', 5)
	setObjectOrder('dadGroup', 6)
	setObjectOrder('boyfriendGroup', 7)
	setObjectOrder('DeathScreen', 8)
	setObjectOrder('RetryText', 9)
	setObjectOrder('deathAnim', '10');
	setObjectOrder('Static', 11)

	setProperty('deathAnim.visible', false)
end