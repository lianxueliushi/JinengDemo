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
	
	import ui.Uimain1UI;
	
	public class PageMain extends Uimain1UI
	{

		private var ani:Animation;
		public function PageMain()
		{
			onCreate();
		}
		private function onCreate():void
		{
			// TODO Auto Generated method stub
			ani=new Animation();
			var urls:Array=[];
			for (var i:int = 0; i < 14; i++) 
			{
				urls.push('yindaodonghua/0100'+(i<10?'0'+i:i)+".jpg");
				trace(urls[i]);
			}
			ani.loadImages(urls);
			bg.addChild(ani);
			ani.once(Event.COMPLETE,this,playOver);
			ani.play(0,false);
			ani.scale(Laya.stage.width/640,Laya.stage.height/480);
		}
		/**
		 *引导动画播放完毕 
		 * 
		 */		
		private function playOver():void
		{
			// TODO Auto Generated method stub
			trace('over');
			ani.destroy();
			var scene:Scene=new Scene();
			//一定要加环境光，才能亮
			bg.addChild(scene);
			
			var camera:Camera=new Camera();
			camera. fieldOfView=55;
			camera.transform.rotate(new Vector3(-15,180,0),true,false);
			
			var sky:SkyBox=new SkyBox();
			sky.textureCube=TextureCube.load('skyBox1/skyCube.ltc');
			camera.clearFlag=BaseCamera.CLEARFLAG_SKY;
			camera.sky=sky;
			scene.addChild(camera);
			var script:Component3D=camera.addComponent(CameraMoveScript);
			btnStart.once(Event.CLICK,this,function(){
				trace('removeComp');
				script._destroy();
				camera.removeAllComponent();
				Laya.stage.offAll();
				if(Laya.stage.hasListener(Event.MOUSE_DOWN)){
					trace("移除失败");
				}
				NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,'page1');
			});
		}
		
		
	}
}