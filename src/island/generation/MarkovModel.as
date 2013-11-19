package island.generation
{

public class MarkovModel{
	
	private var _model:Vector.<Vector.<Number>>;
	
	/**MarkovModel
	 * 
	 * Initializes the class with a probability matrix.
	 * 
	 * @params: rows Vector.<Vector.<Number>>
	 * */
	
	public function MarkovModel(rows:Vector.<Vector.<Number>>){
		_model = rows;
	}
	
	
	/**
	 * apply (*)
	 * 
	 * This function multiplies the model matrix with a user vector input.
	 * 
	 * @params: input Vector.<Number>
	 * @return: result Vector.<Number>
	 * 
	 * */
	public function apply(input:Vector.<Number>):Vector.<Number>{
		var result:Vector.<Number> = new Vector.<Number>(input.length);
		var column:int, row:int;

		for (column = 0; column<_model.length; column++){
			for (row = 0; row<_model.length; row++){
				result[column] += _model[row][column] * input[row];
			}
		}
		
		return result;
	}
}

}