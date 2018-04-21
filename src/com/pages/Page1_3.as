package com.pages
{
	import com.canvas.GraphBase;
	
	import laya.ani.swf.MovieClip;
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.filters.BlurFilter;
	import laya.net.Loader;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Mouse;
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
			Laya.loader.load("p1_3/出血/序列-0319.jpg",Handler.create(this,onResReady));
			
		}
		
		private function onResReady():void
		{
			// TODO Auto Generated method stub
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
		/**
		 *拔毛的次数，用来判定是否拔毛完成。这个判断不准确 
		 */		
		private var bamaoNumber:int;
		private function onScaleEnd():void
		{
			// TODO Auto Generated method stub
			tuzi.destroy();
			mk=new Sprite();
			img2.mask=mk;
			img1.visible=true;
			img2.visible=true;
//			step1();
			step3();
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
			m.pos(img2.mouseX,img2.mouseY);
			var filter:BlurFilter=new BlurFilter(6);
			m.filters=[filter];
			mk.addChild(m);
			trace("local:"+img2.mouseX,img2.mouseY);
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
			Laya.timer.clear(this,tiaoGuobamao);
			Main.showTip("拔毛完成");
			img1.off(Event.MOUSE_DOWN,this,startBamao);
			img1.off(Event.MOUSE_UP,this,endBamao);
			mk.graphics.clear();
			img2.mask=null;
			Laya.timer.once(1000,this,step2);
		}
		/**
		 *第3步：消毒 
		 * 
		 */		
		private function step3():void{
			Main.showTip("请使用酒精棉球对家兔耳朵背侧边缘进行消毒处理");
			img3.mouseThrough=true;
			img3.on(Event.MOUSE_DOWN,this,startXiaodu);
			m_img3wrong.on(Event.MOUSE_DOWN,this,function(e:Event){
				if(e.target.name=="wrong"){
					Main.showTip("请对家兔耳朵背侧边缘进行消毒处理",true,1000);
				}
			});
			img3.on(Event.MOUSE_UP,this,function(){
				img3.off(Event.MOUSE_MOVE,this,xiaoduing);
			});
			img3.visible=true;
			img3.visible=true;
			mk.graphics.clear();
			img3.mask=mk;
		}
		private function startXiaodu(e:Event):void
		{
			// TODO Auto Generated method stub
			trace(e.target.name);
			img3.on(Event.MOUSE_MOVE,this,xiaoduing);
		}
		/**
		 *消毒状态 
		 * 
		 */		
		private function xiaoduing():void
		{
			// TODO Auto Generated method stub
			trace("消毒……"+img3.mouseX,img3.mouseY);
			var m:Sprite=new Sprite();
			m.graphics.drawCircle(-20,-20,40,'#ff0000');
			m.pos(img3.mouseX,img3.mouseY);
			var filter:BlurFilter=new BlurFilter(6);
			m.filters=[filter];
			mk.addChild(m);
			btn_xiaoduCom.visible=true;
			btn_xiaoduCom.alpha=0;
			Tween.to(btn_xiaoduCom,{y:600,alpha:1},600,Ease.circInOut);
			btn_xiaoduCom.on(Event.CLICK,this,xiaoduEd);
		}
		/**
		 *消毒完成 
		 * 
		 */		
		private function xiaoduEd():void
		{
			// TODO Auto Generated method stub
			Main.showTip("消毒处理完毕");
			btn_xiaoduCom.visible=false;
			img3.mask=null;
			mk.graphics.clear();
			mk.destroy();
			
			img2.destroy();
			img3.offAll();
			m_img3wrong.destroy();
			Laya.timer.once(1000,this,step4);
			
		}
		/**
		 *注射 
		 * 
		 */		
		private function step4():void
		{
			// TODO Auto Generated method stub
			Main.showTip("请选择*号针头拖动至暴露的耳缘静脉位置");
			tool_zhentou.visible=true;
			tool_zhentou.y=720;
			tool_zhentou.alpha=0;
			Tween.to(tool_zhentou,{alpha:1,y:618},600);
			zhentouList.selectHandler=new Handler(this,zhentouSelect);
		}
		
		private function zhentouSelect(index:int):void
		{
			// TODO Auto Generated method stub
			if(index==1){
				Main.showTip("选择正确");
				Tween.to(tool_zhentou,{y:720,alpha:0},600);
				img_jiantou.visible=true;
				mc_jiantou.play(0,true);
//				img_zhentou.visible=true;
//				img_zhentou.pos(mouseX,mouseY);
				img_xueguan.visible=true;
				btn_zhushe.visible=true;
				btn_zhushe.on(Event.MOUSE_DOWN,this,chuxie);
				Laya.stage.on(Event.MOUSE_UP,this,stopchuxie);
				Laya.timer.frameLoop(1,this,moveZhentou);
			}
			else if(index==0){
				Main.showTip("针头过小");
			}
			else if(index==2){
				Main.showTip("针头过大");
			}
		}
		/**
		 *针头停止 移动
		 * 
		 */		
		private function stopchuxie():void
		{
			// TODO Auto Generated method stub
			Laya.timer.clear(this,zha);
		}
		
		private function moveZhentou():void
		{
			// TODO Auto Generated method stub
			//img_zhentou.pos(box_zhazhen.mouseX,box_zhazhen.mouseY);
		}
		/**
		 *扎针 
		 * 
		 */		
		private function chuxie():void
		{
			// TODO Auto Generated method stub
			trace("click");
			Laya.timer.clear(this,moveZhentou);
			Laya.timer.frameLoop(1,this,zha);
			
			var mc:Animation=new Animation();
			mc.loadImages(getUrls());
			this.addChild(mc);
			//mc.pos(box_zhazhen.mouseX,box_zhazhen.mouseY);
			mc.play(0,false);
			Laya.timer.once(1000,this,chuxieOver);
//			mc.on(Event.COMPLETE,this,chuxieOver);
			/*var mc:Sprite=new Sprite();
			mc.graphics.drawCircle(0,0,4,"#660000");
			mc.pivot(2,2);
			this.addChild(mc);
			mc.blendMode="lighter";
			mc.pos(mouseX-20,mouseY+5);
			mc.alpha=0;
			Tween.to(mc,{scaleX:8,scaleY:8,alpha:1},800,Ease.circInOut);*/
			
			
		}
		
		private function chuxieOver():void
		{
			// TODO Auto Generated method stub
			Main.showTip("请助手缓慢推动注射器，麻醉完毕！");
		}
		private function getUrls():Array{
			var temp:Array=[];
			for (var i:int = 0; i < 14; i++) 
			{
				temp.push("p1_3/出血/序列-03"+(19+i)+".jpg");
			}
			return temp;
		}
		/**
		 * 针头扎入
		 * 
		 */		
		private function zha():void
		{
			// TODO Auto Generated method stub
			img_zhentou.x-=0.05;
			img_zhentou.y+=0.01;
			box_zhazhen.setChildIndex(img_zhentou,box_zhazhen.getChildIndex(img_xueguan));
			box_zhazhen.setChildIndex(img_xueguan,box_zhazhen.numChildren-1);
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
			Tween.to(img_zhg,{x:268,y:252,rotation:-144},600,Ease.circInOut);
			Tween.to(btn_xiqu,{x:655,y:531},600,Ease.circInOut);
			btn_mazui.visible=btn_zhushou.visible=btn_zhenguan.visible=false;
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
			currJiliang+=0.3;
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