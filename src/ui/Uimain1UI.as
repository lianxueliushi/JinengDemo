/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class Uimain1UI extends View {
		public var bg:Sprite;
		public var btnStart:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Sprite","props":{"y":0,"x":0,"width":1920,"var":"bg","height":1080}},{"type":"Button","props":{"y":972,"x":910,"width":100,"var":"btnStart","skin":"comp/button.png","label":"开始实验","height":40,"sizeGrid":"4,8,6,7"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}