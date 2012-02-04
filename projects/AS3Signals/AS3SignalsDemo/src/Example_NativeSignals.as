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
	import com.rmc.demos.as3signalsdemo.data.types.RobotNative;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;


	// --------------------------------------
	// Metadata
	// --------------------------------------


	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>Example_NativeSignals</code> class is designed to showcase AS3Signals.</p>
	 * 
	 */
	public class Example_NativeSignals extends Sprite
	{

		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS

		// PUBLIC CONST

		// PRIVATE
		
		// PUBLIC STATIC
		/**
		 * The <code>RobotNative</code> class shows <code>NativeSignal</code>-based messaging.
		 * 
		 */
		public static var _robotNative : RobotNative;


		// --------------------------------------
		// Constructor
		// --------------------------------------

		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC

		// PRIVATE
		
		// PUBLIC STATIC
		/**
		 * Create a new <code>Robot</code> instance and show messaging.
		 * 
		 * @param aParent_displayobject : DisplayObject
		 * 
		 * @return void
		 * 
		 */
		public static function runExample (aParent_displayobject : Sprite) : void
		{
			_robotNative = new RobotNative("RobotNative");
			aParent_displayobject.addChild(_robotNative);
			_robotNative.clickedNativeSignal.add(_onRobotClickedNativeSignalDispatched);

			// CALL
			_robotNative.greet("Hey There - I am Robot Native!");

		}

		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		/**
		 * Handles the signal: <code>ClickedNativeSignal</code>.
		 * 
		 * NOTE: Ideal when you want a signal based on an existing Flash UI event.
		 * 
		 * @return void
		 * 
		 */
		private static function _onRobotClickedNativeSignalDispatched(aMouseEvent : MouseEvent) : void
		{

			// TWO MAJOR WAYS TO ACCESS INFORMATION UPON RECEIVING A MESSAGE

			// 1. Access information via 'push' (pushed along with event)
			trace("R4a. The Robot Was Clicked. aMouseEvent  : " + aMouseEvent);

			// 2. Access information via 'pull' (manually grabbed from event.target)
			trace("R4b. The Robot Was Greeted. firstName       : " + (aMouseEvent.target as RobotNative).firstName);

		}


	}
}
    
