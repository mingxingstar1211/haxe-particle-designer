package;


import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageQuality;
import nme.display.StageScaleMode;
import nme.events.Event;
import nme.Lib;
import nme.events.MouseEvent;
import nme.Assets;
import nme.ui.Mouse;
import nme.geom.Point;

import nme.display.Bitmap;
import nme.display.BitmapData;

class Sample extends Sprite
{
	var			particleSystem:ASParticleSystem;

	public function new()
	{
		super ();

		init();
	}

	private function init()
	{
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.stage.addEventListener (Event.ACTIVATE, stage_onActivate);
		Lib.current.stage.addEventListener (Event.DEACTIVATE, stage_onDeactivate);

		//Create a black background
		var			bk:Sprite = new Sprite();
		bk.graphics.beginFill(0x000000);
		bk.graphics.drawRect(0,0,Lib.current.stage.stageWidth,Lib.current.stage.stageHeight);
		bk.graphics.endFill();
		addChild(bk);

		//Create a particle system
		//Pass the file name of the plist and the path for both the plist and the particle textures (.pngs)
		/**
		Be sure to put in trailing "/"" for assets path (2nd argument)
		**/
		
		particleSystem = ASParticleSystem.particleWithFile("blizzard.plist","assets/particles/");
		addChild(particleSystem);
	
		//Add our mouse move function
		addEventListener(MouseEvent.MOUSE_MOVE,mMove);
		addEventListener(MouseEvent.CLICK,firework);


	}

	public function mMove(evt:MouseEvent)
	{
		//trace("Moving to "+mouseX+", "+mouseY);
		particleSystem.position = new Point(mouseX,mouseY);
	}
	
	public function firework(evt:MouseEvent)
	{
		var ps = ASParticleSystem.particleWithFile("comet.plist","assets/particles/");
		
		ps.position = new Point(mouseX,mouseY);
		addChild(ps);
	}

	// Event Handlers
	
	private function stage_onActivate (event:Event):Void
	{
		trace("stage_onActivate");
	}
	
	
	private function stage_onDeactivate (event:Event):Void {
		trace("stage_onDeactivate");
		
	}

	public static function main() {

		//Redirect trace logs from the fucking screen
		//org.flashdevelop.utils.FlashConnect.redirect();

		Lib.current.addChild(new Sample());
	}
}