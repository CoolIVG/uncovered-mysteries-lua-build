local shaderName = "Monochrome"
local shaderEnabled = false

function onCreate()
	shaderCoordFix()

	makeLuaSprite("nameOfShader")
	makeGraphic("shaderImage", screenWidth, screenHeight)

	setSpriteShader("shaderImage", "nameOfShader")


	runHaxeCode([[
		var shaderName = "]] .. shaderName .. [[";
        
		game.initLuaShader(shaderName);
        
		var shader0 = game.createRuntimeShader(shaderName);
		game.camGame.setFilters([new ShaderFilter(shader0)]);
		game.getLuaObject("nameOfShader").shader = shader0;
		return;
	]])
end

function onUpdate(elapsed)
	if shaderEnabled then
		setShaderFloat("nameOfShader", "iTime", os.clock())
	end
end

function shaderCoordFix()
	runHaxeCode([[
		resetCamCache = function(?spr) {
			if (spr == null || spr.filters == null) return;
			spr.__cacheBitmap = null;
			spr.__cacheBitmapData = null;
		}
        
		fixShaderCoordFix = function(?_) {
			resetCamCache(game.camGame.flashSprite);
			resetCamCache(game.camHUD.flashSprite);
			--resetCamCache(game.camOther.flashSprite);
		}
    
		FlxG.signals.gameResized.add(fixShaderCoordFix);
		fixShaderCoordFix();
		return;
	]])
    
	local temp = onDestroy
	function onDestroy()
		runHaxeCode([[
			FlxG.signals.gameResized.remove(fixShaderCoordFix);
			return;
        	]])
		if (temp) then temp() end
	end
end

function onStepHit()
	if curStep == 1055 then
		if curStep == 1055 then
			doTweenAngle('switcharoo', 'camHUD', 360, 0.3, 'linear')
			doTweenAngle('switcharoo2', 'camGame', 360, 0.3, 'linear')
		end
		runTimer('waitup', 0.15)
	elseif curStep == 1311 then
		if curStep == 1311 then
			doTweenAngle('switcharoo', 'camHUD', 360, 0.3, 'linear')
			doTweenAngle('switcharoo2', 'camGame', 360, 0.3, 'linear')
		end
		runTimer('waitup2', 0.15)
	end
end

function onTimerCompleted(tag)
	if tag == 'waitup' then	
		cameraFlash('camOther', '000000', 0.15, true)	
		runHaxeCode([[
			var shader0 = game.getLuaObject("nameOfShader").shader;
			game.camGame.setFilters([new ShaderFilter(shader0)]);
			game.camOther.setFilters([new ShaderFilter(shader0)]);
		]])
		shaderEnabled = true
	elseif tag == 'waitup2' then
		cameraFlash('camOther', '000000', 0.15, true)
		runHaxeCode([[
			game.camGame.setFilters([]);
			game.camOther.setFilters([]);
		]])
		shaderEnabled = false
	end
end

function onCreatePost()
	runHaxeCode([[
		game.camGame.setFilters([]); // Ensure shader is off initially
		game.camOther.setFilters([]);  // Ensure shader is off initially
	]])
	shaderEnabled = false
end

function onTweenCompleted(tag)
	if tag == 'switcharoo2' then
		setProperty('camHUD.angle', 0)
		setProperty('camGame.angle', 0)
	end
end