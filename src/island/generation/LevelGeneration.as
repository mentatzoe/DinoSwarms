package island.generation
{

import island.TileMap;
import island.tiles.Tile;

public class LevelGeneration{
	public static var STARTING_RESOLUTION:int = 256;
	public static var ENDING_RESOLUTION:int = 1;
	public static var RESOLUTION_STEP:int = 2;
	
	private var _layers:Vector.<GenerationLayer> = new Vector.<GenerationLayer>();
	
	private var _currentRes:int = STARTING_RESOLUTION;
	private var _currentLayer:int = 0;
	private var _tileTypeMap:Vector.<Vector.<int>>; 
	
	public function LevelGeneration(){
		_tileTypeMap = new Vector.<Vector.<int>>(TileMap.WIDTH);
		for(var i:int = 0; i < TileMap.WIDTH; i++){
			_tileTypeMap[i] = new Vector.<int>(TileMap.HEIGHT);
			for(var j:int = 0; j < TileMap.HEIGHT; j++){
				_tileTypeMap[i][j] = Tile.WATER;
			}
		}
	}
	
	/**Adds a generation layer to the level generation.  During each pass, generation layers
	 * are applied in the same order that they are added to this generator.
	 */
	public function addGenerationLayer(layer:GenerationLayer):void{
		_layers.push(layer);
	}
	
	/**Applies a single layer to the tilemap, and updates the image
	 * of the tilemap.  If no more layers are found, the resilution is
	 * halved and the current layer is set back to the begining.  If the
	 * resolution is at maximum, this method does nothing.
	 * 
	 * This method does not update the tilemap data, only the image.  To
	 * apply the generator to the tilemap, use finalize()
	 * 
	 * @param tileMap to step the generation on
	 */
	public function stepGenerate(tileMap:TileMap):void{
		var i:int, j:int;
		var subI:int, subJ:int;
		
		if(_currentRes == 0){
			return;
		}
		
		while(!_layers[_currentLayer].usesResolution(_currentRes)){
			nextLayer();
			if(_currentRes == 0){
				return;
			}
		}
		
		_tileTypeMap = _layers[_currentLayer].apply(_tileTypeMap, TileMap.WIDTH / _currentRes, TileMap.HEIGHT / _currentRes);	
		
		for(i = 0; i < TileMap.WIDTH; i++){
			for(j = 0; j < TileMap.HEIGHT; j++){
				subI = i / _currentRes;
				subJ = j / _currentRes;
				tileMap.drawTile(i, j, Tile.getSimpleTileColor(_tileTypeMap[subI][subJ]));
			}
		}
		
		nextLayer();
	}
	
	/**Apply the current generator state to the tilemap.  This creates all
	 * relevant tiles and places them into the tilemap.
	 * 
	 * @param tileMap to finalize the generator state into
	 */
	public function finalize(tileMap:TileMap):void{
		var i:int, j:int;
		
		for(i = TileMap.WIDTH-1; i>=0; i--){
			for(j = TileMap.HEIGHT-1; j>=0; j--){
				tileMap.setTile(i, j, Tile.createTile(_tileTypeMap[i].pop()));
			}
			_tileTypeMap.pop();
		}
	}
	
	/**Returns whether or not the generator has finished generation
	 * 
	 * @returns Boolean
	 */
	public function finished():Boolean{
		return _currentRes == 0;
	}
	
	/**Increments the internal state to the next layer.  If a new
	 * layer cannot be found, double the resolution and keep searching
	 */
	private function nextLayer():void{
		_currentLayer++;
		
		if(_currentLayer == _layers.length){
			_currentLayer = 0;
			_currentRes /= RESOLUTION_STEP;
			
			if(_currentRes < ENDING_RESOLUTION){
				return;
			}
			
			for(var i:int = TileMap.WIDTH / _currentRes - 1; i >= 0; i--){
				for(var j:int = TileMap.HEIGHT / _currentRes - 1; j >= 0; j--){
					var subI:int = i/RESOLUTION_STEP;
					var subJ:int = j/RESOLUTION_STEP;
					_tileTypeMap[i][j] = _tileTypeMap[subI][subJ];
				}
			}
		}
	}
}

}