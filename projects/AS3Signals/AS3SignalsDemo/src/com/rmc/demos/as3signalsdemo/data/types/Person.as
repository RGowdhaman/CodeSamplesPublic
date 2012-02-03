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
package com.rmc.demos.as3signalsdemo.data.types 
{
  
  //--------------------------------------
  //  Imports
  
  //--------------------------------------
	import flash.display.Sprite;
	import com.rmc.demos.as3signalsdemo.events.PersonEvent;
  
  //--------------------------------------
  //  Metadata
  //--------------------------------------
  /**
   * Dispatched when the <code>Person</code> is greeted.
   * 
   * @eventType PersonEvent.GREETED
   * 
   */
  [Event(type="com.rmc.demos.as3signalsdemo.events.PersonEvent" )]
  
  
  //--------------------------------------
  //  Class
  //--------------------------------------
  /**
   * <p>The <code>Person</code> class is designed to show <code>Event</code>-based messaging.</p>
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
  public class Person extends Sprite
  {		
    
    //--------------------------------------
    //  Properties
    //--------------------------------------
    //PUBLIC GETTER/SETTERS
    /**
    * The firstName given to the <code>Person</code> via the constructor.
    * 
    */		
    public function get firstName () 						      : String 	{ 	return _firstName_str; 		}
    public function set firstName (value : String) 		: void 		{ 	_firstName_str = value; 		}
    private var _firstName_str : String;

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
     * @param aFirstName_str String
     * 
     */
    public function Person(aFirstName_str : String)
    {
      //SUPER
      super(); 
      
      //EVENTS
      
      //VARIABLES
      _firstName_str = aFirstName_str;
      
      //PROPERTIES
      
      //METHODS
      
    }
    
    
    //--------------------------------------
    //  Methods
    //--------------------------------------		
    //PUBLIC	
    /**
     * Greet the <code>Person</code>. They will send a message out to confirm
     * The greeting.
     * 
     * @param aGreetedMessage_str : String
     * 
     * @return void
     * 
     */
    public function greet(aGreetedMessage_str : String) : void 
    {
      
      //STORE
      greetedMessage = aGreetedMessage_str; 
      
      //DISPATCH
      dispatchEvent( new PersonEvent(PersonEvent.GREETED, greetedMessage) );
      
    }
    
    
    //PRIVATE	
    
    //--------------------------------------
    //  Event Handlers
    //--------------------------------------		
    
  }
}