package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	
	import laya.events.Event;
	
	import ui.UIShouYeUI;
	
	public class PageShouye extends UIShouYeUI
	{
		public function PageShouye()
		{
			super();
			btn1.on(Event.CLICK,this,onClick);
			btn2.on(Event.CLICK,this,onClick);
			btn3.on(Event.CLICK,this,onClick);
			btn4.on(Event.CLICK,this,onClick);
		}
		
		private function onClick():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'pageDaohang');
		}
	}
}