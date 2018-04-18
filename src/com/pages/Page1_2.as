package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	import com.mode.DBTest;
	
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	import ui.ui.p1_2.GudingtuziPageUI;
	
	/**
	 *	兔盒固定 
	 * @author Administrator
	 * 
	 */	
	public class Page1_2 extends Page
	{
		private var _page:GudingtuziPageUI;
		private var _role:DBTest;
		public function Page1_2()
		{
			super();
//			Laya.loader.load('res/atlas/comp.atlas',Handler.create(this,onLoaded));
			onLoaded();
		}
		/**
		 *资源加载完毕 
		 * 
		 */		
		private function onLoaded():void
		{
			// TODO Auto Generated method stub
			_page=new GudingtuziPageUI();
			this.addChild(_page);
			_page.progbar.value=0;
			_page.tip.changeText('请打开盒子');
			_page.box.on(Event.LABEL,this,onAnimationLabel);
			_role=new DBTest();
			_role.on('DRAGING',this,dragRoleing);
			_role.on('BEGIN_DRAG',this,begindragRole);
			_role.on('END_DRAG',this,enddragRole);
			this.addChild(_role);
			_role.pos(-430,200);
			_role.alpha=0;
			Laya.stage.on(Event.MOUSE_DOWN,this,beginDrag);
			Laya.stage.on(Event.MOUSE_UP,this,endDrag);
			Laya.stage.on(Event.MOUSE_OUT,this,endDrag);
		}
		
		private function onAnimationLabel(label:String):void
		{
			// TODO Auto Generated method stub
			if(label=='opened'){
				_page.box.gotoAndStop(26);
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
			if(_role.x<260 && _role.x>160 && _role.y>-135 && _role.y<-108){
				_role.stopDrag();
				_role.off('DRAGING',this,dragRoleing);
				_role.off('BEGIN_DRAG',this,begindragRole);
				_role.off('END_DRAG',this,enddragRole);
				_role.onHit();
				_role.destroyChildren();
				_role.destroy();
				_page.box.gotoAndStop(27);
				_page.tip.changeText("注意让兔子的头部露出盒子，并盖上盖子。");
				_page.btn.on(Event.CLICK,this,closeBox);
			}
		}
		/**
		 *合上箱子 
		 * 
		 */		
		private function closeBox():void
		{
			// TODO Auto Generated method stub
			trace("click");
			_page.tip.changeText("做的很好，马上进入下一步，耳缘静脉注射");
			_page.box.gotoAndStop(28);
			Laya.timer.once(3000,this,addPage);
		}
		
		private function addPage():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1_3');
		}
		/**
		 * 
		 * 停止开箱动作
		 */		
		private function endDrag():void
		{
			// TODO Auto Generated method stub
			Laya.stage.off(Event.MOUSE_MOVE,this,DragBoxing);
			if(_page.progbar.value<=0.7){
				_page.progbar.value=0;
				_page.box.gotoAndStop(0);
				_page.tip.changeText("请打开盒子");
			}
			else{
				openBox();
			}
		}
		private var lastY:Number;
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
			_page.progbar.value+=dis/100;
			trace("index:"+Math.round(25*_page.progbar.value));
			_page.box.gotoAndStop(Math.round(25*_page.progbar.value));
			if(_page.progbar.value==1){
				openBox();
				return ;
			}
			lastY=this.mouseY;
		}
		
		private function openBox():void
		{
			// TODO Auto Generated method stub
			_page.tip.changeText("盒子已经打开，请将兔子放到盒子里");
			Laya.stage.off(Event.MOUSE_MOVE,this,DragBoxing);
			Laya.stage.off(Event.MOUSE_DOWN,this,beginDrag);
			Laya.stage.off(Event.MOUSE_UP,this,endDrag);
			Laya.stage.off(Event.MOUSE_OUT,this,endDrag);
			Tween.to(_role,{x:20,alpha:1},1000,Ease.backInOut);
			_page.progbar.removeSelf();
		}
	}
}  