package {
	import com.eventdispatcher.NGEventDispatcher;
	import com.pages.Page1Main;
	import com.pages.Page1_1;
	import com.pages.Page1_2;
	import com.pages.Page2Main;
	import com.pages.Page2_1;
	import com.pages.PageMain;
	
	import laya.ani.swf.MovieClip;
	import laya.device.motion.AccelerationInfo;
	import laya.display.Animation;
	import laya.display.Node;
	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.events.Event;
	import laya.ui.Label;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Stat;
	import laya.utils.Tween;
	import laya.webgl.WebGL;
	import com.pages.Page3Main;

	public class Main {
		private var oldpage:Sprite;
		/**场景中通用的提示信息***/
		public static var mainTip:Label;
		public function Main() {
			//初始化引擎
			Laya3D.init(1280,720,WebGL);
			Laya.stage.frameRate='mouse';
			Stat.show();
//			Laya.stage.scaleMode=Stage.SCALE_SHOWALL;
			Laya.stage.alignH=Stage.ALIGN_CENTER;
			Laya.stage.alignV=Stage.ALIGN_MIDDLE;
			Laya.stage.bgColor='#ffffff';
			//添加页面切换侦听
			NGEventDispatcher.getInstance().on(NGEventDispatcher.SHOW_PAGE,this,addPage);
			//加载资源
			Laya.loader.load(['res/atlas/comp.atlas','res/atlas/box.atlas'],Handler.create(this,loadReady));
		}
		
		private function loadReady():void
		{
			// TODO Auto Generated method stub
			
//			var db:DBControl=new DBControl();
			addPage('main');
			mainTip||=new Label();
			mainTip.width=Laya.stage.width*0.6;
			mainTip.height=40;
			mainTip.left=0; 
			mainTip.top=-100; 
			mainTip.alpha=0;
			mainTip.fontSize=20;
			mainTip.color='#ff0000';
			mainTip.bgColor='#ffffff';
			mainTip.align="center";
			mainTip.valign='middle';
			Laya.stage.addChild(mainTip);
		}
		/**
		 * 弹出操作中的提示信息
		 * @param $mes 要显示的信息
		 * 
		 */		
		public static function showTip($mes:String,$autoHide:Boolean=false,$time:int=2000):void{
			mainTip.changeText($mes);
			mainTip.y=0;
			mainTip.alpha=1;
			Tween.from(mainTip,{y:-100,alpha:0},600,Ease.circInOut);
			Laya.stage.setChildIndex(mainTip,Laya.stage.numChildren-1);
			if($autoHide) Laya.timer.once($time,Main,hideTip);
		}
		/**
		 *隐藏提示信息 
		 * 
		 */		
		public static function hideTip():void{
			Tween.to(mainTip,{y:-100,alpha:0},600,Ease.circInOut);
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
				case "main":{
					newpage=new PageMain();
					break ;
				}
				case "page1":{
					newpage=new Page1Main();
					break;
				}
				case "page2":{
					newpage=new Page2Main();
					break;
				}
				case "page3":{
					newpage=new Page3Main();
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
				case 'page2_1':
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
				Tween.from(newpage,{alpha:0},600,Ease.circInOut);
				oldpage=newpage;
			}
		}
		/**
		 *销毁对象及子对象 
		 * @param target
		 * 
		 */		
		private function onDestory(target:Node):void
		{
			target.destroy();
		}
		
	}
}