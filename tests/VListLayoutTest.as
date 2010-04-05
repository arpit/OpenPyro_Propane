package 
{
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertFalse;
	import org.openPyro.layout.virtualized.VListLayout;
	import org.openPyro.layout.virtualized.VRenderersRange;

	public class VListLayoutTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testVirtualizedLayout():void{
			var layout:VListLayout = new VListLayout();
			layout.setItemRendererDimensions(100, 50);
			layout.setContainerDimensions(100, 200);
			var r:VRenderersRange = layout.renderersRange;
			Assert.assertTrue(r.topIndex==0,"Fail: TopIndex was not 0 when no 0 offset was applied")
			Assert.assertTrue(r.bottomIndex == 3, "Fail: BottomIndex was not computed corrently");
			
			layout.setItemRendererDimensions(100, 30);
			Assert.assertTrue(r.bottomIndex == 6, "Fail: BottomIndex was not computed corrently")
		}
		
		[Test]
		public function testPositionsWithVerticalOffset():void{
			var layout:VListLayout = new VListLayout();
			layout.verticalScrollOffset = 10;
			layout.setItemRendererDimensions(100, 50);
			layout.setContainerDimensions(100, 200);
			var r:VRenderersRange = layout.renderersRange;
			Assert.assertTrue("Not computing offset positions correctly ",r.topRendererTopOffset == -10)
		}
	}
}