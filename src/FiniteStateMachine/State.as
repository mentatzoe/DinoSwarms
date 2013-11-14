package FiniteStateMachine
{
	public class State implements IState
	{
		private var _currentAction:IAction;
		private var _entryAction:IAction;
		private var _exitAction:IAction;
		private var _transitions:Vector.<ITransition>;
		/**
		 * 
		 * @param entryAction sets the entry action that will be called on entry into this state
		 * @param exitAction sets the exit action that will be called when leaving this state
		 * @param transitions sets the transitions to call from this state to another
		 */
		public function State()
		{
		}
		/**
		 * Determines the action appropriate for being in this state. 
		 * @return Action for being in this state.
		 */
		public function get action():IAction
		{
			return _currentAction;
		}
		
		public function set action(type:IAction):void
		{
			_currentAction = type;
		}
		
		public function get entryAction():IAction
		{
			return _entryAction;
		}
		
		public function set entryAction(type:IAction):void
		{
			_entryAction = type;
		}
		
		public function get exitAction():IAction
		{
			return _exitAction;
		}
		
		public function set exitAction(type:IAction):void
		{
			_exitAction = type;
		}
		
		public function get transitions():Vector.<ITransition>
		{
			return _transitions;
		}
		
		public function set transitions(type:Vector.<ITransition>):void
		{
			_transitions = type;
		}
	}
}