import flixel.math.FlxMath;
import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import funkin.backend.system.framerate.Framerate;
import funkin.backend.system.framerate.FramerateCounter;
import funkin.options.Options;
import openfl.system.System;

var finalFPS:Float = 0;
var memories = Math.abs(FlxMath.roundDecimal(System.totalMemory / 1000000, 1));
public var camFPS = null;
public var fpsfunniCounter:FlxText;
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
	
	FlxG.cameras.add(camFPS = new HudCamera(), false);
    camFPS.bgColor = 0;
    fpsfunniCounter = new FlxText(11, 4, 100, 18);
    fpsfunniCounter.setFormat("_sans", 12, FlxColor.WHITE);
    fpsfunniCounter.antialiasing = true;
    fpsfunniCounter.scrollFactor.set();
    fpsfunniCounter.cameras = [camFPS];
    finalFPS = 0;
    add(fpsfunniCounter);
	
	FlxG.camera.followLerp *= 2;
    camHUDZoomLerp = 0.1;

    Framerate.fpsCounter.visible = false;
    Framerate.memoryCounter.visible = false;
    Framerate.codenameBuildField.visible = false;
	
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
		
        finalFPS = CoolUtil.fpsLerp(finalFPS, FlxG.elapsed == 0 ? 0 : (1 / FlxG.elapsed), 0.25);
        fpsfunniCounter.text = "FPS: " + Std.string(Math.floor(finalFPS));
		
}

function beatHit() {
		iconP1.setGraphicSize(Std.int(iconP1.width + 30));
		iconP2.setGraphicSize(Std.int(iconP2.width + 30));

        iconP1.updateHitbox();
        iconP2.updateHitbox();

}