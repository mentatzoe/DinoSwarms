package island.tiles
{
import util.Color;

public class Water extends Tile{
	public static const WATER_COLOR:Color = new Color(0.3, 0.3, 1);
	
	public function Water(){
		super();
		_traversable = false;
	}
	
	public override function getColor():uint {
		return WATER_COLOR.color;
	}
}
}