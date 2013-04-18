package duel {
	import duel.art.Piece;
	import starling.display.Sprite;
	import starling.display.DisplayObject;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	/**
	 * ...
	 * @author George
	 */
	public class CardGame extends Sprite {
		public var children:Vector.<Piece>;
		
		public function CardGame() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			children = new <Piece>[];
		}
		
		private function onAdded(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			addEventListener(EnterFrameEvent.ENTER_FRAME, update);
		}
		
		private function update(e:EnterFrameEvent):void {
			
		}
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject {			
			if(child is Piece)
				children.push(child as Piece);
				
			return super.addChildAt(child, index);
		}

	}

}