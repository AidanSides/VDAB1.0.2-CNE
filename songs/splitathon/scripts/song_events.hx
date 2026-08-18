import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

public var daveReactions:FlxSprite;
private var BAMBICUTSCENEICONHURHURHUR:HealthIcon;
public var stupidx:Float = 0;
public var stupidy:Float = 0; //stupid velocities for cutscene
public var updatevels:Bool = false;
public var elapsedtime:Float = 0;

function postCreate() {

        strumLines.members[0].characters[1].color = 0xFF878787;
        strumLines.members[0].characters[1].visible = false;

}

function create() {
    daveReactions = new FlxSprite(125, 360).loadGraphic(Paths.image("otherShit/lookup"));
    daveReactions.antialiasing = true;
    daveReactions.visible = false;
    daveReactions.scrollFactor.set(1, 1);
    daveReactions.color = 0xFF878787;
	add(daveReactions);
}

function stepHit(elapsed:Float) {

    		if(curStep == 4736)
            {
                daveReactions.visible = true;
                strumLines.members[0].characters[0].visible = false;
            }

            if(curStep == 4800)
            {
                if (BAMBICUTSCENEICONHURHURHUR == null) {

					BAMBICUTSCENEICONHURHURHUR = new HealthIcon("bambi", false);
					BAMBICUTSCENEICONHURHURHUR.y = healthBar.y - (BAMBICUTSCENEICONHURHURHUR.height / 2);
					add(BAMBICUTSCENEICONHURHURHUR);
					BAMBICUTSCENEICONHURHURHUR.cameras = [camHUD];
					BAMBICUTSCENEICONHURHURHUR.x = -100;
					FlxTween.linearMotion(BAMBICUTSCENEICONHURHURHUR,-100,BAMBICUTSCENEICONHURHURHUR.y,iconP2.x,BAMBICUTSCENEICONHURHURHUR.y,0.3);
					new FlxTimer().start(0.3,FlingCharacterIconToOblivionAndBeyond);
                    
				}

                camGame.flash(FlxColor.WHITE, 1);
                daveReactions.loadGraphic(Paths.image("otherShit/backup"));
                daveReactions.x = -300;
                strumLines.members[0].characters[1].visible = true;
                strumLines.members[0].characters[0].visible = false;
        
            }

            if(curStep == 5824)
            {
                camGame.flash(FlxColor.WHITE, 1);
                iconP2.setIcon('dave');

                daveReactions.visible = false;

                strumLines.members[0].characters[0].visible = true;
                strumLines.members[0].characters[1].visible = false;
        
            }
            if(curStep == 6080)
            {
                camGame.flash(FlxColor.WHITE, 1);
                iconP2.setIcon('bambi');

                daveReactions.loadGraphic(Paths.image("otherShit/end"));
                daveReactions.visible = true;

                strumLines.members[0].characters[0].visible = false;
                strumLines.members[0].characters[1].visible = true;
        
            }
            if(curStep == 8384)
            {
                camGame.flash(FlxColor.WHITE, 1);
                iconP2.setIcon('dave');

                daveReactions.visible = false;

                strumLines.members[0].characters[0].visible = true;
                strumLines.members[0].characters[1].visible = false;
        
            }

}

function update(elapsed:Float) {

    elapsedtime += elapsed;

    if (updatevels)
		{
			stupidx *= 0.98;
			stupidy += elapsed * 6;
			if (BAMBICUTSCENEICONHURHURHUR != null)
			{
				BAMBICUTSCENEICONHURHURHUR.x += stupidx;
				BAMBICUTSCENEICONHURHURHUR.y += stupidy;
			}
		}
}

function FlingCharacterIconToOblivionAndBeyond(e:FlxTimer=null):Void
	{
		iconP2.setIcon('bambi');
		BAMBICUTSCENEICONHURHURHUR.setIcon('dave-lose');
		stupidx = -5;
		stupidy = -5;
		updatevels = true;
	}