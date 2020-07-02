package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Star extends MovieClip {
		var core:Object;
		
		
		public function Star() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, onAdd);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemove);
		}
		private function onRemove(E:Event){
			removeEventListener(Event.ENTER_FRAME,loop);
		}
		private function onAdd(e:Event){
			core = MovieClip(root);
			this.y=Math.random() * root.stage.stageHeight;
			this.x=Math.random() * root.stage.stageWidth;
			this.scaleX = Math.random() * 2; 
			this.scaleY = this.scaleX; 
			
			this.addEventListener(Event.ENTER_FRAME,loop);
		}
		
			
		private function loop(e:Event){
			this.y+=1.5;
			if(this.y > stage.stageHeight){
				this.y=0;
			}
		}
	}
	
}
