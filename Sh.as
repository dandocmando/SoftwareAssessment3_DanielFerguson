package  {


	 
			
		
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;
    import flash.events.MouseEvent;
	import flash.display.Sprite;
	
	
	public class Sh extends MovieClip {
		
		var core:Object;
		var rightPressed:Boolean;
		var leftPressed:Boolean;
		var upPressed:Boolean;
		var downPressed:Boolean;
		var speed:int;
		var direction:String;
		var hitObj:int;
		//var bullets:Vector.<Sprite> = new Vector.<Sprite>();
		
		//static public const hitObj= false;
		//var gforce:Boolean=true;
		
		
		
		public function Sh() {
			// constructor code
			 hitObj = 68;
			this.addEventListener(Event.ADDED_TO_STAGE, onAdd);
		}
	
	private function onAdd(e:Event)
	{	
		
		core = MovieClip(root);
		this.x=root.stage.stageWidth/2;
		this.y=root.stage.stageHeight/2;
		this.addEventListener(Event.ENTER_FRAME,loop);
		
		//this.addEventListener(Event.ENTER_FRAME,gravity);
		
		
		speed=8;
		
	}
	/*private function shoot(e:MouseEvent){

		
		var bullet:Bullet = new Bullet(); 
      
		bullet.x = this.x; 
		bullet.y = this.y - (this.height * 0.5); 
		trace("shot");
      
    
      
		bullets.push(bullet); 
      
		addChild(bullet);
		
		if(bullets.length != 0) { 
			
			for(var i:int = 0; i < bullets.length; i++) 
			{ 
				bullets[i].y -= 10; 
          
				
          
			if(bullets[i].y < 0) { 
				
				removeChild(bullets[i]); 
				bullets[i] = null; 
				bullets.splice(i, 1); 
			} 
		} 
	}
		
		
	}*/
	
	private function loop(e:Event)
	{
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress,false,0,true);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease,false,0,true);
		stage.addEventListener(Event.ENTER_FRAME,keyControl,false,0,true);
		stage.addEventListener(Event.ENTER_FRAME, collision);
		//stage.addEventListener(MouseEvent.MOUSE_DOWN, shoot);
		boundary();
		//trace(core.gameStart.asteroids[3]); // never worked anyway
		//this.y=this.y+2;
		
		
		//trace(core.numChildren);
		//collision();
		
		//for (var i:uint = 404; i<core.numChildren; i++){
			//var target:MovieClip = core.getChildAt(i);
			
		
	}
	function collision(e:Event){
	
		
	for (var asteroidCount: int = 0; asteroidCount < core.asteroids.length; asteroidCount++) {
		
		if (core.ship.hitTestObject(core.asteroids[asteroidCount])) {
			hitObj = 69;
			
			removeEventListener(Event.ENTER_FRAME,loop);
			//trace(hitObj);
			//removeChild(core.asteroids[d]);
			//trace("fuck yes");
		}
                
	} 
}
	
	
	private function onKeyPress(e:KeyboardEvent)
	{
		if (e.keyCode == Keyboard.RIGHT)
		{
			rightPressed = true;
			direction="right";
		}
		if (e.keyCode == Keyboard.LEFT)
		{
			leftPressed = true;
			direction="left";
		}
		if (e.keyCode == Keyboard.UP)
		{
			upPressed = true;
			direction="up";
			//trace(direction);
		}
		if (e.keyCode == Keyboard.DOWN)
		{
			downPressed = true;
			direction="down";
		}
	}
	private function onKeyRelease(e:KeyboardEvent)
	{
		if (e.keyCode == Keyboard.RIGHT)
		{
			rightPressed = false;
		}
		if (e.keyCode == Keyboard.LEFT)
		{
			leftPressed = false;
		}
		if (e.keyCode == Keyboard.UP)
		{
			upPressed = false;
		}
		if (e.keyCode == Keyboard.DOWN)
		{
			downPressed = false;
		}
	}
	
	private function keyControl(e:Event)
	{
		if (rightPressed)
		{
			x+=speed;
		}
		if (leftPressed)
		{
			x-=speed;
		}
		if (upPressed)
		{
			y-=speed;
		}
		if (downPressed)
		{
			y+=speed;
		}
			
	}
	function boundary()
	{
		if(this.x-this.width/2<0){
			trace("left");
			speed=0;
			if(direction!="left"){
				speed=5;
			}
		}
		if(this.x+this.width/2>stage.stageWidth){
			trace("right");
			speed=0;
			if(direction!="right"){
				speed=5;
			}
		
		}
		if(this.y-this.height/2<0){
			trace("up");
			speed=0;
			if(direction!="up"){
				speed=5;
			}
		
		}
		if(this.y+this.height/2>stage.stageHeight){
			trace("down");
			speed=0;
			if(direction!="down"){
				speed=5;
			}
		
		}
		
		
	}
	
	public function getcollision():int{
		return hitObj;
	}
}
}

