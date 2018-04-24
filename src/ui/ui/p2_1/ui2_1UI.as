/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.p2_1 {
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
		public var box_mazui:Box;
		public var img_mzj:Image;
		public var img_zhg:Image;
		public var pro_jiliang:ProgressBar;
		public var btn_xiqu:Button;
		public var txt_jiliang:Label;
		public var box_zhushou:Box;
		public var btn_mazui:Button;
		public var btn_zhenguan:Button;
		public var btn_zhushou:Button;
		public var box_zhazhen:Box;
		public var img_xueguan:Image;
		public var img_zhentou:Image;
		public var img_jiantou:Image;
		public var tool_zhentou:Box;
		public var zhentouList:RadioGroup;
		public var btn_mianqiu:Button;
		public var img_mianqiu:Image;
		public var btn_zhushou2:Button;
		public var btn_zhushe:Button;
		public var box_zhushou2:Box;
		public var spr_bg:Sprite;
		public var box_zhusheqi:Box;
		public var txt_zhushepro:Label;
		public var pro_zhushe:ProgressBar;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"Sprite","props":{"y":0,"x":0,"width":1280,"var":"tuzi","height":720},"child":[{"type":"Image","props":{"y":360,"x":640,"width":1280,"var":"img_tuzi","skin":"p2_1/兔盒固定.png","pivotY":360,"pivotX":640,"height":720}},{"type":"Sprite","props":{"y":-15,"x":392,"width":365,"var":"clickRect","height":255}}]},{"type":"Sprite","props":{"y":-1,"x":0,"var":"bg1"},"child":[{"type":"Image","props":{"y":364,"x":640,"width":1280,"visible":false,"var":"img1","skin":"comp/er1.jpg","pivotY":426.5,"pivotX":640,"height":853}},{"type":"Image","props":{"y":208,"x":332,"visible":false,"var":"img2","skin":"comp/er2.jpg"}},{"type":"Sprite","props":{"y":224,"x":382,"width":580,"var":"m_img3wrong","name":"wrong","height":446}},{"type":"Image","props":{"y":326,"x":644,"width":403,"visible":false,"var":"img3","skin":"comp/er3.png","pivotY":109,"pivotX":202.5,"name":"right","height":218}},{"type":"Button","props":{"y":711,"x":1089,"width":124,"visible":false,"var":"btn_xiaoduCom","skin":"comp/button.png","label":"消毒完成","height":45,"sizeGrid":"4,8,6,7"}}]},{"type":"Box","props":{"y":144,"x":380,"var":"box_mazui"},"child":[{"type":"Image","props":{"y":66,"width":232,"visible":false,"var":"img_mzj","skin":"comp/img-mazuiji.jpg","height":351}},{"type":"Image","props":{"x":347,"visible":false,"var":"img_zhg","skin":"comp/img-zhenguan.jpg","scaleY":2,"scaleX":2,"rotation":0}},{"type":"ProgressBar","props":{"y":503,"x":63,"width":392,"visible":false,"var":"pro_jiliang","skin":"comp/progress.png","height":14,"sizeGrid":"4,5,3,3"}},{"type":"Button","props":{"y":531,"x":652,"width":184,"visible":false,"var":"btn_xiqu","skin":"comp/button.png","pivotY":20,"pivotX":92,"label":"点击开始吸取麻醉剂","height":43,"sizeGrid":"4,8,6,7"}},{"type":"Label","props":{"y":527,"x":65,"width":389,"visible":false,"var":"txt_jiliang","height":12,"font":"20"}}]},{"type":"Box","props":{"y":661,"x":884,"width":101,"var":"box_zhushou","height":39},"child":[{"type":"Button","props":{"y":0,"x":0,"width":95,"visible":false,"var":"btn_mazui","skin":"comp/button.png","label":"麻醉剂","height":34,"sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"y":0,"x":0,"width":97,"visible":false,"var":"btn_zhenguan","skin":"comp/button.png","label":"针管","height":34,"sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"y":0,"x":2,"width":96,"visible":false,"var":"btn_zhushou","skin":"comp/button.png","label":"助手","height":34,"sizeGrid":"4,8,6,7"}}]},{"type":"Box","props":{"y":0,"x":0,"width":1280,"var":"box_zhazhen","height":720},"child":[{"type":"Image","props":{"y":234,"x":466,"visible":false,"var":"img_xueguan","skin":"comp/er4.png","alpha":1}},{"type":"Image","props":{"y":445,"x":798,"width":216,"visible":false,"var":"img_zhentou","skin":"comp/zhentou.png","pivotY":70,"pivotX":24,"height":88}},{"type":"Image","props":{"y":179,"x":615,"visible":false,"var":"img_jiantou","skin":"comp/箭头.png"},"compId":41}]},{"type":"Box","props":{"y":772,"x":809,"visible":false,"var":"tool_zhentou"},"child":[{"type":"Sprite","props":{"y":0,"x":0,"alpha":0.3},"child":[{"type":"Rect","props":{"width":456,"lineWidth":1,"height":75,"fillColor":"#ffffff"}}]},{"type":"RadioGroup","props":{"y":29,"x":35,"var":"zhentouList","space":50,"skin":"comp/radio.png","labels":"大号针头,中号针头,小号针头","labelSize":20}}]},{"type":"Button","props":{"y":614,"x":1092,"width":111,"visible":false,"var":"btn_mianqiu","skin":"comp/button.png","labelSize":16,"label":"止血棉球","height":38,"sizeGrid":"4,8,6,7"}},{"type":"Image","props":{"y":567,"x":1344,"width":200,"var":"img_mianqiu","skin":"p2_1/mianqiu.png","scaleY":0.5,"scaleX":0.5,"pivotY":112.5,"pivotX":100,"height":225},"compId":48},{"type":"Button","props":{"y":660,"x":917,"width":111,"visible":false,"var":"btn_zhushou2","skin":"comp/button.png","labelSize":16,"label":"助手","height":38,"sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"y":660,"x":917,"width":111,"visible":false,"var":"btn_zhushe","skin":"comp/button.png","labelSize":16,"label":"注射","height":38,"sizeGrid":"4,8,6,7"}},{"type":"Box","props":{"y":54,"x":273,"width":945,"visible":false,"var":"box_zhushou2","height":676},"child":[{"type":"Sprite","props":{"y":300,"x":400,"width":800,"var":"spr_bg","pivotY":300,"pivotX":400,"height":600,"alpha":0.6},"child":[{"type":"Rect","props":{"y":0,"x":0,"width":800,"lineWidth":1,"height":600,"fillColor":"#000000"}}]},{"type":"Box","props":{"y":300,"x":402,"width":249,"var":"box_zhusheqi","pivotY":286,"pivotX":124.5,"height":572},"child":[{"type":"Image","props":{"y":-14,"x":-278,"width":800,"skin":"p2_1/tuizhen.jpg","height":599}},{"type":"Label","props":{"y":410,"x":59,"width":140,"var":"txt_zhushepro","height":23,"fontSize":20,"color":"#c00300"}},{"type":"ProgressBar","props":{"y":392,"x":47,"width":162,"var":"pro_zhushe","value":0,"skin":"comp/progress.png","rotation":0,"height":14,"sizeGrid":"4,5,3,3"}}]}]}],"animations":[{"nodes":[{"target":41,"keyframes":{"y":[{"value":179,"tweenMethod":"linearNone","tween":true,"target":41,"key":"y","index":0},{"value":195,"tweenMethod":"linearNone","tween":true,"target":41,"key":"y","index":10},{"value":179,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"y","index":18},{"value":179,"tweenMethod":"linearNone","tween":true,"label":null,"index":30}],"x":[{"value":622,"tweenMethod":"linearNone","tween":true,"target":41,"key":"x","index":0},{"value":626,"tweenMethod":"linearNone","tween":true,"target":41,"key":"x","index":10},{"value":622,"tweenMethod":"linearNone","tween":true,"target":41,"label":null,"key":"x","index":18},{"value":622,"tweenMethod":"linearNone","tween":true,"label":null,"index":30}]}}],"name":"mc_jiantou","id":2,"frameRate":24,"action":0},{"nodes":[{"target":48,"keyframes":{"x":[{"value":1376,"tweenMethod":"linearNone","tween":true,"target":48,"key":"x","index":0}],"scaleY":[{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":48,"key":"scaleY","index":0},{"value":0.3,"tweenMethod":"linearNone","tween":true,"target":48,"key":"scaleY","index":1}],"scaleX":[{"value":0.5,"tweenMethod":"linearNone","tween":true,"target":48,"key":"scaleX","index":0},{"value":0.4,"tweenMethod":"linearNone","tween":true,"target":48,"key":"scaleX","index":1}]}}],"name":"mc_mianqiu","id":3,"frameRate":24,"action":0},{"nodes":[{"target":48,"keyframes":{"y":[{"value":429,"tweenMethod":"linearNone","tween":true,"target":48,"key":"y","index":0}],"x":[{"value":1388,"tweenMethod":"linearNone","tween":true,"target":48,"key":"x","index":0}]}}],"name":"mc_caxue","id":4,"frameRate":24,"action":0}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}