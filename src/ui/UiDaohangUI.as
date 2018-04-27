/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 
	import script.ScaleButton;

	public class UiDaohangUI extends View {
		public var box_bg:Box;
		public var btnStart:ScaleButton;
		public var nav1:List;
		public var nav2:List;
		public var btn_back:Button;
		public var btn_setting:Button;
		public var btn_exit:Button;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Box","props":{"y":0,"x":0,"var":"box_bg"},"child":[{"type":"Image","props":{"skin":"menu-assets/bg.png","name":"bg"}}]},{"type":"Image","props":{"y":233,"x":736,"width":502,"skin":"menu-assets/select_bg.png","name":"cbg","height":705,"sizeGrid":"12,11,18,10"}},{"type":"Image","props":{"y":0,"x":0,"visible":false,"skin":"menu-assets/menu.jpg","name":"ck"}},{"type":"Button","props":{"y":525,"x":1468,"width":301,"var":"btnStart","stateNum":2,"skin":"menu-assets/btn_in.png","sizeGrid":"12,15,22,14","scaleNum":1,"labelSize":34,"labelPadding":"0,0,7,0","labelFont":"Microsoft YaHei","labelColors":"#ffffff,#ffffff","labelBold":true,"label":"进入实验","height":98,"clicksoundurl":"sound/弹出音效2.wav","click":"startHandler","runtime":"script.ScaleButton"}},{"type":"List","props":{"y":282,"x":221,"width":321,"var":"nav1","spaceY":36,"height":614},"child":[{"type":"Box","props":{"y":0,"x":0,"width":258,"name":"render","height":92},"child":[{"type":"Button","props":{"y":48,"x":129,"width":259,"stateNum":2,"skin":"menu-assets/btn_menu.png","sizeGrid":"13,14,23,13","scaleNum":1.1,"name":"btn","labelSize":36,"labelPadding":"0,0,9,0","labelFont":"Microsoft YaHei","labelColors":"#0081d3,#ffffff","labelBold":true,"label":"生理学实验","height":97,"anchorY":0.5,"anchorX":0.5,"runtime":"script.ScaleButton"}}]}]},{"type":"List","props":{"y":282,"x":806,"width":433,"var":"nav2","vScrollBarSkin":"menu-assets/vscroll.png","spaceY":10,"height":611},"child":[{"type":"Box","props":{"y":0,"x":0,"width":358,"name":"render","height":92},"child":[{"type":"Button","props":{"y":0,"x":0,"width":358,"stateNum":2,"skin":"menu-assets/btn_menu.png","sizeGrid":"13,14,23,13","scaleNum":1,"name":"btn","labelSize":34,"labelPadding":"0,0,9,0","labelFont":"Microsoft YaHei","labelColors":"#0081d3,#ffffff","labelBold":true,"label":"生理学实验","height":95,"runtime":"script.ScaleButton"}}]}]},{"type":"Box","props":{"top":0,"name":"box_top","left":0,"y":0,"x":0,"width":1920,"right":0,"height":98},"child":[{"type":"Image","props":{"top":0,"skin":"menu-assets/header.png","right":0,"name":"headbg","left":0}},{"type":"Image","props":{"y":16,"x":34,"skin":"menu-assets/logo.png","name":"logo"}},{"type":"Button","props":{"visible":true,"var":"btn_back","top":21,"stateNum":2,"skin":"menu-assets/btn_return.png","right":98}},{"type":"Button","props":{"visible":true,"var":"btn_setting","top":21,"stateNum":2,"skin":"menu-assets/btn_system.png","right":173}},{"type":"Button","props":{"visible":true,"var":"btn_exit","top":21,"stateNum":2,"skin":"menu-assets/btn_exit.png","right":22}}]}]};
		override protected function createChildren():void {
			View.regComponent("script.ScaleButton",ScaleButton);
			super.createChildren();
			createView(uiView);

		}

	}
}