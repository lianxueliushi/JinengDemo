/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class UIShouYeUI extends View {
		public var btn1:Button;
		public var btn2:Button;
		public var btn3:Button;
		public var btn4:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Button","props":{"y":759,"x":563,"width":159,"var":"btn1","skin":"comp/button.png","labelSize":20,"label":"教学演示","height":52,"sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"y":759,"x":774,"width":159,"var":"btn2","skin":"comp/button.png","labelSize":20,"label":"实验考核","height":52,"sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"y":759,"x":984,"width":159,"var":"btn3","skin":"comp/button.png","labelSize":20,"label":"实验练习","height":52,"sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"y":759,"x":1195,"width":159,"var":"btn4","skin":"comp/button.png","labelSize":20,"label":"个人档案","height":52,"sizeGrid":"4,8,6,7"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}