package duel.art {
	import flash.display.InteractiveObject;
	import flash.geom.Point;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.display.Sprite;
	import starling.events.TouchPhase;
	import starling.filters.ColorMatrixFilter;
	import starling.filters.FragmentFilter;
	
	/**
	 * Basic game piece, updated by main game
	 * @author George
	 */
	public class Piece extends Sprite {
		
		static private const MOVE_THRESHOLD:Number = 10;
		
		private var moved:Boolean;
		private var totalMoved:Point;
		private var _hilite:Boolean;
		
		public var onTap:Function, onDoubleTap:Function, onDrop:Function;
		
		public var draggable:Boolean, canToggle:Boolean, toggled:Boolean;
		
		public function Piece() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdd);
			
			draggable = false;
			touchable = false;
			totalMoved = new Point();
		}
		
		protected function onAdd(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onAdd);
			addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void {
			var touch:Touch = e.getTouch(this);
			if (touch != null) {
				switch(touch.phase) {
					case TouchPhase.BEGAN:
						totalMoved.x = totalMoved.y = 0;
						break;
					case TouchPhase.MOVED:
						moved ||= true;
						
						if (draggable) {
							var dis:Point = touch.getMovement(parent);
							totalMoved.x += dis.x;
							x += dis.x;
							totalMoved.y += dis.y;
							y += dis.y;
						}
						break;
					case TouchPhase.ENDED:
						if (!draggable || totalMoved.length < MOVE_THRESHOLD) {
							switch(touch.tapCount) {
								case 2: if(onDoubleTap != null) onDoubleTap(this); //break;
								case 1:
									if (onTap != null) onTap(this);
									
									break;
							}
						} else if(onDrop != null) onDrop(this);
						
						moved = false;
						break;
				}
			}
		}
		override public function dispose():void {
			super.dispose();
			totalMoved = null;
		
			onTap = onDoubleTap = onDrop = null;
		}
		
		public function get hilite():Boolean { return _hilite; }
		public function set hilite(value:Boolean):void {
			if (value == _hilite) return;
			if (value) {
				filter = new ColorMatrixFilter(new <Number>[
					1, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 0, 0,
					0, 0, 0, 1, 0 
				]);
			} else filter = null;
									
			_hilite = value;
		}
		
	
		
	}

}