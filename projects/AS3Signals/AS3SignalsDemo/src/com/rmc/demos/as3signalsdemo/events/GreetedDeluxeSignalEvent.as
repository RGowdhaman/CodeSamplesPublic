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
package com.rmc.demos.as3signalsdemo.events
{
  
  //--------------------------------------
  //  Imports
	// --------------------------------------
	import org.osflash.signals.events.GenericEvent;
  
  
  
  //--------------------------------------
  //  Metadata
  //--------------------------------------
  
  
  //--------------------------------------
  //  Class
  //--------------------------------------
  /**
   * <p>The <code>GreetedDeluxeSignalEvent2</code> class is designed to...</p>
   * 
   * <p>AUTHOR  : Samuel Asher Rivello</p>
   * <p>COMPANY : RivelloMultimediaConsulting.com</p>
   * <p>EMAIL   : info@RivelloMultimediaConsulting.com</p>
   * 
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
  public class GreetedDeluxeSignalEvent extends GenericEvent
  {		
    
    //--------------------------------------
    //  Properties
    //--------------------------------------
    //PUBLIC GETTER/SETTERS
    /**
     * The most recent greeted sent into the <code>Person</code>.
     * 
     */		
    public function get greetedMessage () 						    : String 	{ 	return _greetedMessage_str; 		}
    public function set greetedMessage (value : String) 		: void 		{ 	_greetedMessage_str = value; 		}
    private var _greetedMessage_str : String;
    
    
    //PUBLIC CONST
    
    //PRIVATE
    
    
    //--------------------------------------
    //  Constructor
    //--------------------------------------
    /**
     * This is the constructor.
     * 
     */
    public function GreetedDeluxeSignalEvent (aGreetedMessage_str : String )
    {
      
      //VARIABLES
      
      //PROPERTIES
      greetedMessage = aGreetedMessage_str;
      
      //METHODS
      
    }
    
    
    //--------------------------------------
    //  Methods
    //--------------------------------------		
    //PUBLIC	
    
    //PRIVATE	
    
    //--------------------------------------
    //  Event Handlers
    //--------------------------------------		
    
    
  }
}
