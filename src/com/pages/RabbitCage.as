package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	import com.mode.DBTest;
	
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.maths.Point;
	
	import ui.p1_1.RabbitCageUI;
	
	public class RabbitCage extends RabbitCageUI
	{
		private var lastY:Number;
        private var bg1:Sprite;
        private var tuzi:DBTest;
//		private var arrow:Animation;
        public function RabbitCage()
		{
			super();
            onLoaded();
		}

        private function onLoaded():void
		{
            Laya.stage.on(Event.MOUSE_DOWN,this,beginDrag);
			Laya.stage.on(Event.MOUSE_UP,this,endDrag);
			Laya.stage.on(Event.MOUSE_OUT,this,endDrag);

			surface.visible = true;
		}

        private function endDrag():void
		{
			Laya.stage.off(Event.MOUSE_MOVE,this,DragBoxing);
			if(index > 10){
				
				cageAni.gotoAndStop(24);
				openBox();
				OpenGrabRabbit();
				emptyCage.visible = true;
				surface.visible = true;
//				arrow.visible = true;
//				arrow.play(0);
			}
			else{
				i = 0.01;
				cageAni.gotoAndStop(0);
			}
		}

	
		private function beginDrag():void
		{
			lastY=this.mouseY;
			Laya.stage.on(Event.MOUSE_MOVE,this,DragBoxing);
		}
        private function createRabbit():void
        {
            tuzi=new DBTest();
			// tuzi.on('BEGIN_DRAG',this,beginGrab);
			// tuzi.on('END_DRAG',this,endGrab);
			// tuzi.on('DRAGING',this,Grabing);
			// tuzi.on('WRONGDRAG',this,wrongGrab);
			tuzi.pos(885,359);
//			arrow = new Animation();
//			arrow.loadAnimation("./p1_2/zhishi.ani");
//			tuzi.addChild(arrow);
//			arrow.pos(300,30);
//			arrow.visible = false;
			
            newRabbit.addChild(tuzi);
        }
        		
		private var rabPos:Point;
		private function Grabing(e:Event):void
		{
			rabPos = new Point(tuzi.x+400,tuzi.y+300);
			// trace("tuzi:"+tuzi.x,tuzi.y,tuzi.x+400,tuzi.y+300);
			// trace("######dzc0:",dzc0.x,dzc0.y,dzc0.pivotX,dzc0.pivotY);
		
			//if(tuzi.x<680 && tuzi.x>=480 && tuzi.y>30 && tuzi.y<70){
			//if(rabPos.x<450 && rabPos.x>=250 && rabPos.y>517 && rabPos.y<587){
			if(rabPos.y>0 && (dzc0.y-rabPos.y)<180 && Math.abs(dzc0.x-rabPos.x)<100){
				tuzi.onHit();
				tuzi.pos(dzc0.x-400,dzc0.y-400);
				dzc0.visible = false;
				dzc1.visible = true;
				//Tween.to(tuzi,{x:585,y:32},100);
				Laya.timer.callLater(this,Main.showTip,["兔子质量为：3.5Kg"]);
				tuzi.stopDrag();
				tuzi.off(Event.MOUSE_DOWN,this,wrongGrab);
				tuzi.off(Event.MOUSE_UP,this,wrongGrab);
				Laya.timer.once(2000,this,addPage);
			}
		}
		
		private function endGrab():void
		{
			tuzi.stopDrag();
//			arrow.visible = true;
//			arrow.play(0);
			Main.showTip("右手抓起家兔颈背部皮肤向上提起时同时左手向下环抱拖住家兔臀部位置。");
		}

		private function beginGrab():void
		{
			tuzi.startDrag();
//			arrow.visible = false;
			Main.showTip("拖动到电子秤，对家兔进行称重。");
		}
		private function wrongGrab(e:Event):void
		{
			Main.showTip("抓的位置不正确，请按照动画指示抓起");
		}
        private var i:Number = 0.01;
		private var index:Number = 0;
		private function DragBoxing():void
		{
			var dis:Number=lastY-this.mouseY;
			i+=dis/100;
			trace("index:"+Math.round(24*i));
            index = Math.round(24*i);
            if(index > 24)
            {
                index = 24;
                openBox();
				OpenGrabRabbit();
//				arrow.visible = true;
//				arrow.play(0);
				emptyCage.visible = true;
				surface.visible = true;
            }
            else if(index < 0.01)
                index = 0;

                cageAni.gotoAndStop(index);

			lastY=this.mouseY;
		}
		
		private function openBox():void
		{
			 Main.showTip("请将兔子放到盒子里");
			createRabbit();
			Laya.stage.off(Event.MOUSE_MOVE,this,DragBoxing);
			Laya.stage.off(Event.MOUSE_DOWN,this,beginDrag);
			Laya.stage.off(Event.MOUSE_UP,this,endDrag);
			Laya.stage.off(Event.MOUSE_OUT,this,endDrag);

		}
		private function OpenGrabRabbit():void
		{
			tuzi.on('BEGIN_DRAG',this,beginGrab);
			tuzi.on('END_DRAG',this,endGrab);
			tuzi.on('DRAGING',this,Grabing);
			tuzi.on('WRONGDRAG',this,wrongGrab);
		}

		private function addPage():void
		{
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1_2');
		}
	}

    
}