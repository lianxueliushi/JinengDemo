/**Created by the LayaAirIDE,do not modify.*/
package ui.p1_1 {
	import laya.ui.*;
	import laya.display.*; 

	public class RabbitCageUI extends View {
		public var cageAni:Animation;
		public var emptyCage:Box;
		public var newRabbit:Box;
		public var dzc1:Image;
		public var dzc0:Image;
		public var surface:Box;

		public static var uiView:Object =/*[STATIC SAFE]*/{"type":"View","props":{"width":1920,"height":1080},"child":[{"type":"Animation","props":{"y":0,"x":0,"var":"cageAni","source":"OpenRabbitCage.ani"}},{"type":"Box","props":{"y":0,"x":0,"width":1920,"visible":true,"var":"emptyCage","height":1080},"child":[{"type":"Image","props":{"y":0,"x":0,"skin":"rabbit-cage/rabbit-cage.png"}}]},{"type":"Box","props":{"y":0,"x":0,"width":1920,"visible":true,"var":"newRabbit","height":1080},"child":[{"type":"Image","props":{"y":604,"x":150,"visible":false,"var":"dzc1","skin":"rabbit-cage/Dzicheng1.png"}},{"type":"Image","props":{"y":669,"x":341,"width":448,"var":"dzc0","skin":"rabbit-cage/Dzicheng0.png","pivotY":65,"pivotX":191,"height":275}}]},{"type":"Box","props":{"visible":true,"var":"surface"},"child":[{"type":"Image","props":{"y":-3,"x":1,"skin":"rabbit-cage/cage-surface.png"}}]}]};
		override protected function createChildren():void {
			super.createChildren();
			createView(uiView);

		}

	}
}