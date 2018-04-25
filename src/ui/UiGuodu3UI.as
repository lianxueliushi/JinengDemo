/**Created by the LayaAirIDE,do not modify.*/
package ui {
	import laya.ui.*;
	import laya.display.*; 
	import script.GuoduScript;

	public class UiGuodu3UI extends View {
		public var btnStart:Button;
		public var lab:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"title":"家兔机能基础实验--麻醉","height":1080,"eventName":"page1_1","evName":"page1_1"},"child":[{"type":"Button","props":{"x":960,"width":152,"var":"btnStart","skin":"comp/button.png","name":"btnStart","labelSize":20,"label":"开始","height":50,"bottom":100,"anchorY":0.5,"anchorX":0.5,"sizeGrid":"4,8,6,7"}},{"type":"Label","props":{"y":540,"x":960,"width":1047,"var":"lab","valign":"middle","text":"测试信息","name":"lab","height":63,"fontSize":36,"color":"#ffffff","anchorY":0.5,"anchorX":0.5,"alpha":1,"align":"center","sizeGrid":"3,7,5,6"}},{"type":"Script","props":{"title":"家兔机能基础实验--颈部手术","eveString":"page3_1","runtime":"script.GuoduScript"}}]};
		override protected function createChildren():void {
			View.regComponent("script.GuoduScript",GuoduScript);
			super.createChildren();
			createView(uiView);

		}

	}
}