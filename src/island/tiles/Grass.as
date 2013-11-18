package island.tiles
{
    public class Grass extends Tile
    {
        public static const MIN_EDIBLE_PERCENT:Number = .5;
        private static const EAT_RATE:Number = 0.001;
        
        private var _eatenPercent:int;
        private var _isEdible:Boolean;
        private var _growRate:Number;
        
        public function Grass(height:Number,growRate:Number)
        {
            super();
            _traversable = true;
            _eatenPercent = height;
            _isEdible = (height > MIN_EDIBLE_PERCENT);
            _growRate = growRate;
        }
        
        public override function getColor():uint {
            return 0x33CC33;
        }
        
        public function get EatenPercent():Number {
            return _eatenPercent;
        }
        
        public function get IsEdible():Boolean {
            _isEdible = (_eatenPercent > MIN_EDIBLE_PERCENT);
            return _isEdible;
        }
        
        public function onEatGrass():void {
            _eatenPercent -= EAT_RATE;
            _isEdible = (_eatenPercent > 0);
        }
        
        private function grow():void {
            _eatenPercent = Math.min(_eatenPercent+_growRate,1);
        }
        
        public override function onUpdate():void {
            grow();
        }
    }
}