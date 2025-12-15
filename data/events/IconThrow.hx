import flixel.util.FlxStringUtil;
import flixel.text.FlxTextBorderStyle;

function onEvent(e){
    var event = e.event;
    switch (event.name) {
        case "IconThrow":
            var icon_name = event.params[0];
            var is_player = event.params[1];

            var iconOBJ = is_player ? iconP1 : iconP2;
            var playerDir = is_player ? -1 : 1;
        
            var new_icon = new FlxSprite().loadGraphic(Paths.image("icons/" + icon_name), true);
            new_icon.animation.add('lose', [1]);
            new_icon.animation.play('lose');
            new_icon.flipX = is_player;
            new_icon.cameras = [camHUD];
            new_icon.antialiasing = true;

            new_icon.x = iconOBJ.x + iconOBJ.width/2 - new_icon.width/2;
            new_icon.y = iconOBJ.y + iconOBJ.height/2 - new_icon.height/2;

            insert(members.indexOf(iconOBJ) + 1, new_icon);
            
            new_icon.angularVelocity = -15 * playerDir; 
            new_icon.velocity.y = -700;
            new_icon.acceleration.y = 1000; 
            new_icon.acceleration.x = -100 * playerDir; 

            new FlxTimer().start(2, () -> { 
                new_icon.destroy();
            });

    }
}