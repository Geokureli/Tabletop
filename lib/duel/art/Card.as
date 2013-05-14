package duel.art {
	import flash.display.Bitmap;
	import starling.display.Quad;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author George
	 */
	public class Card extends Piece {
		
		private var _faceUp:Boolean;
		
		protected var frontImg:DisplayObject,
						backImg:DisplayObject;
		
		internal var something:Boolean;
		
		public function Card() {
			super();
			_faceUp = true;
		}
		
		public function loadGraphic(url:String, isFront:Boolean = true):void {
			//TODO: load from url
		}
		
		public function embedImage(graphic:Class, isFront:Boolean = true):void {
			
			if (isFront) {
				frontImg = Image.fromBitmap(new graphic());
				
				// --- DISPLAY FRONT
				if (faceUp) addChild(frontImg);
			} else {
				
				backImg = Image.fromBitmap(new graphic());
				// --- DISPLAY BACK
				if (!faceUp) addChild(backImg);
			}
			
		}
		/**
		 * Whether to display the front or back of the card
		 */ 
		public function get faceUp():Boolean { return _faceUp; }
		public function set faceUp(value:Boolean):void {
			if (_faceUp == value) return;
			
			var face:DisplayObject = _faceUp ? frontImg : backImg;
			// --- REMOVE OPPOSITE SIDE FROM DISPLAY
			if (contains(face)) removeChild(face);
			
			_faceUp = value;
			
			face = _faceUp ? frontImg : backImg;
			// --- DISPLAY NEW SIDE
			if (face != null) addChild(face);
		}
		
		public function addBitmap(graphic:Bitmap, isFront:Boolean = true):void {
			if (isFront) {
				frontImg = Image.fromBitmap(graphic);
				
				// --- DISPLAY FRONT
				if (faceUp) addChild(frontImg);
			} else {
				
				backImg = Image.fromBitmap(graphic);
				// --- DISPLAY BACK
				if (!faceUp) addChild(backImg);
			}
		}
		
	}

}