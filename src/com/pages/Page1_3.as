package com.pages
{
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.ui.p1_3.ui1_3UI;

	/**
	 *静脉注射
	 * @author Administrator
	 * 
	 */	
	public class Page1_3 extends Page
	{
		private var page:ui1_3UI;
		public function Page1_3()
		{
			super();
			page=new ui1_3UI();
			this.addChild(page);
			onCreate();
		}
		
		override public function onCreate():void
		{
			// TODO Auto Generated method stub
			super.onCreate();
			page.clickRect.on(Event.CLICK,this,onChooseTuzi);
		}
		
		/**
		 *选中兔子的耳朵  兔子耳朵放大并转动视角 
		 * 
		 */		
		private function onChooseTuzi():void
		{
			// TODO Auto Generated method stub
			Tween.to(page.tuzi,{scaleX:3,scaleY:3,x:80,y:90},600);
			Tween.to(page.tuzi,{alpha:0},100,null,Handler.create(this,onScaleEnd),500);
		}
		
		private function onScaleEnd():void
		{
			// TODO Auto Generated method stub
			trace("new sprite");
		}
		
		override public function onDispose():void
		{
			// TODO Auto Generated method stub
			super.onDispose();
		}
		
		
	}
}