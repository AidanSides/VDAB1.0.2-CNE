public var daveReactions:FlxSprite;

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

function stepHit() {

    		if(curStep == 4736)
            {
                daveReactions.visible = true;
                strumLines.members[0].characters[0].visible = false;
            }

            if(curStep == 4800)
            {
                camGame.flash(FlxColor.WHITE, 1);
                iconP2.setIcon('bambi');
                daveReactions.loadGraphic(Paths.image("otherShit/backup"));
                daveReactions.x = -300;
                strumLines.members[0].characters[1].visible = true;
        
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