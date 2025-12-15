//var bg:FlxSprite;
var menubgs:Array<String> = CoolUtil.coolTextFile(Paths.txt("menubgs"));

function postCreate()
{
	var bg = members[0];
	bg.loadGraphic(randomBg());
}

function randomBg():String
{
    var chance:Int = FlxG.random.int(0, menubgs.length - 1);
	return Paths.image('menus/backgrounds/' + menubgs[chance]);
}