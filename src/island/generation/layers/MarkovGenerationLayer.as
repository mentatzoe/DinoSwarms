package island.generation.layers
{
import flash.utils.Dictionary;
import island.generation.GenerationLayer;
import island.generation.MarkovModel;


public class MarkovGenerationLayer extends GenerationLayer
{
	var MMArray:Dictionary = new Dictionary();
	
	public function MarkovGenerationLayer() {
	
	}
	
	override public function apply(tilemap:Vector.<Vector.<int>>):Vector.<Vector.<int>>{
		//create copy of tilemap
		var tilemapCopy:Vector.<Vector.<int>> = new Vector.<Vector.<int>>(tilemap.length);
		for (var x:int = 0; x < tilemap.length; x++) {
			tilemapCopy[x] = new Vector.<int>(tilemap[x].length);
			for (var y:int = 0; y < tilemap[x].length; y++) {
				tilemapCopy[x][y] = tilemap[x][y];
			}
		}
		
		//loop through both tilemaps
		//apply appropriate markov model to each tile using the copy to check neihbors
		////at each tile, getNeibors(tile)
		////doMath()
		////setTile()
		
		for(var x:int = 0; x < tilemap.length; x++){
			for(var y:int = 0; y < tilemap[x].length; y++){
				var probability:Vector.<Number> = MMArray[tilemapCopy[x][y]].apply(getNeighborArray(tilemapCopy, x, y));
				tilemap[x][y] = chooseTile(probability);
			}
		}	
		return tilemap;
	}
	
	public function setModel(tileType:int, model:MarkovModel):void{
		//set markov models
		MMArray[tileType] = model;
	}
	
	private function getNeighborArray(tilemapCopy, x, y) {
		var count:Vector.<Number> = new Vector.<Number>(Tile.NUM_TILES);
		for (var i:int = -1; i < 2; i++) {
			for (var j:int = -1; j < 2; j++) {
				if (x + i == -1 || x + i == tilemapCopy.length ||  y + j == -1 || y + j == tilemapCopy[x].length) {
					count[Tile.WATER]++;
				} else {
					count[tilemapCopy[x + i][y + j]]++;
				}
			}
		}
		return count;
	}
	
	private function chooseTile(probability) {
		var tileType:int;
		var rndNum:Number = Math.random();
		var sum:Number;
		
		for each(var value:Number in probability) {
			sum += value;
		}
		rndNum *= sum;
		for (var i:int = 0; i < probability.length; i++) {
			rndNum -= probability[i];
			if (rndNum <= 0)
				return i;
		}
		throw("got past rng tile choice.");
	}
	
}

}