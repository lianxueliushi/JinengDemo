package com.mode
{
	import laya.display.Sprite;
	import laya.events.Event;
	
	import ui.ui.p1_1.DragTuziUI;
	
	public class Tuzi_Drag extends Sprite
	{
		private var _page:DragTuziUI;
		public function Tuzi_Drag()
		{
			super();
			onLoaded();
		}
		
		public function get page():DragTuziUI
		{
			return _page;
		}

		private function onLoaded():void
		{
			// TODO Auto Generated method stub
			_page=new DragTuziUI();
			this.addChild(page);
			page.tuzi.mouseThrough=true;
			page.clickRect.on(Event.MOUSE_DOWN,this,downHandler);
			page.clickRect.on(Event.MOUSE_UP,this,upHandler);
		}
		private function upHandler(e:Event):void
		{
			// TODO Auto Generated method stub
			trace('up:'+e.target.name);
			page.mc_shou.play(0,false,'fang');
			page.mc_tuzi.gotoAndStop(0);
			page.zhishi.visible=true;
			page.zhishi.play();
			event('EDN_DRAG');
		}
		private function downHandler():void
		{
			// TODO Auto Generated method stub
			page.mc_tuzi.gotoAndStop(1);
			page.mc_shou.play(0,false,'zhua');
			page.zhishi.stop();
			page.zhishi.visible=false;
			page.on(Event.MOUSE_MOVE,this,onMoveHandler);
			event("BEGIN_DRAG");
		}
		
		private function onMoveHandler(e:Event):void
		{
			event("DRAGING");
			
		}
		public function onHit():void{
			page.off(Event.MOUSE_MOVE,this,onMoveHandler);
			page.clickRect.off(Event.MOUSE_DOWN,this,downHandler);
			page.clickRect.off(Event.MOUSE_UP,this,upHandler);
			page.mc_shou.play(0,false,'fang');
			page.mc_tuzi.gotoAndStop(0);
			page.zhishi.stop();
			page.zhishi.visible=false;
		}
		
	}
}