var focusUzi = false;
var focusBf = false;
var center = false;
var focusBlackBF = false;
var beatfast = false;
var beatveryfast = false;

function postCreate() {
    focusUzi = true;

    blackBarThingie = new FlxSprite().makeSolid(FlxG.width, 100, FlxColor.BLACK);
    blackBarThingie.setGraphicSize(Std.int(blackBarThingie.width + 400));
    blackBarThingie.scrollFactor.set(0, 0);
    blackBarThingie.screenCenter();
    blackBarThingie.alpha = 0;
    insert(members.indexOf(dad), blackBarThingie);

    whiteFlash = new FlxSprite().makeSolid(FlxG.width, 100, FlxColor.WHITE);
    whiteFlash.setGraphicSize(Std.int(whiteFlash.width + 500));
    whiteFlash.scrollFactor.set(0, 0);
    whiteFlash.screenCenter();
    whiteFlash.alpha = 0;
    add(whiteFlash);
    whiteFlash.blend = 0;
    camZoomingInterval = 2;

    blackFront = new FlxSprite().makeSolid(FlxG.width, 100, FlxColor.BLACK);
    blackFront.setGraphicSize(Std.int(blackFront.width + 400));
    blackFront.scrollFactor.set(0, 0);
    blackFront.screenCenter();
    blackFront.alpha = 0;
    add(blackFront);
}

function stepHit(curStep) {
    switch (curStep) {
        case -19:
            FlxTween.tween(camGame, { zoom: 1.3 }, 1, { ease: FlxEase.quadOut });
        case -8:
            FlxG.sound.play(Paths.sound('yey'), 4);
            boyfriend.playAnim('singLEFT', true);
            dad.playAnim('Pissed', true);
            focusBf = true;
            FlxTween.tween(camGame, { zoom: 0.9 }, 1, { ease: FlxEase.quadOut });
            focusUzi = false;
        case 0:
            focusBf = false;
            camZooming = true;
        case 64:
            camZoomingInterval = 1;
        case 96:
            beatfast = true;
        case 112:
            beatveryfast = true;
            beatfast = false;
        case 120:
            beatveryfast = false;
            center = false;
            camZoomingInterval = 2;
        case 260 | 292 | 356: beatveryfast = true;
        case 268 | 294 | 358: beatveryfast = false;
        case 384: 
            center = true;
            defaultCamZoom = 0.7;
            camZoomingInterval = 1;
        case 636: FlxTween.tween(camGame, {zoom: 1.3},2, {ease: FlxEase.quadInOut});
        defaultCamZoom = 1.3;
        FlxTween.tween(blackBarThingie, {alpha: 1},2, {ease: FlxEase.quadOut});
        center = false;

        case 640 | 644 | 648 | 651 | 654 | 656 | 660 | 664 | 667 | 670 | 672 | 676 | 680 | 683 | 688 | 692 | 696 | 699 | 702 | 705 | 708 | 710 | 714 | 718 | 721 | 724 | 727 | 730 | 733 | 736 | 739 | 742 | 745 | 748 | 751 | 754 | 757 | 760 | 763 | 766 | 769 | 772 | 775 | 778 | 781 | 784 | 787 | 790 | 793 | 796 | 799 | 802 | 805 | 808 | 811 | 814 | 817 | 820 | 823 | 826 | 829 | 832 | 835 | 838 | 841 | 844 | 847 | 850 | 853 | 856 | 859 | 862 | 865 | 868 | 871 | 874 | 877 :
            camGame.zoom += 0.035;
            camHUD.zoom += 0.05;
        case 880: FlxTween.tween(camGame, {zoom: 0.8},2, {ease: FlxEase.quadOut});
        FlxTween.tween(blackBarThingie, {alpha: 0},2, {ease: FlxEase.quadOut});
        case 881: center = true;
        defaultCamZoom = 0.7;
        FlxTween.tween(gf, {alpha:1},1, {ease: FlxEase.quadOut});
         gf.playAnim('Entry', true);
        camZoomingInterval = 4;

        case 892: boyfriend.playAnim('reactions', true);
         case 896: dad.playAnim('Pissed 2', true);
            case 912: whiteFlash.alpha = 1;
                        FlxTween.tween(whiteFlash, {alpha: 0}, 1, {ease: FlxEase.quadOut});
                        gf.playAnim('idle', true);
                        gf.scale.set(1.2,1.2);
                        gf.y = -140;
                        gf.x = 200;
                        boyfriend.playAnim('idle', true);

        case 1040 | 1044 | 1048 | 1051 | 1054 | 1056 | 1060 | 1064 | 1067 | 1070 | 1072 | 1076 | 1080 | 1083 | 1088 | 1092 | 1096 | 1099 | 1102 | 1105 | 1108 | 1110 | 1114 | 1118 | 1121 | 1124 | 1127 | 1130 | 1133 | 1136 | 1139 | 1142 | 1145 | 1148 | 1151 | 1154 | 1157 | 1160 | 1163 | 1166 | 1169 | 1172 | 1175 | 1180 | 1183 | 1186 | 1189 | 1192 | 1195 | 1198 | 1201 | 1204 | 1207 | 1210 | 1213 | 1216 | 1219 | 1222 | 1225 | 1228 | 1231 | 1234 | 1237 | 1240 | 1243 | 1246 :
            camGame.zoom += 0.025;
            camHUD.zoom += 0.03;

        case 1248: beatfast = true;


        case 1303: beatfast = false;
            beatveryfast = true;
        case 1312: beatveryfast = false;
        center = true;
        defaultCamZoom = 0.7;
        camZoomingInterval = 2;

        case 1440: camGame.zoom += 0.025;
        camHUD.zoom += 0.015;
        FlxTween.tween(camHUD, {alpha: 0},1, {ease: FlxEase.quadOut});
        FlxTween.tween(camGame, {zoom: 1.5},2, {ease: FlxEase.quadOut});
        FlxTween.tween(blackFront, {alpha: 1},2, {ease: FlxEase.quadOut});
        boyfriend.playAnim('hey', true);
        dad.playAnim('Pissed2', true);
    }

    if (curStep % 2 == 0 && beatfast) {
        camGame.zoom += 0.025;
        camHUD.zoom += 0.015;
    }
    if (curStep % 1 == 0 && beatveryfast) {
        camGame.zoom += 0.025;
        camHUD.zoom += 0.015;
    }
}

function postUpdate(elapsed) {
    if (focusUzi) camFollow.setPosition(100, 625);
    if (focusBf) camFollow.setPosition(700, 580);
    if (focusBlackBF) camFollow.setPosition(800, 625);
    if (center) camFollow.setPosition(450, 540);
}

function update() {
    if (startingSong || !canPause || paused || health <= 0) return;
    updateSpeed(FlxG.keys.pressed.TWO);
}

function updateSpeed(fast:Bool) {
    FlxG.timeScale = inst.pitch = vocals.pitch = (player.cpu = fast) ? 20 : 1;
    FlxG.sound.muted = fast;
    health = !(canDie != fast) ? 2 : health;
}

function onGamePause() {
    updateSpeed(false);
}

function onSongEnd() {
    updateSpeed(false);
}

function destroy() {
    FlxG.timeScale = 1;
    FlxG.sound.muted = false;
}


function onSongEnd(){
    if (playState.isStoryMode) {
            FlxG.switchState(new ModState("your_state"));
    }
}