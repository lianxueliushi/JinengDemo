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
		private var syMain:ToolMain;
//		private var arrow:Animation;
        public function RabbitCage()
		{
			super();
			syMain=new ToolMain();
			this.addChild(syMain);
            onLoaded();
		}

        private function onLoaded():void
		{
			syMain.ShowRightTip("上下拖动鼠标，打开笼子");
            Laya.stage.on(Event.MOUSE_DOWN,this,beginDrag);
			Laya.stage.on(Event.MOUSE_UP,this,endDrag);
			Laya.stage.on(Event.MOUSE_OUT,this,endDrag);
			createRabbit();
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
			}
			else{
				i = 0.01;
				cageAni.gotoAndStop(0);
			}
		}

	
		private function beginDrag(e:Event):void
		{
			lastY=this.mouseY;
			Laya.stage.on(Event.MOUSE_MOVE,this,DragBoxing);
		}
        private function createRabbit():void
        {
            tuzi=new DBTest();
			tuzi.pos(885,359);
            newRabbit.addChild(tuzi);
        }
        		
		private var rabPos:Point;
		private function Grabing(e:Event):void
		{
			rabPos = new Point(tuzi.x+400,tuzi.y+300);
			if(rabPos.y>0 && (dzc0.y-rabPos.y)<180 && Math.abs(dzc0.x-rabPos.x)<100){
				tuzi.onHit();
				tuzi.pos(dzc0.x-400,dzc0.y-400);
				dzc0.visible = false;
				dzc1.visible = true;
				syMain.ShowRightTip("兔子质量为：3.5Kg");
				tuzi.stopDrag();
				tuzi.off(Event.MOUSE_DOWN,this,wrongGrab);
				tuzi.off(Event.MOUSE_UP,this,wrongGrab);
				Laya.timer.once(2000,this,addPage);
			}
		}
		
		private function endGrab():void
		{
			tuzi.stopDrag();
			syMain.ShowRightTip("右手抓起家兔颈背部皮肤向上提起时同时左手向下环抱拖住家兔臀部位置。");
		}

		private function beginGrab():void
		{
			tuzi.startDrag();
			syMain.ShowRightTip("拖动到电子秤，对家兔进行称重。");
		}
		private function wrongGrab(e:Event):void
		{
			syMain.ShowRightTip("抓的位置不正确，请按照动画指示抓起");
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
			 syMain.ShowRightTip("请将兔子放到盒子里");
			
			Laya.stage.off(Event.MOUSE_MOVE,this,DragBoxing);
			Laya.stage.off(Event.MOUSE_DOWN,this,beginDrag);
			Laya.stage.off(Event.MOUSE_UP,this,endDrag);
			Laya.stage.off(Event.MOUSE_OUT,this,endDrag);

		}
		private function OpenGrabRabbit():void
		{
			tuzi.InitListener();
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