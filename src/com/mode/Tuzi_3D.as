package com.mode
{
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.utils.Handler;
	
	public class Tuzi_3D extends Sprite
	{
		private var animation:Animation;
		private var index:Number=5;
		private var lastX:Number;
		public static const RIGHT_DOWN:String="right_down";
		public function Tuzi_3D()
		{
			super();
			animation=new Animation().loadAtlas('res/tuzi/tuzi.atlas',Handler.create(this,tuziReady));
		}
		/**
		 *图集加载完毕 
		 * 
		 */		
		private function tuziReady():void
		{
			// TODO Auto Generated method stub
			this.addChild(animation);
			animation.gotoAndStop(index);
			Laya.stage.on(Event.RIGHT_MOUSE_DOWN,this,mouseDown);
			Laya.stage.on(Event.MOUSE_OUT,this,mouseUp);
			Laya.stage.on(Event.RIGHT_MOUSE_UP,this,mouseUp);
		}
		
		private function mouseDown():void
		{
			// TODO Auto Generated method stub
			Laya.stage.on(Event.MOUSE_MOVE,this,mouseMove);
			lastX=Laya.stage.mouseX;
			event(RIGHT_DOWN);
		}
		
		private function mouseMove():void
		{
			// TODO Auto Generated method stub
			if(Laya.stage.mouseX-lastX>0){
				index-=1;
			}else {
				index+=1;
			}
			if(index<0) index=animation.count-1;
			if(index>animation.count-1){
				index=0;
			}
			animation.gotoAndStop(index);
			lastX=Laya.stage.mouseX;
		}
		
		private function mouseUp():void
		{
			// TODO Auto Generated method stub
			Laya.stage.off(Event.MOUSE_MOVE,this,mouseMove);
		}
		
	}
}