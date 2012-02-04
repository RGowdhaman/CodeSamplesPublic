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
	import com.rmc.demos.as3signalsdemo.data.types.Person;
	import com.rmc.demos.as3signalsdemo.events.PersonEvent;
	
	import flash.display.Sprite;


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
	public class Example_FlashEvents extends Sprite
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
		public static var _person : Person;


		// --------------------------------------
		// Constructor
		// --------------------------------------


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
		public static function runExample() : void
		{
			_person = new Person("Sam");

			// P1.
			_person.addEventListener(PersonEvent.GREETED, _onPersonGreeted);

			// CALL
			_person.greet("Hello!");
			
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
		public static function _onPersonGreeted(aPersonEvent : PersonEvent) : void
		{
			// TWO MAJOR WAYS TO ACCESS INFORMATION UPON RECEIVING A MESSAGE

			// 1. Access information via 'push' (pushed along with event)
			trace("P1a. The Person Was Greeted. greetedMessage   : " + aPersonEvent.greetedMessage);

			// 2. Access information via 'pull' (manually grabbed from event.target)
			trace("P1b. The Person Was Greeted. firstName        : " + (aPersonEvent.target as Person).firstName);
		}

	}
}
    
