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
	import com.rmc.errors.SingletonIllegalConstructionError;
	
	import flash.display.Sprite;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>CustomSingleton1</code> class is designed to hold ONE and only ONE magic phrase.</p>
	 * 
	 */
	public class CustomSingleton1 extends Sprite
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 *  The Secret Phrase (Only one per app)
		 */		
		private var _secretePhrase : String;
		public function get secretePhrase () 					: String 	{ return _secretePhrase; }
		public function set secretePhrase (aValue : String) 	: void 		{ _secretePhrase = aValue; }
		
		// PUBLIC CONST
		
		// PRIVATE
		
		// PRIVATE STATIC
		/**
		 * Instance of the singleton class.
		 * 
		 * @private
		 * 
		 */
		protected static var _Instance : CustomSingleton1;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 * TWO STYLES of Setup. #2 Takes more time to setup, but is nicer to users. I show #1 in this file.
		 * 
		 * 1) Make a 'public' api. Users must call CustomSingleton.getInstance().foo() to access foo()
		 * 2) Make a 'static public' api that wraps a private api. Users can call CustomSingleton.foo() directly.
		 * 
		 */
		public function CustomSingleton1(singletonEnforcer : SingletonEnforcer) 
			{
				
				if ( _Instance ) {
					
					//	THROW ERROR
					throw new SingletonIllegalConstructionError();
					
				} else {
					
					// ONE-TIME-ONLY CODE...
					
					// EVENTS
					
					// VARIABLES
					
					// PROPERTIES
					_secretePhrase = "This is the default secret phrase";
					
					// METHODS
					
				}
			}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//	PUBLIC STATIC
		/**
		 * Get an instance of the singleton class.
		 * 
		 * @return The <code>CustomSingleton1</code> instance
		 *
		 */
		public static function getInstance() : CustomSingleton1  
		{
			if (!_Instance) {
				_Instance = new CustomSingleton1( new SingletonEnforcer ()); 	
			}
			return _Instance;
		}
		
		//	PUBLIC
		/**
		 * Show the secret phrase in a debug trace
		 * 
		 * @return void
		 *
		 */
		public function traceTheSecretPhrase() : void  
		{
			trace("Secret Phrase: " + _secretePhrase);
		}
		
		
		// PRIVATE
		
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
		
	}
}

//--------------------------------------
//  Singleton Enforcer: Prevents 
//	Instantiation of The Class 
//	Above From Anywhere Outside 
//	This Document
//--------------------------------------
internal class SingletonEnforcer {}
