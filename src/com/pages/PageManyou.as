package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	
	import laya.d3.core.Camera;
	import laya.display.Animation;
	import laya.events.Event;
	
	import ui.Uimain1UI;
	
	public class PageManyou extends Uimain1UI
	{

		private var ani:Animation;

		private var camera:Camera;
		public function PageManyou()
		{
			onCreate();
		}
		private function onCreate():void
		{
			// TODO Auto Generated method stub
			ani=new Animation();
			var urls:Array=[];
			for (var i:int = 0; i < 201; i++) 
			{
				urls.push('yindaodonghua/1'+format(i)+".jpg");
				trace(urls[i]);
			}
			ani.loadImages(urls);
			bg.addChild(ani);
			ani.once(Event.COMPLETE,this,playOver);
			ani.play(0,false);
			ani.scale(Laya.stage.width/1280,Laya.stage.height/720);
			btnStart.once(Event.CLICK,this,tiaoguo);
		}
		
		private function tiaoguo():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1_1');
		}
		
		private function format(i:int):String
		{
			// TODO Auto Generated method stub
			if(i>=100){
				return i.toString();
			}
			else if(i>=10){
				return "0"+i;
			}
			else return "00"+i;
		}
		/**
		 *引导动画播放完毕 
		 * 
		 */		
		private function playOver():void
		{
			// TODO Auto Generated method stub
			trace('over');
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1_1');
		
		}
		
		
	}
}