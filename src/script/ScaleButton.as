package script
{
	import laya.events.Event;
	import laya.media.SoundManager;
	import laya.ui.Button;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	public class ScaleButton extends Button
	{
		public var scaleNum:Number;
		public var oversoundurl:String;
		public var clicksoundurl:String;
		public static const defoversound:String="sound/按钮点击音效1.mp3";
		public function ScaleButton(skin:String=null, label:String="")
		{
			super(skin, label);
			Laya.timer.frameOnce(2,this,onReady);
		}
		
		private function onReady():void
		{
			// TODO Auto Generated method stub
			this.on(Event.MOUSE_OVER,this,overHandler);
			this.on(Event.MOUSE_OUT,this,outHandler);
			this.on(Event.CLICK,this,onclick);
		}
		
		private function onclick():void
		{
			// TODO Auto Generated method stub
			if(clicksoundurl){
				SoundManager.playSound(clicksoundurl);
			}
		}
		
		private function outHandler():void
		{
			// TODO Auto Generated method stub
			Tween.to(this,{scaleX:1,scaleY:1},100,Ease.bounceInOut);
			if(oversoundurl){
				SoundManager.stopSound(oversoundurl);
			}
			else{
				SoundManager.stopSound(defoversound);
			}
			
		}
		
		private function overHandler():void
		{
			// TODO Auto Generated method stub
			Tween.to(this,{scaleX:scaleNum,scaleY:scaleNum},100,Ease.circInOut);
			if(oversoundurl) SoundManager.playSound(oversoundurl,1);
			else{
				SoundManager.playSound(defoversound,1);
			}
		}
	}
}