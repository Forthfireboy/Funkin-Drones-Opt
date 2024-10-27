import flixel.addons.display.FlxBackdrop;

var tilesThing:FlxBackdrop;
var cancel:FlxSound;

function postCreate() {

     cancel = FlxG.sound.load(Paths.sound('menu/cancel'));

    endimage = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/End/End funny help'));
    endimage.antialiasing = Options.antialiasing;
    endimage.scrollFactor.set(1, 1);
    endimage.scale.set(1.05, 1.05);
    endimage.screenCenter();
    add(endimage);

    FlxG.sound.play(Paths.music('singularity'), 0.8);

     FlxG.sound.music.volume = 0;

     tilesThing = new FlxBackdrop(Paths.image('menus/title/checker'));
    tilesThing.antialiasing = Options.antialiasing;
    tilesThing.scrollFactor.set(1,1);
    tilesThing.velocity.set(100,100);
    tilesThing.alpha = 0.05;
    tilesThing.scale.set(0.7, 0.7);
    tilesThing.updateHitbox(); 
    add(tilesThing);

    
      discord = new FlxSprite(900, 450).loadGraphic(Paths.image('menus/End/discord'));
    discord.antialiasing = Options.antialiasing;
    discord.scrollFactor.set(1.5, 1.5);
    discord.scale.set(0.3, 0.3);
    add(discord);

}
var selectedSomethin:Bool = false;
function update(elapsed) {

    if (FlxG.mouse.justMoved) {
        usingMouse = true;
    }

    if (!selectedSomethin) {
        if (usingMouse) {
            if (FlxG.mouse.overlaps(discord)) {
                FlxTween.tween(discord.scale, {x: 0.35, y:0.35}, 0.1);
                if (FlxG.mouse.justPressed) {
                    FlxG.openURL('https://discord.gg/Zc3QXmru6a');
                } 

            }
            else {
               FlxTween.tween(discord.scale, {x: 0.3, y:0.3}, 0.1);
        }

    }
}
      FlxG.camera.scroll.x = FlxMath.lerp(FlxG.camera.scroll.x, (FlxG.mouse.screenX - (FlxG.width / 2)) * 0.02, 1);    
    FlxG.camera.scroll.y = FlxMath.lerp(FlxG.camera.scroll.y, (FlxG.mouse.screenY - (FlxG.height / 2)) * 0.02, 1);
 if (controls.BACK || FlxG.mouse.justPressedRight) {
        cancel.play();

        FlxTween.tween(FlxG.camera, {zoom: 1.2}, 2, {ease: FlxEase.expoOut});

        FlxG.camera.fade(FlxColor.BLACK, 0.5, false);
        new FlxTimer().start(.75, function(tmr:FlxTimer) {
            FlxG.switchState(new MainMenuState());
        });
    }

}

