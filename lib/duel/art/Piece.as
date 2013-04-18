package duel.art {
	import flash.geom.Point;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.display.Sprite;
	import starling.events.TouchPhase;
	
	/**
	 * Basic game piece, updated by main game
	 * @author George
	 */
	public class Piece extends Sprite {
		
		public var onTap:Function, onDoubleTap:Function;
		
		public var draggable:Boolean;
		
		public function Piece() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdd);
			
			draggable = false;
			super.touchable = false;
		}
		
		protected function onAdd(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onAdd);
			//addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void {
			var touch:Touch = e.getTouch(this);
			if (touch != null) {
				if(touch.phase == TouchPhase.MOVED && draggable){ 
					var dis:Point = touch.getMovement(parent);
					x += dis.x;
					y += dis.y;
				}
				if(touch.phase == TouchPhase.ENDED){
					switch(touch.tapCount) {
						case 2: if(onDoubleTap != null) onDoubleTap(); //break;
						case 1: if (onTap != null) onTap(); break;
					}
				}
			}
		}
		override public function get touchable():Boolean { return super.touchable; }
		override public function set touchable(value:Boolean):void {
			
			if (super.touchable == value) return;
			
			if (value)
				addEventListener(TouchEvent.TOUCH, onTouch);
			
			if (!value && hasEventListener(TouchEvent.TOUCH))
				removeEventListener(TouchEvent.TOUCH, onTouch);
			super.touchable = value;
		}
	
	}

}