package org.openPyro.layout.virtualized
{
	public interface IVirtualizedLayout
	{
		function setItemRendererDimensions(width:Number, height:Number):void
		function get isReady():Boolean;
	}
}