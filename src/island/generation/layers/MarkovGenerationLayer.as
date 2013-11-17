package island.generation.layers
{
import island.TileMap;
import island.generation.GenerationLayer;
import island.generation.MarkovModel;

public class MarkovGenerationLayer extends GenerationLayer
{
	public function MarkovGenerationLayer(){
		//TODO
	}
	
	override public function apply(tilemap:TileMap, resolution:int):TileMap{
		//TODO
		return null;
	}
	
	public function setModel(tileType:int, model:MarkovModel):void{
		//TODO
	}
}

}