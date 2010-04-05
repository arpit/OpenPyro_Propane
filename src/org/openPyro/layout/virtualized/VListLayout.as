package org.openPyro.layout.virtualized
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ItemResponder;

	public class VListLayout extends EventDispatcher implements IVirtualizedLayout
	{
		public function VListLayout() 
		{
		}
		
		private var _itemRendererHeight:Number = NaN;
		public function setItemRendererDimensions(width:Number, height:Number):void{
			_itemRendererHeight = height;
			if(isReady){
				calculateItemRendererPositions();
			}
		}
		
		private var _containerHeight:Number = NaN;
		public function setContainerDimensions(width:Number, height:Number):void{
			_containerHeight = height;
			if(isReady){
				calculateItemRendererPositions();
			}
		}
		
		private var _verticalScrollOffset:Number = 0;
		public function set verticalScrollOffset(n:Number):void{
			if(_verticalScrollOffset == n) return;
			_verticalScrollOffset = n;
			if(isReady){
				calculateItemRendererPositions();
			}
		}
		
		public function calculateItemRendererPositions():VRenderersRange{
			var r:VRenderersRange = new VRenderersRange();
			r.topIndex = Math.floor(_verticalScrollOffset/_itemRendererHeight)
			r.bottomIndex = Math.floor((_verticalScrollOffset+_containerHeight)/_itemRendererHeight);
			r.topRendererTopOffset = (r.topIndex*_itemRendererHeight)-_verticalScrollOffset
			_renderersRange = r;
			return r;
			
		}
		
		protected var _renderersRange:VRenderersRange
		public function get renderersRange():VRenderersRange{
			return _renderersRange;
		}
		
		public function get isReady():Boolean{
			return (!isNaN(_itemRendererHeight) && !isNaN(_containerHeight))
		}
	}
}