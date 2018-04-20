/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class progressUI extends View {
		public var _prog:ProgressBar;
		public var _tip:Label;
		public var _txtPro:Label;

		public static var uiView:Object ={"type":"View","props":{"width":600,"height":400},"child":[{"type":"ProgressBar","props":{"y":236,"x":181,"width":239,"var":"_prog","skin":"comp/progress.png","height":14}},{"type":"Label","props":{"y":274,"x":259,"var":"_tip","text":"资源加载中……","font":"16","color":"#dd2521","align":"center"}},{"type":"Label","props":{"y":219,"x":285,"var":"_txtPro","text":"label","color":"#ff0400"}},{"type":"Image","props":{"y":178,"x":430,"width":63,"skin":"comp/image.png","height":105}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);
		}
	}
}