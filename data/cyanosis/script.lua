function onSongStart()
	if not middlescroll then
		for i = 0, 3 do
    			setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
    			setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i] + 10)
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') > 0.05 then
		setProperty('health', getProperty('health') - 0.024)
	end
end

