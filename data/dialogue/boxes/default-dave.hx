var loopedTimer:FlxTimer;  // vs dave and bambi
var bgFade:FlxSprite;

function postCreate() {
	bgFade = new FlxSprite().makeSolid(FlxG.width + 100, FlxG.height + 100, 0xFFB3DFd8);
	bgFade.screenCenter();
	bgFade.scrollFactor.set();
	bgFade.alpha = 0;
	cutscene.insert(0, bgFade);

	loopedTimer = new FlxTimer().start(0.3, function(tmr:FlxTimer)
	{
		bgFade.alpha += (1 / 5) * 0.7;
		if (bgFade.alpha > 0.7)
			bgFade.alpha = 0.7;
	}, 5);

}

var finished:Bool = false;
function close(event) {
	if(finished) return;
	else event.cancelled = true;
	cutscene.canProceed = false;

	cutscene.curMusic?.fadeOut(1, 0);
	for(c in cutscene.charMap) c.visible = false;

	loopedTimer.cancel();
	loopedTimer = new FlxTimer().start(0.2, function(tmr:FlxTimer)
	{
		if (tmr.elapsedLoops <= 5) {
			cutscene.dialogueBox.alpha -= 1 / 5;
			cutscene.dialogueBox.text.alpha -= 1 / 5;
			bgFade.alpha -= (1 / 5) * 0.7;
		} else {
			finished = true;
			cutscene.close();
		}
	}, 6);
}