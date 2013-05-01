package yugi.art {
	import duel.art.Card;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author George
	 */
	public class YugiCard extends Card {
		[Embed(source="../res/card.png")] static private const CARD:Class;
		[Embed(source="../res/card_back.png")] static private const SLEEVE:Class;
		public function YugiCard() {
			super();
			embedImage(CARD);
			embedImage(SLEEVE, false);
			
		}
		override protected function onAdd(e:Event):void {
			super.onAdd(e);
			//draggable = 
			touchable = true;
			//onDoubleTap = dblTap
		}
		
		//private function dblTap():void { faceUp = !faceUp; }
	}

}