function onCreatePost()
	addCharacterToList('Piglet_Porcellum', 'dad')
end

function onStepHit()
	if curStep == 288 then
		triggerEvent('Change Character', 'dad', 'Piglet_Porcellum')
	end
end