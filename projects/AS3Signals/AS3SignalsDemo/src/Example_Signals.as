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
	import com.rmc.demos.as3signalsdemo.data.types.Robot;
	
	import flash.display.Sprite;


	// --------------------------------------
	// Metadata
	// --------------------------------------


	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>Example_Signals</code> class is designed to showcase AS3Signals.</p>
	 * 
	 *
	 */
	public class Example_Signals extends Sprite
	{

		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS

		// PUBLIC CONST

		// PRIVATE
		
		// PRIVATE STATIC
		/**
		 * The <code>Robot</code> class shows <code>Signal</code>-based messaging.
		 * 
		 */
		private static var _robot : Robot;

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
		 * @return void
		 * 
		 */
		public static function runExample () : void
		{
			_robot = new Robot("Robot");
			_robot.signal.add(_onRobotSignalGreeted);
			_robot.greet("It is me, the Robot!");

		}

		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		/**
		 * Handles the signal: <code>Signal</code>.
		 * 
		 * NOTE: Ideal when you want a quick messaging setup with no parameters passed and no custom classes created
		 * 
		 * @return void
		 * 
		 */
		private static function _onRobotSignalGreeted() : void
		{
			// Access information via 'push' (pushed along with event)
			trace("R1a. The Robot Was Greeted. No parameters are passed.");

		}

	}
}
    
