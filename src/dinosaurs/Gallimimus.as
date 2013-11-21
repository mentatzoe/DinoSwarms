package dinosaurs
{
    import flash.events.Event;
    import flash.geom.Point;
    
    import FiniteStateMachine.State;
    import FiniteStateMachine.StateMachine;
    import FiniteStateMachine.Transition;
    
    import dinosaurs.behaviors.Eat;
    import dinosaurs.behaviors.SearchForFood;
    
    import island.TileMap;
    import island.tiles.Grass;
    import island.tiles.Tile;

    public class Gallimimus extends Dinosaur
    {        
        public function Gallimimus()
        {
            super();
            _speed = 2;
            graphics.beginFill(0xFF00FF);
            graphics.drawRect(0,0,TileMap.TILE_SIZE*5,TileMap.TILE_SIZE*5);
            graphics.endFill();
            
            _carnivore = false;
            _stateMachine = new StateMachine();
            //Search
            var search:State = new State();
            search.action = new SearchForFood(this).search;
            _stateMachine.currentState = search;
            var searchTransition:Transition = new Transition();
            searchTransition.condition = function():Boolean {
                
                var targetTile:Tile = TileMap.CurrentMap.getTile(targetPoint.x,targetPoint.y);
                var currentTile:Tile = TileMap.CurrentMap.getTile(this.x,this.y);
                if(targetTile != currentTile) return false;
                if(currentTile is Grass){
                    return (currentTile as Grass).IsEdible;
                }
                return false;
            };
            
            //Eat
            var eat:State = new State();
            eat.action = new Eat(this).eat;
            searchTransition.targetState = eat;

        }
        
        protected override function onUpdate(e:Event):void{
            var actions:Array = _stateMachine.update();
            for(var a in actions){
                actions[a]();
            }
        }
    }
}