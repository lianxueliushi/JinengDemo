package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	
	import laya.events.Event;
	import laya.media.SoundManager;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	import ui.MokuaiUI;
	
	public class PageMokuai extends MokuaiUI
	{

		private var x1:Number;

		private var y1:Number;

		private var x3:Number;

		private var y3:Number;
		private var soundurl:String="sound/窗口弹出音效.wav";
		public function PageMokuai()
		{
			super();
			box1.left=300;
			box3.right=300;
			x1=box1.x;
			y1=box1.y;
			x3=box3.x;
			y3=box3.y;
			box1.scale(0.1,0.1);
			box2.scale(0.1,0.1);
			box3.scale(0.1,0.1);
			trace("x:"+x1,"x:"+x3);
			trace("y:"+y1,"y:"+y3);
			for (var i:int = 1; i < 4; i++) 
			{
				this['btn'+i].once(Event.CLICK,this,onClick);
			}
			box1.alpha=box2.alpha=box3.alpha=0;
			box1.centerX=box2.centerX=box3.centerX=0;
			box1.centerY=box2.centerY=box3.centerY=1000;
			Tween.to(box1,{alpha:1,scaleX:1,scaleY:1,x:x1,y:y1},600,Ease.circInOut);
			Tween.to(box2,{alpha:1,centerX:0,centerY:0,scaleX:1,scaleY:1},600,Ease.circInOut,null,100);
			Tween.to(box3,{alpha:1,scaleX:1,scaleY:1,x:x3,y:y3},600,Ease.circInOut,null,200);
			
			btn_back.on(Event.CLICK,this,onBack);
		}
		
		private function onBack():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,Main.P_LOGIN);
		}
		
		private function onClick():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,Main.P_SYLX);
		}
	}
}