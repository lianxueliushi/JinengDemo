package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	import com.mode.DBTest;
	
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.d3.core.particleShuriKen.module.shape.BoxShape;
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import ui.p1_2.GudingtuziPageUI;
	
	/**
	 *	兔盒固定 
	 * @author Administrator
	 * 
	 */	
	public class Page1_2 extends GudingtuziPageUI
	{
		private var _role:DBTest;
		public function Page1_2()
		{
			super();
			onLoaded();
		}
		
		private function onError():void
		{
			// TODO Auto Generated method stub
			trace("loadError")
		}
		/**
		 *资源加载完毕 
		 * 
		 */		
		private function onLoaded():void
		{
			// TODO Auto Generated method stub
			progbar.value=0;
			Main.showTip("拖动鼠标打开盒子");
			box.on(Event.LABEL,this,onAnimationLabel);
			_role=new DBTest();
			_role.on('DRAGING',this,dragRoleing);
			_role.on('BEGIN_DRAG',this,begindragRole);
			_role.on('END_DRAG',this,enddragRole);
			this.addChild(_role);
			Laya.timer.once(1000,this,addHandler);
			_role.pos(box_tuzi.x-400,box_tuzi.y-300);
			_role.alpha=0;
			Laya.stage.on(Event.MOUSE_DOWN,this,beginDrag);
			Laya.stage.on(Event.MOUSE_UP,this,endDrag);
			Laya.stage.on(Event.MOUSE_OUT,this,endDrag);
		}
		
		private function addHandler():void
		{
			// TODO Auto Generated method stub
			_role.InitListener();
		}
		
		private function onAnimationLabel(label:String):void
		{
			// TODO Auto Generated method stub
			if(label=='opened'){
				box.gotoAndStop(26);
			}
		}
		/**
		 *停止拖动 角色
		 * 
		 */		
		private function enddragRole():void
		{
			// TODO Auto Generated method stub
			_role.stopDrag();
			if(Math.abs(_role.x+400-box_hezi.x)<100 && (_role.y+300-box_hezi.y)<100){
				_role.stopDrag();
				_role.off('DRAGING',this,dragRoleing);
				_role.off('BEGIN_DRAG',this,begindragRole);
				_role.off('END_DRAG',this,enddragRole);
				_role.onHit();
				_role.destroyChildren();
				_role.destroy();
				//				box.gotoAndStop(27);
				
				fangHezi=new Templet();
				fangHezi.on(Event.COMPLETE,this,onParseCom);
				fangHezi.on(Event.ERROR,this,onParseError);
				fangHezi.loadAni('p1_2/fangruhezi.sk');
				Main.showTip("合上盒子。");
				
				btnClose.on(Event.CLICK,this,closeHalfBox);
			}
		}
		/**
		 *开始拖动角色
		 * 
		 */		
		private function begindragRole():void
		{
			// TODO Auto Generated method stub
			_role.startDrag();
		}
		/**
		 *角色拖动中 
		 * 
		 */		
		private function dragRoleing():void
		{
			// TODO Auto Generated method stub
			trace('_role.x:'+_role.x,'_role.y:'+_role.y);
		}
		/**
		 *第二个视角——抓起耳朵，盖上盖子 
		 * 
		 */		
		private function onTurn():void
		{
			// TODO Auto Generated method stub
			box.stop();
//			
			
			templet=new Templet();
			templet.on(Event.COMPLETE,this,onParseCom2);
			templet.on(Event.ERROR,this,onParseError);
			templet.loadAni('tuzi1/tierduo001.sk');
		}
		
		private function onParseCom2():void
		{
			// TODO Auto Generated method stub
			trace('骨骼动画加载完毕');
			skeleton=templet.buildArmature(0);
			skeleton.play(0,false);
			skeleton.pos(box_tuzi.x+400,box_tuzi.y-230);
//			skeleton.on(Event.COMPLETE,this,playOver);
			box2.visible=true;
			box1.visible=false;
			box2.addChild(skeleton);
		}
		
		private function playOver():void
		{
			// TODO Auto Generated method stub
			Laya.timer.once(1500,this,addPage);
		}
		
		private function onParseError():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onParseCom():void
		{
			// TODO Auto Generated method stub
			fangheziSkeleton=fangHezi.buildArmature(0);
			fangheziSkeleton.play(0,false);
			box_hezi.addChild(fangheziSkeleton);
			fangheziSkeleton.pos(box.x,box.y);
		}
		/**
		 *合上一半盒子 
		 * 
		 */		
		private function closeHalfBox():void
		{
			// TODO Auto Generated method stub
			trace("click");
			box.wrapMode=1;
			box.addLabel("turn",5);
			box.on(Event.LABEL,this,onTurn);
			box.play(Math.round(progbar.value*(box.count-1)),false);
			
			/*Main.showTip("做的很好，马上进入下一步，耳缘静脉注射");
			box.gotoAndStop(28);*/
//			Laya.timer.once(1500,this,addPage);
		}
		
		private function addPage():void
		{
			// TODO Auto Generated method stub
			Main.hideTip();
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page2_1');
		}
		/**
		 * 
		 * 停止开箱动作
		 */		
		private function endDrag():void
		{
			// TODO Auto Generated method stub
			Laya.stage.off(Event.MOUSE_MOVE,this,DragBoxing);
			if(progbar.value<=0.5){
				/*progbar.value=0;
				box.gotoAndStop(0);
				Main.showTip("拖动鼠标打开盒子");*/
				box.wrapMode=1;
				box.play(Math.round(progbar.value*(box.count-1)),false);
				progbar.value=0;
			}
			else{
				box.wrapMode=0;
				box.play(Math.round(progbar.value*(box.count-1)),false);
				openBox();
			}
		}
		private var lastY:Number;
		private var fangHezi:Templet;
		private var fangheziSkeleton:Skeleton;
		private var templet:Templet;
		private var skeleton:Skeleton;
		/**
		 * 开始拖动盒子   鼠标上下拖动 模拟开箱动作
		 * 
		 */		
		private function beginDrag():void
		{
			// TODO Auto Generated method stub
			lastY=this.mouseY;
			Laya.stage.on(Event.MOUSE_MOVE,this,DragBoxing);
		}
		/**
		 *拖动鼠标，打开盒子 
		 * 
		 */		
		private function DragBoxing():void
		{
			// TODO Auto Generated method stub
			var dis:Number=lastY-this.mouseY;
			progbar.value+=dis/100;
			trace("index:"+Math.round(24*progbar.value));
			box.gotoAndStop(Math.round(24*progbar.value));
			if(progbar.value==1){
				openBox();
				return ;
			}
			lastY=this.mouseY;
		}
		
		private function openBox():void
		{
			// TODO Auto Generated method stub
			Main.showTip("请将兔子放到盒子里");
			Laya.stage.off(Event.MOUSE_MOVE,this,DragBoxing);
			Laya.stage.off(Event.MOUSE_DOWN,this,beginDrag);
			Laya.stage.off(Event.MOUSE_UP,this,endDrag);
			Laya.stage.off(Event.MOUSE_OUT,this,endDrag);
			Tween.to(_role,{x:box_tuzi.x-400,y:box_tuzi.y-300,alpha:1},600,Ease.backInOut);
//			Tween.to(this,{x:x+50},600);
			progbar.removeSelf();
		}
	}
}  