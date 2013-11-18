package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    import dinosaurs.Gallimimus;
    
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
            var dino:Gallimimus = new Gallimimus();
            addChild(dino);
            trace("STAGE DIMENSIONS:");
        }
    }
}