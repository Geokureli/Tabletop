package yugi.browser{
	import duel.CardGame;
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	import yugi.Yugioh;
	
	/**
	 * ...
	 * @author George
	 */
	public class Main extends Sprite {
		private var star:Starling;
		
		public function Main() {
			super();
			setup();
		}
		private function setup():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			Starling.multitouchEnabled = true;
			star = new Starling(Yugioh, stage);
			star.start();
		}
		
	}
	
}