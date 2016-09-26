package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Ivan Baigorria
 */
class Personaje extends FlxSprite
{
	var velocidad:Int;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(10, 10);
		velocidad = 50;
		velocity.x = 50;
	}
	override public function update(elapsed:Float):Void 
	{
		Movimiento();
		super.update(elapsed);
	}
	public function Movimiento():Void {
		var arriba:Bool;
		var abajo:Bool;
		var der:Bool;
		var izq:Bool;
		var ang:Float = 0;
		
		arriba = FlxG.keys.anyPressed([UP]);
		abajo = FlxG.keys.anyPressed([DOWN]);
		der = FlxG.keys.anyPressed([RIGHT]);
		izq = FlxG.keys.anyPressed([LEFT]);
		
		if (arriba && abajo){
			arriba = abajo = false;
		}
		if (der && izq){
			der = izq = false;
		}
		if (arriba || abajo || izq || der) {
			ang = 0;
			velocidad = 100;
			if (arriba && y >= FlxG.camera.y) {
				ang = -60;
				if (izq) {
					ang -= 45;
				}
				else if (der){
					velocidad += 50;
					ang += 15;
				}
			}
			else if (abajo && y <= (FlxG.camera.height-height)){
				ang = 60;
				if (izq) {
					ang += 45;
				}
				else if (der){
					velocidad += 50;
					ang -= 15;
				}
			}
			else if (izq){
				velocidad -= 50;
				ang = 180;
			}
			else if (der){
				velocidad += 50;
				ang = 0;
			}
			velocity.set(velocidad, 0);
			velocity.rotate(FlxPoint.weak(0, 0), ang);
		}
		else{
			ang = 0;
			velocidad = 50;
			velocity.set(velocidad, 0);
			velocity.rotate(FlxPoint.weak(0, 0), ang);
		}
	}
}