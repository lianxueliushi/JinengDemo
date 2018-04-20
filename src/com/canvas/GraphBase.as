package com.canvas
{
	import laya.display.Sprite;
	
	/**
	 * 定义各种绘制图形的基类
	 * 所有绘制的形状都继承自此类，并重写了begin方法和draw方法
	 * begin在开始画线时调用，draw在鼠标移动画线时不停调用
	 */
	public class GraphBase extends Sprite
	{   
		protected var sizes:Number=20;
		protected var startX:Number;
		protected var startY:Number;
		protected var oldScale:Number;
		protected var randomRotation:Boolean;//是否随机分布
		protected var gap:Number=20;	
		public function GraphBase() 
		{
						
		}
		public function begin(xx:Number, yy:Number):void { 
			startX = xx;
			startY = yy;
			oldScale = 1.3;
		}
		public function draw(xx:Number, yy:Number):void {
			var dx:Number = xx - startX;
			var dy:Number = yy - startY;
			var dd:Number =Math.sqrt(dx*dx+dy*dy);
			var n:int = Math.ceil(dd / gap);
			/**2014-12-20修改**/
			for (var i:int = 0; i < n; i++) {
				var d:Sprite = new Sprite();
				d.graphics.drawCircle(-sizes/2,-sizes/2,sizes,'#ffc600');
				d.blendMode='lighter';
				d.x = dx / n * (i+1)+ startX;
				d.y = dy / n * (i+1) + startY;
				if (randomRotation) {
					d.rotation+=Math.asin(Math.abs(dy)/dd);
				}		
				d.alpha=0.1;
				addChild(d);
				d.x = (dx / n) * (i + 1) + startX;
				d.y = (dy / n) * (i + 1) + startY;
			}
			/**2014-12-20修改**/
			//更新起始点，使当前坐标成为下一个起始点
			startX = xx;
			startY = yy;
			
		}		
		
	}
	
}