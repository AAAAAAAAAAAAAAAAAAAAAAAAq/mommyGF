package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _mom:Mom;
	private var _player:Player;
	
	private var _timer:Float = 60;
	private var _timerText:FlxText;
	
	override public function create():Void
	{
		
		_mom = new Mom(300, 100);
		add(_mom);
		
		_player = new Player(50, 260);
		add(_player);
		
		_timerText = new FlxText(10, FlxG.height - 35, 0, Std.string(Math.ffloor(_timer)), 20);
		add(_timerText);
		
		_timerText.scrollFactor.x = 0;
		
		FlxG.camera.follow(_mom);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		_timer -= FlxG.elapsed;
		_timerText.text = "0:" + Math.ffloor(_timer);
		
		if (FlxG.keys.pressed.RIGHT)
		{
			_player.setPosition(_mom.x + 250, 260);
			_player._left = false;
		}
		if (FlxG.keys.pressed.LEFT)
		{
			_player.setPosition(_mom.x - 150, 260);
			_player._left = true;
		}
		
		if (FlxG.keys.pressed.SPACE)
		{
			if (_player._left)
			{
				_player.setPosition(_mom.x - 50, 260);
			}
			else
			{
				_player.setPosition(_mom.x + 150, 260);
			}
		}
		else
		{
			if (_player._left)
			{
				_player.setPosition(_mom.x - 150, 260);
			}
			else
			{
				_player.setPosition(_mom.x + 250, 260);
			}
		}
		
	}
}