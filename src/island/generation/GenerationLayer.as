package island.generation
{
import island.TileMap;
import flash.errors.IllegalOperationError;

public class GenerationLayer
{
	public function GenerationLayer(){
		//TODO
	}
		
	public function apply(tilemapIn:TileMap, resolution:int):TileMap{
		throw new IllegalOperationError();
	}
		
	public function addResolution(resolution:int):void{
		//TODO
	}
		
	public function setMinMaxResolution(minResolution:int, maxResolution):void{
		//TODO
	}
}

}