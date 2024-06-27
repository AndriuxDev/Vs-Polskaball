--CRASH BANDICOOT PAUSE MENU V2 BY ANDRIUXDEV

option = {'Continue','Restart','Exit Song','Exit Game'}
local MessageTexts = {'Go chill for a while and then you come back playing this game.',
    'To err, is human. To forgive, divine.',
    'Are Countryhumans even canon?',
    'Welcome to the pause menu!',
    'Waiting for something to happen?',
    'Gettin\' freaky on a Friday Night, yeah!',
    'Digital Circus Hellshow died for this.',
    'Crash Bandicoot... it\'s about time!'};
canPause = true
constOptX = 250 -- Option text X constant
constOptY = 475 -- Option text Y constant
consY = constOptY+10; -- Arrow constant
constMoveX = constOptX-20; -- Arrow's X moving constant 
constMoveY = 35; -- Arrow's Y moving constant
local Path = 'pause/'

function onCreate()
    --Options
    makeLuaText('pauseTXT', 'PAUSED', 1280, -1280, 10)
	setTextFont('pauseTXT', "crashalike.ttf")
	setTextAlignment('pauseTXT', 'Left')
	setObjectCamera('pauseTXT', 'camOther');
	setProperty('pauseTXT.antialiasing',false)
	setTextBorder('pauseTXT',1,'000000')
	setTextSize('pauseTXT',100);

    makeLuaSprite("pauseGrad", nil, 0, -1280);
    makeGraphic("pauseGrad", screenWidth, screenHeight, '000000');
    setObjectCamera('pauseGrad', 'camOther');
    setProperty("pauseGrad.alpha", 0.5);

    makeLuaSprite('PauseLog', Path..'paused', -1280, -20);
    setProperty('PauseLog.antialiasing',false)
	setObjectCamera('PauseLog', 'camOther');
	scaleObject('PauseLog', 1, 1);
    
    makeLuaSprite('PauseProg', Path..'progress', 1280, -40);
    setProperty('PauseProg.antialiasing',false)
	setObjectCamera('PauseProg', 'camOther');
	scaleObject('PauseProg', 1, 1);

    makeLuaText('song', songName.upper(songName), 0, -2000, 385)
    setTextFont('song', "zoinks.ttf")
	setTextAlignment('song', 'Center')
	setObjectCamera('song', 'camOther');
	setProperty('song.antialiasing',false)
	setTextBorder('song',1,'000000')
	setTextSize('song',40);

    makeLuaSprite('PauseOpt', Path..'options', -1280, 10);
    setProperty('PauseOpt.antialiasing',false)
	setObjectCamera('PauseOpt', 'camOther');
	scaleObject('PauseOpt', 1, 1);

    makeLuaSprite('PauseMsg', Path..'messageBar', -10, 200);
    setProperty('PauseMsg.antialiasing',false)
	setObjectCamera('PauseMsg', 'camOther');
	scaleObject('PauseMsg', 1, 1);

    makeLuaText('opts', 'CONTINUE\nRESTART SONG\nEXIT SONG\nEXIT GAME', 0, -1280, constOptY)
    setTextFont('opts', "zoinks.ttf")
	setTextAlignment('opts', 'Center')
	setObjectCamera('opts', 'camOther');
	setProperty('opts.antialiasing',false)
	setTextBorder('opts',1,'000000')
	setTextSize('opts',30);

    makeLuaText('PauseMessage', 'Test', 1280, 0, 1280)
	setTextFont('PauseMessage', "crashalike.ttf")
	setTextAlignment('PauseMessage', 'Center')
	setObjectCamera('PauseMessage', 'camOther');
	setProperty('PauseMessage.antialiasing',false)
	setTextBorder('PauseMessage',1,'000000')
	setTextSize('PauseMessage',30);
    
    makeLuaText('Arrow', '->', 50, constOptX - 40, consY);
    setTextFont('Arrow', "vcr.ttf")
	setProperty('Arrow.antialiasing',false)
    setProperty('Arrow.alpha', 0)
	setObjectCamera('Arrow', 'camOther');

    removeLuaScript('scripts/CustomPause')

    for i = 1,#option do
        makeLuaText('option_'..i,option[i],0,0,i * 120);
        setTextSize('option_'..i,50);
        setTextBorder('option_'..i,3,'000000');
        setObjectCamera('option_'..i,'other');
        addLuaText('option_'..i);
        setProperty('option_'..i..'.x',screenWidth/2 - getTextWidth('option_'..i)/2)
        setProperty('option_'..i..'.alpha', 0)
    end

    makeLuaSprite("obj1", Path..'endGrad', 0, 0);
    setObjectCamera('obj1', 'camOther');
    setProperty("obj1.alpha", 0);
end

function onPause()
    if canPause == true then
        openCustomSubstate('pauseCrash',true);
        return Function_Stop;
    else
        return Function_Stop;
    end
end

function showInfo()
    conInfo = 80 -- Info Y position
    conScore = 480 -- Score Y position

    makeLuaText('diff', "Difficulty:\n"..difficultyName, 650, 730, conInfo)
	setTextFont('diff', "crashalike.ttf")
	setTextAlignment('diff', 'Left')
	setObjectCamera('diff', 'camOther');
	setProperty('diff.antialiasing',false)
	setTextBorder('diff',1,'000000')
	setTextSize('diff',50);
    setProperty("diff.alpha", 0)
    addLuaText('diff');

    makeLuaText('date', "Date: "..os.date('%d-%m-%Y'), 650, 730, conInfo+(25*8))
	setTextFont('date', "crashalike.ttf")
	setTextAlignment('date', 'Left')
	setObjectCamera('date', 'camOther');
	setProperty('date.antialiasing',false)
	setTextBorder('date',1,'000000')
	setTextSize('date',25);
    setProperty("date.alpha", 0)
    addLuaText('date');

    if isStoryMode then
        playingIn = 'Story Mode'
    else
        playingIn = 'Freeplay Mode'
    end

    makeLuaText('playmode', "Playing in: "..playingIn, 650, 730, conInfo+(25*9))
	setTextFont('playmode', "crashalike.ttf")
	setTextAlignment('playmode', 'Left')
	setObjectCamera('playmode', 'camOther');
	setProperty('playmode.antialiasing',false)
	setTextBorder('playmode',1,'000000')
	setTextSize('playmode',25);
    setProperty("playmode.alpha", 0)
    addLuaText('playmode');

    if getProperty('practiceMode') then
        practiceTog = "ON"
    else
        practiceTog = "OFF"
    end

    makeLuaText('practiceT', "Practice Mode: "..practiceTog, 650, 730, conInfo+(25*10))
	setTextFont('practiceT', "crashalike.ttf")
	setTextAlignment('practiceT', 'Left')
	setObjectCamera('practiceT', 'camOther');
	setProperty('practiceT.antialiasing',false)
	setTextBorder('practiceT',1,'000000')
	setTextSize('practiceT',25);
    setProperty("practiceT.alpha", 0)
    addLuaText('practiceT');

    makeLuaText('score', "Score: "..getScore()..'\nHealth: '..(getHealth()*50), 650, 730, conScore)
	setTextFont('score', "crashalike.ttf")
	setTextAlignment('score', 'Left')
	setObjectCamera('score', 'camOther');
	setProperty('score.antialiasing',false)
	setTextBorder('score',1,'000000')
    setProperty('score.alpha',0)
	setTextSize('score',25);
    addLuaText('score');

    if ratingName == '?' then
        ratingName = "NAN"
    end

    makeLuaText('accuracy', "Hits: "..getHits().." | Misses: "..getMisses().." | Accuracy: "..math.floor(rating * 100) .."% ("..ratingName..")", 650, 730, conScore+50)
	setTextFont('accuracy', "crashalike.ttf")
	setTextAlignment('accuracy', 'Left')
	setObjectCamera('accuracy', 'camOther');
	setProperty('accuracy.antialiasing',false)
	setTextBorder('accuracy',1,'000000')
    setProperty('accuracy.alpha',0)
	setTextSize('accuracy',25);
    addLuaText('accuracy');

    if getProperty('cpuControlled') then
        botToggle = 'ON'
    else
        botToggle = 'OFF'
    end

    makeLuaText('botPlay', "Botplay: "..botToggle, 650, 730, conScore+(25*3))
	setTextFont('botPlay', "crashalike.ttf")
	setTextAlignment('botPlay', 'Left')
	setObjectCamera('botPlay', 'camOther');
	setProperty('botPlay.antialiasing',false)
    setProperty('botPlay.alpha',0)
	setTextBorder('botPlay',1,'000000')
	setTextSize('botPlay',25);
    addLuaText('botPlay');

    runTimer("showInfo", 0.7)
end

function deletInfo()
    removeLuaText("diff")
    removeLuaText("date")
    removeLuaText("playmode")
    removeLuaText("practiceT")
    removeLuaText("score")
    removeLuaText("accuracy")
    removeLuaText("botPlay")
end

function onCustomSubstateCreatePost(name)
	if name == 'pauseCrash' then
        runTimer("pauseSound", 0.1)
        doTweenX("pauseTXTTwn", "pauseTXT", 50, 0.5, "linear")
        doTweenY("pauseGradTwn", "pauseGrad", 0, 0.5, "linear")
        doTweenX("PauseLogTwn", "PauseLog", -50, 0.5, "linear")
        doTweenX("PauseProgTwn", "PauseProg", 0, 0.5, "linear")
        doTweenX("songTwn", "song", constOptX, 0.5, "linear")
        doTweenX("PauseOptTwn", "PauseOpt", -50, 0.5, "linear")
        doTweenY("PauseMsgTwn", "PauseMsg", 0, 0.5, "linear")
        doTweenY("PauseMsg2Twn", "PauseMessage", screenHeight-45, 0.5, "linear")
        doTweenX("optsTwn", "opts", constOptX, 0.5, "linear")
        runTimer("showArrow",1)

        percTotal = (getSongPosition() / songLength) * 100;
        formatted = string.format('%.0f', percTotal)
        
        if percTotal >= 0 then
            makeLuaText('acc', formatted .. "%", 1280, 3000, 80)
        else
            makeLuaText('acc', "NaN%", 1280, 3000, 80)
        end
        
        setTextFont('acc', "crashalike.ttf")
        setTextAlignment('acc', 'Center')
        setObjectCamera('acc', 'camOther');
        setProperty('acc.antialiasing',false)
        setTextBorder('acc',1,'000000')
        setTextSize('acc',130);
        
        addLuaSprite("pauseGrad", false);
        addLuaSprite("PauseLog", false);
        addLuaSprite("PauseOpt", false);
        addLuaSprite("PauseProg", false);
        addLuaSprite("PauseMsg", false);
        addLuaText('pauseTXT');
        addLuaText('opts'); 
        addLuaText('song');
        addLuaText('Arrow');
        
        addLuaText('acc');
        showInfo();
        addLuaText('PauseMessage')
	    setTextString('PauseMessage', MessageTexts[getRandomInt(1, #MessageTexts)])  
        doTweenX("accTwn", "acc", 460, 0.5, "linear")
    end
end

function onCustomSubstateUpdatePost(name)
	if name == 'pauseCrash' then

        if keyboardJustPressed('ENTER') and optionSelected == 1 then
            doTweenX("pauseTXTTwn", "pauseTXT", -1280, 0.5, "linear")
            doTweenY("pauseGradTwn", "pauseGrad", -1280, 0.5, "linear")
            doTweenX("PauseLogTwn", "PauseLog", -1200, 0.5, "linear")
            doTweenX("PauseProgTwn", "PauseProg", 1280, 0.5, "linear")
            doTweenX("PauseOptTwn", "PauseOpt", -1280, 0.5, "linear")
            doTweenX("optsTwn", "opts", -1280, 0.5, "linear")
            doTweenX("accTwn", "acc", 3000, 0.5, "linear")
            doTweenX("songTwn", "song", -3000, 0.5, "linear")
            doTweenY("PauseMsgTwn", "PauseMsg", 1280, 0.5, "linear")
            doTweenY("PauseMsg2Twn", "PauseMessage", 1280, 0.2, "linear")
            doTweenAlpha("ArrowTwn", "Arrow", 0, 0.5, "linear")
            runTimer("deletInfo", 0.1)
            runTimer("endSubstate", 0.7)
            playSound("endPause");
        elseif keyboardJustPressed('ENTER') and optionSelected == 2 then
            playSound("confirmMenu");
            restartSong(false);
        elseif keyboardJustPressed('ENTER') and optionSelected == 3 then
            playSound("confirmMenu");
            exitSong(false);
        elseif keyboardJustPressed('ENTER') and optionSelected == 4 then
            playSound("confirmMenu");
            playSound("laughEnd");
            addLuaSprite('obj1');
            doTweenAlpha("endGradTwn", "obj1", 1, 2, "linear")
            setObjectOrder("obj1", 50)
            runTimer("endProgram",5)
        end

        if optionSelected == 1 then
            setProperty('Arrow.x', constMoveX)
            setProperty('Arrow.y', consY)
        end
        
        if optionSelected == 2 then
            setProperty('Arrow.y', consY+constMoveY)
            setProperty('Arrow.x', constMoveX - 30)
        end
        
        if optionSelected == 3 then
            setProperty('Arrow.x', constMoveX)
            setProperty('Arrow.y', consY+(constMoveY*2))
        end

        if optionSelected == 4 then
            setProperty('Arrow.x', constMoveX)
            setProperty('Arrow.y', consY+(constMoveY*3))
        end

        if keyboardJustPressed('UP') then
            chooseOption(-1)
            playSound("scrollMenu");
        elseif keyboardJustPressed('DOWN') then
            chooseOption(1)
            playSound("scrollMenu");
        end
    end
end

optionSelected = 1
function chooseOption(choose)
	optionSelected = optionSelected + choose;

	if optionSelected >= #option + 1 then
	    optionSelected = 1;
	elseif optionSelected <= 0 then
	    optionSelected = #option;
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'endSubstate' then
        removeLuaSprite("pauseGrad", false);
        removeLuaSprite("PauseLog", false);
        removeLuaSprite("PauseProg", false);
        removeLuaSprite("PauseOpt", false);
        removeLuaSprite("PauseMsg", false);
        removeLuaSprite('obj1', false);
        removeLuaText('song', false)
        removeLuaText('pauseTXT', false)
        removeLuaText('opts', false)
        removeLuaText('Arrow', false)
        removeLuaText('acc', false)
        removeLuaText('PauseMessage', false)
        deletInfo();
        closeCustomSubstate();
        setPropertyFromClass("flixel.FlxG", "autoPause", true)
    elseif tag == 'pauseSound' then
        playSound("pause");
    elseif tag == 'showInfo' then
        doTweenAlpha("diffTwn", "diff", 1, 0.5, "linear")
        doTweenAlpha("dateTwn", "date", 1, 0.5, "linear")
        doTweenAlpha("playmodeTwn", "playmode", 1, 0.5, "linear")
        doTweenAlpha("practiceTTwn", "practiceT", 1, 0.5, "linear")
        doTweenAlpha("scoreTwn", "score", 1, 0.5, "linear")
        doTweenAlpha("accuracyTwn", "accuracy", 1, 0.5, "linear")
        doTweenAlpha("botPlayTTwn", "botPlay", 1, 0.5, "linear")
    elseif tag == 'deletInfo' then
        doTweenAlpha("diffTwn", "diff", 0, 0.5, "linear")
        doTweenAlpha("dateTwn", "date", 0, 0.5, "linear")
        doTweenAlpha("playmodeTwn", "playmode", 0, 0.5, "linear")
        doTweenAlpha("practiceTTwn", "practiceT", 0, 0.5, "linear")
        doTweenAlpha("scoreTwn", "score", 0, 0.5, "linear")
        doTweenAlpha("accuracyTwn", "accuracy", 0, 0.5, "linear")
        doTweenAlpha("botPlayTTwn", "botPlay", 0, 0.5, "linear")
    elseif tag == 'showArrow' then
        doTweenAlpha("ArrowTwn", "Arrow", 1, 0.7, "linear")
    elseif tag == 'endProgram' then
        os.exit();
    end
end

function onDestroy()
	setPropertyFromClass("flixel.FlxG", "autoPause", true)
	removeLuaScript('scripts/CustomPause')
end