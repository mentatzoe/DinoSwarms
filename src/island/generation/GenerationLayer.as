package island.generation
{
import flash.errors.IllegalOperationError;

public class GenerationLayer{
	
	public function GenerationLayer(){
		//TODO
	}
	
	/**
	 * 
	 */
	public function apply(tilemap:Vector.<Vector.<int>>, resolution:int):Vector.<Vector.<int>>{
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