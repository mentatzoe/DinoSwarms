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
    import island.generation.layers.DirtBaseGenerationLayer;
    
    public class DinoSwarms extends Sprite{
        private var _tileMap:TileMap;
		private var _generator:LevelGeneration;
        
        public function DinoSwarms(){
			initGenerator();
			
			_tileMap = new TileMap();
			
            addEventListener(Event.ADDED_TO_STAGE, init);
        }
		
		private function initGenerator():void{
			_generator = new LevelGeneration();
			
			var exampleLayer:DirtBaseGenerationLayer = new DirtBaseGenerationLayer();
			exampleLayer.addResolution(4); 
			_generator.addGenerationLayer(exampleLayer);
			
			var fractalLayer:MarkovGenerationLayer = new MarkovGenerationLayer();
			fractalLayer.setMinMaxResolution(64, 1);
			var fractalModel:MarkovModel = new MarkovModel([[1, 0, 0, 0, 0],
															[0, 1, 0, 0, 0],
															[0, 0, 0, 0, 0],
															[0, 0, 0, 0, 0],
															[0, 0, 0, 0, 0]]);
			fractalLayer.setModel(fractalModel, Tile.DIRT, Tile.GRASS, Tile.SAND, Tile.TREE);
			_generator.addGenerationLayer(fractalLayer);
		}
        
        private function init(e:Event):void {
            addChild(_tileMap);
			addEventListener(Event.ENTER_FRAME, stepGenerate);
        }
		
		private function stepGenerate(e:Event):void{
			_generator.stepGenerate(_tileMap);
			if(_generator.finished()){
				_generator.finalize(_tileMap);
				removeEventListener(Event.ENTER_FRAME, stepGenerate);
				//generationFinished();
			}
		}
		
		private function generationFinished():void{
			for(var i:int = 0; i<70;i++){
				var dino:Gallimimus = new Gallimimus();
				addChild(dino);
			}
		}
    }
}