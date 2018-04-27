package com.pages
{
	import com.components.CameraMoveScript;
	import com.eventdispatcher.NGEventDispatcher;
	
	import laya.d3.component.Component3D;
	import laya.d3.core.BaseCamera;
	import laya.d3.core.Camera;
	import laya.d3.core.scene.Scene;
	import laya.d3.math.Vector3;
	import laya.d3.resource.TextureCube;
	import laya.d3.resource.models.SkyBox;
	import laya.display.Animation;
	import laya.events.Event;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	import ui.Uimain1UI;
	
	public class PageManyou extends Uimain1UI
	{

		private var ani:Animation;

		private var camera:Camera;
		public function PageManyou()
		{
			onCreate();
		}
		private function onCreate():void
		{
			// TODO Auto Generated method stub
			ani=new Animation();
			var urls:Array=[];
			for (var i:int = 0; i < 201; i++) 
			{
				urls.push('yindaodonghua/1'+format(i)+".jpg");
				trace(urls[i]);
			}
			ani.loadImages(urls);
			bg.addChild(ani);
			ani.once(Event.COMPLETE,this,playOver);
			ani.play(0,false);
			ani.scale(Laya.stage.width/1280,Laya.stage.height/720);
			btnStart.visible=false;
		}
		
		private function format(i:int):String
		{
			// TODO Auto Generated method stub
			if(i>=100){
				return i.toString();
			}
			else if(i>=10){
				return "0"+i;
			}
			else return "00"+i;
		}
		/**
		 *引导动画播放完毕 
		 * 
		 */		
		private function playOver():void
		{
			// TODO Auto Generated method stub
			trace('over');
			
			var scene:Scene=new Scene();
			//一定要加环境光，才能亮
			bg.addChild(scene);
			
			camera=new Camera();
			camera. fieldOfView=55;
			camera.transform.rotate(new Vector3(0,180,0),true,false);
			
			var sky:SkyBox=new SkyBox();
			sky.textureCube=TextureCube.load('skyBox1/skyCube.ltc');
			camera.clearFlag=BaseCamera.CLEARFLAG_SKY;
			camera.sky=sky;
			scene.addChild(camera);
			var script:Component3D=camera.addComponent(CameraMoveScript);
			btnStart.visible=true;
			btnStart.alpha=0;
			btnStart.bottom=0;
			btnStart.x=(Laya.stage.width-btnStart.width)/2;
			Tween.to(btnStart,{y:btnStart.y-200,alpha:1},600,Ease.circInOut);
			Laya.timer.frameLoop(1,this,rotate);
			btnStart.once(Event.CLICK,this,function():void
			{
				trace('removeComp');
				script._destroy();
				camera.removeAllComponent();
				Laya.stage.offAll();
				if(Laya.stage.hasListener(Event.MOUSE_DOWN)){
					trace("移除失败");
				}
				NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1');
			});
//			ani.destroy();
		}
		
		private function rotate():void
		{
			// TODO Auto Generated method stub
			camera.transform.rotate(new Vector3(0,0.03,0),true,false);
		}		
		
	}
}