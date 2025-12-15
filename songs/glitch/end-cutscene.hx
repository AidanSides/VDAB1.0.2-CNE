import flixel.util.FlxTimer;
private var STUPDVARIABLETHATSHOULDNTBENEEDED:FlxSprite;

function create() {

var marcello:FlxSprite = new FlxSprite(dad.x - 170,dad.y);
marcello.flipX = true;
add(marcello);
dad.visible = false;
boyfriend.stunned = true;
marcello.frames = Paths.getSparrowAtlas('dave/cutscene');
marcello.animation.addByPrefix('throw_phone', 'bambi0', 24, false);
boyfriend.playAnim('singDOWNmiss',true);
STUPDVARIABLETHATSHOULDNTBENEEDED = marcello;
new FlxTimer().start(5.5, THROWPHONEMARCELLO);

	var sound = FlxG.sound.load(Paths.sound('break_phone'));
	sound.onComplete = function() {
		close();
	};
	sound.play();
}