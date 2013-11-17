package island.generation
{
import flash.errors.IllegalOperationError;

public class GenerationLayer{
	private var _resolutions:Vector.<int>;
	
	public function GenerationLayer(){
	}

	/**
	 * Given a 2D vector of ints, applies a process to a 2D vector of ints
	 */
	public function apply(tilemap:Vector.<Vector.<int>>, resolution:int):Vector.<Vector.<int>>{
		throw new IllegalOperationError();
	}
	
	/**
	 * Adds a resolution to the object's list
	 */
	public function addResolution(resolution:int):void{
		_resolutions.concat(resolution);
	}
	
	/**
	 * Adds the max/min resolutions, and resolutions from max that are powers of two to the list
	 */
	public function setMinMaxResolution(minResolution:int, maxResolution):void{
		while(maxResolution != minResolution){
			addResolution(maxResolution);
			maxResolution = maxResolution/2;
		}
		addResolution(minResolution);
	}
	
	/**
	 * Returns true if the resolution is found in the list
	 */
	public function usesResolution(resolution:int):Boolean{
		return _resolutions.indexOf(resolution) != -1;
	}
}

}