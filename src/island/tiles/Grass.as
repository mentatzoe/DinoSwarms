package island.tiles
{
    import flash.events.Event;

    public class Grass extends Tile
    {
        public static const EDIBLE_PERCENT:Number = .5;
        private static const EAT_RATE:Number = 0.001;
        
        private var _ediblePercent:int;
        private var _isEdible:Boolean;
        
        public function Grass(height:Number)
        {
            super();
            _traversable = true;
            _ediblePercent = height;
            _isEdible = (height > EDIBLE_PERCENT);
        }
        
        public override function getColor():uint {
            return 0x33CC33;
        }
        
        public function get EdiblePercent():Number {
            return _ediblePercent;
        }
        
        public function get IsEdible():Boolean {
            return _isEdible;
        }
        
        public function onEatGrass():void {
            _ediblePercent -= EAT_RATE;
            if(_ediblePercent <= 0){
                _isEdible = false;
                addEventListener(Event.
            }
        }
        
        
    }
}