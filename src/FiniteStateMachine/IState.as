package FiniteStateMachine
{
	public interface IState
	{
		/**
		 * Determines the action appropriate for being in this state. 
		 * @return Action for being in this state.
		 */
		function get action():IAction;
		/**
		 * sets the action returned while in the state.
		 * @param action action to set
		 */
		function set action(type:IAction):void;
		/**
		 * Generates the action for entering this state.
		 * @return The action associated with entering this state.
		 */
		function get entryAction():IAction;
		/**
		 * Sets the action for entering the state.
		 * @param action Entrance action.
		 */
		function set entryAction(type:IAction):void;
		/**
		 * Retrieves the action for exiting this state.
		 * @return The action associated with exiting this state.
		 */
		function get exitAction():IAction;
		/**
		 * Sets the action for exiting the state.
		 * @param action Exit action.
		 */
		function set exitAction(type:IAction):void;
		/**
		 * Accessor for all transitions out of this state.
		 * @return The outbound transitions from this state.
		 */
		function get transitions():Vector.<ITransition>;
		/**
		 * Sets the transition collection for this state.
		 * @param trans the transitions
		 */
		function set transitions(type:Vector.<ITransition>):void;
	}
}