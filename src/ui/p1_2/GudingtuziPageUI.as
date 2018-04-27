/**Created by the LayaAirIDE,do not modify.*/
package ui.p1_2 {
	import laya.ui.*;
	import laya.display.*; 

	public class GudingtuziPageUI extends View {
		public var box1:Box;
		public var box_tuzi:Box;
		public var progbar:ProgressBar;
		public var box_hezi:Box;
		public var box:Animation;
		public var btnClose:Sprite;
		public var box2:Box;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Box","props":{"var":"box1"},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"bg1.jpg"}},{"type":"Box","props":{"y":651,"x":539,"width":100,"var":"box_tuzi","height":100}},{"type":"ProgressBar","props":{"y":1036,"x":1614,"width":276,"var":"progbar","skin":"comp/progress.png","skewY":0,"rotation":0,"right":30,"height":14,"bottom":30,"anchorY":0,"anchorX":0,"sizeGrid":"4,5,3,3"}},{"type":"Label","props":{"y":1020,"x":1794,"text":"盒子开启动画模拟","rotation":0,"right":30,"color":"#000000","bottom":48}},{"type":"Box","props":{"y":673,"x":1234,"width":491,"var":"box_hezi","scaleY":1.5,"scaleX":1.5,"height":310,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Animation","props":{"y":101,"x":87,"width":50,"var":"box","source":"p1_2/box.ani","pivotY":39,"pivotX":-275,"height":50}}]},{"type":"Sprite","props":{"y":603,"x":1594,"width":238,"var":"btnClose","height":162,"alpha":0},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":237,"lineWidth":1,"height":163,"fillColor":"#ff0000"}}]}]},{"type":"Box","props":{"y":0,"x":0,"visible":false,"var":"box2"},"child":[{"type":"Image","props":{"skin":"bg1.jpg"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}