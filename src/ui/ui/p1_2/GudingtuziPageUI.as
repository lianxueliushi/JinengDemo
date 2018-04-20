/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.p1_2 {
	import laya.ui.*;
	import laya.display.*; 

	public class GudingtuziPageUI extends View {
		public var progbar:ProgressBar;
		public var box:Animation;
		public var btn:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"ProgressBar","props":{"y":662,"x":1166,"width":276,"var":"progbar","skin":"comp/progress.png","skewY":0,"rotation":-90,"height":14,"sizeGrid":"4,5,3,3"}},{"type":"Label","props":{"y":671,"x":1128,"text":"盒子开启动画模拟","rotation":0}},{"type":"Animation","props":{"y":500,"x":640,"var":"box","source":"ui/p1_2/box.ani"}},{"type":"Sprite","props":{"y":312,"x":834,"width":150,"var":"btn","height":90,"alpha":0.2},"child":[{"type":"Rect","props":{"width":150,"lineWidth":1,"height":89,"fillColor":"#ff0000"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}