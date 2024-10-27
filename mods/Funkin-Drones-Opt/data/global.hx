import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;

static var initialized:Bool = false;

function new() {

    window.title = "Funkin' Drones";
}

static var redirectStates:Map<FlxState, String> = [
    FreeplayState => "FD/FreeplayCustomState",
    MainMenuState => "FD/MainMenuState",
    TitleState => "FD/TitleState",

];

function update(){
    if (FlxG.save.data.devMode)
        if (FlxG.keys.justPressed.F5)
            FlxG.resetState();
        if (FlxG.keys.justPressed.F6)
            NativeAPI.allocConsole();
}

function preStateSwitch() {


	for (redirectState in redirectStates.keys())
		if (FlxG.game._requestedState is redirectState)
			FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

