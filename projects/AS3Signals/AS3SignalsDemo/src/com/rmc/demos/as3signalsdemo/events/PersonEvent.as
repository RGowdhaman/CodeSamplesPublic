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
	import flash.events.Event;
  
  //--------------------------------------
  //  Imports
  //--------------------------------------
  
  
  //--------------------------------------
  //  Metadata
  //--------------------------------------
  
  
  //--------------------------------------
  //  Class
  //--------------------------------------
  /**
   * <p>The <code>PersonEvent</code> class is designed to...</p>
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
  public class PersonEvent extends Event
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
    /**
     * 
     * The <code>PersonEvent.GREETED</code> constant defines the value of the <code>type</code> 
     * property of the event object of type <code>AnimatorEvent</code>.
     *
     * <p>The properties of the event object have the following values:</p>
     * <table class='innertable'>
     * <tr><th>Property</th><th>Value</th></tr>
     * <tr><td>type</td><td>The event type.</td></tr>
     * <tr><td>bubbles</td><td>false</td></tr>
     * <tr><td>cancelable</td><td>false</td></tr>
     * <tr><td>currentTarget</td><td>The object that is actively processing the Event object with an event listener.</td></tr>
     * <tr><td>target</td><td>Any DisplayObject instance with a listener registered for this event.</td></tr>
     * ...
     * </table>
     * 
     * @eventType greeted
     * 
     */  
    public static const GREETED : String = "greeted";
    
    
    //PRIVATE
    
    
    //--------------------------------------
    //  Constructor
    //--------------------------------------
    /**
     * This is the constructor.
     * 
     */
    public function PersonEvent (   type_str : String, 
                                    aGreetedMessage_str : String,
                                    bubbles_boolean : Boolean = false, 
                                    cancelable_boolean : Boolean = false)
    {
      //SUPER
      super(type_str, bubbles_boolean, cancelable_boolean); 
      
      //EVENTS
      
      //VARIABLES
      
      //PROPERTIES
      _greetedMessage_str = aGreetedMessage_str;
      
      //METHODS
      
    }
    
    
    //--------------------------------------
    //  Methods
    //--------------------------------------		
    //PUBLIC	
    /**
     * Clones this object. Must be overridden by the subclass.
     * 
     * @return Event
     * 
     */
    public override function clone() : Event 
    {
      return new PersonEvent(type, greetedMessage, bubbles, cancelable);
      
    }
    
    
    //PRIVATE	
    
    //--------------------------------------
    //  Event Handlers
    //--------------------------------------		
    
    
  }
}
