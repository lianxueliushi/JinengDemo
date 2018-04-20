/**Created by the LayaAirIDE,do not modify.*/
package ui.ui {
	import laya.ui.*;
	import laya.display.*; 

	public class UimainUI extends View {
		public var bg:Sprite;
		public var btnStart:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"Sprite","props":{"y":0,"x":0,"width":1280,"var":"bg","height":720}},{"type":"Button","props":{"y":597,"x":590,"width":100,"var":"btnStart","skin":"comp/button.png","label":"开始实验","height":40,"sizeGrid":"4,8,6,7"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}