local shadersIKMS = {'Linkbait'} -- Add shaders here to preload based on songName
local shaderCamThing = {'camHUD', 'camGame', 'camOther'} -- Apply shader to specific cameras
local time = 0

function onEvent(n, v1, v2)
    if n == "Shaders" then
        if v2 == 'none' then
            runHaxeCode([[
                game.]].. v1 ..[[.setFilters([]); 
            ]])
        else
            shaderCoordFix()

            setSpriteShader(v1, v2)

            runHaxeCode([[
                game.initLuaShader(game.getLuaObject(']].. v1 ..[[').shader);

                game.]].. v1 ..[[.setFilters([new ShaderFilter(game.getLuaObject(']].. v1 ..[[').shader)]);
            ]])
        end
    end
end

function createCamSprites()
    for i=1, #shaderCamThing do
        if not luaSpriteExists(shaderCamThing[i]) then
            makeLuaSprite(shaderCamThing[i], nil, 0, 0)
            makeGraphic(shaderCamThing[i], 1280, 720)
        end
    end
end

function onCreate()
    createCamSprites()
    shaderCoordFix()
    
    -- Only preload shader if it matches songName
    for i=1, #shadersIKMS do
        if shadersIKMS[i] == songName then
            initLuaShader(shadersIKMS[i]) -- Preload only matching shader
        end
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }

        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end

function onUpdatePost(elapsed)
    time = time + elapsed
    for i=1, #shaderCamThing do
        setShaderFloat(shaderCamThing[i], 'iTime', time)
    end
end
