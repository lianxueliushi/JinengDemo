/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 
	import script.ScaleButton;

	public class LoginUI extends View {
		public var box_login:Box;
		public var ipt_userName:TextInput;
		public var ipt_userPwd:TextInput;
		public var btn_login:ScaleButton;
		public var lab_msg:Label;
		public var btn_back:Button;
		public var btn_setting:Button;
		public var btn_exit:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"menu-assets/bg.jpg","name":"bg"}},{"type":"Image","props":{"y":0,"x":0,"visible":false,"skin":"login-assets/login.png","name":"ck"}},{"type":"Box","props":{"y":0,"x":0,"width":1920,"right":0,"name":"box_foot","left":0,"height":50,"bottom":0},"child":[{"type":"Label","props":{"width":411,"valign":"middle","text":"版权所有·河南恒茂创远科技股份有限公司","rotation":0,"right":50,"padding":"0","mouseThrough":true,"mouseEnabled":false,"height":34,"fontSize":22,"font":"Microsoft YaHei","color":"#ffffff","cacheAsBitmap":true,"bottom":10,"align":"center"}},{"type":"Image","props":{"sizeGrid":"4,5,3,4","y":0,"x":0,"width":1920,"skin":"menu-assets/img_footbg.png","right":0,"name":"foot","left":0,"height":50,"bottom":0}}]},{"type":"Box","props":{"width":654,"var":"box_login","height":577,"centerY":0,"centerX":0,"anchorY":0.5,"anchorX":0.5},"child":[{"type":"Image","props":{"skin":"login-assets/login_box.png","name":"loginbg","centerY":0,"centerX":0}},{"type":"TextInput","props":{"width":499,"var":"ipt_userName","valign":"middle","type":"text","top":140,"skin":"menu-assets/input_txt.png","padding":"0,0,0,20","height":80,"fontSize":24,"font":"Microsoft YaHei","color":"#004362","centerX":0,"anchorY":0.5,"anchorX":0.5,"sizeGrid":"15,11,15,10"}},{"type":"TextInput","props":{"width":499,"var":"ipt_userPwd","valign":"middle","type":"password","top":260,"skin":"menu-assets/input_txt.png","padding":"0,0,0,20","height":80,"fontSize":24,"font":"Microsoft YaHei","color":"#004362","centerX":0,"anchorY":0.5,"anchorX":0.5,"sizeGrid":"15,11,15,10"}},{"type":"Button","props":{"width":503,"var":"btn_login","stateNum":2,"skin":"menu-assets/btn_login.png","sizeGrid":"10,14,18,13","scaleNum":1,"labelSize":40,"labelPadding":"0,0,10,0","labelFont":"Microsoft YaHei","labelColors":"#ffffff,#ffffff","labelBold":true,"label":"登  陆","height":86,"clicksoundurl":"sound/弹出音效2.wav","centerX":0,"bottom":110,"runtime":"script.ScaleButton"}},{"type":"Label","props":{"y":475,"width":483,"visible":false,"var":"lab_msg","text":"提示信息","height":24,"fontSize":20,"color":"#ffe788","centerX":3,"align":"center"}}]},{"type":"Box","props":{"name":"box_top","y":0,"x":0,"width":1920,"top":0,"right":0,"left":0,"height":98},"child":[{"type":"Image","props":{"top":0,"skin":"menu-assets/header.png","right":0,"name":"headbg","left":0}},{"type":"Image","props":{"y":16,"x":34,"skin":"menu-assets/logo.png","name":"logo"}},{"type":"Button","props":{"visible":true,"var":"btn_back","top":20,"stateNum":2,"skin":"menu-assets/btn_return.png","right":140}},{"type":"Button","props":{"visible":true,"var":"btn_setting","top":20,"stateNum":2,"skin":"menu-assets/btn_system.png","right":230}},{"type":"Button","props":{"visible":true,"var":"btn_exit","top":20,"stateNum":2,"skin":"menu-assets/btn_exit.png","right":50}}]}]};
		override protected function createChildren():void {
			View.regComponent("script.ScaleButton",ScaleButton);
			super.createChildren();
			createView(uiView);

		}

	}
}