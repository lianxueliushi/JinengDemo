/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.p1_3 {
	import laya.ui.*;
	import laya.display.*; 

	public class ui1_3UI extends View {
		public var mc_jiantou:FrameAnimation;
		public var tuzi:Sprite;
		public var clickRect:Sprite;
		public var bg1:Sprite;
		public var img1:Image;
		public var img2:Image;
		public var m_img3wrong:Sprite;
		public var img3:Image;
		public var btn_xiaoduCom:Button;
		public var img_mzj:Image;
		public var img_zhg:Image;
		public var pro_jiliang:ProgressBar;
		public var btn_xiqu:Button;
		public var txt_jiliang:Label;
		public var btn_mazui:Button;
		public var btn_zhenguan:Button;
		public var btn_zhushou:Button;
		public var box_zhazhen:Box;
		public var img_xueguan:Image;
		public var img_zhentou:Image;
		public var btn_zhushe:Button;
		public var img_jiantou:Image;
		public var tool_zhentou:Box;
		public var zhentouList:RadioGroup;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"Sprite","props":{"y":128,"x":385,"var":"tuzi"},"child":[{"type":"Image","props":{"skin":"comp/tuzi-er.png"}},{"type":"Sprite","props":{"y":18,"x":175,"width":100,"var":"clickRect","height":120}},{"type":"Label","props":{"y":56,"x":154,"text":"点击开始脱毛","fontSize":20,"color":"#ca0300"}}]},{"type":"Sprite","props":{"y":-1,"x":0,"var":"bg1"},"child":[{"type":"Image","props":{"y":364,"x":640,"width":1280,"visible":false,"var":"img1","skin":"comp/er1.jpg","pivotY":426.5,"pivotX":640,"height":853}},{"type":"Image","props":{"y":208,"x":332,"visible":false,"var":"img2","skin":"comp/er2.jpg"}},{"type":"Sprite","props":{"y":224,"x":382,"width":580,"var":"m_img3wrong","name":"wrong","height":446}},{"type":"Image","props":{"y":326,"x":644,"width":403,"visible":false,"var":"img3","skin":"comp/er3.png","pivotY":109,"pivotX":202.5,"name":"right","height":218}},{"type":"Button","props":{"y":711,"x":1089,"width":124,"visible":false,"var":"btn_xiaoduCom","skin":"comp/button.png","label":"消毒完成","height":45,"sizeGrid":"4,8,6,7"}}]},{"type":"Box","props":{"y":144,"x":380},"child":[{"type":"Image","props":{"y":66,"width":232,"visible":false,"var":"img_mzj","skin":"comp/img-mazuiji.jpg","height":351}},{"type":"Image","props":{"x":347,"visible":false,"var":"img_zhg","skin":"comp/img-zhenguan.jpg","scaleY":2,"scaleX":2,"rotation":0}},{"type":"ProgressBar","props":{"y":503,"x":63,"width":392,"visible":false,"var":"pro_jiliang","skin":"comp/progress.png","height":14,"sizeGrid":"4,5,3,3"}},{"type":"Button","props":{"y":531,"x":652,"width":184,"visible":false,"var":"btn_xiqu","skin":"comp/button.png","pivotY":20,"pivotX":92,"label":"点击开始吸取麻醉剂","height":43,"sizeGrid":"4,8,6,7"}},{"type":"Label","props":{"y":527,"x":65,"width":389,"visible":false,"var":"txt_jiliang","height":12,"font":"20"}}]},{"type":"Box","props":{"y":658,"x":942},"child":[{"type":"Button","props":{"visible":false,"var":"btn_mazui","skin":"comp/button.png","label":"麻醉剂","sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"visible":false,"var":"btn_zhenguan","skin":"comp/button.png","label":"针管","sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"visible":false,"var":"btn_zhushou","skin":"comp/button.png","label":"助手","sizeGrid":"4,8,6,7"}}]},{"type":"Box","props":{"y":0,"x":0,"var":"box_zhazhen"},"child":[{"type":"Image","props":{"y":0,"x":0,"visible":false,"var":"img_xueguan","skin":"p1_3/出血/序列-0319.jpg","alpha":1}},{"type":"Image","props":{"y":499,"x":1079,"width":216,"visible":false,"var":"img_zhentou","skin":"comp/zhentou.png","pivotY":70,"pivotX":27,"height":88}},{"type":"Button","props":{"y":633,"x":1091,"width":109,"visible":false,"var":"btn_zhushe","skin":"comp/button.png","labelSize":20,"label":"注射","height":49,"sizeGrid":"4,8,6,7"}},{"type":"Image","props":{"y":341,"x":694,"visible":false,"var":"img_jiantou","skin":"comp/箭头.png"},"compId":41}]},{"type":"Box","props":{"y":772,"x":809,"visible":false,"var":"tool_zhentou"},"child":[{"type":"Sprite","props":{"y":0,"x":0,"alpha":0.3},"child":[{"type":"Rect","props":{"width":456,"lineWidth":1,"height":75,"fillColor":"#ffffff"}}]},{"type":"RadioGroup","props":{"y":29,"x":35,"var":"zhentouList","space":50,"skin":"comp/radio.png","labels":"大号针头,中号针头,小号针头","labelSize":20}}]}],"animations":[{"nodes":[{"target":41,"keyframes":{"y":[{"value":341,"tweenMethod":"linearNone","tween":true,"target":41,"key":"y","index":0},{"value":349,"tweenMethod":"linearNone","tween":true,"target":41,"key":"y","index":5},{"value":349,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"y","index":10},{"value":341,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"y","index":18},{"value":341,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"y","index":24}],"x":[{"value":694,"tweenMethod":"linearNone","tween":true,"target":41,"key":"x","index":0},{"value":694,"tweenMethod":"linearNone","tween":true,"target":41,"key":"x","index":5},{"value":694,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"x","index":10},{"value":694,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"x","index":18},{"value":694,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"x","index":24}]}}],"name":"mc_jiantou","id":2,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}