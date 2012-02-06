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
package com.rmc.demos.as3withcocktails.lesson1
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>AccessModifierExample</code> class shows a sample of each member type - property, method, event.</p>
	 * 
	 */
	public class AccessModifierExample
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		
		//	PUBLIC
		/**
		 * Example : Any class can access this object, but its value is constant and can never change.
		 * 
		 */
		public const sampleConstantProperty : String = "Sample: Constant";
		
		
		//	PUBLIC
		/**
		 * Example : Any class can access this object
		 * 
		 */
		public var samplePublicProperty : String;

		
		//	PRIVATE
		/**
		 * Example : We generally use an "_" to start the name of each protected variables. 
		 * 
		 * 			 Only this class can access it
		 * 
		 */
		private var _samplePrivateProperty : String;
		
		
		//	PROTECTED
		/**
		 * Example : We generally use an "_" to start the name of each private variables
		 * 
		 */
		protected var _sampleProtectedProperty : String;
		
		//	STATIC
		/**
		 * Example : We generally use ALL CAPITAL LETTERS for static variables
		 * 
		 */
		public var SAMPLE_STATIC_PROPERTY : String;
		
		
		//	PUBLIC SETTER / GETTER
		/**
		 * Example : 
		 * 
		 */
		private var _sampleSetAndGet_str : String;
		public function get sampleSetAndGet_str () 					: String 	{ 
			//RETURN THE EXACT VALUE, OR MODIFY IT, IF NEEDED. 
			return _sampleSetAndGet_str; 
		}
		public function set sampleSetAndGet_str (aValue : String) 	: void 		{ 
			//SET THE EXACT VALUE AS IT IS PASSED IN, OR MODIFY IT, IF NEEDED. 
			_sampleSetAndGet_str = aValue; 
		}
		
		/////////////////////////////////////////
		//	ADVANCED (NOT SHOWN HERE. ITS TOO ADVANCED)
		//		OTHER OPTIONS ARE 'internal' and namespace
		/////////////////////////////////////////
		
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function AccessModifierExample()
		{
			//ITS COMMON, (BUT NOT REQUIRED) TO SET THE VALUES OF PROPERTIES HERE IN THE CONSTRUCTOR
			SAMPLE_STATIC_PROPERTY 		= "SAMPLE STATIC...";
			samplePublicProperty		= "sample public...";
			sampleSetAndGet_str			= "sample: set and get...";
			_samplePrivateProperty		= "sample: private";
			_sampleProtectedProperty	= "sample: protected";
			
			//IT IS NOT PERMITTED TO CHANGE THE VALUE OF A 'CONST'
			//sampleConstantProperty = "this is a new value";
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		
		
		// PRIVATE
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
		
	}
}

