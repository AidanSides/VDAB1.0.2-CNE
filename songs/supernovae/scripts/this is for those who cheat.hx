function update() {

    if (FlxG.keys.justPressed.SEVEN) {
        PlayState.loadSong("cheating", "Normal");
        FlxG.switchState(new PlayState());
        return;
    }

}