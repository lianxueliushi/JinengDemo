package com.pages
{
	import com.components.DragAndMove;
	import com.eventdispatcher.NGEventDispatcher;
	import com.mode.Tuzi_3D;
	
	import laya.events.Event;
	import laya.ui.Button;
	
	public class Page1Main extends Page
	{
		public function Page1Main()
		{
			super();
			var tuzi:Tuzi_3D=new Tuzi_3D();
			tuzi.name='tuzi';
			this.addChild(tuzi);
			tuzi.size(800,600);
			trace("stagewidth:"+Laya.stage.width+"stageheight:"+Laya.stage.height);
			tuzi.pos(120,60);
			var drag:DragAndMove=new DragAndMove(tuzi);
			
			
			var btn:Button=new Button();
			btn.name='btn';
			btn.size(200,60);
			btn.pos(450,600);
			btn.label='第一步：捉拿称重';
			btn.labelSize=20;
			btn.on(Event.CLICK,this,onBegin);
			this.addChild(btn);
		}
		
		override public function onDispose():void
		{
			super.onDispose();
		}
		
		private function onBegin():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1_1');
		}
	}
}