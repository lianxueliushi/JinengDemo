package com.components
{
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.events.EventDispatcher;
	
	public class DragAndMove extends EventDispatcher
	{
		
		private var _mainRole:Sprite;
		public var downFun:Function;
		public var upFun:Function;
		public var wheelFun:Function;
		public function DragAndMove($role:Sprite)
		{
			super();
			_mainRole=$role;
			_mainRole.on(Event.MOUSE_DOWN,this,mouseDownHandler);
			Laya.stage.on(Event.MOUSE_OUT,this,mouseUpHandler);
			_mainRole.on(Event.MOUSE_UP,this,mouseUpHandler);
			Laya.stage.on(Event.MOUSE_WHEEL,this,onWheel);
			$role.on(Event.REMOVED,this,onRemove);
		}
		
		private function onRemove():void
		{
			// TODO Auto Generated method stub
			trace("removed");
			Laya.stage.off(Event.MOUSE_OUT,this,mouseUpHandler);
			Laya.stage.off(Event.MOUSE_WHEEL,this,onWheel);
		}
		private function onWheel(e:Event):void
		{
			// TODO Auto Generated method stub
			_mainRole.scaleX+=e.delta*0.008;
			_mainRole.scaleY+=e.delta*0.008;
			_mainRole.x-=_mainRole.width*e.delta*0.004;
			_mainRole.y-=_mainRole.height*e.delta*0.004;
		}
		private function mouseUpHandler(e:Event):void
		{
			// TODO Auto Generated method stub
			_mainRole.stopDrag();
		}
		
		private function mouseDownHandler(e:Event):void
		{
			// TODO Auto Generated method stub
			_mainRole.startDrag();
		}
		
	}
}