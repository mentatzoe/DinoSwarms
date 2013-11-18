package island
{
import events.TileEvent;

import flash.display.Sprite;
import flash.events.Event;

import island.tiles.Sand;
import island.tiles.Tile;
import island.tiles.Water;

public class TileMap extends Sprite
{
	public static const WIDTH:int = 256;
	public static const HEIGHT:int  = 256;
	
	private static const TILE_SIZE:int = 5;
	
	private var tileMap:Array = [];
	
	public function TileMap(){
		super();
		
		//i = row
		//j = column
		//In order to access tileMap[x][y]
		for(var i:int = 0; i<WIDTH; i++){
			var column:Array = [];
			for(var j:int = 0; j<HEIGHT; j++){
				var r:int = Math.random()*2;
				column.push((r == 1)?new Sand:new Water);
			}
			tileMap.push(column);
		}
		
		addEventListener(Event.ADDED_TO_STAGE,init);
	}
	
	private function init(e:Event):void {
		stage.addEventListener(TileEvent.ON_TILE,onTileEvent,false,0,true);
		stage.addEventListener(TileEvent.EAT_GRASS,eatGrass,false,0,true);
		addEventListener(Event.ENTER_FRAME, onUpdate);
	}
	
	private function onUpdate(e:Event):void {
		for(var x:int = 0; x<WIDTH; x++){
			for(var y:int = 0; y<HEIGHT; y++){
				var tile:Tile = tileMap[x][y];
				tile.onUpdate();
			}
		}
		draw();
	}
	
	private function onTileEvent(e:TileEvent):void {
		
	}
	
	private function eatGrass(e:TileEvent):void {
		
	}
	
	private function draw():void {
		for(var x:int = 0; x<WIDTH; x++){
			for(var y:int = 0; y<HEIGHT; y++){
				var tile:Tile = tileMap[x][y];
				graphics.beginFill(tile.getColor());
				graphics.drawRect(x*TILE_SIZE,y*TILE_SIZE,TILE_SIZE,TILE_SIZE);
				graphics.endFill();
			}
		}
	}
	
	public function get Map():Array {
		return tileMap;
	}
	
	public function getTile(x:int, y:int):Tile {
		return tileMap[x][y];
	}
	
	
	/**
	 * setTile
	 * 
	 * setter for each individual tile
	 * 
	 * @params: int x, int y, Tile t
	 * */
	public function setTile(x:int, y:int, t:Tile):void {
		tileMap[x][y] = t;
	}
}
}