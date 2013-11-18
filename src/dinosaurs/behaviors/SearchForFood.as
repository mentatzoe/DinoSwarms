package dinosaurs.behaviors
{    
    import flash.geom.Point;
    
    import dinosaurs.Dinosaur;
    
    import island.TileMap;
    import island.tiles.Tile;
    
    public class SearchForFood extends Behavior
    {        
        public function SearchForFood(dino:Dinosaur)
        {
            super(dino);
        }
        
        public function search():void {
            //search for shit to eat
            if(_dinosaur.targetPoint){
				var dx:Number = Math.abs(_dinosaur.targetPoint.x - _dinosaur.x);
				var dy:Number = Math.abs(_dinosaur.targetPoint.y - _dinosaur.y);
				var distance:Number = Math.sqrt(Math.pow(dx,2) + Math.pow(dy,2));
				if(distance <= _dinosaur.Speed){
					_dinosaur.x = _dinosaur.targetPoint.x;
					_dinosaur.y = _dinosaur.targetPoint.y;
				}
				trace("target: ( "+_dinosaur.targetPoint.x+", "+_dinosaur.targetPoint.y+"), dino: ("+_dinosaur.x+", "+_dinosaur.y+")");
                var targetTile:Tile = TileMap.CurrentMap.getTile(_dinosaur.targetPoint.x,_dinosaur.targetPoint.y);
                var currentTile:Tile = TileMap.CurrentMap.getTile(Math.floor(_dinosaur.x),Math.floor(_dinosaur.y));
				if(currentTile == targetTile) _dinosaur.targetPoint = null;
            }
            
            if(!_dinosaur.targetPoint){
				var rand:Number = Math.random();
				trace("rand: "+rand);
                _dinosaur.targetPoint = new Point();
                _dinosaur.targetPoint.x = (TileMap.WIDTH - 1)*Math.random()*TileMap.TILE_SIZE;
                _dinosaur.targetPoint.y = (TileMap.HEIGHT - 1)*Math.random()*TileMap.TILE_SIZE;
            }else{
				//trace("x:"+_dinosaur.targetPoint.x + ", y: "+_dinosaur.targetPoint.y);
                var dx:Number = (_dinosaur.targetPoint.x - _dinosaur.x);
                var dy:Number = (_dinosaur.targetPoint.y - _dinosaur.y);
                var distance:Number = Math.sqrt(Math.pow(dx,2) + Math.pow(dy,2));
                _dinosaur.x += (dx/distance)*_dinosaur.Speed;
                _dinosaur.y += (dy/distance)*_dinosaur.Speed;
            }
        }
    }
}