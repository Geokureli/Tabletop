package yugi.art {
	import duel.art.Card;
	import duel.util.Random;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import starling.display.Sprite;
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author George
	 */
	public class YugiCard extends Card {
		[Embed(source="../res/card.png")] static private const CARD:Class;
		[Embed(source = "../res/card_back.png")] static private const SLEEVE:Class;
		
		static private const WIDTH:int = 68,
							HEIGHT:int = 100,
							BORDER:Number = 6;
		static private var RANDOM_SEED:int = 0;
		
		public function YugiCard() {
			super();
			addChild(frontImg = randomCard);
			embedImage(SLEEVE, false);
			
		}
		override protected function onAdd(e:Event):void {
			super.onAdd(e);
			//draggable = 
			touchable = true;
			//onDoubleTap = dblTap
		}
		
		//private function dblTap():void { faceUp = !faceUp; }
		static private function get randomCard():DisplayObject {
			var cardImg:Sprite = new Sprite();
			var quad:Quad;
			cardImg.addChild(new Quad(WIDTH, HEIGHT, 0));
			cardImg.addChild(quad = new Quad(WIDTH-BORDER, HEIGHT-BORDER, randomColor));
			quad.x = quad.y = BORDER/2;
			return cardImg;
		}
		static private function get randomColor():int {
			return Random.between(0xFFFFFF);
		}
	}

}