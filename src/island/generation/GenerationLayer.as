package island.generation
{
import flash.errors.IllegalOperationError;

import island.TileMap;

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
	
	public function usesResolution(resolution:int):Boolean{
		//TODO
		return false;
	}
}

}