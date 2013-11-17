package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    import island.TileMap;
    import island.generation.LevelGeneration;
    import island.generation.layers.RandomGenerationLayer;
    
    public class DinoSwarms extends Sprite
    {
        private var tileMap:TileMap;
        
        public function DinoSwarms()
        {
			var generator:LevelGeneration = new LevelGeneration(0, 0);
			generator.addGenerationLayer(new RandomGenerationLayer());
			tileMap = generator.generate();
			
            addEventListener(Event.ADDED_TO_STAGE, init);
            
        }
        
        private function init(e:Event):void {
            addChild(tileMap);
        }
    }
}