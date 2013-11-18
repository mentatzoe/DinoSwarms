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
                var targetTile:Tile = TileMap.CurrentMap.getTile(_dinosaur.targetPoint.x,_dinosaur.targetPoint.y);
                var currentTile:Tile = TileMap.CurrentMap.getTile(_dinosaur.x,_dinosaur.y);
                if(targetTile == currentTile) _dinosaur.targetPoint = null;
            }
            
            if(!_dinosaur.targetPoint){
                _dinosaur.targetPoint = new Point();
                _dinosaur.targetPoint.x = (TileMap.WIDTH - 1)*Math.random()*TileMap.TILE_SIZE;
                _dinosaur.targetPoint.y = (TileMap.HEIGHT - 1)*Math.random()*TileMap.TILE_SIZE;
            }else{
                //trace(_dinosaur.targetPoint.x + "," + _dinosaur.targetPoint.y);
                var dx:int = Math.abs(_dinosaur.x - _dinosaur.targetPoint.x);
                var dy:int = Math.abs(_dinosaur.y - _dinosaur.targetPoint.y);
                var distance:Number = Math.sqrt(Math.pow(dx,2) + Math.pow(dy,2));
                _dinosaur.x += (dx/distance)*_dinosaur.Speed;
                _dinosaur.y += (dy/distance)*_dinosaur.Speed;
            }
        }
    }
}