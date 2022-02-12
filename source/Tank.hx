package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;

class Tank extends FlxTypedGroup<FlxSprite> {
	public var x:Float;
	public var y:Float;

	public var tankBase(default, null):FlxSprite;

	var tankCannon:FlxSprite;

	public function new() {
		super();
		tankBase = new FlxSprite().loadGraphic(AssetPaths.tankbase__png);
		tankCannon = new FlxSprite().loadGraphic(AssetPaths.tankcannon__png);

		tankCannon.origin.x = tankCannon.origin.x - (tankCannon.width / 2) + (tankCannon.height / 2);
		tankCannon.allowCollisions = NONE;

		add(tankBase);
		add(tankCannon);
	}

	override public function update(elapsed:Float):Void {
		tankBase.setPosition(x, y);
		tankCannon.setPosition(x + (tankBase.width / 2) - (tankCannon.height / 2), y + (tankBase.height / 2) - (tankCannon.height / 2));
		tankCannon.angle += 1;
		super.update(elapsed);
	}

	public function setPosition(x:Float = 0, y:Float = 0) {
		this.x = x;
		this.y = y;
	}
}
