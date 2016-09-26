package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	//declaracion de variables/objetos/loquede
	var elRiel:Riel;
	var personaje:Personaje;
	override public function create():Void
	{
		super.create();
		//instanciacion de variables/objetos/loquede
		elRiel = new Riel();
		personaje = new Personaje(0, 0);
		
		//color de fondo y la camara que sigue al riel
		FlxG.cameras.bgColor = FlxColor.BLUE;
		FlxG.camera.follow(elRiel);
		
		//no es necesario (pero para graficarlo)
		elRiel.screenCenter();
		//elRiel.visible = false;
		add(elRiel);
		
		//agregado al display los sprites
		add(personaje);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
