package island.generation.layers
{
import island.generation.GenerationLayer;
import island.tiles.Tile;

public class RandomGenerationLayer extends GenerationLayer
{
	public function RandomGenerationLayer(){
		super();
	}
	
	override public function apply(tilemap:Vector.<Vector.<int>>, width:int, height:int):Vector.<Vector.<int>>{
		for(var x:int = 0; x < width; x++){
			for(var y:int = 0; y < height; y++){
				tilemap[x][y] = Math.random() * 5;
			}
		}
		return tilemap;
	}
}
}