package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.filters.BlurFilter;
	import laya.filters.GlowFilter;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.ui.p2_1.ui2_1UI;
	import ui.ui.p2_1.ui_jisuanUI;

	/**
	 *麻醉-静脉注射
	 * @author Administrator
	 * 
	 */	
	public class Page2_1 extends ui2_1UI
	{
		public function Page2_1()
		{
			super();
//			Laya.loader.load("p2_1/出血/序列-0319.jpg",Handler.create(this,onResReady));
			onResReady();
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
			trace("clickTuziErduo");
			Tween.to(tuzi,{scaleX:3,scaleY:3,x:-600,y:-100},600);
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
			step4();
			// step3();
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
			mk.destroy();
			mk=new Sprite();
			
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
			btn_xiaoduCom.y=500;
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
		 *扎针过程
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
				img_zhentou.visible=true;
				img_zhentou.pos(mouseX,mouseY);
				img_xueguan.visible=true;
				img_xueguan.once(Event.MOUSE_DOWN,this,chuxie);
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
			img_zhentou.pos(box_zhazhen.mouseX,box_zhazhen.mouseY);
		}
		/**
		 *扎针出血过程
		 * 
		 */		
		private function chuxie():void
		{
			// TODO Auto Generated method stub
			trace("click");
			Laya.timer.clear(this,moveZhentou);
			Laya.timer.frameLoop(1,this,zha);
			img_jiantou.visible=false;
			Laya.timer.once(400,this,function(){
				Laya.timer.clear(this,zha);
				xuedi=new Sprite();
				xuedi.graphics.drawCircle(0,0,4,"#660000");
				xuedi.pivot(2,2);
				box_zhazhen.addChild(xuedi);
				xuedi.blendMode="lighter";
				xuedi.pos(mouseX-10,mouseY+10);
				xuedi.alpha=0;
				Tween.to(xuedi,{scaleX:8,scaleY:8,alpha:1},800,Ease.circInOut);
				chuxieOver();
			});
//			var mc:Animation=new Animation();
//			mc.loadImages(getUrls());
//			box_zhazhen.addChild(mc);
//			mc.play(0,false);
//			Laya.timer.once(1000,this,chuxieOver);
		}
		private function getUrls():Array{
			var temp:Array=[];
			for (var i:int = 0; i < 14; i++) 
			{
				temp.push("p2_1/出血/序列-03"+(19+i)+".jpg");
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
			trace(img_zhentou.x,img_zhentou.y,Laya.timer.currFrame);
			box_zhazhen.setChildIndex(img_zhentou,box_zhazhen.getChildIndex(img_xueguan));
			box_zhazhen.setChildIndex(img_xueguan,box_zhazhen.numChildren-1);
		}
		/**
		 *止血棉球 
		 * 
		 */		
		private function chuxieOver():void
		{
			// TODO Auto Generated method stub
			Main.showTip("请选择止血棉球止血！");
			img_mianqiu.visible=true;
			btn_mianqiu.visible=true;
			btn_mianqiu.on(Event.MOUSE_DOWN,this,onChooseMianqiu);
			img_mianqiu.on(Event.MOUSE_DOWN,this,onChooseMianqiu);
			Laya.stage.on(Event.MOUSE_UP,this,onstopMoveMianqiu);
		}
		/**
		 *停止拖动止血棉球 
		 * 
		 */		
		private function onstopMoveMianqiu():void
		{
			// TODO Auto Generated method stub
			Laya.stage.off(Event.MOUSE_MOVE,this,onMoveMianqiu);
			img_mianqiu.stopDrag();
			img_mianqiu.filters=[];
			Tween.to(img_mianqiu,{scaleX:0.5,scaleY:0.5},300);
		}
		/**
		 *选择止血棉球 
		 * 
		 */		
		private function onChooseMianqiu():void
		{
			// TODO Auto Generated method stub
			Tween.to(img_mianqiu,{scaleX:0.45,scaleY:0.45},300);
			img_mianqiu.pos(mouseX,mouseY);
			img_mianqiu.startDrag();
			Laya.stage.on(Event.MOUSE_MOVE,this,onMoveMianqiu);
		}
		/**
		 *移动棉球 
		 * 
		 */		
		private function onMoveMianqiu():void
		{
			// TODO Auto Generated method stub
//			img_mianqiu.pos(mouseX,mouseY);
			if(Math.abs(img_mianqiu.x-(img_zhentou.x-10))<=10 && Math.abs(img_mianqiu.y-(img_zhentou.y-5))<=5){
				img_mianqiu.stopDrag();
				Tween.to(img_mianqiu,{scaleX:0.5,scaleY:0.5},300);
				var filter:GlowFilter=new GlowFilter("#ffff00",5);
				img_mianqiu.filters=[filter];
				Laya.timer.clear(this,onMoveMianqiu);
				Laya.timer.once(600,this,function(){img_mianqiu.filters=[]});
				Laya.stage.off(Event.MOUSE_MOVE,this,onMoveMianqiu);
				btn_mianqiu.off(Event.MOUSE_DOWN,this,onChooseMianqiu);
				Laya.stage.off(Event.MOUSE_UP,this,onstopMoveMianqiu);
				img_mianqiu.off(Event.MOUSE_DOWN,this,onChooseMianqiu);
				btn_mianqiu.visible=false;
				btn_mianqiu.destroy();
				Laya.timer.clear(this,step5);
				Laya.timer.once(600,this,step5);
				/*Laya.timer.once(1000,this,function(){
					NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,"page1_4");
				
				});*/
			}
			
		}
		/**
		 *注射麻醉剂 
		 * 
		 */		
		private function step5():void
		{
			// TODO Auto Generated method stub
			Main.showTip("请用棉球按压出血处，然后请助手推动麻醉剂注射针管");
			btn_zhushou2.visible=true;
			btn_zhushou2.alpha=1;
			Tween.from(btn_zhushou2,{y:btn_zhushou2.y+60,alpha:0},600,null,null,400);
			btn_zhushou2.once(Event.CLICK,this,onZhushou2);
		}
		/**
		 *弹出注射器 
		 * 
		 */		
		private function onZhushou2():void
		{
			// TODO Auto Generated method stub
			box_zhushou2.visible=true;
			spr_bg.scale(0.1,0.1);
			spr_bg.alpha=0;
			Tween.to(spr_bg,{scaleX:1,scaleY:1,alpha:0.6},600,Ease.circInOut);
			
			box_zhusheqi.scale(0.1,0.1);
			box_zhusheqi.alpha=0;
			Tween.to(box_zhusheqi,{scaleX:1,scaleY:1,alpha:1},600,Ease.circInOut);
			
			
			btn_zhushe.visible=true;
			btn_zhushe.alpha=0;
			Tween.to(btn_zhushe,{x:btn_zhushe.x+120,alpha:1},600,Ease.circInOut);
			btn_zhushe.on(Event.MOUSE_DOWN,this,zhusheHandler);
			btn_zhushe.on(Event.MOUSE_UP,this,zhushePause);
		}
		/***暂停注射**/		
		private function zhushePause():void{Laya.timer.clear(this,zhusheIng);	}
		/****开始注射*/		
		private var zhushePro:Number=0;
		private function zhusheHandler():void{Laya.timer.frameLoop(1,this,zhusheIng);	}
		/***注射过程**/		
		private function zhusheIng():void
		{
			// TODO Auto Generated method stub
			zhushePro+=0.2;
			if(zhushePro>=jiliang){
				Laya.timer.clear(this,zhusheIng);
				Laya.timer.callLater(this,zhusheEnd);
			}
			txt_zhushepro.text="您已注射："+Math.round(zhushePro)+"ml";
			pro_zhushe.value=zhushePro/jiliang;
			
		}
		/**
		 *注射完成 
		 * 
		 */		
		private function zhusheEnd():void
		{
			// TODO Auto Generated method stub
			box_zhushou2.visible=false;
			box_zhushou2.destroy();
			btn_zhushou2.visible=false;
			btn_zhushe.visible=false;
			btn_zhushe.destroy();
			Main.showTip("注射完成，请用棉球擦干净伤口周围的血渍");
			
			Laya.timer.once(600,this,step6);
		}
		/**
		 * 
		 * 擦干净伤口周围的血渍
		 */		
		private function step6():void
		{
			// TODO Auto Generated method stub
			img_mianqiu.visible=true;
			img_mianqiu.on(Event.MOUSE_DOWN,this,onCaxueDown);
			img_mianqiu.on(Event.MOUSE_UP,this,onCaxueUp);
		}
		private var caNum:int=0;
		/**
		 *鼠标抬起 暂停拖动棉球 
		 * 
		 */		
		private function onCaxueUp():void
		{
			// TODO Auto Generated method stub
			img_mianqiu.stopDrag();
			Tween.to(img_mianqiu,{scaleX:0.5,scaleY:0.5},300);
			caNum++;
			if(caNum>=6){
				img_mianqiu.off(Event.MOUSE_DOWN,this,onCaxueDown);
				img_mianqiu.off(Event.MOUSE_UP,this,onCaxueUp);
				Main.showTip("麻醉过程全部学习完毕！");
			}
		}
		/**
		 *擦血渍 
		 * 
		 */		
		private function onCaxueDown():void
		{
			// TODO Auto Generated method stub
			img_mianqiu.startDrag();
			var s:Sprite=new Sprite();
			s.graphics.drawCircle(0,0,img_mianqiu.width/2,"#ff3333");
			s.pivot(s.width/2,s.height/2);
			s.pos(img_mianqiu.width/2,img_mianqiu.height/2);
			img_mianqiu.addChild(s);
			s.blendMode='lighter';
			s.alpha=0.1;
			
			xuedi.alpha-=0.1;
			/*var f1:BlurFilter=new BlurFilter(4);
			var f2:GlowFilter=new GlowFilter("#ff0000",5);
			img_mianqiu.filters=[f1,f2];*/
			Tween.to(img_mianqiu,{scaleX:0.45,scaleY:0.45},300);
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
		private var zhushouShow:Boolean=false;
		/**
		 *选择助手 
		 * 
		 */		
		private function onChoosezhushou():void
		{
			// TODO Auto Generated method stub
			if(zhushouShow){//收起助手子按钮
				Tween.to(btn_zhenguan,{x:btn_zhushou.x,alpha:0},600,Ease.circInOut);
				Tween.to(btn_mazui,{x:btn_zhushou.x,alpha:0},600,Ease.circInOut,null,100);
				zhushouShow=false;
			}
			else{//展开助手子按钮
				zhushouShow=true;
				btn_mazui.visible=true;
				btn_zhenguan.visible=true;
				btn_mazui.alpha=0;
				btn_zhenguan.alpha=0;
				Tween.to(btn_zhenguan,{x:btn_zhushou.x+200,alpha:1},600,Ease.circInOut);
				Tween.to(btn_mazui,{x:btn_zhushou.x+100,alpha:1},600,Ease.circInOut,null,100);
			}
			
			btn_mazui.on(Event.CLICK,this,onChoosemazui);
			btn_zhenguan.on(Event.CLICK,this,onChooseZhG);
		}
		/**
		 *检查是否两个工具都选用了 
		 * 
		 */		
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
			btn_zhushou.off(Event.CLICK,this,onChoosezhushou);
			txt_jiliang.visible=true;
			pro_jiliang.visible=true;
			pro_jiliang.value=0;
			btn_xiqu.on(Event.MOUSE_DOWN,this,onxiqu);
			btn_xiqu.on(Event.MOUSE_UP,this,stopXiqu);
		}
		/**
		 *鼠标抬起停止吸取麻醉剂 
		 * 
		 */		
		private function stopXiqu():void
		{
			// TODO Auto Generated method stub
			Laya.timer.clear(this,xiquing);
		}
		private const jiliang:int=18;
		private var currJiliang:Number=0;

		private var xuedi:Sprite;
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