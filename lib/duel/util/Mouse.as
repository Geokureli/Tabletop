package duel.util {
	
	import flash.events.IEventDispatcher;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * ...
	 * @author George
	 */
	public class Mouse {
		static public var x:Number, y:Number;
		static public var pressed:Boolean,
							justPressed:Boolean,
							justReleased:Boolean;
		static private var lastPressed:Boolean;
		static private var onTap:Function, onDoubleTap:Function;
		
		static public function init(stage:Stage):void {
			stage.addEventListener(TouchEvent.TOUCH, touchHandle);
			pressed = justPressed = justReleased = lastPressed = false;
		}
		static public function update():void {
			justPressed = !lastPressed &&  pressed;
			justReleased = lastPressed && !pressed;
			
			lastPressed = pressed;
		}
		/* INTERFACE flash.events.IEventDispatcher */
		
		//public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {}
		//public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {}
		//public function dispatchEvent(event:Event):Boolean { return false; }
		//public function hasEventListener(type:String):Boolean { return false; }
		//public function willTrigger(type:String):Boolean { return false; }
		
		static private function touchHandle(e:TouchEvent):void {
			var target:DisplayObject = e.target as DisplayObject;
			var touch:Touch = e.getTouch(target);
			if (touch == null) return;
			x = touch.globalX;
			y = touch.globalY;
			switch(touch.phase) {
				//case TouchPhase.MOVED: break;
				case TouchPhase.BEGAN: pressed = true;  break;
				case TouchPhase.ENDED:
					pressed = false;
					if (touch.tapCount > 0 && onTap != null)
						onDoubleTap();
					if (touch.tapCount == 2 && onDoubleTap != null)
						onDoubleTap();
					break;
			}
			//trace(x, y);
		}
		
	}

}