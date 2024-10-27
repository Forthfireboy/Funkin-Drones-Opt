var credit:FunkinSprite;

function postCreate() {



   credit = new FunkinSprite(1300, 480).loadGraphic(Paths.image('stages/stage 1/credit'));
   credit.scrollFactor.set(0,0);
   credit.scale.set(0.8, 0.8);
   credit.zoomFactor = 0.2;
   credit.blend = 0;
    add(credit);
}

function stepHit(curStep) {
    switch (curStep) {
        case 2: FlxTween.tween(credit, {x: credit.x -380}, 1, {ease: FlxEase.expoOut});
        case 120: FlxTween.tween(credit, {x: credit.x +380}, 1, {ease: FlxEase.expoIn});
    }
           
}
