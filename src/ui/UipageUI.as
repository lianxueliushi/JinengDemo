/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class UipageUI extends View {
		public var bg:Sprite;
		public var btnStart:Button;
		public var title:Text;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"Sprite","props":{"y":0,"x":0,"width":1280,"var":"bg","height":720}},{"type":"Button","props":{"y":590,"x":564,"width":152,"var":"btnStart","skin":"comp/button.png","labelSize":20,"label":"开始","height":50,"sizeGrid":"4,8,6,7"}},{"type":"Text","props":{"y":341,"x":638,"width":330,"var":"title","text":"家兔机能基础实验--捉拿固定","pivotY":17,"pivotX":165,"height":34,"fontSize":26,"bold":true}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}