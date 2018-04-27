/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 
	import script.ScaleButton;

	public class MokuaiUI extends View {
		public var btn_back:Button;
		public var btn_setting:Button;
		public var btn_exit:Button;
		public var box1:Box;
		public var btn1:ScaleButton;
		public var box2:Box;
		public var btn2:ScaleButton;
		public var box3:Box;
		public var btn3:ScaleButton;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"menu-assets/bg.png"}},{"type":"Image","props":{"visible":false,"top":0,"skin":"menu-assets/img_home.png","name":"ck","left":0}},{"type":"Box","props":{"y":0,"x":0,"name":"box_top","width":1920,"top":0,"right":0,"left":0,"height":98},"child":[{"type":"Image","props":{"top":0,"skin":"menu-assets/header.png","right":0,"name":"headbg","left":0}},{"type":"Image","props":{"y":16,"x":34,"skin":"menu-assets/logo.png","name":"logo"}},{"type":"Button","props":{"visible":true,"var":"btn_back","top":20,"stateNum":2,"skin":"menu-assets/btn_return.png","right":140}},{"type":"Button","props":{"visible":true,"var":"btn_setting","top":20,"stateNum":2,"skin":"menu-assets/btn_system.png","right":230}},{"type":"Button","props":{"visible":true,"var":"btn_exit","top":20,"stateNum":2,"skin":"menu-assets/btn_exit.png","right":50}}]},{"type":"Box","props":{"y":0,"x":0,"width":1920,"right":0,"name":"box_foot","left":0,"height":50,"bottom":0},"child":[{"type":"Label","props":{"right":50,"width":411,"valign":"middle","text":"版权所有·河南恒茂创远科技股份有限公司","rotation":0,"padding":"0","mouseThrough":true,"mouseEnabled":false,"height":34,"fontSize":22,"font":"Microsoft YaHei","color":"#ffffff","cacheAsBitmap":true,"bottom":10,"align":"center"}},{"type":"Image","props":{"sizeGrid":"4,5,3,4","y":0,"x":0,"width":1920,"skin":"menu-assets/img_footbg.png","right":0,"name":"foot","left":0,"height":50,"bottom":0}}]},{"type":"Box","props":{"var":"box1","left":300,"centerY":0},"child":[{"type":"Label","props":{"y":276,"x":57,"width":188,"text":"教学演示","strokeColor":"#e0e0e0","stroke":1,"height":60,"fontSize":46,"font":"Microsoft YaHei","color":"#ffffff","cacheAsBitmap":true,"bold":false}},{"type":"Button","props":{"y":0,"x":0,"var":"btn1","stateNum":2,"skin":"menu-assets/btn_teach.png","scaleNum":1,"runtime":"script.ScaleButton"}}]},{"type":"Box","props":{"x":809,"var":"box2","centerY":0,"centerX":0},"child":[{"type":"Button","props":{"var":"btn2","stateNum":2,"skin":"menu-assets/btn_exam.png","scaleNum":1,"labelSize":20,"runtime":"script.ScaleButton"}},{"type":"Label","props":{"y":276,"x":58,"width":188,"text":"实验考核","strokeColor":"#e0e0e0","stroke":1,"height":60,"fontSize":46,"font":"Microsoft YaHei","color":"#ffffff","cacheAsBitmap":true,"bold":false}}]},{"type":"Box","props":{"var":"box3","right":300,"centerY":0},"child":[{"type":"Button","props":{"y":0,"x":0,"var":"btn3","stateNum":2,"skin":"menu-assets/btn_practice.png","scaleNum":1,"labelSize":20,"runtime":"script.ScaleButton"}},{"type":"Label","props":{"y":276,"x":57,"width":188,"text":"练习实验","strokeColor":"#e0e0e0","stroke":1,"height":60,"fontSize":46,"font":"Microsoft YaHei","color":"#ffffff","cacheAsBitmap":true,"bold":false}}]}]};
		override protected function createChildren():void {
			View.regComponent("script.ScaleButton",ScaleButton);
			super.createChildren();
			createView(uiView);

		}

	}
}