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
		--game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("nameOfShader").shader)]);
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
	if curStep == 1008 then
		runHaxeCode([[
			var shader0 = game.getLuaObject("nameOfShader").shader;
			game.camGame.setFilters([new ShaderFilter(shader0)]);
			game.camHUD.setFilters([new ShaderFilter(shader0)]);
		]])
		shaderEnabled = true
	elseif curStep == 1404 then
		runHaxeCode([[
			game.camGame.setFilters([]);
			game.camHUD.setFilters([]);
		]])
		shaderEnabled = false
	end
end

function onCreatePost()
	runHaxeCode([[
		game.camGame.setFilters([]); // Ensure shader is off initially
		game.camHUD.setFilters([]);  // Ensure shader is off initially
	]])
	shaderEnabled = false
end