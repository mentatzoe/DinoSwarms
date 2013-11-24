package island.tiles
{
import util.Color;

public class Bush extends Tile{
	public static const BUSH_COLOR:Color = new Color(0.70, 1.22, 0.45);
	
	public function Bush()
	{
		super();
		_traversable = true;
	}
	
	public override function getColor():uint {
		return BUSH_COLOR.color;
	}
}
}