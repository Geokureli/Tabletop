package duel.util {
	/**
	 * ...
	 * @author George
	 */
	public class Random {
		/**
		 * Creates a random number between the specified values.
		 * Random.between(4,10,2) returns a even number between 4 and 10
		 * Random.between(5,10) returns an integer between 5 and 10
		 * Random.between(10) returns an integer between 0 and 10
		 * @param	low: The bottom range of the output. If high is lower, the values are flipped.
		 * @param	high: The top range of the output. If high is lower, the values are flipped.
		 * @param	round: The interval between 2 adjacent expected values. if 0, no rounding is done.
		 * @return a random number between the specified values.
		 */
		static public function between(low:Number, high:Number = 0, round:Number = 1):Number {
			// --- RANDOM NUMBER IN RANGE
			var num:Number = Math.random() * (high - low) + low;
			// --- ROUND TO TARGET INTERVAL
			if (round > 0) int(num / round) * round;
			// --- PROFIT
			return num;
		}
		
		static public function bool(chance:Number = .5):Boolean {  return Math.random() <= chance;  }
		
		
	}

}