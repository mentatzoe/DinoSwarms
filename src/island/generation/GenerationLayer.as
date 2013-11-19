package island.generation
{
import flash.errors.IllegalOperationError;

public class GenerationLayer{
	private var _resolutions:Vector.<int> = new Vector.<int>();
	
	public function GenerationLayer(){
	}

	/**
	 * Applies a process to a 2D vector of ints at a specific resolution and returns a 2D vector of ints.
	 */
	public function apply(tilemap:Vector.<Vector.<int>>, width:int, height:int):Vector.<Vector.<int>>{
		throw new IllegalOperationError();
	}
	
	/**
	 * Adds a resolution to the object's list
	 */
	public function addResolution(resolution:int):void{
		_resolutions.push(resolution);
	}
	
	/**
	 * From max resolution, adds resolutions of powers of two in descending order to the list, adding
	 * min resolution last.
	 */
	public function setMinMaxResolution(minResolution:int, maxResolution):void{
		if(minResolution < maxResolution){
			throw ("Minimum resolution should be larger than maximum resolution");
		}
		while(minResolution >= maxResolution){
			addResolution(minResolution);
			minResolution = minResolution/2;
		}
	}
	
	/**
	 * Returns true if the resolution is found in the list
	 */
	public function usesResolution(resolution:int):Boolean{
		return _resolutions.indexOf(resolution) != -1;
	}
}

}