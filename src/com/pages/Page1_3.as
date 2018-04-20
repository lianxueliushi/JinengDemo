package com.pages
{
	import com.canvas.GraphBase;
	
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.filters.BlurFilter;
	import laya.ui.Image;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.ui.p1_3.ui1_3UI;

	/**
	 *麻醉-静脉注射
	 * @author Administrator
	 * 
	 */	
	public class Page1_3 extends Page
	{
		private var page:ui1_3UI;
		public function Page1_3()
		{
			super();
			page=new ui1_3UI();
			this.addChild(page);
			page.clickRect.on(Event.CLICK,this,onChooseTuzi);
		}
		/**
		 *选中兔子的耳朵  兔子耳朵放大并转动视角 
		 * 
		 */		
		private function onChooseTuzi():void
		{
			// TODO Auto Generated method stub
			Tween.to(page.tuzi,{scaleX:3,scaleY:3,x:80,y:90},600);
			Tween.to(page.tuzi,{alpha:0},100,null,Handler.create(this,onScaleEnd),500);
		}
		private var mk:Sprite;

		private var img1:Image;
		/**
		 *拔毛的次数，用来判定是否拔毛完成。这个判断不准确 
		 */		
		private var bamaoNumber:int;
		private var img2:Image;
		private function onScaleEnd():void
		{
			// TODO Auto Generated method stub
			page.tuzi.destroy();
			img1=new Image("res/tuzi/er/er1.jpg");
			this.addChild(img1);
			img1.size(1280,853);
			
			img2=new Image('res/tuzi/er/er2.jpg');
			this.addChild(img2);
			mk=new Sprite();
			img2.mask=mk;
			step1();
		}
		/**
		 *第一步：拔毛 
		 * 
		 */		
		private function step1():void{
			img1.once(Event.MOUSE_DOWN,this,startBamao);
			Laya.timer.callLater(this,Main.showTip,["使用鼠标选择家兔耳背侧耳缘进行拔毛裸露静脉操作"]);
		}
		private function endBamao():void
		{
			// TODO Auto Generated method stub
			img1.once(Event.MOUSE_DOWN,this,startBamao);
		}
		
		private function startBamao():void
		{
			// TODO Auto Generated method stub
			img1.once(Event.MOUSE_UP,this,endBamao);
			Laya.stage.once(Event.MOUSE_MOVE,this,bamaoing);
		}
		
		private function bamaoing():void
		{
			// TODO Auto Generated method stub
			var m:Sprite=new Sprite();
			m.graphics.drawCircle(-15,-15,30,30,'#ff0000');
			m.scaleY=0.6;
			m.pos(img1.mouseX,img1.mouseY);
			var filter:BlurFilter=new BlurFilter(6);
			m.filters=[filter];
			mk.addChild(m);
			trace("local:"+img1.mouseX,img1.mouseY);
			trace("stage:"+Laya.stage.mouseX,Laya.stage.mouseY);
			bamaoNumber++;
			if(bamaoNumber>10){
				Laya.timer.callLater(this,Main.showTip,["点击可跳过拔毛",false]);
				Main.mainTip.once(Event.CLICK,this,tiaoGuobamao);
			}
		}
		
		private function tiaoGuobamao():void
		{
			// TODO Auto Generated method stub
			Main.hideTip();
			img1.off(Event.MOUSE_DOWN,this,startBamao);
			img1.off(Event.MOUSE_UP,this,endBamao);
			mk.graphics.clear();
			mk.destroy();
			img2.mask=null;
		}
		/**
		 *第3步：消毒 
		 * 
		 */		
		private function step3():void{
			Laya.timer.callLater(this,Main.showTip,["请使用酒精棉球对家兔耳朵背侧边缘进行消毒处理"]);
			img2.on(Event.MOUSE_DOWN,this,startXiaodu);
			img2.on(Event.MOUSE_UP,this,endXiaodu);
			xiaoduBg=new GraphBase();
			img2.addChild(xiaoduBg);
			xiaoduBg.alpha=0.6;
		}
		private function endXiaodu():void
		{
			// TODO Auto Generated method stub
			img2.off(Event.MOUSE_MOVE,this,xiaoduing);
		}
		
		private var xiaoduBg:GraphBase;
		private function startXiaodu():void
		{
			// TODO Auto Generated method stub
			img2.on(Event.MOUSE_MOVE,this,xiaoduing);
			xiaoduBg.begin(xiaoduBg.mouseX,xiaoduBg.mouseY);
		}
		/**
		 *消毒状态 
		 * 
		 */		
		private function xiaoduing():void
		{
			// TODO Auto Generated method stub
			/*var s:Sprite=new Sprite();
			s.graphics.drawCircle(-5,-5,10,'#ffc600');
			s.blendMode='lighter';
			xiaoduBg.addChild(s);
			s.pos(img2.mouseX,img2.mouseY);*/
			xiaoduBg.draw(xiaoduBg.mouseX,xiaoduBg.mouseY);
		}
		/**
		 *准备麻醉剂 
		 * 
		 */		
		private function step2():void{
			Laya.timer.callLater(this,Main.showTip,["你需要请你的助手帮你准备麻醉剂"]);
		}
	}
}