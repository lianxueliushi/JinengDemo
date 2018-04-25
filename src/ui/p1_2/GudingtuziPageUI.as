/**Created by the LayaAirIDE,do not modify.*/
package ui.p1_2 {
	import laya.ui.*;
	import laya.display.*; 

	public class GudingtuziPageUI extends View {
		public var progbar:ProgressBar;
		public var box:Animation;
		public var btn:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"ProgressBar","props":{"width":276,"var":"progbar","skin":"comp/progress.png","skewY":0,"rotation":0,"right":30,"height":14,"bottom":30,"anchorY":0,"anchorX":0,"sizeGrid":"4,5,3,3"}},{"type":"Label","props":{"text":"盒子开启动画模拟","rotation":0,"right":30,"color":"#000000","bottom":48}},{"type":"Animation","props":{"y":537,"x":966,"var":"box","source":"p1_2/box.ani"}},{"type":"Sprite","props":{"y":541,"x":1259,"width":150,"var":"btn","height":90,"alpha":0.1},"child":[{"type":"Rect","props":{"width":150,"lineWidth":1,"height":89,"fillColor":"#ff0000"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}