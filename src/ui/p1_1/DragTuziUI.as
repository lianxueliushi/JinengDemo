/**Created by the LayaAirIDE,do not modify.*/
package ui.p1_1 {
	import laya.ui.*;
	import laya.display.*; 

	public class DragTuziUI extends View {
		public var mc_tuzi:FrameAnimation;
		public var tuzi:Sprite;
		public var zhishi:Animation;
		public var mc_shou:Animation;
		public var clickRect:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"y":0,"x":0,"width":422,"height":322},"child":[{"type":"Sprite","props":{"y":0,"x":0,"width":528,"var":"tuzi","scaleY":0.8,"scaleX":0.8,"height":398},"child":[{"type":"Image","props":{"x":0,"width":528,"skin":"comp/tuzi-lefts.png","name":"tuzi","height":398},"compId":5},{"type":"Animation","props":{"y":106,"x":197,"var":"zhishi","source":"p1_2/zhishi.ani","name":"zhishi"}},{"type":"Animation","props":{"y":132,"x":254,"width":0,"var":"mc_shou","source":"p1_2/shou.ani","scaleY":0.9,"scaleX":0.9,"name":"shou","height":0}},{"type":"Sprite","props":{"y":141,"x":262,"width":100,"var":"clickRect","pivotY":35,"pivotX":49,"name":"mouserect","height":53,"alpha":0},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":100,"lineWidth":1,"height":64,"fillColor":"#ff0000"}}]}]}],"animations":[{"nodes":[{"target":5,"keyframes":{"x":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":5,"key":"x","index":0},{"value":0,"tweenMethod":"linearNone","tween":true,"target":5,"key":"x","index":1}],"skin":[{"value":"comp/tuzi-left.png","tweenMethod":"linearNone","tween":false,"target":5,"key":"skin","index":0},{"value":"comp/tuzi-lefts.png","tweenMethod":"linearNone","tween":false,"target":5,"key":"skin","index":1}]}}],"name":"mc_tuzi","id":1,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}