chosenCharacter = "Shardantus" --Hey snoopers! This code is currently just for testing. Change "Shardantus" to any other skin contest skin name to play their respective chart.
local noteTypes = {
	Jakayla = 'JakaylaNotes',
	Glenn = 'GlennNotes',
	Russel = 'RusselNotes',
	Shardantus = 'ShardantusNotes',
	Fergus = 'FergusNotes'
}

function onUpdatePost(elapsed)
	local chosenNoteType = noteTypes[chosenCharacter]
	if chosenNoteType then
		for a = 0, getProperty('notes.length') - 1 do
			if getPropertyFromGroup('notes', a, 'noteType') == chosenNoteType then
				setPropertyFromGroup('notes', a, 'mustPress', true)
			end
		end
	end
end

function onSongStart()
	setProperty('cameraSpeed', 0)
	for i = 0, 3 do
		noteTweenAlpha('Note' .. i, i, 0, 0.00001, 'linear')
	end
	if not middlescroll then
		for i = 0, getProperty('playerStrums.length') do
			setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x') - 320);
		end
	end
end

function onCreatePost()
	setObjectOrder('Shardantus', 10)
	setObjectOrder('Jakayla', 11)
	setObjectOrder('Russel', 12)
	setObjectOrder('Glenn', 13)
	setObjectOrder('Fergus', 14)

	setProperty('gfGroup.visible', false)
	setProperty('dadGroup.visible', false)
	setProperty('boyfriendGroup.visible', false)

	setProperty('healthBarBG.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('iconsq1.visible', false)
	setProperty('iconsq2.visible', false)
end