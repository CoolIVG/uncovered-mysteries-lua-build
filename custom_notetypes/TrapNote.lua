function onCreate()
	precacheSound('Trap')
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'TrapNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/TrapNotes');
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'TrapNote' then
		setProperty('boyfriend.stunned', true);
		setProperty('boyfriend.color', getColorFromHex('C8C8C8'))
		triggerEvent('Add Camera Zoom', 0.05,0.03)
		cameraFlash('camOther', '000000', 1, true)
		playSound('Trap', 0.5)
		runTimer('Unstun', 1)
	end
end

function onTimerCompleted(tag)
	if tag == 'Unstun' then
		setProperty('boyfriend.stunned', false);
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
	end
end