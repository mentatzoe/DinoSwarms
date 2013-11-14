package FiniteStateMachine
{
	import Dinosaur.Dinosaur;

	public interface IAction
	{
		function doAction():void;
		
		function get move():Array;
		
		function getMove(type:Dinosaur):Array;
	}
}