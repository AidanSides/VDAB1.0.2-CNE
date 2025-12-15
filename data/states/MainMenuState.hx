//ty Ner0 for writing the original script and kay0 for fixing it

//var bg:FlxSprite;
var menubgs:Array<String> = CoolUtil.coolTextFile(Paths.txt("menubgs"));

function postCreate()
{
	var bg = members[0];
	bg.loadGraphic(randomBg());
	bg.color = 0xffFDE871;

	magenta.loadGraphic(bg.graphic);
}

function randomBg():String
{
    var chance:Int = FlxG.random.int(0, menubgs.length - 1);
	return Paths.image('menus/backgrounds/' + menubgs[chance]);
}