package island.tiles
{
import util.Color;

public class Tree extends Tile{
	public static const TREE_COLOR:Color = new Color(0.5, 0.2, 0);
	
	public function Tree(){
		super();
		_traversable = false;
	}
	
	public override function getColor():uint {
		return TREE_COLOR.color;
	}
}
}