/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

    import laya.utils.ClassUtils;
	public class Box1UI extends Box {
		public var btn_back:Button;
		public var btn_setting:Button;
		public var btn_exit:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Box","child":[{"type":"Image","props":{"top":0,"skin":"menu-assets/header.png","right":0,"name":"headbg","left":0}},{"type":"Image","props":{"y":16,"x":34,"skin":"menu-assets/logo.png","name":"logo"}},{"type":"Button","props":{"stateNum":2,"skin":"menu-assets/btn_return.png","var":"btn_back","visible":false,"top":20,"right":140}},{"type":"Button","props":{"stateNum":2,"skin":"menu-assets/btn_system.png","var":"btn_setting","visible":false,"right":230,"top":20}},{"type":"Button","props":{"stateNum":2,"skin":"menu-assets/btn_exit.png","var":"btn_exit","visible":false,"right":50,"top":20}}],"props":{"name":"box_top","top":0,"left":0,"right":0,"height":98,"x":0,"y":0}};
		public function Box1UI(){
		createUI(uiView);
		}
		private function createUI(uiData:Object):void
		{

			ClassUtils.createByJson(uiData, this, this);

		}

	}
}