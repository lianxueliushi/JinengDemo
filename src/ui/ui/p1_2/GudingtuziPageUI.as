/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.p1_2 {
	import laya.ui.*;
	import laya.display.*; 

	public class GudingtuziPageUI extends View {
		public var progbar:ProgressBar;
		public var tip:Label;
		public var box:Animation;
		public var btn:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"ProgressBar","props":{"y":662,"x":1166,"width":276,"var":"progbar","skin":"comp/progress.png","skewY":0,"rotation":-90,"height":14}},{"type":"Label","props":{"y":648,"x":446,"width":426,"var":"tip","valign":"middle","text":"盒子开启中……","height":34,"fontSize":20,"color":"#e30804","bgColor":"#eeeaea","align":"center"}},{"type":"Label","props":{"y":563,"x":1150,"text":"盒子开启动画模拟","rotation":90}},{"type":"Animation","props":{"y":411,"x":641,"var":"box","source":"ui/p1_2/box.ani"}},{"type":"Sprite","props":{"y":252,"x":818,"width":150,"var":"btn","height":90,"alpha":0.2},"child":[{"type":"Rect","props":{"width":150,"lineWidth":1,"height":89,"fillColor":"#ff0000"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}