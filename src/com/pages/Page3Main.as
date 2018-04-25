package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	import ui.UipageUI;

	public class Page3Main extends UipageUI
	{
		public function Page3Main()
		{
			super();
			onCreate();
		}
		private function onCreate():void
		{
			// TODO Auto Generated method stub
			title.text="家兔机能基础实验--颈部手术";
			btnStart.alpha=0;
			btnStart.y=690;
			Tween.from(title,{scaleX:0.2,scaleY:0.2,y:500,alpha:0},1000,Ease.circInOut);
			Tween.to(btnStart,{y:590,alpha:1},1000,Ease.circInOut,null,600);
			btnStart.on(Event.CLICK,this,onBegin);
		}
		private function onBegin():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page3_1');
		}
	}
}