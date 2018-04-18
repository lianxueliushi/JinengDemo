package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	import com.mode.DBTest;
	
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.ui.p1_1.ZhuotuziPageUI;
	
	/**
	 *捉拿称重 
	 * @author Administrator
	 * 
	 */	
	public class Page1_1 extends Page
	{
		private var tuzi:DBTest;
		private var page:ZhuotuziPageUI;
		public function Page1_1()
		{
			super();
			Laya.loader.load('res/atlas/comp.atlas',Handler.create(this,onLoaded));
		}
		
		private function onLoaded():void
		{
			// TODO Auto Generated method stub
			page=new ZhuotuziPageUI();
			this.addChild(page);
			showTip("右手抓起家兔颈背部皮肤向上提起时同时左手向下环抱拖住家兔臀部位置。");
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
			if(tuzi.x<944 && tuzi.x>=424 && tuzi.y>-200 && tuzi.y<0){
				tuzi.onHit();
				page.mc_dzc.gotoAndStop(1);
				Tween.to(tuzi,{x:571,y:-20},100);
				showTip("兔子质量为：3.6Kg");
				tuzi.stopDrag();
				tuzi.off(Event.MOUSE_DOWN,this,wrongDrag);
				tuzi.off(Event.MOUSE_UP,this,wrongDrag);
				Laya.timer.once(3000,this,addPage);
			}
		}
		
		private function endDrag():void
		{
			// TODO Auto Generated method stub
			tuzi.stopDrag();
			showTip("右手抓起家兔颈背部皮肤向上提起时同时左手向下环抱拖住家兔臀部位置。");
		}
		
		private function beginDrag():void
		{
			// TODO Auto Generated method stub
			tuzi.startDrag();
			showTip("拖动到电子秤，对家兔进行称重。  ");
		}
		//兔子身上按下，显示错误
		private function wrongDrag(e:Event):void
		{
			// TODO Auto Generated method stub
			showTip("抓的位置不正确，请按照动画指示抓起");
		}
		private function showTip($str:String):void{
			page.tip.text=$str;
			page.tip.x=10;
			page.tip.alpha=1;
			Tween.from(page.tip,{x:-640,alpha:0},600,Ease.circOut);
		}
		private function hideTip():void{
			Tween.to(page.tip,{x:-640,alpha:0},600,Ease.circIn);
		}
		
		private function addPage():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1_2');
		}
		
		
		override public function onDispose():void
		{
			// TODO Auto Generated method stub
			super.onDispose();
		}
		
		
	}
}