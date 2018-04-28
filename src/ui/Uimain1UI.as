/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 
	import script.ScaleButton;

	public class Uimain1UI extends View {
		public var bg:Sprite;
		public var btnStart:ScaleButton;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Sprite","props":{"y":0,"x":0,"width":1920,"var":"bg","height":1080}},{"type":"Button","props":{"y":1000,"x":1800,"width":140,"var":"btnStart","stateNum":2,"skin":"menu-assets/btn_login.png","scaleNum":1.1,"right":50,"labelSize":22,"labelPadding":"0,0,7,0","labelFont":"Microsoft YaHei","label":"跳过","height":59,"clicksoundurl":"sound/提示窗口音效.WAV","bottom":50,"anchorY":0.5,"anchorX":0.5,"sizeGrid":"10,14,18,13","runtime":"script.ScaleButton"}}]};
		override protected function createChildren():void {
			View.regComponent("script.ScaleButton",ScaleButton);
			super.createChildren();
			createView(uiView);

		}

	}
}