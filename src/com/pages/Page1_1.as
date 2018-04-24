package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	import com.mode.DBTest;
	
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.ui.p1_1.ZhuotuziPageUI;
	
	/**
	 *捉拿称重 
	 * @author Administrator
	 * 
	 */	
	public class Page1_1 extends ZhuotuziPageUI
	{
		private var tuzi:DBTest;
		public function Page1_1()
		{
			super();
			Laya.loader.load('res/atlas/comp.atlas',Handler.create(this,onLoaded));
		}
		
		private function onLoaded():void
		{
			// TODO Auto Generated method stub
			Main.showTip("右手抓起家兔颈背部皮肤向上提起时同时左手向下环抱拖住家兔臀部位置。");
			tuzi=new DBTest();
			tuzi.pos(100,100);
			tuzi.on('BEGIN_DRAG',this,beginDrag);
			tuzi.on('END_DRAG',this,endDrag);
			tuzi.on('DRAGING',this,Draging);
			tuzi.on('WRONGDRAG',this,wrongDrag);
			this.addChild(tuzi);
		}
		
		private function Draging(e:Event):void
		{
			// TODO Auto Generated method stub
			trace("tuzi:"+tuzi.x,tuzi.y);
			if(tuzi.x<680 && tuzi.x>=480 && tuzi.y>30 && tuzi.y<70){
				tuzi.onHit();
				mc_dzc.gotoAndStop(1);
				Tween.to(tuzi,{x:585,y:32},100);
				Laya.timer.callLater(this,Main.showTip,["兔子质量为：3.6Kg"]);
				tuzi.stopDrag();
				tuzi.off(Event.MOUSE_DOWN,this,wrongDrag);
				tuzi.off(Event.MOUSE_UP,this,wrongDrag);
				Laya.timer.once(2000,this,addPage);
			}
		}
		
		private function endDrag():void
		{
			// TODO Auto Generated method stub
			tuzi.stopDrag();
			Main.showTip("右手抓起家兔颈背部皮肤向上提起时同时左手向下环抱拖住家兔臀部位置。");
		}
		
		private function beginDrag():void
		{
			// TODO Auto Generated method stub
			tuzi.startDrag();
			Main.showTip("拖动到电子秤，对家兔进行称重。");
		}
		//兔子身上按下，显示错误
		private function wrongDrag(e:Event):void
		{
			// TODO Auto Generated method stub
			Main.showTip("抓的位置不正确，请按照动画指示抓起");
		}
		private function addPage():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1_2');
		}
		
		
	}
}