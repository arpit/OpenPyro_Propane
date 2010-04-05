package org.openPyro.layout.virtualized
{
	import flash.utils.Dictionary;
	
	import org.openPyro.core.ClassFactory;
	import org.openPyro.core.IDataRenderer;
	import org.openPyro.core.IUIControl;

	public class RendererPool
	{
		
		public function RendererPool()
		{
		}
		
		private var _dataProvider:Array;
		private var _uidMap:Dictionary;
		private var _renderersFactory:ClassFactory;
		
		public function init(renderersFactory:ClassFactory, dataProvider:Array):void{
			_renderersFactory = renderersFactory;
			_dataProvider = dataProvider; 
			_uidMap = new Dictionary();
		}
		
		public function getRendererForUID(uid:ListUID):*{
			if(_uidMap[uid]){
				return _uidMap[uid]
			}
			//else
			var renderer:* = _renderersFactory.newInstance();
			if(renderer is IUIControl){
				IUIControl(renderer).initialize();
			}
			if(renderer is IDataRenderer){
				IDataRenderer(renderer).data = uid.data;
			}
			
		}
		
		
		
		
	}
}