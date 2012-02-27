//Marks the right margin of code *******************************************************************
package view
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import caurina.transitions.Tweener;
	
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * This is the typical format of a simple multiline comment
	 * such as for a <code>Food<code> class.
	 * 
	 * <p><u>REVISIONS</u> : <br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Email</th><th>Description</th></tr>
	 * <tr><td>[Oct 17, 2009]</td><td>[srivello]</td><td>presentations@RivelloMultimediaConsulting.com</td><td>Class created.</td></tr>
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
	public class Food extends FoodView
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		/**
		 * This constrains where movement happens (bouncing off walls to stay inside here)
		 * 
		 */		
		public function get targetDestination () 				: Point 			{ 	return _targetDestination_point; 		}
		public function set targetDestination (aValue : Point) 	: void 				{ 	_targetDestination_point = aValue; 		}
		private var _targetDestination_point : Point;
		
		/**
		 * The amount of energy this contains
		 */		
		public function get calories () 				: uint 	{ 	return _calories_uint; 		}
		public function set calories (aValue : uint) 	: void 	{ 	_calories_uint = aValue; 	}
		private var _calories_uint : uint;
		
		/**
		 * The current state (unnatended, attended, being eaten, that sorta thing)
		 */		
		public  function get state () 					: FoodState 	{ 	return _foodState; 		}
		//private function set state (aValue : FoodState) 	: void 			{ 	_foodState = aValue; 	}
		private var _foodState : FoodState;
		
		
		//PUBLIC CONST
		public static const DESTROY : String = "DESTROY";
		
		//PRIVATE
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * This is the typical format of a simple multiline comment
		 * such as for a <code>Food</code> constructor.
		 */
		public function Food (aLayoutBounds_rectangle : Rectangle)
		{
			//SUPER
			super (); 
			
			//VARIABLES
			
			//PROPERTIES
			_foodState = FoodState.UNTARGETED;
			_calories_uint = 10;
			_targetDestination_point = new Point (
							aLayoutBounds_rectangle.left + Math.random()*(aLayoutBounds_rectangle.right - aLayoutBounds_rectangle.left),
							aLayoutBounds_rectangle.top + Math.random()*(aLayoutBounds_rectangle.bottom - aLayoutBounds_rectangle.top)
							);
			
			//JUST CALL ONCE INTERNALLY INSTEAD OF FROM API FOR NOW
			doTick();						
						
			
			//METHODS
			
			//EVENTS
			
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
			//move
			x = targetDestination.x;
			y = targetDestination.y;
		}
		
		/**
		 * Update State and Return Self : Targeted
		 * 
		 * @return Food
		 */	
		public function setStateToTargetedAndReturnInstance (aVidita : Vidita) : Food 
		{				
			_foodState = FoodState.TARGETED;
			return this;
		}
		
		/**
		 * Update State and Return Self : Being Eaten,( NOT USED YET - FOOD IS INSTANTLY EATEN FOR NOW)
		 * 
		 * @return Food
		 */	
		public function setStateToBeingEatenAndReturnInstance (aVidita : Vidita) : Food 
		{				
			_foodState = FoodState.BEING_EATEN;
			return this;
		}
		
		/**
		 * Update State and Return Self : Eaten
		 * 
		 * @return Food
		 */	
		public function setStateToEatenAndReturnInstance (aVidita : Vidita) : Food 
		{				
			_foodState = FoodState.EATEN;
			aVidita.calories += _calories_uint; //return calories
			_prepareToDestroy();
			return null; //remove reference from the eater
		}
		
		/**
		 * Animate death before destroying itself
		 * 
		 * @return void
		 */	
		private function _prepareToDestroy () : void 
		{			
			
			Tweener.addTween	(this,
				{	
					scaleX 		: 0,
					scaleY 		: 0,
					time   		: .2,
					transition  : "easeInElastic", 
					onComplete  : onPrepareToDestroyComplete
					
				}
			);
		}

		
		//PRIVATE	
		
		
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

			dispatchEvent( new Event (DESTROY));
		}
		
		
	}
}