package yugi {
	import duel.art.Card;
	import duel.art.Piece;
	import duel.art.Stack;
	import duel.CardGame;
	import starling.events.Event;
	import yugi.art.YugiCard;
	
	/**
	 * ...
	 * @author George
	 */
	public class Yugioh extends CardGame {
		private var cards:Vector.<YugiCard>;
		private var stack1:Stack,
					stack2:Stack;
					
		private var selected:Piece;
		
		public function Yugioh() {
			super();
		}
		override protected function onAdded(e:Event):void {
			super.onAdded(e);
			
			var stack:Stack;
			var x:Number = 50;
			var y:Number = 0;
			for (var i:int = 0; i < 7; i++) {
				y = 0;
				for (var j:int = 0; j < 2; j++) {
					addChild(stack = new Stack());
					stack.x = 10 + x;
					stack.y = stage.stageHeight - (stack.height+20)*2 - y;
					stack.onTap = onStackTap;
					stack.touchable = true;
					y -= stack.height + 10;
					stack.displayMode = Stack.SPREAD
				}
				stack.displayMode = Stack.STACK;
				
				x += 100;
			}
			
			var card:Card;
			for (i = 0; i < 40; i++) {
				stack.add(card = new YugiCard());
				//card.x = x;
				//card.y = 50;
				//card.onTap = onTap;
			}
		}
		
		private function onStackTap(stack:Stack):void {
			
			if (selected != null) {
				//if (stack == selected)
				
				if (selected is Stack) {
					
					var hiliteStack:Stack = selected as Stack;
					
					if(hiliteStack.length > 0)
						stack.add(hiliteStack.pop());
				
					//selected = null;
				} else if (selected is Card) {
					
					selected.onTap = null
					selected.hilite = false;
					stack.add(selected);
					//trace(stack.onTap);
				}
				selected.hilite = false;
				selected = null;
				return;
			}
			selected = stack;
			selected.hilite = true;
		}
		
		private function onTap(card:Card):void {
			
			if (selected != null) {
				selected.hilite = false;
				selected = null;
				if (selected == card)
					return;
			}
			selected = card;
			card.hilite = true;
		}
	}

}