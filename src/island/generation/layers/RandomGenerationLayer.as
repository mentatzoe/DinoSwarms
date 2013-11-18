package island.generation.layers
{
import island.generation.GenerationLayer;

public class RandomGenerationLayer extends GenerationLayer
{
	public function RandomGenerationLayer(){
		super();
	}
	
	override public function apply(tilemap:Vector.<Vector.<int>>, resolution:int):Vector.<Vector.<int>>{
		for(var x:int = 0; x < tilemap.length; x += resolution){
			for(var y:int = 0; y < tilemap[x].length; y += resolution){
				tilemap[x][y] = (int)(Math.random() * 5);
			}
		}
		return tilemap;
	}
}
}