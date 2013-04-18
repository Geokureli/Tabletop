package duel.art {
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author George
	 */
	public class Stack extends Sprite {
		public var cards:Vector.<Card>;
		public function Stack() {
			super();
			cards = new <Card>[];
		}
		public function add(card:Card):Card {
			card.x = 0;
			card.y = 0;
			
			while (numChildren > 0) removeChildAt(0);
			
			addChild(card);
		}
		public function pop():Card {
			if (cards.length > 0)
				return removeChild(cards.pop());
			return null;
		}
	}

}