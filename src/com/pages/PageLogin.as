package com.pages
{
	import com.eventdispatcher.NGEventDispatcher;
	
	import laya.events.Event;
	import laya.media.SoundManager;
	import laya.utils.Ease;
	import laya.utils.Tween;
	
	import ui.LoginUI;
	
	public class PageLogin extends LoginUI
	{
		public function PageLogin()
		{
			super();
			box_login.alpha=0;
			box_login.scale(0.1,0.1);
			box_login.centerY=800;
//			Tween.to(box_login,{alpha:1,scaleX:1,scaleY:1},300,Ease.circInOut,null,300);
			Tween.to(box_login,{alpha:1,centerY:0,scaleX:1,scaleY:1},600,Ease.circInOut,null,200);
			ipt_userName.on(Event.FOCUS,this,onFus);
			ipt_userName.on(Event.INPUT,this,onInput);
			ipt_userPwd.on(Event.FOCUS,this,onFus);
			ipt_userPwd.on(Event.INPUT,this,onInput);
			ipt_userName.on(Event.FOCUS_CHANGE,this,onLoseFocus);
			ipt_userPwd.on(Event.FOCUS_CHANGE,this,onLoseFocus);
			btn_login.on(Event.CLICK,this,onLogin);
			btn_back.visible=btn_exit.visible=btn_setting.visible=false;
		}
		
		private function onLoseFocus(e:Event):void
		{
			// TODO Auto Generated method stub
			trace("loseFocus:"+ e.currentTarget )
			if(e.currentTarget==ipt_userName){
				ipt_userName.changeText("用户名");
			}
			
		}
		
		private function onInput(e:Event):void
		{
			// TODO Auto Generated method stub
			trace("input:"+e.target);
			
		}
		
		private function onFus(e:Event):void
		{
			// TODO Auto Generated method stub
			trace("focus:"+e.currentTarget);
			if(ipt_userName.focus){
				ipt_userName.text="";
			}
			if(ipt_userPwd.focus){
				ipt_userPwd.text="";
			}
//			var input:TextInput=e.currentTarget as TextInput;
//			input.text="";
			
		}
		
		private function onLogin():void
		{
			// TODO Auto Generated method stub
			if(ipt_userName.text.replace(" ","").length==0){
				lab_msg.visible=true;
				lab_msg.changeText("请检查您的用户名！");
				SoundManager.playSound("sound/错误.WAV",1);
			}
			else if(ipt_userPwd.text.replace(" ","").length==0){
				lab_msg.visible=true;
				lab_msg.changeText("请输入密码！");
				SoundManager.playSound("sound/错误.WAV",1);
			}
			else{
				lab_msg.changeText("");
				NGEventDispatcher.getInstance().event(NGEventDispatcher.SHOW_PAGE,Main.P_SYMK);
				
			}
		}
	}
}