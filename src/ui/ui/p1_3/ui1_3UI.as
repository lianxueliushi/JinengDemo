/**Created by the LayaAirIDE,do not modify.*/
package ui.ui.p1_3 {
	import laya.ui.*;
	import laya.display.*; 

	public class ui1_3UI extends View {
		public var tuzi:Sprite;
		public var clickRect:Sprite;
		public var bg1:Sprite;
		public var btn_mazui:Button;
		public var btn_zhenguan:Button;
		public var img_mzj:Image;
		public var img_zhg:Image;
		public var btn_zhushou:Button;
		public var pro_jiliang:ProgressBar;
		public var btn_xiqu:Button;
		public var txt_jiliang:Label;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1280,"height":720},"child":[{"type":"Sprite","props":{"y":128,"x":385,"var":"tuzi"},"child":[{"type":"Image","props":{"skin":"comp/tuzi-er.png"}},{"type":"Sprite","props":{"y":18,"x":175,"width":100,"var":"clickRect","height":120}},{"type":"Label","props":{"y":56,"x":154,"text":"点击开始脱毛","fontSize":20,"color":"#ca0300"}}]},{"type":"Sprite","props":{"y":-1,"x":0,"var":"bg1"}},{"type":"Button","props":{"y":656,"x":945,"visible":false,"var":"btn_mazui","skin":"comp/button.png","label":"麻醉剂","sizeGrid":"4,8,6,7"}},{"type":"Button","props":{"y":656,"x":945,"visible":false,"var":"btn_zhenguan","skin":"comp/button.png","label":"针管","sizeGrid":"4,8,6,7"}},{"type":"Image","props":{"y":210,"x":380,"width":232,"visible":false,"var":"img_mzj","skin":"comp/img-mazuiji.jpg","height":351}},{"type":"Image","props":{"y":144,"x":727,"visible":false,"var":"img_zhg","skin":"comp/img-zhenguan.jpg","scaleY":2,"scaleX":2}},{"type":"Button","props":{"y":656,"x":945,"visible":false,"var":"btn_zhushou","skin":"comp/button.png","label":"助手","sizeGrid":"4,8,6,7"}},{"type":"ProgressBar","props":{"y":647,"x":443,"width":392,"visible":false,"var":"pro_jiliang","skin":"comp/progress.png","height":14,"sizeGrid":"4,5,3,3"}},{"type":"Button","props":{"y":702,"x":1035,"width":184,"visible":false,"var":"btn_xiqu","skin":"comp/button.png","pivotY":20,"pivotX":92,"label":"点击开始吸取麻醉剂","height":43,"sizeGrid":"4,8,6,7"}},{"type":"Label","props":{"y":671,"x":445,"width":389,"visible":false,"var":"txt_jiliang","height":12,"font":"20"}}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}