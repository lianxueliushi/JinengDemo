package
{
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.events.Event;
	import laya.events.EventDispatcher;
	
	public class DBControl extends EventDispatcher
	{
		private var factory:Templet;
		private var skeleton:Skeleton;
		public function DBControl()
		{
			super();
			factory=new Templet();
			factory.on(Event.COMPLETE,this,parseComplete);
			factory.on(Event.ERROR,this,parseError);
			factory.loadAni("db/Test1.sk");
		}
		private var aniIndex:int=0;
		/**
		 *动画加载完毕 
		 * 
		 */		
		private function parseComplete():void
		{
			// TODO Auto Generated method stub
			skeleton=factory.buildArmature(1);
			skeleton.paused();
			Laya.stage.addChild(skeleton);
			skeleton.pos(Laya.stage.width/2,Laya.stage.height/2);
			
			Laya.stage.on(Event.MOUSE_DOWN,this,mouseDownHandler);
			Laya.stage.on(Event.MOUSE_UP,this,mouseUpHandler);
		}
		private var lastX:Number;
		private var lastY:Number;
		private function mouseUpHandler():void
		{
			// TODO Auto Generated method stub
			Laya.stage.off(Event.MOUSE_MOVE,this,moveHandler);
		}
		
		private function mouseDownHandler():void
		{
			// TODO Auto Generated method stub
			Laya.stage.on(Event.MOUSE_MOVE,this,moveHandler);
			lastX=Laya.stage.mouseX;
			lastY=Laya.stage.mouseY;
		}
		private var totaltime:Number=13*24;
		private function moveHandler():void
		{
			// TODO Auto Generated method stub
			
			if(lastX-Laya.stage.mouseX>0){//鼠标向左移动
				aniIndex-=1;
				if(aniIndex<=0){
					aniIndex=totaltime;
				}
			}
			else{//鼠标向右移动
				aniIndex+=1;
				if(aniIndex>totaltime){
					aniIndex=0;
				}
			}
			trace("move:"+aniIndex);
			skeleton.play(0,false,true,aniIndex,(aniIndex+1));
		}
		private function parseError():void
		{
			// TODO Auto Generated method stub
			trace("加载出错，请检查！");
		}
	}
}