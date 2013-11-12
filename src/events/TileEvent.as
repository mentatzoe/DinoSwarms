package events
{
    import flash.events.Event;
    import flash.geom.Point;
    
    public class TileEvent extends Event
    {
        public static const TRAMPLE:String = "Trample";
        public static const ON_TILE:String = "On Tile";
        public static const EAT_GRASS:String = "Eat Grass";
        
        private var _data:*;
        private var _x:int,_y:int;
        public function TileEvent(type:String, x:int, y:int, bubbles:Boolean=false, cancelable:Boolean=false, data:* = null)
        {
            super(type, bubbles, cancelable);
            _data = data;
            _x = x;
            _y = y;
        }
        
        public function get Data():* {
            return _data;
        }
        
        public function get X():int {
            return _x;
        }
        
        public function get Y():int {
            return _y;
        }
    }
}