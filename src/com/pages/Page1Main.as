package com.pages
{
	import com.components.DragAndMove;
	import com.eventdispatcher.NGEventDispatcher;
	import com.mode.Tuzi_3D;
	
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	import ui.Uipage1UI;
	
	public class Page1Main extends Uipage1UI
	{
		public function Page1Main()
		{
			super();
			/*var tuzi:Tuzi_3D=new Tuzi_3D();
			tuzi.name='tuzi';
			this.addChild(tuzi);
			tuzi.size(800,600);
			trace("stagewidth:"+Laya.stage.width+"stageheight:"+Laya.stage.height);
			tuzi.pos(120,60);
			var drag:DragAndMove=new DragAndMove(tuzi);*/
			
			btnStart.on(Event.CLICK,this,onBegin);
			onCreate();
		}
		
		private function onCreate():void
		{
			// TODO Auto Generated method stub
			btnStart.alpha=0;
			btnStart.y=690;
			Tween.from(title,{scaleX:0.2,scaleY:0.2,y:500,alpha:0},1000,Ease.circInOut);
			Tween.to(btnStart,{y:590,alpha:1},1000,Ease.circInOut,null,600);
		}
		private function onBegin():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1_1');
		}
	}
}