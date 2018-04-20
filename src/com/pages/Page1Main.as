package com.pages
{
	import com.components.DragAndMove;
	import com.eventdispatcher.NGEventDispatcher;
	import com.mode.Tuzi_3D;
	
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	import ui.Uipage1UI;
	
	public class Page1Main extends Page
	{
		private var skin:Uipage1UI;
		public function Page1Main()
		{
			super();
			skin=new Uipage1UI();
			this.addChild(skin);
			/*var tuzi:Tuzi_3D=new Tuzi_3D();
			tuzi.name='tuzi';
			this.addChild(tuzi);
			tuzi.size(800,600);
			trace("stagewidth:"+Laya.stage.width+"stageheight:"+Laya.stage.height);
			tuzi.pos(120,60);
			var drag:DragAndMove=new DragAndMove(tuzi);*/
			
			skin.btnStart.on(Event.CLICK,this,onBegin);
			onCreate();
		}
		
		private function onCreate():void
		{
			// TODO Auto Generated method stub
			skin.btnStart.alpha=0;
			skin.btnStart.y=690;
			Tween.from(skin.title,{scaleX:0.2,scaleY:0.2,y:500,alpha:0},1000,Ease.circInOut);
			Tween.to(skin.btnStart,{y:590,alpha:1},1000,Ease.circInOut,null,600);
		}
		private function onBegin():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1_1');
		}
	}
}