/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.p1_3 {
	import laya.ui.*;
	import laya.display.*; 
	import laya.display.Text;

	public class ui_jisuanUI extends Dialog {
		public var rgroup:RadioGroup;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"Dialog","props":{"width":800,"height":600},"child":[{"type":"Image","props":{"y":0,"x":0,"width":799,"skin":"comp/bg.png","sizeGrid":"30,10,10,8","height":606}},{"type":"Text","props":{"y":134,"x":93,"wordWrap":true,"width":640,"text":"20%乌拉坦又叫氨基甲酸乙酯，家兔每公斤用量5ml,当前兔子重量3.6KG，请为兔子选择合适剂量的麻醉剂","leading":20,"height":63,"fontSize":22,"color":"#000000"}},{"type":"RadioGroup","props":{"y":338,"x":267,"width":236,"var":"rgroup","space":50,"skin":"comp/radio.png","labels":"18ml,15ml,20ml","height":12}}]};
		override protected function createChildren():void {
			View.regComponent("Text",Text);
			super.createChildren();
			createView(uiView);

		}

	}
}