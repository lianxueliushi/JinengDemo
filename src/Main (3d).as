package {
	import com.components.CameraMoveScript;
	import com.eventdispatcher.NGEventDispatcher;
	import com.pages.Page;
	import com.pages.Page1Main;
	import com.pages.Page1_1;
	import com.pages.Page1_2;
	import com.pages.Page2_1;
	
	import laya.d3.component.Component3D;
	import laya.d3.core.BaseCamera;
	import laya.d3.core.Camera;
	import laya.d3.core.Sprite3D;
	import laya.d3.core.light.DirectionLight;
	import laya.d3.core.scene.Scene;
	import laya.d3.math.Vector3;
	import laya.d3.resource.TextureCube;
	import laya.d3.resource.models.SkyBox;
	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.net.Loader;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	import laya.webgl.WebGL;
	
	import view.ProgressView;

	public class Main3d {
		private var oldpage:Sprite;
		private var camera:Camera;
		public static var cameraScript:Component3D;
		private var progress:ProgressView;
		private var pro:Number;
		private var carChild:Sprite3D;
		public function Main() {
			//初始化引擎
			Laya3D.init(1280,720,WebGL);
			Laya.stage.scaleMode=Stage.SCALE_FULL;
			Laya.stage.screenMode=Stage.SCREEN_NONE;
			
			Laya.stage.bgColor='#ffffff';
			NGEventDispatcher.getInstance().on(NGEventDispatcher.SHOW_PAGE,this,addPage);
			
			Laya.loader.load('res/atlas/comp.atlas', Handler.create(this, LoadedCom));
		}
		
		private function LoadedCom():void
		{
			// TODO Auto Generated method stub
			progress= new ProgressView();
			progress.pivot(progress.width/2,progress.height/2);
			progress.pos(Laya.stage.width/2,Laya.stage.height/2);
			Laya.stage.addChild(progress);
			//加载3D资源
			Laya.loader.create([{url:'changjing/zhanshichangjing.ls'},{url:'car0/zc.lh'}],Handler.create(this,on3DComplete),Handler.create(this,onLoading));
		}
		
		private function onLoading():void
		{
			// TODO Auto Generated method stub
			trace('loading:'+pro);
			if (pro < 1){
				progress._tip.text = '请稍后……';
				progress._txtPro.text=Math.round(pro*100)+'%';
				
				progress._prog.value = pro;
				
			}
			else{
				progress._tip.text = '加载完毕';
				progress.removeSelf();
			}
		}
		
		private function on3DComplete():void
		{
			// TODO Auto Generated method stub
			var scene:Scene=Loader.getRes('changjing/zhanshichangjing.ls');
			// var scene:Scene=new Scene();
			//一定要加环境光，才能亮
			scene.ambientColor=new Vector3(0.6,.6,.6);
			
			Laya.stage.addChild(scene);
			Laya.stage.setChildIndex(scene,0);
			
			
			camera=new Camera();
			camera.fieldOfView=55;
			
			
			var sky:SkyBox=new SkyBox();
			sky.textureCube=TextureCube.load('skyBox1/skyCube.ltc');
			camera.clearFlag=BaseCamera.CLEARFLAG_SKY;
			camera.sky=sky;
			
			var car:Sprite3D=scene.addChild(Loader.getRes('car0/zc.lh'))  as Sprite3D;
			car.transform.position=new Vector3(35.6,-1.62,-39.5);
			
			carChild=car.addChild(new Sprite3D()) as Sprite3D;
			carChild.addChild(camera);
			cameraScript=carChild.addComponent(CameraMoveScript);
			
			
			camera.transform.position=new Vector3(29,1,-39.5);
			camera.transform.lookAt(car.transform.position,new Vector3(0,5,0));
			
			var dLight:DirectionLight=scene.addChild(new DirectionLight()) as DirectionLight;
			dLight.transform.translate(new Vector3(-34,40,-65));
			dLight.transform.rotate(new Vector3(55,-30,0));
			dLight.intensity=0.5;
			
			Laya.loader.load('res/atlas/comp.atlas',Handler.create(this,loadReady));
		}
		
		private function loadReady():void
		{
			// TODO Auto Generated method stub
			addPage('page1');
		}
		/**
		 *切换新场景 s
		 * @param $pageName 场景名称
		 * 
		 */		
		private function addPage($pageName:String):void
		{
			// TODO Auto Generated method stub
			if(oldpage) Tween.to(oldpage,{alpha:0},300,Ease.circIn,Handler.create(this,onDestory,[oldpage]));
			var newpage:Sprite;
			switch($pageName)
			{
				case "page1":{
					newpage=new Page1Main();
					break;
				}
				case 'page1_1':{
					newpage=new Page1_1();
					break;
				}
				case 'page1_2':
				{
					newpage=new Page1_2();
					break;
				}
				case 'page1_3':
				{
					newpage=new Page2_1();
					break;
				}
				default:
				{
					break;
				}
			}
			if(newpage){
				Laya.stage.addChild(newpage);
				Tween.from(newpage,{alpha:0},300,Ease.circInOut);
				oldpage=newpage;
			}
		}
		/**
		 *销毁对象及子对象 
		 * @param target
		 * 
		 */		
		private function onDestory(target:Page):void
		{
			target.onDispose();
		}
		
	}
}