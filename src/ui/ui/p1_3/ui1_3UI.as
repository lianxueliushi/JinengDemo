/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.p1_3 {
	import laya.ui.*;
	import laya.display.*; 

	public class ui1_3UI extends View {
		public var tuzi:Sprite;
		public var clickRect:Sprite;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"Sprite","props":{"y":128,"x":385,"var":"tuzi"},"child":[{"type":"Image","props":{"skin":"comp/tuzi-er.png"}},{"type":"Sprite","props":{"y":18,"x":175,"width":100,"var":"clickRect","height":120}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}