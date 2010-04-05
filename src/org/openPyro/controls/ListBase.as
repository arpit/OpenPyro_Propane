package org.openPyro.controls
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import org.openPyro.core.ClassFactory;
	import org.openPyro.core.IUIControl;
	import org.openPyro.layout.virtualized.IVirtualizedLayout;
	import org.openPyro.layout.virtualized.RendererPool;
	import org.openPyro.layout.virtualized.VListLayout;
	
	public class ListBase extends Sprite
	{
		private var _layout:IVirtualizedLayout;
		
		public function ListBase(layout:IVirtualizedLayout)
		{
			super();
		}
		private var rendererPool:RendererPool;
		
		public function set itemRenderer(cf:ClassFactory):void{
			rendererPool = new RendererPool();
			var instance:DisplayObject = DisplayObject(cf.newInstance());
			_layout.setItemRendererDimensions(instance.width, instance.height);
		}
		
		public function setSize(w:Number, height:Number):void{
			
		}
	}
}