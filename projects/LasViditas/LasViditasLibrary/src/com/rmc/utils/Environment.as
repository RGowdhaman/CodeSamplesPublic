//Marks the right margin of code *******************************************************************
package com.rmc.utils
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * This is the typical format of a simple multiline comment
	 * such as for a <code>TemplateClass<code> class.
	 * 
	 * <p><u>REVISIONS</u> : <br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Description</th></tr>
	 * <tr><td>07/17/2009</td><td>samr - Samuel Asher Rivello - info@RivelloMultimediaConsulting.com</td><td>Class created.</td></tr>
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
	public class Environment extends EventDispatcher
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		/**
		 * Hold reference to stage to access 'parameters' and other properties of the 'movie'.
		 * 
		*/		
		public static function get stage () 				: Stage 	{ 	return _stage; 		}
		public static function set stage (aValue : Stage) 	: void 		{ 	_stage = aValue; 		}
		private static var _stage : Stage;
		
		//PUBLIC CONST
		/**
		 * Detect if the game is in the shell or not.  Not sure if this is the best check to do
		*/		
        public static function get isFileOnline () : Boolean { 
        	
        	trace ("Environment HARDCODING 'IF ONLINE' STILL");
        	return true ;     
        	   
        	//USE STAGE 
        	if (_stage) {
        		//this check fails in some cases online, not sure why
        		return !(new RegExp("file://").test(Environment.stage.loaderInfo.url)) ; 
        	} else {
        		throw new Error ("Environment. Must set stage (" + _stage + ") before calling isFileOnline.");
        	}
        
        //
        }

		//PRIVATE
		
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * Most methods are static (all?) for easy use
		 * 
		 * <span class="hide">Any hidden comments go here.</span>
		*/
		public function Environment ()
		{
			//SUPER
			super (); 
			
			//VARIABLES
			
			//PROPERTIES
			
			//METHODS
			
			//EVENTS

			

		}
		
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//PUBLIC	
		
		//PRIVATE	
		
		//--------------------------------------
		//  Events
		//--------------------------------------		
		//Event Dispatchers
		
		//Event Handlers
		
	}
}	