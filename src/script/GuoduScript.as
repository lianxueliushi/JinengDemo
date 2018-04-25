package script
{
	import com.eventdispatcher.NGEventDispatcher;
	
	import laya.events.Event;
	import laya.ui.Button;
	import laya.ui.Label;
	import laya.ui.View;
	import laya.utils.Ease;
	import laya.utils.Tween;

	public class GuoduScript
	{
		private var view:View;
		public var title:String;
		public var eveString:String;
		public function GuoduScript()
		{
		}
		/**
		 *设置owner函数，可以直接获取到添加附加脚本的组件实例 
		 * @param value
		 * 
		 */        
		public function set owner(value:*):void{
			view = value;
			//自定义的脚本会有时序问题，所以在此添加一个延时
			view.frameOnce(2,this,onLoaded);
		}
		
		private function onLoaded():void
		{
			// TODO Auto Generated method stub
			var lab:Label=view.getChildByName("lab") as Label;
			lab.text=title;
			
			var btnStart:Button=view.getChildByName("btnStart") as Button;
			btnStart.on(Event.CLICK,this,onClick);
			
			btnStart.alpha=0;
			btnStart.bottom=0;
			lab.pos(Laya.stage.width>>1,Laya.stage.height>>1);
			Tween.from(lab,{scaleX:0.2,scaleY:0.2,y:lab.y+100,alpha:0},1000,Ease.circInOut);
			Tween.to(btnStart,{y:btnStart.y-200,alpha:1},1000,Ease.circInOut,null,600);
		}
		
		private function onClick():void
		{
			// TODO Auto Generated method stub
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,eveString);
		}
		
	}
}