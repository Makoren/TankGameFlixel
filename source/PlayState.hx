package;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {
	override public function create() {
		var tank = new Tank();
		tank.x = FlxG.width / 2;
		tank.y = FlxG.height / 2;
		add(tank);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
