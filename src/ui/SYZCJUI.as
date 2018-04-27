/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 

	public class SYZCJUI extends View {
		public var btn_back:Button;
		public var btn_setting:Button;
		public var btn_exit:Button;
		public var btn_tool:Button;
		public var btn_test:Button;
		public var btn_library:Button;
		public var btn_medch:Button;
		public var btn_box:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Image","props":{"top":0,"skin":"bg1.jpg","right":0,"name":"bg","left":0,"bottom":0}},{"type":"Image","props":{"y":0,"x":0,"visible":false,"skin":"scene-assets/scene.png","name":"ck"}},{"type":"Box","props":{"y":163,"x":484,"width":1920,"top":0,"right":0,"name":"box_top","left":0,"height":98},"child":[{"type":"Button","props":{"y":23,"x":1613,"stateNum":1,"skin":"scene-assets/btn_user.png"}},{"type":"Image","props":{"top":0,"skin":"menu-assets/header.png","right":0,"name":"headbg","left":0}},{"type":"Image","props":{"y":16,"x":34,"skin":"menu-assets/logo.png","name":"logo"}},{"type":"Button","props":{"visible":true,"var":"btn_back","top":21,"stateNum":2,"skin":"menu-assets/btn_return.png","right":98}},{"type":"Button","props":{"visible":true,"var":"btn_setting","top":21,"stateNum":2,"skin":"menu-assets/btn_system.png","right":173}},{"type":"Button","props":{"visible":true,"var":"btn_exit","top":21,"stateNum":2,"skin":"menu-assets/btn_exit.png","right":22}}]},{"type":"Button","props":{"y":597,"x":1661,"var":"btn_tool","stateNum":2,"skin":"scene-assets/btn_tool.png","label":"label"}},{"type":"Button","props":{"y":730,"x":1820,"var":"btn_test","stateNum":2,"skin":"scene-assets/btn_test.png","label":"label"}},{"type":"Button","props":{"y":898,"x":1402,"stateNum":1,"skin":"scene-assets/btn_closetip.png"}},{"type":"Button","props":{"y":456,"x":1819,"var":"btn_library","stateNum":2,"skin":"scene-assets/btn_library.png"}},{"type":"Button","props":{"y":700,"x":1711,"var":"btn_medch","stateNum":2,"skin":"scene-assets/btn_medch.png","label":"label"}},{"type":"Image","props":{"skin":"scene-assets/li.png","left":50,"bottom":0}},{"type":"Image","props":{"x":422,"skin":"scene-assets/medchine_box.png","bottom":-5}},{"type":"Image","props":{"y":157,"x":1377,"skin":"scene-assets/msg_handle.png"}},{"type":"Box","props":{"y":117,"x":14},"child":[{"type":"Image","props":{"skin":"scene-assets/msg_test.png"}},{"type":"Image","props":{"y":57,"x":568,"skin":"scene-assets/msg_close.png"}}]},{"type":"Image","props":{"skin":"scene-assets/time_bg.png","left":0,"bottom":0}},{"type":"Image","props":{"skin":"scene-assets/time_box.png","left":15,"bottom":5}},{"type":"Button","props":{"y":962,"x":44,"width":13,"stateNum":2,"skin":"scene-assets/btn_timetip.png","height":15}},{"type":"Button","props":{"y":493,"x":1712,"var":"btn_box","stateNum":2,"skin":"scene-assets/btn_box.png","label":"label"}},{"type":"Button","props":{"y":568,"x":1782,"stateNum":1,"skin":"scene-assets/btn_current_handle.png"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}