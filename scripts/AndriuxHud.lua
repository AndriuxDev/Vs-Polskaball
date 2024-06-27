local format = 12 --Change between 12hr and 24hr settings for the clock!

function onCreate()
    precacheImage("HUD/healthBarR4", true)
    makeLuaSprite("health", "HUD/healthBarR4", 0, 0)
    setObjectCamera("health", "hud")
    setProperty("healthBar.visible", true)

    --UPSCROLL
    makeLuaSprite("hud1", "HUD/HUDUP", 0, -200)
    setObjectCamera("hud1", "hud")
    scaleObject("hud1", 2, 2)
    addLuaSprite("hud1", false)

    makeLuaSprite("hud2", "HUD/HUDDOWM", 0, 200)
    setObjectCamera("hud2", "hud")
    scaleObject("hud2", 2, 2)
    addLuaSprite("hud2", false)

    --DOWNSCROLL
    makeLuaSprite("hud3", "HUD/HUDUP2", 0, -200)
    setObjectCamera("hud3", "hud")
    scaleObject("hud3", 2, 2)
    addLuaSprite("hud3", false)

    makeLuaSprite("hud4", "HUD/HUDDOWM2", 0, 200)
    setObjectCamera("hud4", "hud")
    scaleObject("hud4", 2, 2)
    addLuaSprite("hud4", false)

    addLuaSprite("health", false)
end

function onUpdate(elapsed)
	setProperty("health.x", getProperty("healthBar.x") - 29)
	setProperty("health.y", getProperty("healthBar.y") - 4)
    setProperty("scoreTxt.visible",false)

    --OS TIME
    local h24, min = os.date("%H"), os.date("%M")
    local h12, time = os.date("%I"), os.date("%p")

    if downscroll then
        if format == 24 then
            makeLuaText("time", 'Time: ' ..h24 ..':' ..min, 0, 1150, 680)
            setTextSize("time", 20)
            setTextFont("time", "KeeponTruckin.ttf")
            setObjectCamera("time", 'hud');
            addLuaText("time", false);
        elseif format == 12 then
            makeLuaText("time", 'Time: ' ..h12 ..':' ..min ..' ' ..time, 0, 1100, 680)
            setTextSize("time", 20)
            setTextFont("time", "KeeponTruckin.ttf")
            setObjectCamera("time", 'hud');
            addLuaText("time", false);
        end
    else
        if format == 24 then
            makeLuaText("time", 'Time: ' ..h24 ..':' ..min, 0, 1150, 10)
            setTextSize("time", 20)
            setTextFont("time", "KeeponTruckin.ttf")
            setObjectCamera("time", 'hud');
            addLuaText("time", false);
        elseif format == 12 then
            makeLuaText("time", 'Time: ' ..h12 ..':' ..min ..' ' ..time, 0, 1100, 10)
            setTextSize("time", 20)
            setTextFont("time", "KeeponTruckin.ttf")
            setObjectCamera("time", 'hud');
            addLuaText("time", false);
        end
    end

    --SCORE TEXT
    if downscroll then
        makeLuaText("acc", "Accuracy: " ..math.floor(rating * 100) .."%" ..' | ' ..ratingName, 0, 20, 20);
        setTextSize("acc", 20);
        setTextFont("acc", "DKids.ttf")
        setObjectCamera("acc", "camHud")
        addLuaText("acc", false)

        makeLuaText("score", "Total Score: " ..score, 0, 20, 50);
        setTextSize("score", 20);
        setTextFont("score", "DKids.ttf")
        setObjectCamera("score", "camHud")
        addLuaText("score", false)

        makeLuaText("rats", "Misses: " ..misses, 0, 20, 80);
        setTextSize("rats", 20);
        setTextFont("rats", "DKids.ttf")
        setObjectCamera("rats", "camHud")
        addLuaText("rats", false)

        makeLuaText("fcstat", "Rating: " ..ratingFC, 0, 20, 110);
        setTextSize("fcstat", 20);
        setTextFont("fcstat", "DKids.ttf")
        setObjectCamera("fcstat", "camHud")
        addLuaText("fcstat", false)

        makeLuaSprite("weegee", "pauseScreen/luigi", 1170, 0);
        setObjectCamera("weegee", "hud")
        addLuaSprite("weegee", false)
        scaleObject("weegee", 0.3, 0.3)

        if botPlay then
            setProperty("weegee.visible", true)
        else
            setProperty("weegee.visible", false)
        end
    else
        makeLuaText("acc", "Accuracy: " ..math.floor(rating * 100) .."%" ..' | ' ..ratingName, 0, 20, 580);
        setTextSize("acc", 20);
        setTextFont("acc", "DKids.ttf")
        setObjectCamera("acc", "camHud")
        addLuaText("acc", false)

        makeLuaText("score", "Total Score: " ..score, 0, 20, 610);
        setTextSize("score", 20);
        setTextFont("score", "DKids.ttf")
        setObjectCamera("score", "camHud")
        addLuaText("score", false)

        makeLuaText("rats", "Misses: " ..misses, 0, 20, 640);
        setTextSize("rats", 20);
        setTextFont("rats", "DKids.ttf")
        setObjectCamera("rats", "camHud")
        addLuaText("rats", false)

        makeLuaText("fcstat", "Rating: " ..ratingFC, 0, 20, 670);
        setTextSize("fcstat", 20);
        setTextFont("fcstat", "DKids.ttf")
        setObjectCamera("fcstat", "camHud")
        addLuaText("fcstat", false)

        makeLuaSprite("weegee", "pauseScreen/luigi", 1170, 630);
        setObjectCamera("weegee", "hud")
        addLuaSprite("weegee", false)
        scaleObject("weegee", 0.3, 0.3)

        if botPlay then
            setProperty("weegee.visible", true)
        else
            setProperty("weegee.visible", false)
        end
    end

    if getProperty("inCutscene", false) == true then
        setProperty('acc.visible', false);
        setProperty('score.visible', false);
        setProperty('rats.visible', false);
        setProperty('fcstat.visible', false);
    else
        setProperty('acc.visible', true);
        setProperty('score.visible', true);
        setProperty('rats.visible', true);
        setProperty('fcstat.visible', true);
    end

    if botPlay then
        setProperty('acc.alpha', 0);
        setProperty('score.alpha', 0);
        setProperty('rats.alpha', 0);
        setProperty('fcstat.alpha', 0);
    else
        setProperty('acc.alpha', 1);
        setProperty('score.alpha', 1);
        setProperty('rats.alpha', 1);
        setProperty('fcstat.alpha', 1);
    end
end

function onCountdownTick(swagCounter)
    if swagCounter == 3 then
        for i = 4,7 do
            noteTweenX("p1Tween"..i, i-4, (115 * i) - 375, 0.34 + (i * 0.25), "sineOut")
            noteTweenX("p2Tween"..i, i, 275 + (115 * i), 0.34 + (i * 0.25), "sineOut")
        end
        if downscroll then
            doTweenY("hud3Y", "hud3", 0, 1, "sineOut")
            doTweenY("hud4Y", "hud4", 0, 1, "sineOut")
        else
            doTweenY("hud1Y", "hud1", 0, 1, "sineOut")
            doTweenY("hud2Y", "hud2", 0, 1, "sineOut")
        end
    end
end

function onEvent(name, value1, value2)
    if name == 'Cinematics (With HUD)' then
        Distance = tonumber(value2)
        if Distance > 0 then
            if downscroll then
                doTweenY("hud3Y", "hud3", -400, 1, "sineOut")
                doTweenY("hud4Y", "hud4", 400, 1, "sineOut")
            else
                doTweenY("hud1Y", "hud1", -400, 1, "sineOut")
                doTweenY("hud2Y", "hud2", 400, 1, "sineOut")
            end
        elseif Distance == 0 then
            if downscroll then
                doTweenY("hud3Y", "hud3", 0, 1, "sineOut")
                doTweenY("hud4Y", "hud4", 0, 1, "sineOut")
            else
                doTweenY("hud1Y", "hud1", 0, 1, "sineOut")
                doTweenY("hud2Y", "hud2", 0, 1, "sineOut")
            end
        end
    end
end