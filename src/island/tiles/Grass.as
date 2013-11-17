package island.tiles
{
public class Grass extends Tile
{
	public static const EDIBLE_PERCENT:Number = .5;
	private static const EAT_RATE:Number = 0.001;
	
	private var _ediblePercent:int;
	private var _isEdible:Boolean;
	private var _growRate:Number;
	
	public function Grass(height:Number,growRate:Number){
		super();
		_traversable = true;
		_ediblePercent = height;
		_isEdible = (height > EDIBLE_PERCENT);
		_growRate = growRate;
	}
	
	public override function getColor():uint {
		return 0x33CC33;
	}
	
	public function get EdiblePercent():Number {
		return _ediblePercent;
	}
	
	public function get IsEdible():Boolean {
		return _isEdible;
	}
	
	public function onEatGrass():void {
		_ediblePercent -= EAT_RATE;
		_isEdible = (_ediblePercent > 0);
	}
	
	private function grow():void {
		_ediblePercent = Math.min(_ediblePercent+_growRate,1);
	}
	
	public override function onUpdate():void {
		grow();
	}
}
}