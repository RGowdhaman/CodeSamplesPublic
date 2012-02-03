/**
 * Copyright (C) 2005-2011 by Rivello Multimedia Consulting (RMC).                    
 * info@RivelloMultimediaConsulting.com                                                  
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
// Marks the right margin of code *******************************************************************
package
{
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.demos.as3signalsdemo.data.types.Person;
	import com.rmc.demos.as3signalsdemo.data.types.Robot;
	import com.rmc.demos.as3signalsdemo.data.types.RobotDeluxe;
	import com.rmc.demos.as3signalsdemo.data.types.RobotNative;
	import com.rmc.demos.as3signalsdemo.events.GreetedDeluxeSignalEvent;
	import com.rmc.demos.as3signalsdemo.events.PersonEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;


	// --------------------------------------
	// Metadata
	// --------------------------------------


	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>AS3SignalsDemo</code> class is designed to showcase AS3Signals.</p>
	 * 
	 * <p>AUTHOR  : Samuel Asher Rivello</p>
	 * <p>COMPANY : RivelloMultimediaConsulting.com</p>
	 * <p>EMAIL   : info@RivelloMultimediaConsulting.com</p>
	 * <p>CREATION DATE    : Apr 05, 2011</p>
	 * 
	 * @example Here is a code example. 
	 *  
	 * <listing version="3.0">
	 * <p>Describe this code example.</p>
	 *
	 * </listing>
	 *
	 */
	public class AS3SignalsDemo extends Sprite
	{

		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS

		// PUBLIC CONST

		// PRIVATE
		/**
		 * The <code>Person</code> class shows <code>Event</code>-based messaging.
		 * 
		 */
		private var _person : Person;

		/**
		 * The <code>Robot</code> class shows <code>Signal</code>-based messaging.
		 * 
		 */
		private var _robot : Robot;

		/**
		 * The <code>RobotDeluxe</code> class shows <code>DeluxeSignal</code>-based messaging.
		 * 
		 */
		private var _robotDeluxe : RobotDeluxe;

		/**
		 * The <code>RobotNative</code> class shows <code>NativeSignal</code>-based messaging.
		 * 
		 */
		private var _robotNative : RobotNative;


		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function AS3SignalsDemo()
		{
			// SUPER
			super();

			// EVENTS

			// VARIABLES

			// PROPERTIES

			// METHODS
			_createPerson();
			_createRobot();

		}


		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC

		// PRIVATE
		/**
		 * Create a new <code>Person</code> instance and show messaging.
		 * 
		 * @return void
		 * 
		 */
		private function _createPerson() : void
		{
			_person = new Person("Sam");

			// P1.
			_person.addEventListener(PersonEvent.GREETED, _onPersonGreeted);

			// CALL
			_person.greet("Hello!");
			
		}

		/**
		 * Create a new <code>Robot</code> instance and show messaging.
		 * 
		 * @return void
		 * 
		 */
		private function _createRobot() : void
		{
			_robot = new Robot("RobotS");

			// R1.
			_robot.signal.add(_onRobotSignalGreeted);

			// R2.
			_robot.greetedSignal.add(_onRobotGreetedSignalDispatched);


			// R3
			_robotDeluxe = new RobotDeluxe("RobotDeluxe");
			_robotDeluxe.greetedDeluxeSignal.add(_onRobotGreetedDeluxeSignalDispatched);

			_robotNative = new RobotNative("RobotNative");
			addChild(_robotNative);
			_robotNative.clickedNativeSignal.add(_onRobotClickedNativeSignalDispatched);

			// CALL
			_robot.greet("Hey There!");

		}

		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		/**
		 * Handles the event: <code>PersonEvent.GREETED</code>.
		 * 
		 * @param event <code>PersonEvent</code> The incoming event payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onPersonGreeted(aPersonEvent : PersonEvent) : void
		{
			// TWO MAJOR WAYS TO ACCESS INFORMATION UPON RECEIVING A MESSAGE

			// 1. Access information via 'push' (pushed along with event)
			trace("P1a. The Person Was Greeted. greetedMessage   : " + aPersonEvent.greetedMessage);

			// 2. Access information via 'pull' (manually grabbed from event.target)
			trace("P1b. The Person Was Greeted. firstName        : " + (aPersonEvent.target as Person).firstName);
		}

		/**
		 * Handles the signal: <code>Signal</code>.
		 * 
		 * NOTE: Ideal when you want a quick messaging setup with no parameters passed and no custom classes created
		 * 
		 * @return void
		 * 
		 */
		private function _onRobotSignalGreeted() : void
		{
			// Access information via 'push' (pushed along with event)
			trace("R1a. The Robot Was Greeted. No parameters are passed.");

		}

		/**
		 * Handles the signal: <code>GreetedSignal</code>.
		 * 
		 * NOTE: Ideal when you want small amounts of data sent along with message
		 * 
		 * @return void
		 * 
		 */
		private function _onRobotGreetedSignalDispatched(aGreetedMessage_str : String) : void
		{
			// Access information via 'push' (pushed along with event)
			trace("R2a. The Robot Was Greeted. aGreetedMessage_str : " + aGreetedMessage_str);

		}

		/**
		 * Handles the signal: <code>GreetedDeluxeSignal</code>.
		 * 
		 * NOTE: Ideal when you want rich information sent in an organized way along with message
		 * 
		 * @return void
		 * 
		 */
		private function _onRobotGreetedDeluxeSignalDispatched(aGreetedDeluxeSignalEvent : GreetedDeluxeSignalEvent) : void
		{

			// TWO MAJOR WAYS TO ACCESS INFORMATION UPON RECEIVING A MESSAGE

			// 1. Access information via 'push' (pushed along with event)
			trace("R3a. The Robot Was Greeted. greetedMessage  : " + aGreetedDeluxeSignalEvent.greetedMessage);

			// 2. Access information via 'pull' (manually grabbed from event.target)
			trace("R3b. The Robot Was Greeted. firstName       : " + (aGreetedDeluxeSignalEvent.target as Robot).firstName);

		}


		/**
		 * Handles the signal: <code>ClickedNativeSignal</code>.
		 * 
		 * NOTE: Ideal when you want a signal based on an existing Flash UI event.
		 * 
		 * @return void
		 * 
		 */
		private function _onRobotClickedNativeSignalDispatched(aMouseEvent : MouseEvent) : void
		{

			// TWO MAJOR WAYS TO ACCESS INFORMATION UPON RECEIVING A MESSAGE

			// 1. Access information via 'push' (pushed along with event)
			trace("R4a. The Robot Was Clicked. aMouseEvent  : " + aMouseEvent);

			// 2. Access information via 'pull' (manually grabbed from event.target)
			trace("R4b. The Robot Was Greeted. firstName       : " + (aMouseEvent.target as RobotNative).firstName);

		}


	}
}
    
