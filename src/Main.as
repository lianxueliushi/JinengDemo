package {
	import com.eventdispatcher.NGEventDispatcher;
	import com.pages.Page;
	import com.pages.Page1Main;
	import com.pages.Page1_1;
	import com.pages.Page1_2;
	import com.pages.Page1_3;
	
	import laya.display.Sprite;
	import laya.display.Stage;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	import laya.webgl.WebGL;

	public class Main {
		private var oldpage:Sprite;
		public function Main() {
			//初始化引擎
			Laya.init(1280,720,WebGL);
			Laya.stage.scaleMode=Stage.SCALE_FULL;
			
			Laya.stage.bgColor='#ffffff';
			NGEventDispatcher.getInstance().on(NGEventDispatcher.SHOW_PAGE,this,addPage);
			Laya.loader.load('res/atlas/comp.atlas',Handler.create(this,loadReady));
		}
		
		private function loadReady():void
		{
			// TODO Auto Generated method stub
			addPage('page1_3');
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
					newpage=new Page1_3();
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