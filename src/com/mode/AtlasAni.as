package com.mode
{
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.utils.Handler;
	
	public class AtlasAni extends Sprite
	{
		private var index:Number=1;
		private var animation:Animation;
		public function AtlasAni()
		{
			super();
			animation=new Animation().loadAtlas('res/sheep/idle.atlas',Handler.create(this,onSheepReady));
		}
		
		private function onSheepReady():void
		{
			// TODO Auto Generated method stub
			this.addChild(animation);
			animation.play();
			Laya.stage.on(Event.RIGHT_MOUSE_DOWN,this,mouseDown);
			Laya.stage.on(Event.MOUSE_OUT,this,mouseUp);
			Laya.stage.on(Event.RIGHT_MOUSE_UP,this,mouseUp);
		}
		
		private function mouseUp():void
		{
			// TODO Auto Generated method stub
			Laya.stage.off(Event.MOUSE_MOVE,this,mouseMove);
		}
		
		private function mouseDown():void
		{
			// TODO Auto Generated method stub
			Laya.stage.on(Event.MOUSE_MOVE,this,mouseMove);
		}
		
		private function mouseMove():void
		{
			// TODO Auto Generated method stub
			trace("mouseMove"+index);
			index++;
			if(index>animation.count-1){
				index=0;
			}
			animation.gotoAndStop(index);
		}
	}
}