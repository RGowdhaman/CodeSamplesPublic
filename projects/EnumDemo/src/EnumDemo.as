/**
 * Copyright (C) 2005-2012 by Rivello Multimedia Consulting (RMC).                    
 * code [at] RivelloMultimediaConsulting [dot] com                                                  
 *                                                                      
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the      
 * "Software"), to deal in the Software without restriction, including  
 * without limitation the rights to use, copy, modify, merge, publish,  
 * distribute, sublicense, and#or sell copies of the Software, and to   
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:                                            
 *                                                                      
 * The above copyright notice and this permission notice shall be       
 * included in all copies or substantial portions of the Software.      
 *                                                                      
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,      
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF   
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR    
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.                                      
 */
//Marks the right margin of code *******************************************************************
package
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>EnumDemo</code> class is ...</p>
	 * 
	 */
	public class EnumDemo extends Sprite
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PUBLIC CONST
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function EnumDemo()
		{
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
			// METHODS
			_doDemo();
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		
		// PRIVATE
		/**
		 * Show Demo of the <code>StateEnum</code> enum.
		 * 
		 */		
		private function _doDemo() : void
		{
			
			//	1. STRONG TYPED & NICE USAGE
			var current_estate : StateEnum = StateEnum.Connecting;
			
			//	traces 'Connecting'. Nice!
			trace ("Instance  : " + current_estate); 	
			
			//	traces 'true'
			trace ("TypeCheck : " + (current_estate is StateEnum) ); 	
			
			//	trace 'true' - This is the most common usage. 
			//	Checking if a StateEnum instance matches a kind of StateEnum	
			trace ("Match?    : " + (current_estate == StateEnum.Connecting) ); 
			
			//	2. PROPERLY THROWS AN ERROR - YOU CAN'T INSTANTIATE StateEnum Outside of StateEnum.as
			//var local_enum : StateEnum = new StateEnum ();
			
			
		}
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
	}
}

