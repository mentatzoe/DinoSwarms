package island.generation
{

import island.TileMap;
import island.tiles.Tile;

public class LevelGeneration{
	public static var STARTING_RESOLUTION:int = 256;
	public static var ENDING_RESOLUTION:int = 1;
	
	private var layers:Vector.<GenerationLayer> = new Vector.<GenerationLayer>();
	
	/**Starting with a default map filled with water, with the starting resolution.
	 * We step through each layer of the generator, if the layer can be applied at
	 * the current resolution, it is applied, otherwise skipped for this resolution.
	 * 
	 * After all layers are applied, the resolution is halved and the proccess repeates.
	 * The generation terminates once the last pass has been completed at maximum resolution.
	 */
	public function generate():TileMap{
		//defining locals
		var tileMap:TileMap = new TileMap(); //TileMap we're returning after the generation
		var step : int = 2; //Defines the step in which the resolution will increase ("decrease")
		var currentRes : int = STARTING_RESOLUTION; //Controlling the current resolution
		var i:int, j:int;
		
		//Generating 2D int vector (of tile types);
		var tileTypes : Vector.<Vector.<int>> = new Vector.<Vector.<int>>(TileMap.WIDTH);		
		for(i = 0; i < TileMap.WIDTH; i++){
			tileTypes[i] = new Vector.<int>(TileMap.HEIGHT);
			for(j = 0; j < TileMap.HEIGHT; j++){
				tileTypes[i][j] = 0;
			}
		}
		
		//Applying layers to the int array of tile types on increasing resolution
		while (currentRes >= ENDING_RESOLUTION){
			for each (var layer:GenerationLayer in layers){
				if (layer.usesResolution(currentRes)){
					tileTypes = layer.apply(tileTypes, currentRes);
				}			
			}
			currentRes /= step;
		}
		
		//Convert int array into tileMap	
		for(i = 0; i < TileMap.WIDTH; i++){
			for(j = 0; j < TileMap.HEIGHT; j++){
				tileMap.setTile(i, j, Tile.createTile(tileTypes[i][j])); //If the TileMap is initialized
			}
		}
		
		//Ta-dah!
		return tileMap; 
	}
	
	/**Adds a generation layer to the level generation.  During each pass, generation layers
	 * are applied in the same order that they are added to this generator.
	 */
	public function addGenerationLayer(layer:GenerationLayer):void{
		//Vectors in AS3 = stacks=
		layers.push(layer);
	}
	
	
}

}