package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	import com.mode.SkyControl;
	
	import laya.display.Animation;
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Button;
	import laya.ui.Label;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Mouse;
	import laya.utils.Tween;
	
	import ui.UiDaohangUI;
	
	public class PageShiyanleixing extends UiDaohangUI
	{
		private var index1:int=0;
		private var index2:int=0;
		/**
		 *一级目录 
		 */		
		private var dataList1:Array=[{des:"生理学实验",value:"SY_SLX"},
									  {des:"病理学实验",value:"SY_BLX"},
									  {des:"药理学实验",value:"SY_YLX"},
									  {des:"针灸学实验",value:"SY_ZJX"},
									  {des:"综合实验",value:"SY_ZHSY"}];
		/**
		 *二级目录 
		 */		
		private var dataList2:Array=[
			[{des:"常用器械及手术技能1",value:"CYQX"},{des:"BL-420生物机能实验",value:"SWJN"},{des:"小鼠实验基本操作",value:"XSJB"},{des:"大鼠实验基本操作",value:"DSJB"},{des:"兔类实验基本操作",value:"TLJB"},{des:"蛙类实验基本操作",value:"WLJB"}],
			[{des:"常用器械及手术技能2",value:"CYQX"},{des:"BL-420生物机能实验",value:"SWJN"},{des:"小鼠实验基本操作",value:"XSJB"},{des:"大鼠实验基本操作",value:"DSJB"},{des:"兔类实验基本操作",value:"TLJB"},{des:"蛙类实验基本操作",value:"WLJB"}],
			[{des:"常用器械及手术技能3",value:"CYQX"},{des:"BL-420生物机能实验",value:"SWJN"},{des:"小鼠实验基本操作",value:"XSJB"},{des:"大鼠实验基本操作",value:"DSJB"},{des:"兔类实验基本操作",value:"TLJB"},{des:"蛙类实验基本操作",value:"WLJB"}],
			[{des:"常用器械及手术技能4",value:"CYQX"},{des:"BL-420生物机能实验",value:"SWJN"},{des:"小鼠实验基本操作",value:"XSJB"},{des:"大鼠实验基本操作",value:"DSJB"},{des:"兔类实验基本操作",value:"TLJB"},{des:"蛙类实验基本操作",value:"WLJB"}],
			[{des:"常用器械及手术技能5",value:"CYQX"},{des:"BL-420生物机能实验",value:"SWJN"},{des:"小鼠实验基本操作",value:"XSJB"},{des:"大鼠实验基本操作",value:"DSJB"},{des:"兔类实验基本操作",value:"TLJB"},{des:"蛙类实验基本操作",value:"WLJB"}],
			[{des:"常用器械及手术技能6",value:"CYQX"},{des:"BL-420生物机能实验",value:"SWJN"},{des:"小鼠实验基本操作",value:"XSJB"},{des:"大鼠实验基本操作",value:"DSJB"},{des:"兔类实验基本操作",value:"TLJB"},{des:"蛙类实验基本操作",value:"WLJB"}]
		];
		public function PageShiyanleixing()
		{
			super();
			resReady();
		}
		/**
		 *资源准备完毕 
		 * 
		 */		
		private function resReady():void
		{
			// TODO Auto Generated method stub
			sky=new SkyControl('skyBox1/skyCube.ltc');
			box_bg.addChild(sky);
			
			nav1.array=dataList1;
			nav2.array=dataList2[0];
			nav1.renderHandler=new Handler(this,nav1Render);
			nav2.renderHandler=new Handler(this,nav2Render);
			nav1.mouseHandler=new Handler(this,onSelect1);
			nav2.mouseHandler=new Handler(this,onSelect2);
			
			//滚动在头或底回弹时间
			nav2.scrollBar.elasticBackTime= 500;
			
			nav2.scrollBar.autoHide=true;
			//滚动在头或底最大距离
			nav2.scrollBar.elasticDistance = 200;
			nav2.scrollBar.showButtons=false;
			btnStart.on(Event.CLICK,this,onClick);
		}
		private function onClick():void
		{
			// TODO Auto Generated method stub
			sky.onDispose();
			NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,Main.P_CJMY);
		}
		private function onSelect2(e:Event,index:Number):void
		{
			// TODO Auto Generated method stub
			if(e.type==Event.CLICK){
				index2=index;
				if(lastItem2){
					lastItem2.selected=false;
					trace("reset:"+lastItem2);
				}
				var box:Box=e.currentTarget as Box;
				lastItem2=box.getChildByName('btn') as Button;
				lastItem2.selected=true;
			}
		}
		private var lastItem1:Button;
		private var lastItem2:Button;
		private var sky:SkyControl;
		private function onSelect1(e:Event,index:Number):void
		{
			// TODO Auto Generated method stub
			if(e.type==Event.CLICK){
				if(index==index1){
					return ;
				}
				trace("selcet:"+index);
				if(lastItem1){
					lastItem1.selected=false;
				}
				var box:Box=e.currentTarget as Box;
				lastItem1=box.getChildByName("btn") as Button;
				lastItem1.selected=true;
				index1=index;
				lastItem2=null;
				nav2.array=dataList2[index1];
			}
			
		}
		private function nav1Render(cell:Box,ind:int):void
		{
			// TODO Auto Generated method stub
			trace("render***");
			var btn:Button=cell.getChildByName("btn") as Button;
			btn.label=dataList1[ind].des;
			if(ind==0 && !lastItem1){//首次渲染
				lastItem1=btn;
				lastItem1.selected=true;
			}
			else btn.selected=false;
		
		}
		private function nav2Render(cell:Box,ind:int):void
		{
			// TODO Auto Generated method stub
			var btn:Button=cell.getChildByName("btn") as Button;
			btn.label=dataList2[index1][ind].des;
			cell.alpha=0;
			cell.y+=50;
			Tween.to(cell,{y:cell.y-50,alpha:1},600,Ease.cubicInOut,null,100*ind);
			if(!lastItem2 && ind==0){
				lastItem2=btn;
				lastItem2.selected=true;
			}
			else btn.selected=false;
			
		}
	}
}