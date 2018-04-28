package com.mode
{
	import com.components.CameraMoveScript;
	
	import laya.d3.component.Component3D;
	import laya.d3.core.BaseCamera;
	import laya.d3.core.Camera;
	import laya.d3.core.MeshSprite3D;
	import laya.d3.core.Sprite3D;
	import laya.d3.core.light.DirectionLight;
	import laya.d3.core.scene.Scene;
	import laya.d3.math.Vector3;
	import laya.d3.resource.TextureCube;
	import laya.d3.resource.models.BoxMesh;
	import laya.d3.resource.models.SkyBox;
	import laya.display.Sprite;
	import laya.events.Event;
	
	public class SkyControl extends Sprite
	{
		private var camera:Camera;

		private var script:Component3D;
		private var sprite3d:Sprite3D;
		public function SkyControl($url:String)
		{
			super();
			var scene:Scene=Scene.load("LayaScene_lizi/lizi.ls");
			this.addChild(scene);
//			//创建方向光 ------------------------
//			var light:DirectionLight = scene.addChild(new DirectionLight()) as DirectionLight;
//			//移动灯光位置
//			light.transform.translate(new Vector3(0,2,5));
//			//调整灯光方向
//			light.direction = new Vector3(0.5, -1, 0);
//			//设置灯光颜色
//			light.color = new Vector3(0.3, 0.3, 0.3);
//			//设置灯光环境色
//			scene.ambientColor = new Vector3(1, 1, 1); 
			
			camera=new Camera();
			camera. fieldOfView=55;
			camera.transform.rotate(new Vector3(0,180,0),true,false);
			var sky:SkyBox=new SkyBox();
			sky.textureCube=TextureCube.load($url);
			camera.clearFlag=BaseCamera.CLEARFLAG_SKY;
			camera.sky=sky;
			scene.addChild(camera);
			script=camera.addComponent(CameraMoveScript);
			script.on("mouseup",this,mouseLeave);
			Laya.timer.frameLoop(1,this,rotate);
			
//			var boxMesh:BoxMesh=new BoxMesh(1,1,1);
//			//创建模型显示对象
//			var box3D:MeshSprite3D=new MeshSprite3D(boxMesh);
//			scene.addChild(box3D);
		}
		
		private function mouseLeave():void
		{
			// TODO Auto Generated method stub
//			trace("mouseLeave");
			/*Laya.timer.clear(this,freeHandler);
			Laya.timer.once(4*1000,this,freeHandler);*/
		}
		/**
		 *自由旋转   
		 * 
		 */		
		private function freeHandler():void
		{
			// TODO Auto Generated method stub
			camera.transform.rotate(new Vector3(0,180,0),true,false);
		}
		private var r:Number=0;
		private var speed:Number=0.01;
		private function rotate():void
		{
			// TODO Auto Generated method stub
			camera.transform.rotate(new Vector3(0,speed,0),true,false);
//			trace("ss"+camera.transform.localRotation.y);
			r+=speed;
			/*if(r>30) speed*=-1;
			if(r<-30) speed*=-1;*/
			
		}
		public function onDispose():void{
			trace("dispose");
			script._destroy();
			camera.removeAllComponent();
			Laya.stage.offAll();
			if(Laya.stage.hasListener(Event.MOUSE_DOWN)){
				trace("移除失败");
			}
			Laya.timer.clear(this,rotate);
		}
	}
}