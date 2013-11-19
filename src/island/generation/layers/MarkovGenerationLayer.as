package island.generation.layers
{
import flash.utils.Dictionary;

import island.generation.GenerationLayer;
import island.generation.MarkovModel;
import island.tiles.Tile;


public class MarkovGenerationLayer extends GenerationLayer
{
	private var MMArray:Dictionary = new Dictionary();
	
	public function MarkovGenerationLayer() {
	
	}
	
	override public function apply(tilemap:Vector.<Vector.<int>>, width:int, height:int):Vector.<Vector.<int>>{
		//create copy of tilemap
		var x:int, y:int;
		var tilemapCopy:Vector.<Vector.<int>> = new Vector.<Vector.<int>>(width);
		for (x = 0; x < width; x++) {
			tilemapCopy[x] = new Vector.<int>(height);
			for (y = 0; y < height; y++) {
				tilemapCopy[x][y] = tilemap[x][y];
			}
		}
		
		//loop through both tilemaps
		//apply appropriate markov model to each tile using the copy to check neihbors
		////at each tile, getNeibors(tile)
		////doMath()
		////setTile()
		
		for(x = 0; x < width; x++){
			for(y = 0; y < height; y++){
				var model:MarkovModel = MMArray[tilemapCopy[x][y]];
				var neighborArray:Vector.<Number> = getNeighborArray(tilemapCopy, x, y, width, height);
				if(model){
					var probability:Vector.<Number> = model.apply(neighborArray);
					tilemap[x][y] = chooseTile(probability);
				}
			}
		}	
		return tilemap;
	}
	
	public function setModel(model:MarkovModel, ... tileTypes):void{
		if(tileTypes.length != 0){
			for each (var type:int in tileTypes){
				MMArray[type] = model;
			}
		}else{
			for(var i:int = 0; i<Tile.NUM_TILES; i++){
				MMArray[i] = model;
			}
		}
	}
	
	private function getNeighborArray(tilemapCopy, x, y, width, height):Vector.<Number>{
		var count:Vector.<Number> = new Vector.<Number>(Tile.NUM_TILES);
		for (var i:int = -1; i < 2; i++) {
			for (var j:int = -1; j < 2; j++) {
				if (x + i == -1 || x + i == width ||  y + j == -1 || y + j == height) {
					count[Tile.WATER]++;
				} else {
					count[tilemapCopy[x + i][y + j]]++;
				}
			}
		}
		return count;
	}
	
	private function chooseTile(probability):int{
		var tileType:int;
		var rndNum:Number = Math.random();
		var sum:Number = 0;
		
		for each(var value:Number in probability) {
			sum += value;
		}
		rndNum *= sum;
		
		for (var i:int = 0; i < probability.length; i++) {
			rndNum -= probability[i];
			if (rndNum <= 0)
				return i;
		}
		trace(rndNum);
		throw("got past rng tile choice.");
	}
}

}