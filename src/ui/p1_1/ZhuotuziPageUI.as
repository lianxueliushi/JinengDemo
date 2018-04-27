/**Created by the LayaAirIDE,do not modify.*/
package ui.p1_1 {
	import laya.ui.*;
	import laya.display.*; 

	public class ZhuotuziPageUI extends View {
		public var box_ani:Box;
		public var ani_dzc:Animation;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"bg1.jpg"}},{"type":"Box","props":{"width":613,"var":"box_ani","left":250,"height":376,"bottom":150,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Animation","props":{"y":174,"x":308,"var":"ani_dzc","source":"p1_1/ani_dzc.ani","scaleY":2,"scaleX":2}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}