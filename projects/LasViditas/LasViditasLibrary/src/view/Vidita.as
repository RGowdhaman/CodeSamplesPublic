//Marks the right margin of code *******************************************************************
package view
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import caurina.transitions.Tweener;
	
	import com.gskinner.utils.Rndm;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	import mx.events.PropertyChangeEvent;
	
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * This is the typical format of a simple multiline comment
	 * such as for a <code>Vidita<code> class.
	 * 
	 * <p><u>REVISIONS</u> : <br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Email</th><th>Description</th></tr>
	 * <tr><td>[Oct 14, 2009]</td><td>[srivello]</td><td>presentations@RivelloMultimediaConsulting.com</td><td>Class created.</td></tr>
	 * <tr><td>[MM/DD/YYYY]</td><td>[AUTHOR]</td><td>[EMAIL]</td><td>[DESCRIPTION.]</td></tr>
	 * </table>
	 * </p>
	 * 
	 * @example Here is a code example.  
	 * <listing version="3.0" >
	 * 	//Code example goes here.
	 * </listing>
	 *
	 * <span class="hide">Any hidden comments go here.</span>
	 *
	 */
	public class Vidita extends ViditaView
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		/**
		 * This constrains where movement happens (bouncing off walls to stay inside here)
		 * 
		 */		
		public function get movementBounds () 			: Rectangle 			{ 	return _movementBounds_rectangle; 		}
		public function set movementBounds (aValue : Rectangle) 	: void 		{ 	_movementBounds_rectangle = aValue; 		}
		private var _movementBounds_rectangle : Rectangle;
		
		/**
		 * This constrains where movement happens (bouncing off walls to stay inside here)
		 * 
		 */		
		public function get foodArray () 				: Array 		{ 	return _food_array; 		}
		public function set foodArray (aValue : Array) 	: void 			{ 	_food_array = aValue; 		}
		private var _food_array : Array;
		
		/**
		 * Store some calories (in fat!)
		 * 
		 */		
		[Bindable(event="Event")] 
		public function get calories () 				: Number 		{ 	return _calories_num; 		}
		public function set calories (aValue : Number) 	: void 			{ 	_calories_num = aValue; 	dispatchEvent (new Event (Event.CHANGE));	}
		private var _calories_num : Number;
		
		/**
		 * Burn some calories!
		 * 
		 */		
		public function get caloriesMetabolizedPerTick () 					: Number 		{ 	return _caloriesMetabolizedPerTick_num; 		}
		public function set caloriesMetabolizedPerTick (aValue : Number) 	: void 			{ 	_caloriesMetabolizedPerTick_num = aValue; 		}
		private var _caloriesMetabolizedPerTick_num : Number;
		
		/**
		 * This constrains where movement happens (bouncing off walls to stay inside here)
		 * 
		 */		
		public function get speedFactor () 			: uint 			{ 	return _speedFactor_uint; 		}
		public function set speedFactor (aValue : uint) 	: void 	{ 	_speedFactor_uint = aValue; 		}
		private var _speedFactor_uint : uint;
		
		/**
		 * This constrains where movement happens (bouncing off walls to stay inside here)
		 * 
		 */		
		public function get targetFood () 				: Food 			{ 	return _target_food; 		}
		public function set targetFood (aValue : Food) 	: void 	{ 	_target_food = aValue; 		}
		private var _target_food : Food;
		
		/**
		 * This constrains where movement happens (bouncing off walls to stay inside here)
		 * 
		 */		
		public function get targetDestination () 				: Point 			{ 	return _targetDestination_point; 		}
		public function set targetDestination (aValue : Point) 	: void 	{ 	_targetDestination_point = aValue; 		}
		private var _targetDestination_point : Point;
		
		/**
		 * The current state (unnatended, attended, being eaten, that sorta thing)
		 */	
		[Bindable(event="Event")] 
		public  function get state () 					: ViditaState 	{ 	return _viditaState; 		}
		private function set state (aValue : ViditaState) 	: void 			{ 	_viditaState = aValue;  dispatchEvent (new Event ("propertyChange"));	}
		private var _viditaState : ViditaState;
		
		/**
		 * This constrains where movement happens (bouncing off walls to stay inside here)
		 * 
		 */		
		public function get foodFindingStrategy () 				: ViditaFoodFindingStrategy 			{ 	return _foodFindingStrategy; 		}
		//public function set foodFindingStrategy (aValue : ViditaFoodFindingStrategy) 				: void 	{ 	_foodFindingStrategy = aValue; 		}
		private var _foodFindingStrategy : ViditaFoodFindingStrategy;
		
		/**
		 * This changes physical size onscreen
		 * 
		 */		
		public function get scaleFactor () 			: uint 			{ 	return _scaleFactor_uint; 		}
		public function set scaleFactor (aValue : uint) 	: void 	{ 	
			
			//animate a size change
			if (_scaleFactor_uint != aValue ) {
				_scaleFactor_uint = aValue; 
				
				Tweener.addTween	(this,
					{	
						scaleX 		: _scaleOriginal_num*_scaleFactor_uint/100,
						scaleY 		: _scaleOriginal_num*_scaleFactor_uint/100,
						time   		: 3,
						transition  : "easeInAndOut" 
						
					}
				);
			}
			
		}
		private var _scaleFactor_uint : uint;
		
		
		//PUBLIC CONST
		/**
		 * Start all speed calculations with this value for desired effect.
		 * 
		 * @default SPEED_BASE_AMOUNT 
		 */
		public static const SPEED_BASE_AMOUNT : uint = 20;
		
		/**
		 * Event Name dispatched to remove itself from ecosystem
		 * 
		 * @default DESTROY 
		 */
		public static const DESTROY : String = "DESTROY";
		
		//PRIVATE
		/**
		 * Pixels moved every frame in direction : X
		 */
		private var _speedX_int : int;		
		
		/**
		 * Pixels moved every frame in direction : Y
		 */
		private var _speedY_int : int;		
		
		/**
		 * Scale original - the scale factor is always applied (for 0 to 1.0) multiplier effect
		 */
		private var _scaleOriginal_num : int;		
		
		/**
		 * Handles Timer
		 */
		private var _blinkEyesOpen_timer : Timer;		
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the typical format of a simple multiline comment
		 * such as for a <code>Vidita</code> constructor.
		 *
		 * <span class="hide">Any hidden comments go here.</span>
		 *
		 * @param param1 Describe param1 here.
		 * @param param2 Describe param2 here.
		 */
		public function Vidita (aLayoutBounds_rectangle : Rectangle)
		{
			//SUPER
			super (); 
			
			//VARIABLES
			
			//PROPERTIES
			movementBounds = aLayoutBounds_rectangle;
			_speedFactor_uint = 50; //overwritten from API
			_scaleFactor_uint = 50; //overwritten from API
			_scaleOriginal_num = 5;
			_targetDestination_point = null ; //overritten from API
			_calories_num = 20;
			_caloriesMetabolizedPerTick_num = .1;
			_foodFindingStrategy = ViditaFoodFindingStrategy.RANDOM_AND_UNTARGETED;
			_viditaState = ViditaState.IDLE
			
			//METHODS
			x = Math.random()*movementBounds.right;
			y = Math.random()*movementBounds.bottom;
			_speedX_int = Rndm.sign()*(Math.random()*10 + 1);
			_speedY_int = Rndm.sign()*(Math.random()*10 + 1);
			gotoAndStop (FrameLabelConstants.VIDITA_IDLE);	
			
			var f : GlowFilter = new GlowFilter (0xFFFFFF, .8, 5, 5, 3, 1);
			filters = [f]
			
			rotation = Math.ceil(Math.random()*4) *90;
			
			//TWEEN UP SIZE
			scaleX = scaleY = 0; //instantly change size
			scaleFactor = 3; //tween to a new size

			
			//
			_blinkEyesOpen_timer = new Timer (200,1);
			_blinkEyesOpen_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onBlickEyesOpenTimerComplete);

		}
		 
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//PUBLIC	
		/**
		 * Called externally every time the ecosystem 'ticks' ahead with time
		 * 
		 * @return void
		 */	
		public function doTick () : void 
		{				
			if (_viditaState != ViditaState.DEAD) {
				
				updateTargetFood();
				
				if (_targetDestination_point != null && _target_food != null) {
					
					_targetDestination_point = new Point (_target_food.x, _target_food.y);
					
					var target_point : Point = _targetDestination_point;
					var targetAngleRadians_num : Number = Math.atan2((target_point.y-y),(target_point.x-x));
					var targetAngleDegrees_num : Number = targetAngleRadians_num*(360/Math.PI)
					rotation = targetAngleDegrees_num;
					
					
					//UPDATE MOVEMENT VECTORS
					_speedX_int = SPEED_BASE_AMOUNT*Math.cos(targetAngleRadians_num);//converts to radians
					_speedY_int = SPEED_BASE_AMOUNT*Math.sin(targetAngleRadians_num); //converts to radians
				
				
					//GROWTH (WHILE ALIVE ONLY)
					_updateGrowth();
				}
				//MOVE BY MOVEMENT VECTORS (COULD BE FROM A TARGET OR COULD BE AIMLESSLY BOUNCING OFF WALLS)
				x +=  _speedX_int*(_speedFactor_uint/100);
				y +=  _speedY_int*(_speedFactor_uint/100);
				
				_bounceOffWalls();
				_consumeNearbyFood();
				_metabolize();
				_checkForDeath();
			}
		}
		
		
		//PRIVATE	
		/**
		 * Bounce off all the walls
		 * 
		 * @return void
		 */
		private function _bounceOffWalls ( ) : void 
		{
			if (x - width/2 < movementBounds.left) {
				x = movementBounds.left + width/2;
				_speedX_int = -_speedX_int;
				_blinkEyesOpen();
			} else if (x + width/2 > movementBounds.right) {
				x = movementBounds.right - width/2;
				_speedX_int = -_speedX_int;
				_blinkEyesOpen();
			}
			
			if (y - height/2 < movementBounds.top) {
				y = movementBounds.top + height/2;
				_speedY_int = -_speedY_int;
				_blinkEyesOpen();
			} else if (y + height/2 > movementBounds.bottom) {
				y = movementBounds.bottom - height/2;
				_speedY_int = -_speedY_int;
				_blinkEyesOpen();
			}
			
		}
		
		/**
		 * Choose 1 target food and follow until its gone (someone eats it);
		 * 
		 * @return void
		 */
		private function updateTargetFood ( ) : void 
		{
			//WHILE THERE IS FOOD AVAILABLE
			if (_target_food == null && _food_array != null && _food_array.length > 0) {
				
				switch (_foodFindingStrategy) {
					case ViditaFoodFindingStrategy.RANDOM_AND_UNTARGETED:
						_findRandomUntargetedFood();
						break;
					case ViditaFoodFindingStrategy.CLOSEST_AND_UNTARGETED:
						_findClosestUntargetedFood();
						break;
				}
				
			}
		}
		
		/**
		 * Choose Food. Randomly
		 * 
		 * @return void
		 */
		private function _findRandomUntargetedFood ( ) : void 
		{
			//FIND FOOD THAT IS NOT BEING TARGETED OR EATEN (THUS ITS AVAILABLE)
			var possibleTarget_food : Food;
			do {
				possibleTarget_food = (_food_array [Math.floor( _food_array.length*Math.random())] as Food);
				
				//trace ("randomly found this one: " + possibleTarget_food.state);
				//trace ("possibleTarget_food.state == FoodState.UNTARGETED: " + (possibleTarget_food.state == FoodState.UNTARGETED));
				if (possibleTarget_food.state == FoodState.UNTARGETED) {
					//SELECT AND TARGET A FOOD
					_target_food = possibleTarget_food.setStateToTargetedAndReturnInstance(this);
					//trace ("so targeting " + _target_food);
					return;
				}
			} while (possibleTarget_food.state == FoodState.UNTARGETED);
			
			//DON'T SELECT ANYTHING
			_target_food = null;
			return ;
			
		}
		/**
		 * Choose Food. Randomly
		 * 
		 * @return void
		 */
		private function _findClosestUntargetedFood ( ) : void 
		{
			//FIND FOOD THAT IS NOT BEING TARGETED OR EATEN (THUS ITS AVAILABLE)
			var possibleTarget_food : Food;
			do {
				possibleTarget_food = (_food_array [Math.floor( _food_array.length*Math.random())] as Food);
				
				if (possibleTarget_food.state == FoodState.UNTARGETED) {
					//SELECT AND TARGET A FOOD
					_target_food = possibleTarget_food.setStateToTargetedAndReturnInstance(this);
					return;
				}
			} while (possibleTarget_food.state == FoodState.UNTARGETED);
			
			//DON'T SELECT ANYTHING
			_target_food = null;
			return ;
			
		}
		
		/**
		 * if close enough, eat food
		 * 
		 * @return void
		 */
		private function _consumeNearbyFood ( ) : void 
		{
			
			if (_target_food) {
				
				var distance_num : Number = Math.sqrt ( 
														Math.pow ( _target_food.x - x,2) +
														Math.pow ( _target_food.y - y,2)
														);
				if (distance_num < 15) {
					//eat calories and destroy it
					trace ("eating!");
					_target_food = _target_food.setStateToEatenAndReturnInstance(this);
				}
			} else {
				updateTargetFood();
				
			}
			
		}
		
		/**
		 * Burn Calories
		 * 
		 * @return void
		 */
		private function _metabolize ( ) : void 
		{
			_calories_num -= _caloriesMetabolizedPerTick_num;
		}
		
		/**
		 * Grow!
		 * 
		 * @return void
		 */
		private function _updateGrowth ( ) : void 
		{
			scaleFactor = 3 * 10*_calories_num/20;
			
		}
		
		/**
		 * Dead?
		 * 
		 * @return void
		 */
		private function _checkForDeath ( ) : void 
		{
			if (_calories_num <= 1) {
				_prepareToDestroy();
			}
			
		}
		
		/**
		 * Bounce off all the walls
		 * 
		 * @return void
		 */
		private function _blinkEyesOpen ( ) : void 
		{
			gotoAndStop (FrameLabelConstants.VIDITA_BLINK);
			_blinkEyesOpen_timer.start();
			
		}

		
		/**
		 * Animate death before destroying itself
		 * 
		 * @return void
		 */	
		private function _prepareToDestroy () : void 
		{			
			trace ("prepare2");
			_viditaState = ViditaState.DEAD;
			gotoAndStop (FrameLabelConstants.VIDITA_DEAD);
			
			Tweener.addTween	(this,
				{	
					scaleX 		: scaleX*.5,
					scaleY 		: scaleY*.5,
					time   		: 1,
					transition  : "easeInOut", 
					onComplete  : onPrepareToDestroyComplete
					
				}
			);
		}
		

		
		
		//--------------------------------------
		//  Events
		//--------------------------------------		
		/**
		 * when animation out is done
		 * 
		 * @return void
		 */	
		private function onPrepareToDestroyComplete () : void 
		{			
			trace ("dead");
			dispatchEvent( new Event (DESTROY));
		}

		/**
		 * Handles the event: TimerEvent.TIMER
		 */
		private function onBlickEyesOpenTimerComplete (aEvent : TimerEvent) : void
		{
			gotoAndStop (FrameLabelConstants.VIDITA_IDLE);		
		}
		
		
	}
}