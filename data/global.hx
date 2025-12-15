//
import funkin.backend.utils.WindowUtils;
import lime.graphics.Image;
import lime.utils.Assets;

function new() {
	window.setIcon(Image.fromBytes(Assets.getBytes(Paths.getPath('images/iconOG.png'))));
}

function update(elapsed:Float) {
	if (FlxG.keys.justPressed.F5) FlxG.resetState();
}
