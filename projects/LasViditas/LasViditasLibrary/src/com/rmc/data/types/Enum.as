//Marks the right margin of code *******************************************************************
package com.rmc.data.types
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	
	
	//--------------------------------------
	//  Special Instructions
	//--------------------------------------
	/**
	 * Subclasses of <code>Enum<code> automatically get injected with a 'name' property within each Enum property below matching its 
	 * reference name to assist debugging through Flex Builder's 'Variables' Panel - samr
	 * It is solely to help debugging.  Set a breakpoint and introspect an instance of this class to see.
	 * 
	 * REQUIRED: In every subclass, but not in superclass.
	 */	
	//{CStringUtils.InitEnumConstants(GameState);} //keep commented out in this class, use only in subclasses
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	/**
	 * This is the typical format of a simple multiline comment
	 * such as for a <code>Enum<code> class.
	 * 
	 * <p><u>REVISIONS</u> : <br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Email</th><th>Description</th></tr>
	 * <tr><td>[Dec 04, 2008]</td><td>[srivello]</td><td>presentations@RivelloMultimediaConsulting.com</td><td>Class created.</td></tr>
	 * <tr><td>[MM/DD/YYYY]</td><td>[AUTHOR]</td><td>[EMAIL]</td><td>[DESCRIPTION.]</td></tr>
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
	public class Enum extends Object
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		/**
		 * Name is autopopulated by a util.  This is mostly valuable for the 'Variables' panel in Flex Builder during debugging.
		 * 
		*/		
		public function get name () 					: String 	{ 	return _name_str; 		}
		public function set name (aValue : String) 		: void 		{ 	_name_str = aValue; 		}
		private var _name_str : String;
		
		//PUBLIC CONST
		
		//PRIVATE
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//PUBLIC	
		/**
		 * Aids output panel statements on the object references to show the name.
		 *
		 * <span class="hide">Any hidden comments go here.</span>
		 * 
		 * @return String
		*/
		
   		public function toString () : String
   		{
   			return name;
   		}
		
		
		//PRIVATE	

		
	}
}