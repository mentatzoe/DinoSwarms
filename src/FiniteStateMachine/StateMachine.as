package FiniteStateMachine
{
	public class StateMachine implements IStateMachine
	{
		private var _currentState:IState;
		
		public function StateMachine()
		{
		}
		/**
		 * The member function that performs the update on the FSM:
		 * - Test transitions for current state and moves to new state.
		 * - Returns a collection of IActions that result from the current
		 *   state and any transitions, entrances and exits that may occur.
		 * @return A collection of actions produced by evaluating the FSM.
		 */
		public function update():Vector.<IAction>
		{
			var actions:Vector.<IAction> = new Vector.<IAction>;
			var transitions:Vector.<ITransition> = new Vector.<ITransition>;
			
			
			for(var trans:ITransition in transitions){
				if(trans.isTriggered()){
					if(_currentState.exitAction != null){
						actions.push(_currentState.exitAction);
					}
					if(trans.action != null){
						actions.push(trans.action);
					}
					_currentState = trans.targetState;
					if(_currentState.entryAction != null){
						actions.push(_currentState.entryAction);
					}
					break;
				}
			}
			actions.push(_currentState.action);
			return actions;
		}
		/**
		 * Retrieves the current state of the finite state machine.
		 * @return The current state of the finite state machine.
		 */
		public function get currentState():IState
		{
			return _currentState;
		}
		
		public function set currentState(type:IState):void
		{
			_currentState = type;
		}
	}
}