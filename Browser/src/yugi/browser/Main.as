package yugi.browser{
	import card.CardGame;
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author George
	 */
	public class Main extends Sprite {
		private var star:Starling;
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			star = new Starling(CardGame, stage);
		}
		
	}
	
}