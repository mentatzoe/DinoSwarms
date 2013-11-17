package island.generation.layers
{
import island.generation.GenerationLayer;
import island.generation.MarkovModel;

public class MarkovGenerationLayer extends GenerationLayer
{
	public function MarkovGenerationLayer(){
		//TODO
	}
	
	override public function apply(tilemap:Array.<Array.<int>>, resolution:int):Array.<Array.<int>>{
		//TODO
		return null;
	}
	
	public function setModel(tileType:int, model:MarkovModel):void{
		//TODO
	}
}

}