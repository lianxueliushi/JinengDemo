/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.p1_1 {
	import laya.ui.*;
	import laya.display.*; 

	public class ZhuotuziPageUI extends View {
		public var mc_dzc:FrameAnimation;
		public var mc_tuzi:FrameAnimation;
		public var mc_shan:FrameAnimation;
		public var dzc:Sprite;
		public var dianzicheng:Image;
		public var tip:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1366,"height":768},"child":[{"type":"Sprite","props":{"y":393,"x":729,"width":504,"var":"dzc","height":326},"compId":15,"child":[{"type":"Image","props":{"width":511,"var":"dianzicheng","skin":"comp/dianzicheng.png","height":335},"compId":4},{"type":"Image","props":{"y":422,"x":704,"width":199,"skin":"comp/dianzicheng-liang.png","height":48,"alpha":0},"compId":6}]},{"type":"Label","props":{"y":686,"x":-1,"wordWrap":true,"width":426,"var":"tip","valign":"middle","text":"label","height":77,"fontSize":20,"color":"#ff0905","bgColor":"#e7e7e7","align":"center"}}],"animations":[{"nodes":[{"target":6,"keyframes":{"y":[{"value":422,"tweenMethod":"linearNone","tween":true,"target":6,"key":"y","index":0},{"value":189,"tweenMethod":"linearNone","tween":true,"target":6,"key":"y","index":1}],"x":[{"value":704,"tweenMethod":"linearNone","tween":true,"target":6,"key":"x","index":0},{"value":99,"tweenMethod":"linearNone","tween":true,"target":6,"key":"x","index":1}],"alpha":[{"value":0,"tweenMethod":"linearNone","tween":true,"target":6,"key":"alpha","index":0},{"value":1,"tweenMethod":"linearNone","tween":true,"target":6,"key":"alpha","index":1}]}},{"target":4,"keyframes":{"skin":[{"value":"comp/dianzicheng.png","tweenMethod":"linearNone","tween":false,"target":4,"key":"skin","index":0},{"value":"comp/dianzicheng-s.png","tweenMethod":"linearNone","tween":false,"target":4,"key":"skin","index":1},{"value":"comp/dianzicheng.png","tweenMethod":"linearNone","tween":false,"target":4,"key":"skin","index":2}],"renderType":[{"value":null,"tweenMethod":"linearNone","tween":false,"target":4,"key":"renderType","index":0},{"value":"","tweenMethod":"linearNone","tween":false,"target":4,"key":"renderType","index":1}],"blendMode":[{"value":null,"tweenMethod":"linearNone","tween":false,"target":4,"key":"blendMode","index":0},{"value":"","tweenMethod":"linearNone","tween":false,"target":4,"key":"blendMode","index":1}]}},{"target":15,"keyframes":{"y":[{"value":393,"tweenMethod":"linearNone","tween":true,"target":15,"key":"y","index":0}],"x":[{"value":729,"tweenMethod":"linearNone","tween":true,"target":15,"key":"x","index":0}]}}],"name":"mc_dzc","id":1,"frameRate":24,"action":0},{"nodes":[{"target":2,"keyframes":{"skin":[{"value":"comp/tuzi-left.png","tweenMethod":"linearNone","tween":false,"target":2,"key":"skin","index":0},{"value":"comp/tuzi-lefts.png","tweenMethod":"linearNone","tween":false,"target":2,"key":"skin","index":1}]}}],"name":"mc_tuzi","id":2,"frameRate":24,"action":0},{"nodes":[{"target":19,"keyframes":{"x":[{"value":222,"tweenMethod":"linearNone","tween":true,"target":19,"key":"x","index":0},{"value":222,"tweenMethod":"linearNone","tween":true,"target":19,"key":"x","index":8},{"value":222,"tweenMethod":"linearNone","tween":true,"target":19,"key":"x","index":30}],"alpha":[{"value":0.2,"tweenMethod":"linearNone","tween":true,"target":19,"key":"alpha","index":0},{"value":0.6,"tweenMethod":"linearNone","tween":true,"target":19,"key":"alpha","index":8},{"value":0.2,"tweenMethod":"linearNone","tween":true,"target":19,"key":"alpha","index":30}]}}],"name":"mc_shan","id":4,"frameRate":24,"action":2}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}