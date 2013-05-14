package duel.art {
	import duel.util.Random;
	import starling.display.Quad;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author George
	 */
	public class Stack extends Piece {
		
		static public const STACK:String = "stack",
							SPREAD:String = "spread";
		
		private var back:Quad;
		public var pieces:Vector.<Piece>;
		
		public var maxSize:int;
		public var spreadWidth:Number;
		private var _displayMode:String;
		
		public function Stack() {
			super();
			
			pieces = new <Piece>[];
			
			addChild(back = new Quad(68, 100, 0xFF00FF));
		}
		public function add(piece:Piece):Piece {
			piece.x = 0;
			piece.y = 0;
			pieces.push(piece);
			switch(displayMode) {
				case STACK:
					while (numChildren > 0) removeChildAt(0);
					//break;
				case SPREAD:
					addChild(piece);
					spreadPieces();
					break;
			}
			return piece;
		}
		
		private function spreadPieces():void {
			if (numChildren > 0) {
				
				var w:Number = pieces[0].width;
				var space:Number = (spreadWidth - w) / pieces.length;
				var x:Number = (w - spreadWidth) / 2;
				for (var i:int = 0; i < pieces.length; i++) {
					pieces[i].x = x;
					x += space;
				}
			}
		}
		public function pop():Piece {
			
			var piece:Piece;
			
			if (pieces.length > 0) {
				
				piece = removeChild(pieces.pop()) as Piece;
				
				
				if (pieces.length == 0) addChild(back);
				else addChild(pieces[pieces.length - 1]);
				//piece.touchable = true;
			}
			
			return piece;
		}
		
		private function redraw():void {
			while (numChildren > 0) removeChildAt(0);
			switch(displayMode) {
				case STACK:
					if (back != null && pieces.length == 0) addChild(back);
					else addChild(pieces[pieces.length - 1]);
					break;
				case SPREAD:
					for each (var item:Piece in pieces)
						addChild(item);
					spreadPieces();
					break;
			}
		}
		
		public function shuffle():void
		{
			
			var i:int = 0;
			for(i = 0; i < pieces.length; i++ )
			{
				
				var tmp:Piece = pieces[i]  
				var randomInt:int = Random.between(0, pieces.length); 
				pieces	[i] = pieces[randomInt];                         
				pieces[randomInt] = tmp;                            
				
			}
		}

		public function get length():int { return pieces.length; }
		
		public function get displayMode():String { return _displayMode; }
		public function set displayMode(value:String):void {
			if (value == _displayMode) return;
			
			_displayMode = value;
			redraw();
		}
		
	}
}