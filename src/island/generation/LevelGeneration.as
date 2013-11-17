package island.generation
{

import island.TileMap;

public class LevelGeneration{
	public static var STARTING_RESOLUTION:int = 256;
	public static var ENDING_RESOLUTION:int = 1;
	
	private var layers:Vector.<GenerationLayer>;
	
	public function LevelGeneration(width:int, height:int){
		//TODO
	}
	
	/**Starting with a default map filled with water, with the starting resolution.
	 * We step through each layer of the generator, if the layer can be applied at
	 * the current resolution, it is applied, otherwise skipped for this resolution.
	 * 
	 * After all layers are applied, the resolution is halved and the proccess repeates.
	 * The generation terminates once the last pass has been completed at maximum resolution.
	 */
	public function generate():TileMap{
		//TODO
		return null;
	}
	
	/**Adds a generation layer to the level generation.  During each pass, generation layers
	 * are applied in the same order that they are added to this generator.
	 */
	public function addGenerationLayer(layer:GenerationLayer):void{
		//TODO
	}
}

}