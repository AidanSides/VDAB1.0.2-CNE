import flixel.math.FlxMath;
import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import funkin.options.Options;
import openfl.system.System;

var iconOffset:Int = 26;

function postCreate() {
	
	doIconBop = false;
	
	remove(accuracyTxt);
    remove(missesTxt);

	scoreTxt.y = 699;
	scoreTxt.x = 641;
    scoreTxt.alignment = "left";
	
	healthBar.createFilledBar(0xFFFF0000, 0xFF66FF33);
    healthBar.updateBar();
	
	FlxG.camera.followLerp *= 2;
    camHUDZoomLerp = 0.1;

	
}

function onStrumCreation(e) {
    e.strum.x -= 48;
}

function onPlayerHit(e) {
    e.showSplash = false;
}

function onDadHit(e) {
    e.preventStrumGlow();
}


function create() {
		
		var kadeEngineWatermark = new FlxText(4,FlxG.height - 4,0,PlayState.SONG.meta.displayName + " " + PlayState.difficulty + " - Dave Engine", 16);
		kadeEngineWatermark.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
		kadeEngineWatermark.scrollFactor.set();
		add(kadeEngineWatermark);
		
}

function update(elapsed:Float) {

        iconP1.setGraphicSize(Std.int(FlxMath.lerp(150, iconP1.width, 0.50)));
		iconP2.setGraphicSize(Std.int(FlxMath.lerp(150, iconP2.width, 0.50)));

		iconP1.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01) - iconOffset);
		iconP2.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(healthBar.percent, 0, 100, 100, 0) * 0.01)) - (iconP2.width - iconOffset);

        iconP1.updateHitbox();
        iconP2.updateHitbox();
		
}

function beatHit() {
		iconP1.setGraphicSize(Std.int(iconP1.width + 30));
		iconP2.setGraphicSize(Std.int(iconP2.width + 30));

        iconP1.updateHitbox();
        iconP2.updateHitbox();

}