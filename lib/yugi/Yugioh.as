package yugi {
	import duel.CardGame;
	import duel.util.Mouse;
	import starling.events.Event;
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
			addEventListener(Event.ADDED_TO_STAGE, onAdd);
		}
		
		private function onAdd(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onAdd);
			
			Mouse.init(stage);
		}
	}

}