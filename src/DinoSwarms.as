package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    import island.TileMap;
    
    public class DinoSwarms extends Sprite
    {
        private var tileMap:TileMap;
        
        public function DinoSwarms()
        {
            tileMap = new TileMap();
            addEventListener(Event.ADDED_TO_STAGE, init);
            
        }
        
        private function init(e:Event):void {
            addChild(tileMap);
        }
    }
}