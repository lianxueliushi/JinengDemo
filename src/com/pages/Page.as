package com.pages
{
	import laya.display.Sprite;
	
	public class Page extends Sprite implements PageInterface
	{
		public function Page()
		{
			super();
		}
		public function onDispose():void{
			this.destroyChildren();
			this.destroy();
		}
		
		public function onCreate():void
		{
			// TODO Auto Generated method stub
		}
		
	}
}