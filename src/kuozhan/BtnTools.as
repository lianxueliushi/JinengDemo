package kuozhan
{
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	public class BtnTools extends Box
	{
		private var btnList:Array;
		private var show:Boolean=false;
		private var btn_library:Button;
		private var btn_box:Button;
		private var btn_tool:Button;
		private var btn_medch:Button;
		private var btn_test:Button;
		private var btn_bar:Button;
		public function BtnTools()
		{
			super();
			Laya.timer.frameOnce(5,this,ready);
		}
		
		private function ready():void
		{
			// TODO Auto Generated method stub
			btn_bar=this.getChildByName("bar") as Button;
			btn_library=this.getChildByName("library") as Button;
			btn_box=this.getChildByName("box") as Button;
			btn_tool=this.getChildByName("tool") as Button;
			btn_medch=this.getChildByName("medch") as Button;
			btn_test=this.getChildByName("test") as Button;
			btnList=[btn_library,btn_box,btn_tool,btn_medch,btn_test];
			for (var i:int = 0; i < btnList.length; i++) 
			{
				trace(btnList[i]);
			}
			
			initBoxbtns();
		}
		/**
		 *初始化盒子 
		 * 
		 */		
		private function initBoxbtns():void
		{
			// TODO Auto Generated method stub
			btn_bar.on(Event.CLICK,this,onBar);
			for (var i:int = 0; i < btnList.length; i++) 
			{
				var btn:Button=btnList[i];
				btn.on(Event.CLICK,this,onBtnClick);
			}
			hideBtns();
		}
		
		private function onBtnClick(e:Event):void
		{
			// TODO Auto Generated method stub
			hideBtns();
			event(e.currentTarget.name);
		}
		
		private function hideBtns():void
		{
			// TODO Auto Generated method stub
			for (var i:int = 0; i < btnList.length; i++) 
			{
				var btn:Button=btnList[i];
				Tween.to(btn,{x:btn_bar.x,y:btn_bar.y,alpha:0},300,Ease.circInOut);
			}
			show=false;
		}
		
		private function onBar():void
		{
			// TODO Auto Generated method stub
			if(show){
				hideBtns();
				Tween.to(btn_bar,{scaleX:1,scaleY:1},300);
			}
			else {
				showBtns();
				Tween.to(btn_bar,{scaleX:0.8,scaleY:0.8},300);
			}
		}
		
		private function showBtns():void
		{
			// TODO Auto Generated method stub
			var r:Number=130;
			for (var i:int = 0; i < btnList.length; i++) 
			{
				var btn:Button=btnList[i];
				Tween.to(btn,{scaleX:1,scaleY:1,x:btn_bar.x-r*Math.cos(i*Math.PI/4-Math.PI/2),y:btn_bar.y+r*Math.sin(i*Math.PI/4-Math.PI/2),alpha:1},200,Ease.circInOut);
			}
			show=true;
		}
	}
}