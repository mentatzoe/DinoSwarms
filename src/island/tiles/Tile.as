package island.tiles
{
import flash.errors.IllegalOperationError;

public class Tile{
	public static var WATER:int = 0;
	public static var DIRT:int = 1;
	public static var GRASS:int = 2;
	public static var SAND:int = 3;
	public static var TREE:int = 4;
	
	protected var _traversable:Boolean;
	
	public function Tile(){
		super();
	}
	
	public function getColor():uint {
		throw new IllegalOperationError();
	}
	
	public function onUpdate():void {
		throw new IllegalOperationError();
	}
}
}