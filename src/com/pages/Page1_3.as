package com.pages
{
	import com.canvas.GraphBase;
	
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.filters.BlurFilter;
	import laya.ui.Image;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.ui.p1_3.ui1_3UI;
	import ui.ui.p1_3.ui_jisuanUI;

	/**
	 *麻醉-静脉注射
	 * @author Administrator
	 * 
	 */	
	public class Page1_3 extends ui1_3UI
	{
		public function Page1_3()
		{
			super();
			clickRect.on(Event.CLICK,this,onChooseTuzi);
		}
		/**
		 *选中兔子的耳朵  兔子耳朵放大并转动视角 
		 * 
		 */		
		private function onChooseTuzi():void
		{
			// TODO Auto Generated method stub
			Tween.to(tuzi,{scaleX:3,scaleY:3,x:80,y:90},600);
			Tween.to(tuzi,{alpha:0},100,null,Handler.create(this,onScaleEnd),500);
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
			tuzi.destroy();
			img1=new Image("res/tuzi/er/er1.jpg");
			bg1.addChild(img1);
			img1.size(1280,853);
			
			img2=new Image('res/tuzi/er/er2.jpg');
			bg1.addChild(img2);
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
			Main.showTip("使用鼠标选择家兔耳背侧耳缘进行拔毛裸露静脉操作");
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
		/**
		 *拔毛 
		 * 
		 */		
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
			if(bamaoNumber==10){
				bamaoNumber=0;
				Main.showTip("点击可跳过拔毛");
				Main.mainTip.once(Event.CLICK,this,tiaoGuobamao);
				Laya.timer.once(3000,this,tiaoGuobamao);
			}
		}
		
		private function tiaoGuobamao():void
		{
			// TODO Auto Generated method stub
			Main.showTip("拔毛完成");
			img1.off(Event.MOUSE_DOWN,this,startBamao);
			img1.off(Event.MOUSE_UP,this,endBamao);
			mk.graphics.clear();
			mk.destroy();
			img2.mask=null;
			Laya.timer.once(1000,this,step2);
		}
		/**
		 *第3步：消毒 
		 * 
		 */		
		private function step3():void{
			Main.showTip("请使用酒精棉球对家兔耳朵背侧边缘进行消毒处理");
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
			Main.showTip("你需要请你的助手帮你准备麻醉剂");
			btn_zhushou.visible=true;
//			Tween.to(btn_zhushou,{y:btn_zhushou.y+100},600,Ease.circInOut);
			btn_zhushou.on(Event.CLICK,this,onChoosezhushou);
		}
		private var zhenguanS:Boolean=false;
		private var mzjS:Boolean=false;
		private var dialog:ui_jisuanUI;
		/**
		 *选择助手 
		 * 
		 */		
		private function onChoosezhushou():void
		{
			// TODO Auto Generated method stub
			btn_mazui.visible=true;
			btn_zhenguan.visible=true;
			btn_mazui.alpha=0;
			btn_zhenguan.alpha=0;
			Tween.to(btn_zhenguan,{x:btn_zhushou.x+180,alpha:1},600,Ease.circInOut);
			Tween.to(btn_mazui,{x:btn_zhushou.x+100,alpha:1},600,Ease.circInOut,null,100);
			btn_mazui.on(Event.CLICK,this,onChoosemazui);
			btn_zhenguan.on(Event.CLICK,this,onChooseZhG);
		}
		
		private function checkHecheng():void
		{
			// TODO Auto Generated method stub
			if(zhenguanS && mzjS){
				dialog=new ui_jisuanUI();
				Laya.timer.once(600,dialog,dialog.show);
//				dialog.show();
				dialog.rgroup.selectHandler=new Handler(this,onChoose);
			}
		}
		/**
		 *选择剂量 
		 * 
		 */		
		private function onChoose(index:int):void
		{
			// TODO Auto Generated method stub
			if(index==0){
				dialog.close();
				Main.showTip("你选择的剂量合适。请根据提示开始获吸取麻醉剂。");
				Laya.timer.once(1000,this,initXiqu);
			}
			else if(index==1){
				Main.showTip("你选择的剂量太少，达不到深度麻醉的目的");
			}
			else if(index==2){
				Main.showTip("你选择的剂量太多，会伤害兔子的身体");
			}
		}
		/**
		 *初始化吸取 
		 * 
		 */		
		private function initXiqu():void
		{
			// TODO Auto Generated method stub
			btn_xiqu.visible=true;
			Tween.to(img_zhg,{x:648,y:415,rotation:-154},600,Ease.circInOut);
			Tween.to(btn_xiqu,{x:1035,y:673},600,Ease.circInOut);
			txt_jiliang.visible=true;
			pro_jiliang.visible=true;
			pro_jiliang.value=0;
			btn_xiqu.on(Event.MOUSE_DOWN,this,onxiqu);
			btn_xiqu.on(Event.MOUSE_UP,this,stopXiqu);
		}
		
		private function stopXiqu():void
		{
			// TODO Auto Generated method stub
			Laya.timer.clear(this,xiquing);
		}
		private const jiliang:int=18;
		private var currJiliang:Number=0;
		/**
		 *开始吸取麻醉剂 
		 * 
		 */		
		private function onxiqu():void
		{
			// TODO Auto Generated method stub
			Laya.timer.frameLoop(1,this,xiquing);
			
		}
		/**
		 *吸取麻醉剂 
		 * 
		 */		
		private function xiquing():void
		{
			// TODO Auto Generated method stub
			currJiliang+=0.1;
			if(currJiliang>=jiliang){
				Laya.timer.clear(this,xiquing);
				btn_xiqu.off(Event.MOUSE_DOWN,this,onxiqu);
				btn_xiqu.off(Event.MOUSE_UP,this,stopXiqu);
				btn_xiqu.visible=false;
				pro_jiliang.visible=false;
				txt_jiliang.visible=false;
				img_mzj.visible=false;
				img_zhg.visible=false;
				step3();
			}
			txt_jiliang.text="当前麻醉剂量："+Math.round(currJiliang)+"ml";
			pro_jiliang.value=currJiliang/jiliang;
		}
		/**
		 * 选择针管
		 * 
		 */		
		private function onChooseZhG():void
		{
			// TODO Auto Generated method stub
			img_zhg.visible=true;
			img_zhg.alpha=1;
			Tween.from(img_zhg,{x:800,alpha:0},600,Ease.circInOut);
			zhenguanS=true;
			Laya.timer.callLater(this,checkHecheng);
		}
		/**
		 *选择麻醉
		 * 
		 */		
		private function onChoosemazui():void
		{
			// TODO Auto Generated method stub
			img_mzj.visible=true;
			img_mzj.alpha=1;
			Tween.from(img_mzj,{x:300,alpha:0},600,Ease.circInOut);
			mzjS=true;
			Laya.timer.callLater(this,checkHecheng);
		}
	}
}