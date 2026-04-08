--Credit to circuitella for making this script!!

function onEvent(name, value1, value2)
	if name == 'WindowChanges' then
		local IconPath = value1
		addHaxeLibrary('Application', 'lime.app')
		addHaxeLibrary('Image', 'lime.graphics')
		runHaxeCode([[
			var Icon:Image=Image.fromFile(Paths.modFolders('images/]]..IconPath..[[.png'));
			Application.current.window.setIcon(Icon);
		]])
		local title = getPropertyFromClass('openfl.Lib', 'application.window.title')
		setPropertyFromClass('openfl.Lib', 'application.window.title', value2)
	end
end