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
	 * <p>The <code>SingletonDemo</code> class shows how to replicate full <code>Singleton</code> functionality in AS3.</p>
	 * 
	 * NOTE: AS3 does not natively support singletons
	 * NOTE: There are TWO styles of Singleton shown here. ONLY ONE is needed for your project.
	 * 
	 * WIKI: http://en.wikipedia.org/wiki/Singleton_pattern
	 * 
	 */
	public class SingletonDemo extends Sprite
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PUBLIC
		/**
		 * DEMO of <code>MyCustomSingleton1</code> 
		 * 
		 * NOTE: It requires the 'getInstance()' one time in each class that uses it.
		 */		
		public var MyCustomSingleton1 : CustomSingleton1 = CustomSingleton1.getInstance();
		
		// PUBLIC CONST
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function SingletonDemo()
		{
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
			// METHODS
			_doTheDemo();
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		
		// PRIVATE
		/**
		 * Show demo of a singleton.
		 * 
		 */		
		private function _doTheDemo() : void
		{

// TWO STYLES ARE SHOWN

// *******************************************
// DEMO 1 - View the Console Output (getInstance() Required)
// *******************************************
var MyCustomSingleton1 : CustomSingleton1 = CustomSingleton1.getInstance();
MyCustomSingleton1.traceTheSecretPhrase();
MyCustomSingleton1.secretePhrase = "Now the value has changed in 1.";
MyCustomSingleton1.traceTheSecretPhrase();

// *******************************************
// DEMO 2 - View the Console Output (getInstance() *NOT* Required)
// *******************************************
CustomSingleton2.traceTheSecretPhrase();
CustomSingleton2.secretePhrase = "Now the value has changed in 2.";
CustomSingleton2.traceTheSecretPhrase();


// *******************************************
// DEMO - Impossible - This will show an error
// *******************************************
//var myFailedCustomSingleton1 = new MyCustomSingleton1 ();
//var myFailedCustomSingleton2 = new MyCustomSingleton2 ();
			
			
			
		}
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
		
	}
}

