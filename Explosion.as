package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	
	public class Explosion extends MovieClip {
		var core:Object;
		
		
		public function Explosion() {
			// constructor code
			var timer:Timer = new Timer(1000, 3);
			timer.addEventListener(TimerEvent.TIMER, tick);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, complete);
			timer.start();

				
			}
			function complete(e:TimerEvent){
				//trace("fucking nigger");
				stop()
				this.visible = false;
				
			
			
			
		}
		function tick(e:TimerEvent){
			
		}
	}
	
}
