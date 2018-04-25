/**Created by the LayaAirIDE,do not modify.*/
package ui.p3_1 {
	import laya.ui.*;
	import laya.display.*; 

	public class ui3_1UI extends View {

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"Image","props":{"y":55,"x":208,"width":841,"skin":"comp/sijiaochaotian.png","height":631}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}