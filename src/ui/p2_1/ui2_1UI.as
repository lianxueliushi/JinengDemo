/**Created by the LayaAirIDE,do not modify.*/
package ui.p2_1 {
	import laya.ui.*;
	import laya.display.*; 

	public class ui2_1UI extends View {
		public var mc_jiantou:FrameAnimation;
		public var mc_mianqiu:FrameAnimation;
		public var mc_caxue:FrameAnimation;
		public var tuzi:Sprite;
		public var img_tuzi:Image;
		public var clickRect:Sprite;
		public var bg1:Sprite;
		public var img1:Image;
		public var img2:Image;
		public var m_img3wrong:Sprite;
		public var img3:Image;
		public var btn_xiaoduCom:Button;
		public var img_mianqian:Image;
		public var box_mazui:Box;
		public var img_mzj:Image;
		public var img_zhg:Image;
		public var pro_jiliang:ProgressBar;
		public var btn_xiqu:Button;
		public var txt_jiliang:Label;
		public var btn_zhushou:Button;
		public var btn_zhenguan:Button;
		public var btn_mazui:Button;
		public var box_zhazhen:Box;
		public var img_xueguan:Image;
		public var img_zhentou:Image;
		public var img_jiantou:Image;
		public var tool_zhentou:Box;
		public var zhentouList:RadioGroup;
		public var btn_mianqiu:Button;
		public var img_mianqiu:Image;
		public var btn_zhushe:Button;
		public var btn_zhushou2:Button;
		public var box_zhushou2:Box;
		public var spr_bg:Sprite;
		public var box_zhusheqi:Box;
		public var txt_zhushepro:Label;
		public var pro_zhushe:ProgressBar;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"Sprite","props":{"y":0,"x":0,"width":1280,"var":"tuzi","height":720},"child":[{"type":"Image","props":{"y":360,"x":640,"width":1280,"var":"img_tuzi","skin":"p2_1/兔盒固定.png","pivotY":360,"pivotX":640,"height":720}},{"type":"Sprite","props":{"y":-15,"x":392,"width":365,"var":"clickRect","height":255}}]},{"type":"Sprite","props":{"y":0,"x":0,"width":1280,"visible":false,"var":"bg1","height":720},"child":[{"type":"Image","props":{"y":363,"x":638,"width":1283,"visible":false,"var":"img1","skin":"comp/er1.jpg","pivotY":426.5,"pivotX":640,"height":854},"child":[{"type":"Box","props":{"y":63,"x":0,"width":1282,"renderType":"mask","height":720},"child":[{"type":"Rect","props":{"y":0,"x":2,"width":1280,"lineWidth":1,"height":720,"fillColor":"#ff0000"}}]}]},{"type":"Image","props":{"y":208,"x":332,"visible":false,"var":"img2","skin":"comp/er2.jpg"}},{"type":"Sprite","props":{"y":224,"x":382,"width":580,"var":"m_img3wrong","name":"wrong","height":393}},{"type":"Image","props":{"y":327,"x":644,"width":403,"visible":false,"var":"img3","skin":"comp/er3.png","pivotY":109,"pivotX":202.5,"name":"right","height":218}},{"type":"Button","props":{"y":650,"x":1120,"width":110,"visible":false,"var":"btn_xiaoduCom","skin":"comp/button.png","label":"消毒完成","height":38,"sizeGrid":"4,8,6,7"}},{"type":"Image","props":{"y":323,"x":721,"width":225,"visible":false,"var":"img_mianqian","skin":"comp/mianqian.png","pivotY":45,"pivotX":48,"height":98}}]},{"type":"Box","props":{"y":144,"x":380,"var":"box_mazui"},"child":[{"type":"Image","props":{"y":66,"width":232,"visible":false,"var":"img_mzj","skin":"comp/img-mazuiji.jpg","height":351}},{"type":"Image","props":{"x":347,"visible":false,"var":"img_zhg","skin":"comp/img-zhenguan.jpg","scaleY":2,"scaleX":2,"rotation":0}},{"type":"ProgressBar","props":{"y":485,"x":131,"width":277,"visible":false,"var":"pro_jiliang","skin":"comp/progress.png","height":14,"sizeGrid":"4,5,3,3"}},{"type":"Button","props":{"width":110,"visible":false,"var":"btn_xiqu","skin":"comp/button.png","right":15,"pivotY":0,"pivotX":0,"label":"吸取麻醉剂","height":38,"bottom":22,"sizeGrid":"4,8,6,7"}},{"type":"Label","props":{"y":511,"x":164,"width":226,"visible":false,"var":"txt_jiliang","height":12,"font":"20"}}]},{"type":"Button","props":{"width":110,"visible":false,"var":"btn_zhushou","skin":"comp/button.png","right":325,"label":"助手","height":38,"bottom":75,"sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"width":110,"visible":false,"var":"btn_zhenguan","skin":"comp/button.png","right":325,"label":"针管","height":38,"bottom":75,"sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"width":110,"visible":false,"var":"btn_mazui","skin":"comp/button.png","right":325,"label":"麻醉剂","height":38,"bottom":75,"sizeGrid":"4,8,6,7"}},{"type":"Box","props":{"y":0,"x":0,"width":1280,"var":"box_zhazhen","height":720},"child":[{"type":"Image","props":{"y":234,"x":466,"visible":false,"var":"img_xueguan","skin":"comp/er4.png","alpha":1}},{"type":"Image","props":{"y":445,"x":798,"width":216,"visible":false,"var":"img_zhentou","skin":"comp/zhentou.png","pivotY":70,"pivotX":24,"height":88}},{"type":"Image","props":{"y":179,"x":615,"visible":false,"var":"img_jiantou","skin":"comp/箭头.png"},"compId":41}]},{"type":"Box","props":{"y":0,"visible":false,"var":"tool_zhentou","right":0,"bottom":0},"child":[{"type":"Sprite","props":{"y":0,"x":0,"alpha":0.3},"child":[{"type":"Rect","props":{"width":456,"lineWidth":1,"height":75,"fillColor":"#ffffff"}}]},{"type":"RadioGroup","props":{"y":29,"x":35,"var":"zhentouList","space":50,"skin":"comp/radio.png","labels":"大号针头,中号针头,小号针头","labelSize":20}}]},{"type":"Button","props":{"width":110,"visible":false,"var":"btn_mianqiu","skin":"comp/button.png","right":50,"labelSize":16,"label":"止血棉球","height":38,"bottom":50,"sizeGrid":"4,8,6,7"}},{"type":"Image","props":{"y":567,"x":1344,"width":200,"var":"img_mianqiu","skin":"comp/mianqiu.png","scaleY":0.5,"scaleX":0.5,"pivotY":112.5,"pivotX":100,"height":225},"compId":48},{"type":"Button","props":{"width":110,"visible":false,"var":"btn_zhushe","skin":"comp/button.png","right":150,"labelSize":16,"label":"注射","height":38,"bottom":50,"sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"y":631,"width":110,"visible":false,"var":"btn_zhushou2","skin":"comp/button.png","right":150,"labelSize":16,"label":"助手","height":38,"bottom":51,"sizeGrid":"4,8,6,7"}},{"type":"Box","props":{"y":66,"x":143,"width":801,"visible":false,"var":"box_zhushou2","height":598},"child":[{"type":"Sprite","props":{"y":328,"x":400,"width":800,"var":"spr_bg","pivotY":263,"pivotX":400,"height":495,"alpha":0.6},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":800,"lineWidth":1,"height":492,"fillColor":"#000000"}}]},{"type":"Box","props":{"y":309,"x":389,"width":683,"var":"box_zhusheqi","pivotY":297,"pivotX":344,"height":572},"child":[{"type":"Image","props":{"y":61,"x":38,"width":632,"skin":"p2_1/tuizhen.jpg","height":473}},{"type":"Label","props":{"y":503,"x":461,"width":199,"var":"txt_zhushepro","height":23,"fontSize":16,"color":"#c00300","align":"center"}},{"type":"ProgressBar","props":{"y":485,"x":479,"width":162,"var":"pro_zhushe","value":0,"skin":"comp/progress.png","rotation":0,"height":14,"sizeGrid":"4,5,3,3"}}]}]}],"animations":[{"nodes":[{"target":41,"keyframes":{"y":[{"value":179,"tweenMethod":"linearNone","tween":true,"target":41,"key":"y","index":0},{"value":195,"tweenMethod":"linearNone","tween":true,"target":41,"key":"y","index":10},{"value":179,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"y","index":18},{"value":179,"tweenMethod":"linearNone","tween":true,"label":null,"index":30}],"x":[{"value":622,"tweenMethod":"linearNone","tween":true,"target":41,"key":"x","index":0},{"value":626,"tweenMethod":"linearNone","tween":true,"target":41,"key":"x","index":10},{"value":622,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"x","index":18},{"value":622,"tweenMethod":"linearNone","tween":true,"label":null,"index":30}]}}],"name":"mc_jiantou","id":2,"frameRate":24,"action":0},{"nodes":[{"target":48,"keyframes":{"x":[{"value":1376,"tweenMethod":"linearNone","tween":true,"target":48,"key":"x","index":0}],"scaleY":[{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":48,"key":"scaleY","index":0},{"value":0.3,"tweenMethod":"linearNone","tween":true,"target":48,"key":"scaleY","index":1}],"scaleX":[{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":48,"key":"scaleX","index":0},{"value":0.4,"tweenMethod":"linearNone","tween":true,"target":48,"key":"scaleX","index":1}]}}],"name":"mc_mianqiu","id":3,"frameRate":24,"action":0},{"nodes":[{"target":48,"keyframes":{"y":[{"value":429,"tweenMethod":"linearNone","tween":true,"target":48,"key":"y","index":0}],"x":[{"value":1388,"tweenMethod":"linearNone","tween":true,"target":48,"key":"x","index":0}]}}],"name":"mc_caxue","id":4,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}