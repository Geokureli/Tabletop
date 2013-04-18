package yugi.art {
	import duel.art.Card;
	
	/**
	 * ...
	 * @author George
	 */
	public class YugiCard extends Card {
		[Embed(source = "../res/card.jpg")] static private const CARD:Class;
		public function YugiCard() {
			super();
			embedImage(CARD);
		}
		
	}

}