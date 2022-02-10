package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState {
	var player:Tank;
	var map:FlxOgmo3Loader;
	var wallsLayer:FlxTilemap;
	var groundLayer:FlxTilemap;

	override public function create() {
		map = new FlxOgmo3Loader(AssetPaths.TankGame__ogmo, AssetPaths.level1__json);
		groundLayer = map.loadTilemap(AssetPaths.desert_tileset__png, "ground");
		wallsLayer = map.loadTilemap(AssetPaths.desert_tileset__png, "walls");
		add(groundLayer);
		add(wallsLayer);

		player = new Tank();
		map.loadEntities(placeEntities, "entities");
		add(player);
	}

	override public function update(elapsed:Float) {
		FlxG.collide(player, wallsLayer);
		super.update(elapsed);
	}

	function placeEntities(entity:EntityData) {
		if (entity.name == "player") {
			player.setPosition(entity.x, entity.y);
		}
	}
}
