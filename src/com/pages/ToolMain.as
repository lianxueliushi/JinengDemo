package com.pages
{
	import laya.events.Event;
	import laya.ui.Box;
	import laya.ui.Image;
	import laya.ui.Label;
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Mouse;
	import laya.utils.Tween;
	
	import ui.SYZCJUI;
	
	public class ToolMain extends SYZCJUI
	{
		public static const CHOOSE_TOOLS_EVENT:String="chooseTools";
		private var currtoolListData:Array=[];
		private var toolListData1:Array=[{img:'tools1/obj_cheng.png',value:"dianzicheng",title:"电子秤",cursor:"tools1/obj_cheng.png"},
										  {img:'tools1/obj_jiandao.png',value:"jiandao",title:"剪刀",cursor:"tools1/obj_jiandao.png"},
										  {img:'tools1/obj_mianqian.png',value:"mianqian",title:"棉签",cursor:"tools1/obj_mianqian.png"},
										  {img:'tools1/obj_shoushudao.png',value:"shoushudao",title:"手术刀",cursor:"tools1/obj_shoushudao.png"},
										  {img:'tools1/obj_shoutao.png',value:"shoutao",title:"手套",cursor:"tools1/obj_shoutao.png"},
										  {img:'tools1/obj_zhusheqi.png',value:"zhusheqi",title:"注射器",cursor:"tools1/obj_zhusheqi.png"},];
		public function ToolMain()
		{
			super();
			this.mouseThrough=true;
			box_btns.on("box",this,showToolsByName,["box"]);
			box_btns.on("library",this,showToolsByName,["library"]);
			box_btns.on("tool",this,showToolsByName,["tool"]);
			box_btns.on("medch",this,showToolsByName,["medch"]);
			box_btns.on("test",this,showToolsByName,["test"]);
			
			
			btn_closetool.on(Event.CLICK,this,onCloseTools);
			// 使用但隐藏滚动条
			_list.hScrollBarSkin = "";
			_list.renderHandler=new Handler(this,toolBoxRender);
			_list.mouseHandler=new Handler(this,onChooseTools);
			//滚动在头或底回弹时间
			_list.scrollBar.elasticBackTime= 500;
			//滚动在头或底最大距离
			_list.scrollBar.elasticDistance = 200;
			
			
			btn_closeshiyanyuanli.on(Event.CLICK,this,closeShiyanyuanli);
			img_person.on(Event.CLICK,this,showShiyanyuanli);
		}
		
		private function showShiyanyuanli():void
		{
			// TODO Auto Generated method stub
			Tween.to(box_syyl,{x:66},300,Ease.circInOut);
		}
		
		private function closeShiyanyuanli():void
		{
			// TODO Auto Generated method stub
			Tween.to(box_syyl,{x:-img_syylbg.width},300,Ease.circInOut);
		}
		
		private function onChooseTools(e:Event,index:int):void
		{
			// TODO Auto Generated method stub
			trace("choose:"+index);
			if(e.type==Event.CLICK){//鼠标点击事件
				Mouse.cursor="url('"+currtoolListData[index].cursor+"'),auto";
				event(CHOOSE_TOOLS_EVENT,currtoolListData[index]);
			}
		}
		/**
		 *工具箱列表 Render
		 * 
		 */		
		private function toolBoxRender(cell:Box,ind:int):void
		{
			// TODO Auto Generated method stub
			var bg:Image=cell.getChildByName("btn").getChildByName("img") as Image;
			bg.loadImage(currtoolListData[ind].img);
			var lab:Label=cell.getChildByName("lab") as Label;
			lab.text=currtoolListData[ind].title;
			
		}
		/**
		 *更新工具箱数据 
		 * 
		 */		
		private function initBoxTools($name:String):void
		{
			// TODO Auto Generated method stub
			switch($name)
			{
				case "box":
				case "library":
				case "tool":
				case "medch":
				case "test":
				{
					currtoolListData=toolListData1;
					break;
				}
					
				default:
				{
					break;
				}
			}
			_list.array=currtoolListData;
		}
		
		private function onCloseTools():void
		{
			// TODO Auto Generated method stub
			Mouse.cursor='';
			Tween.to(box_tools,{y:Laya.stage.height,alpha:0},300,Ease.circInOut);
		}
		
		private function showToolsByName($name:String):void
		{
			// TODO Auto Generated method stub
			initBoxTools($name);
			switch($name)
			{
				case "box":
				case "library":
				case "tool":
				case "medch":
				case "test":
				{
					Tween.to(box_tools,{y:Laya.stage.height-box_tools.height,alpha:1},300,Ease.circInOut);
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		public function ShowLeftTip(str:String,$autoHide:Boolean=false,interval:int=5000):void{
			leftTip.changeText(str);
			leftTip.y=0;
			leftTip.alpha=1;
			Tween.from(leftTip,{x:-leftTip.width,alpha:0},600,Ease.circInOut);
			if($autoHide) Laya.timer.once(interval,this,HideLeftTip);
		}
		public function HideLeftTip():void{
			Tween.to(leftTip,{x:-leftTip.width,alpha:0},600,Ease.circInOut);
		}
		
		public function ShowRightTip(str:String,bAutoHide:Boolean=false,interval:int=5000):void{
			rightTip.changeText(str);		
			rightBox.alpha=1;
			Tween.from(rightBox,{x:Laya.stage.width,alpha:0},600,Ease.circInOut);
			if(bAutoHide) Laya.timer.once(interval,this,HideRightTip);
		}
		
		public function HideRightTip():void{
			Tween.to(rightBox,{x:rightBox.x,alpha:0},600,Ease.circInOut);
		}
	}
}