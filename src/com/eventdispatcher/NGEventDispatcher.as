package com.eventdispatcher
{
	import laya.events.EventDispatcher;
	
	public class NGEventDispatcher extends EventDispatcher
	{
		/**
		 *场景切换的  事件调度类  单例模式 
		 * 
		 */		
		private static var _ins:NGEventDispatcher;
		public static const SHOW_PAGE:String="SHOW_PAGE";
		public function NGEventDispatcher(ins:Ins)
		{
			super();
			if(ins==null){
				alert("单例模式，请调用getInstance方法");
				return ;
			}
		}
		public static function getInstance():NGEventDispatcher
		{
			if(_ins==null){
				_ins=new NGEventDispatcher(new Ins());
			}
			return _ins;
		}
	}
}
class Ins{};