package
{
    import flash.display.Sprite;
    import flash.events.Event;
    
    import dinosaurs.Gallimimus;
    
    import island.TileMap;
    import island.generation.LevelGeneration;
    import island.generation.MarkovModel;
    import island.generation.layers.MarkovGenerationLayer;
    import island.generation.layers.RandomGenerationLayer;
    import island.tiles.Tile;
    
    public class DinoSwarms extends Sprite
    {
        private var tileMap:TileMap;
		private var generator:LevelGeneration;
        
        public function DinoSwarms(){
			generator = new LevelGeneration();
			
			var exampleLayer:RandomGenerationLayer = new RandomGenerationLayer();
			exampleLayer.addResolution(64);
			generator.addGenerationLayer(exampleLayer);
			
			var fractalLayer:MarkovGenerationLayer = new MarkovGenerationLayer();
			fractalLayer.setMinMaxResolution(1, 32);
			var fractalModel:MarkovModel = new MarkovModel([[1, 0, 0, 0, 0],
															[0, 1, 0, 0, 0],
															[0, 0, 1, 0, 0],
															[0, 0, 0, 1, 0],
															[0, 0, 0, 0, 1]]);
			fractalLayer.setModel(fractalModel, Tile.DIRT, Tile.GRASS, Tile.SAND, Tile.TREE);
			generator.addGenerationLayer(fractalLayer);
			
			tileMap = new TileMap();
			
            addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event):void {
            addChild(tileMap);
			addEventListener(Event.ENTER_FRAME, stepGenerate);
        }
		
		private function stepGenerate(e:Event):void{
			generator.stepGenerate(tileMap);
			if(generator.finished()){
				generator.finalize(tileMap);
				removeEventListener(Event.ENTER_FRAME, stepGenerate);
				generationFinished();
			}
		}
		
		private function generationFinished():void{
			var dino:Gallimimus = new Gallimimus();
			addChild(dino);
		}
    }
}