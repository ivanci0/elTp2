package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	var btnPlay:FlxButton;
	override public function create():Void
	{
		super.create();
		btnPlay = new FlxButton(0, 0, "Play", onClick);
		btnPlay.screenCenter();
		add(btnPlay);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	public function onClick():Void{
		FlxG.switchState(new PlayState());
	}
}
