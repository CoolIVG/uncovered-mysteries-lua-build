
offsetX = 10
offsetY = 10

CLO = false
CLX = nil
CLY = nil

CPX = nil -- Camera X position with offset
CPY = nil -- Camera Y position with offset

Character = nil -- 'player' or 'opponent'

function cameraUpdate()
	CPX = getProperty('camFollow.x')
	CPY = getProperty('camFollow.y')
end

function onMoveCamera(focus)
	cameraUpdate()
	if (focus == 'boyfriend') or (focus == 'gf' and mustHitSection) then
		CLO = false
	elseif (focus == 'dad') or (focus == 'gf' and not mustHitSection) then
		CLO = false
	end
	Character = focus
end

function onUpdatePost()
	if CLO and not getProperty('isCameraOnForcedPos') then 
		setProperty('camFollow.x', CLX)
		setProperty('camFollow.y', CLY)
	end
end

local function updateCamPosition(direction)
	if direction == 0 then
		CLX = CPX - offsetX
		CLY = CPY
	elseif direction == 1 then
		CLX = CPX
		CLY = CPY + offsetY
	elseif direction == 2 then
		CLX = CPX
		CLY = CPY - offsetY
	elseif direction == 3 then
		CLX = CPX + offsetX
		CLY = CPY
	else
		CLX = CPX
		CLY = CPY
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if Character == 'boyfriend' or (Character == 'gf' and mustHitSection) then
		CLO = true
		updateCamPosition(direction)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if Character == 'dad' or (Character == 'gf' and not mustHitSection) then
		CLO = true
		updateCamPosition(direction)
	end
end