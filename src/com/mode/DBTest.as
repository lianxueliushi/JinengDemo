package com.mode
{
	
	import laya.ani.bone.EventData;
	import laya.ani.bone.Skeleton;
	import laya.ani.bone.Templet;
	import laya.display.Animation;
	import laya.display.Sprite;
	import laya.events.Event;
	import laya.maths.Rectangle;

	public class DBTest extends Sprite
	{
		private var templet:Templet;
		public var skeleton:Skeleton;
		/**
		 *手动画 
		 */		
		private var mc_shou:Animation;
		/**
		 *当前动画索引 
		 */		
		private var index:Number=0;
		/**
		 *指示动画 
		 */		
		private var zhishi:Animation;
		public function DBTest()
		{
			templet=new Templet();
			templet.on(Event.COMPLETE,this,onParseCom);
			templet.on(Event.ERROR,this,onParseError);
			templet.loadAni('demo/Demo.sk');
		}
		/**
		 *DB动画加载完毕 
		 * 
		 */		
		private function onParseCom():void
		{
			// TODO Auto Generated method stub
			trace('骨骼动画加载完毕');
			skeleton=templet.buildArmature(0);
			skeleton.name='skeleton';
			zhishi=new Animation();
			zhishi.loadAnimation("ui/p1_2/zhishi.ani");
			zhishi.play();
			zhishi.pos(-70,-110);
			skeleton.addChild(zhishi);
			
			mc_shou=new Animation();
			mc_shou.loadAnimation('ui/p1_2/shou.ani');
			mc_shou.stop();
			skeleton.addChild(mc_shou);
			mc_shou.mouseEnabled=false;
			if(!mc_shou.width){
				var rect:Rectangle=mc_shou.getBounds();
				mc_shou.size(rect.width,rect.height);
			}
			this.on(Event.MOUSE_DOWN,this,onThisdown);
			var dragRect:Sprite=new Sprite();
			dragRect.graphics.drawRect(0,0,100,40,'#ff0000');
			dragRect.alpha=0;
			dragRect.pos(-70,-110);
			dragRect.size(100,40);
			dragRect.name="dragRect";
			skeleton.addChild(dragRect);
			dragRect.on(Event.MOUSE_DOWN,this,onDown);
			skeleton.on(Event.MOUSE_UP,this,onUp);
			
			this.addChild(skeleton);
			this.size(800,600);
			trace("兔子的尺寸："+skeleton.width,skeleton.height);
			skeleton.play("stand",true);
			skeleton.pos(400,300);
		}
		
		private function onThisdown(e:Event):void
		{
			// TODO Auto Generated method stub
			trace('down:'+e.target.name);
			if(e.target.name!="dragRect") event('WRONGDRAG');
		}
		
		private function onLable(e:EventData):void
		{
			// TODO Auto Generated method stub
			if(e.name=="dragstop"){
				skeleton.off(Event.LABEL,this,onLable);
				skeleton.play("stand",true);
			}
		}
		private function onUp():void
		{
			// TODO Auto Generated method stub
				skeleton.play("fang",false,true);
				zhishi.visible=true;
				mc_shou.play(0,false,"fang");
				Laya.stage.off(Event.MOUSE_MOVE,this,onMove);
				event("END_DRAG");
		}
		private function onDown(e:Event):void
		{
			// TODO Auto Generated method stub
			if(e.target.name=='dragRect'){
				event("BEGIN_DRAG");
				skeleton.on(Event.LABEL,this,onLable);
				skeleton.play("drag",false,true);
				zhishi.visible=false;
				mc_shou.visible=true;
				mc_shou.pos(skeleton.mouseX,skeleton.mouseY);
				mc_shou.play(0,false,"zhua");
				Laya.stage.on(Event.MOUSE_MOVE,this,onMove);
			}
			else{
				event('WRONGDRAG');
			}
			
		}
		
		private function onMove():void
		{
			// TODO Auto Generated method stub
			event("DRAGING");
		}
		private function onClick():void
		{
			// TODO Auto Generated method stub
			index++;
			if(index>skeleton.getAnimNum()-1){
				index=0;
			}
			skeleton.play(index,true,false,0,0.1);
		}
		/**
		 *DB动画加载出错 
		 * 
		 */		
		private function onParseError():void
		{
			// TODO Auto Generated method stub
			trace('骨骼动画加载出错');
		}
		
		public function onHit():void
		{
			// TODO Auto Generated method stub
			skeleton.off(Event.MOUSE_UP,this,onUp);
			skeleton.off(Event.MOUSE_DOWN,this,onDown);
			Laya.stage.off(Event.MOUSE_MOVE,this,onMove);
			skeleton.play("fang",false,true);
			mc_shou.play(0,false,"fang");
			zhishi.visible=false;
		}
	}
}