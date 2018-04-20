package com.components
{
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.events.EventDispatcher;
	import laya.maths.Rectangle;
	import laya.utils.Tween;
	
	public class MoveScript extends EventDispatcher
	{
		private static var _script:MoveScript;
		private var _target:Sprite;
		private var xx:Number;
		private var yy:Number;
		private var rect:Rectangle=new Rectangle(Laya.stage.width*.3,Laya.stage.height*.3,Laya.stage.width*.4,Laya.stage.height*.4);
		public function MoveScript($target:Sprite)
		{
			super();
			_target=$target;
			xx=Laya.stage.width-_target.width>>1;
			yy=Laya.stage.height-_target.height>>1;
			_target.pos(xx,yy);
			start();
		}
		private function onMove():void
		{
			// TODO Auto Generated method stub
			if(rect.contains(Laya.stage.mouseX,Laya.stage.mouseY)){
				return;
			}
			_target.x-=(Laya.stage.mouseX-Laya.stage.width/2)*0.005;
			_target.y-=(Laya.stage.mouseY-Laya.stage.height/2)*0.005;
			_target.x=Math.min(Math.max(_target.x,xx*2),0);
			_target.y=Math.min(Math.max(_target.y,yy*2),0);
		}
		public function start():void{
			Laya.timer.frameLoop(1,this,onMove);
			Laya.stage.on(Event.DOUBLE_CLICK,this,reset);
		}
		public function reset():void{
			Tween.to(_target,{x:xx,y:yy},300);
			Laya.timer.clear(this,onMove);
		}
		
		
	}
}
