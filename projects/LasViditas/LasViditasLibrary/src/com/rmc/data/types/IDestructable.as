//Marks the right margin of code *******************************************************************
package com.rmc.data.types
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * IDestructable can be .destructor()'d to cleanup code (runtime and ram considerations)
	 * 
	 * <p><u>REVISIONS</u> : <br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Description</th></tr>
	 * <tr><td>06/23/08</td><td>Samuel Asher Rivello</td><td>Class created.</td></tr>
	 * <tr><td>[MM/DD/YYYY]</td><td>[AUTHOR]</td><td>[DESCRIPTION.]</td></tr>
	 * </table>
	 * </p>
	 * 
	 * @example Here is a code example.  
     * <listing version="3.0" >
	 * 	//Code example goes here.
	 *  if (instance is IDestructable) {
	 *  	instance.destructor();
	 *  }
	 * </listing>
	 *
     * <span class="hide">Any hidden comments go here.</span>
     *
	*/
	public interface IDestructable
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS

		
		//--------------------------------------
		//  Methods
		//--------------------------------------				
		//PUBLIC	
		function destructor () : void;
		
	}
}