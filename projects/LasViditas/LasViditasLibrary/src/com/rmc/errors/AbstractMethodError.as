//Marks the right margin of code *******************************************************************
package com.rmc.errors
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
	 * Error for use in every method in a Abstract class.  Such methods should never be called.  Only overrritten.
	 * 
	 * <p><u>REVISIONS</u> : <br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Description</th></tr>
	 * <tr><td>07/17/2009</td><td>[AUTHOR]</td><td>Class created.</td></tr>
	 * <tr><td>[MM/DD/YYYY]</td><td>[AUTHOR]</td><td>[DESCRIPTION.]</td></tr>
	 * </table>
	 * </p>
	 * 
	 * @example Here is a code example.  
     * <listing version="3.0" >
	 * 	//Code example goes here.
	 * </listing>
	 *
     * <span class="hide">Any hidden comments go here.</span>
     *
	*/
	public class AbstractMethodError extends Error
	{		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		*/
		public function AbstractMethodError()
		{
			super("AbstractMethodError.  This method must be overridden.");
		}
		
	}
}