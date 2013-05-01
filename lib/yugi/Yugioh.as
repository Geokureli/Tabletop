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
			
			addChild(stack1 = new Stack());
			stack1.x = 200;
			stack1.y = stage.stageHeight - stack1.height;
			stack1.onTap = onStackTap;
			stack1.touchable = true;
			
			addChild(stack2 = new Stack());
			stack2.x = 400;
			stack2.y = stage.stageHeight - stack2.height;
			stack2.onTap = onStackTap;
			stack2.touchable = true;
			
			var card:Card;
			for (var x:int = 0; x < stage.stageWidth; x += 100) {
				addChild(card = new YugiCard());
				card.x = x;
				card.y = 50;
				card.onTap = onTap;
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