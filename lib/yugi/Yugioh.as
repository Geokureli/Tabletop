package yugi {
	import duel.CardGame;
	import yugi.art.YugiCard;
	
	/**
	 * ...
	 * @author George
	 */
	public class Yugioh extends CardGame {
		private var card:YugiCard;
		
		public function Yugioh() {
			super();
			
			addChild(card = new YugiCard());
			card.x = 50;
			card.y = 50;
		}
	}

}