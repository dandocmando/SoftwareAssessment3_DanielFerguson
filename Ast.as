package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	
	public class Ast extends MovieClip {
		var core:Object;
		var global:MovieClip = MovieClip(root);
		//var localGameFinished:int = new int;
		var speed:int = new int;
		
		
		
		public function Ast() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, onAdd);
			this.addEventListener(Event.ENTER_FRAME, asteroidRemove);

			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemove);
			//var localGameFinished=global.gameFinished;
			
		}
		private function onRemove(e:Event){
			removeEventListener(Event.ENTER_FRAME,loop);
		}
		private function onAdd(e:Event){
			core = MovieClip(root);
			speed=8;
			speed=6+Math.floor(Math.random( ) * 8) + 1;
			
			this.y=root.stage.stageHeight;
			
			
			this.x=Math.random() * root.stage.stageWidth;
			
			this.addEventListener(Event.ENTER_FRAME,loop);
		}
		private function loop(e:Event){
			
			
			

			
			this.y+=speed;
			if(this.y-this.height/2>stage.stageHeight){ //when the asteroids body is past the bottom boundary its sent back to the top
				
				
				this.y=0-Math.random() * 100;
				this.x=Math.random() * root.stage.stageWidth; //when the asteroid goes up to the top it will get a new x position
				
				
			}
		}
	}
	
}
