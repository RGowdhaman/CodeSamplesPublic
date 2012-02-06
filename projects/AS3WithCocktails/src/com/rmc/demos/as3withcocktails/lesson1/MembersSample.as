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
	 * <p>The <code>MembersSample</code> class shows a sample of each member type - property, method, event.</p>
	 * 
	 */
	public class MembersSample
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		/**
		 * This is an example of a property member.
		 * 
		 */
		public var sampleProperty : String;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function MembersSample()
		{
			// PROPERTY
			sampleProperty = "Hello I am a Sample Property";
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		/**
		 * This is an example of a property member.
		 * 
		 */
		public function sampleMethod(aSampleArgument : String) : void 
		{
			trace ("MembersSample.sampleMethod() called with aSampleArgument: " + aSampleArgument);
			
		}
		
		
		// PRIVATE
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
		
	}
}

