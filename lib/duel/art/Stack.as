package duel.art {
	import duel.util.Random;
	import starling.display.Quad;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author George
	 */
	public class Stack extends Piece {
		private var quad:Quad;
		public var pieces:Vector.<Piece>;
		public function Stack() {
			super();
			
			pieces = new <Piece>[];
			addChild(quad = new Quad(68, 100, 0xFF00FF));
		}
		public function add(piece:Piece):Piece {
			piece.x = 0;
			piece.y = 0;

			while (numChildren > 0) removeChildAt(0);
			pieces.push(piece);
			//piece.touchable = false;
			return addChild(piece) as Piece;
		}
		public function pop():Piece {
			
			var piece:Piece;
			
			if (pieces.length > 0)
				piece = removeChild(pieces.pop()) as Piece;
				
			if (pieces.length == 0) addChild(quad);
			//piece.touchable = true;
			
			return piece;
		}
		
		public function Shufle():void
		{
			
			var i:int = 0;
			for(i = 0; i < pieces.length; i++ )
			{
				
				var tmp:Piece = pieces[i]  
				var randomInt:int = Random.between(0, pieces.length); 
				pieces	[i] = Piece[randomInt];                         
				Piece[randomInt] = tmp;                            
				
			}
		}
		
		public function shuffling():void 
		{
			var temp:Piece; 
		   
		}
		public function get length():int { return pieces.length; }
	}
}