var focusUzi = false;
var focusBf = false;
var center = false;
var focusBlackBF = false;

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

}


function stepHit(curStep) {
    switch(curStep) {
        case -19: FlxTween.tween(camGame, {zoom: 1.3},1, {ease: FlxEase.quadOut});
        case -8:  FlxG.sound.play(Paths.sound('yey'),4);
                boyfriend.playAnim('singLEFT', true);
                dad.playAnim('pissed 1', true);
                focusBf = true;
                FlxTween.tween(camGame, {zoom: 0.9},1, {ease: FlxEase.quadOut});
                focusUzi = false;
        case 0: FlxTween.tween(camGame, {zoom: 0.8},1, {ease: FlxEase.quadOut});
                focusBf = false;
case 512:center = true;
defaultCamZoom = 0.7;
case 768: FlxTween.tween(camGame, {zoom: 1.3},6, {ease: FlxEase.quadInOut});
        focusBlackBF = true;
        FlxTween.tween(blackBarThingie, {alpha: 1},6, {ease: FlxEase.quadOut});
        center = false;
        camZoomingInterval = 0.5;
case 835:focusBlackBF = false;
         focusUzi = true;
         defaultCamZoom = 1.3;

         case 888: FlxTween.tween(camGame, {zoom: 0.8},9, {ease: FlxEase.quadOut});
         FlxTween.tween(blackBarThingie, {alpha: 0},9, {ease: FlxEase.quadOut});
         focusUzi = false;
         defaultCamZoom = 0.8;
         case 1008: defaultCamZoom = 0.7;
         center = true;
         FlxTween.tween(gf, {alpha:1},1, {ease: FlxEase.quadOut});
         gf.playAnim('Entry', true);
        camZoomingInterval = 4;
         case 1015: boyfriend.playAnim('reactions', true);
         case 1020: dad.playAnim('Pissed 2', true);
            case 1040: whiteFlash.alpha = 1;
                        FlxTween.tween(whiteFlash, {alpha: 0}, 1, {ease: FlxEase.quadOut});
                        gf.playAnim('idle', true);
                        gf.scale.set(1.2,1.2);
                        gf.y = -140;
                        gf.x = 200;
    }
}
function postUpdate(elapsed) {
    if (focusUzi)
        camFollow.setPosition(100,625);
    if (focusBf)
        camFollow.setPosition(600,625);
    if (focusBlackBF)
        camFollow.setPosition(800,625);
    if (center)
        camFollow.setPosition(450,525);
    
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

function onGamePause() {updateSpeed(false);}
function onSongEnd() {updateSpeed(false);}
function destroy() {FlxG.timeScale = 1;FlxG.sound.muted = false;}