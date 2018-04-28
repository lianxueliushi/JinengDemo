/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 
	import kuozhan.BtnTools;
	import script.ScaleButton;

	public class SYZCJUI extends View {
		public var btn_back:Button;
		public var btn_setting:Button;
		public var btn_exit:Button;
		public var box_syyl:Box;
		public var img_syylbg:Image;
		public var btn_closeshiyanyuanli:Image;
		public var leftTip:Label;
		public var img_person:Image;
		public var box_timeline:Box;
		public var img_timeline:Image;
		public var img_timebg:Image;
		public var btn_time:Image;
		public var box_tips:Box;
		public var box_mask:Box;
		public var box_btns:BtnTools;
		public var btn_tool:Button;
		public var btn_test:Button;
		public var btn_library:Button;
		public var btn_medch:Button;
		public var btn_box:Button;
		public var btn_bar:ScaleButton;
		public var box_tools:Box;
		public var bg_tool:Image;
		public var btn_closetool:Button;
		public var _list:List;
		public var rightBox:Box;
		public var rightTip:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Box","props":{"y":163,"x":484,"width":1920,"top":0,"right":0,"name":"box_top","left":0,"height":98},"child":[{"type":"Image","props":{"top":0,"skin":"menu-assets/header.png","right":0,"name":"headbg","left":0}},{"type":"Image","props":{"y":16,"x":34,"skin":"menu-assets/logo.png","name":"logo"}},{"type":"Button","props":{"visible":true,"var":"btn_back","top":21,"stateNum":2,"skin":"menu-assets/btn_return.png","right":98}},{"type":"Button","props":{"visible":true,"var":"btn_setting","top":21,"stateNum":2,"skin":"menu-assets/btn_system.png","right":173}},{"type":"Button","props":{"visible":true,"var":"btn_exit","top":21,"stateNum":2,"skin":"menu-assets/btn_exit.png","right":22}},{"type":"Button","props":{"top":21,"stateNum":2,"skin":"scene-assets/btn_user.png","right":250,"x":10,"y":10}}]},{"type":"Box","props":{"x":66,"var":"box_syyl","top":111},"child":[{"type":"Image","props":{"var":"img_syylbg","skin":"scene-assets/msg_test.png"}},{"type":"Image","props":{"y":38,"x":493,"var":"btn_closeshiyanyuanli","skin":"scene-assets/msg_close.png"}},{"type":"Label","props":{"y":53,"x":78,"wordWrap":true,"width":368,"var":"leftTip","text":"label","height":72,"fontSize":24,"color":"#ffffff"}}]},{"type":"Image","props":{"y":97,"x":0,"var":"img_person","skin":"menu-assets/person.png"}},{"type":"Box","props":{"x":0,"width":266,"visible":false,"var":"box_timeline","height":827,"bottom":0},"child":[{"type":"Image","props":{"var":"img_timeline","skin":"scene-assets/li.png","left":43,"bottom":67}},{"type":"Image","props":{"var":"img_timebg","skin":"scene-assets/time_bg.png","left":0,"bottom":0}},{"type":"Image","props":{"var":"btn_time","skin":"scene-assets/time_box.png","left":15,"bottom":0}},{"type":"Box","props":{"y":690,"x":0,"width":266,"var":"box_tips","renderType":"render","height":44},"child":[{"type":"Button","props":{"y":18,"x":38,"stateNum":2,"skin":"scene-assets/btn_timetip.png"}},{"type":"Sprite","props":{"y":0,"x":0,"alpha":0},"child":[{"type":"Rect","props":{"width":264,"lineWidth":1,"height":44,"fillColor":"#ff0000"}}]},{"type":"Box","props":{"y":11,"x":38,"width":16,"var":"box_mask","renderType":"mask","height":26},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":17,"lineWidth":1,"height":26,"fillColor":"#ff0000"}}]},{"type":"Label","props":{"y":11,"width":206,"right":0,"left":60,"height":22,"fontSize":22,"color":"#ffffff"}}]}]},{"type":"Box","props":{"x":1659,"width":261,"var":"box_btns","right":0,"pivotY":0,"pivotX":0,"height":353,"bottom":0,"runtime":"kuozhan.BtnTools"},"child":[{"type":"Button","props":{"y":180,"x":42,"var":"btn_tool","stateNum":2,"skin":"scene-assets/btn_tool.png","name":"tool","anchorY":0.5,"anchorX":0.5}},{"type":"Button","props":{"y":310,"x":201,"var":"btn_test","stateNum":2,"skin":"scene-assets/btn_test.png","name":"test","anchorY":0.5,"anchorX":0.5}},{"type":"Button","props":{"y":39,"x":200,"var":"btn_library","stateNum":2,"skin":"scene-assets/btn_library.png","name":"library","anchorY":0.5,"anchorX":0.5}},{"type":"Button","props":{"y":283,"x":92,"var":"btn_medch","stateNum":2,"skin":"scene-assets/btn_medch.png","name":"medch","anchorY":0.5,"anchorX":0.5}},{"type":"Button","props":{"y":76,"x":93,"var":"btn_box","stateNum":2,"skin":"scene-assets/btn_box.png","name":"box","anchorY":0.5,"anchorX":0.5}},{"type":"Button","props":{"y":172,"x":171,"var":"btn_bar","stateNum":1,"skin":"scene-assets/btn_current_handle.png","scaleNum":1,"right":30,"name":"bar","clicksoundurl":"sound/提示窗口音效.WAV","anchorY":0.5,"anchorX":0.5,"runtime":"script.ScaleButton"},"child":[{"type":"Animation","props":{"y":59,"x":60,"source":"circle.ani","scaleY":0.5,"scaleX":0.5,"autoPlay":true}}]}]},{"type":"Box","props":{"width":1001,"var":"box_tools","height":176,"centerX":1,"bottom":-192,"alpha":1},"child":[{"type":"Image","props":{"x":0,"var":"bg_tool","top":0,"skin":"scene-assets/medchine_box.png"}},{"type":"Button","props":{"var":"btn_closetool","top":-20,"stateNum":1,"skin":"scene-assets/btn_closetip.png","right":-20}},{"type":"List","props":{"y":24,"x":163,"width":759,"var":"_list","spaceX":45,"height":139},"child":[{"type":"Box","props":{"y":0,"x":0,"width":114,"renderType":"render","height":141},"child":[{"type":"Button","props":{"y":57,"x":56,"width":112,"stateNum":2,"skin":"menu-assets/btn_homebtn.png","scaleNum":1.02,"name":"btn","height":114,"clicksoundurl":"sound/提示窗口音效.WAV","anchorY":0.5,"anchorX":0.5,"sizeGrid":"12,14,12,12","runtime":"script.ScaleButton"},"child":[{"type":"Image","props":{"width":94,"name":"img","height":83,"centerY":-4,"centerX":0}}]},{"type":"Label","props":{"y":109,"x":8,"width":99,"valign":"middle","name":"lab","height":24,"fontSize":16,"font":"Microsoft YaHei","color":"#ffffff","align":"center"}}]}]}]},{"type":"Box","props":{"y":101,"width":545,"var":"rightBox","right":0,"height":129},"child":[{"type":"Image","props":{"y":-4,"x":2,"skin":"scene-assets/msg_handle.png"}},{"type":"Label","props":{"y":6,"x":102,"wordWrap":true,"width":432,"var":"rightTip","text":"label","height":102,"fontSize":24,"color":"#ffffff"}}]}]};
		override protected function createChildren():void {
			View.regComponent("kuozhan.BtnTools",BtnTools);
			View.regComponent("script.ScaleButton",ScaleButton);
			super.createChildren();
			createView(uiView);

		}

	}
}