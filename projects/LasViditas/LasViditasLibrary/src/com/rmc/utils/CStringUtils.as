//Marks the right margin of code *******************************************************************
package com.rmc.utils
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import flash.utils.describeType;
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * Utility class used to setup Enum 'name' property introspection. 
	 * 
	 * <p><u>REVISIONS</u> : <br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Description</th></tr>
	 * <tr><td>[12/04/08]</td><td>samr</td><td>Class created.</td></tr>
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
	public class CStringUtils  
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		
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
		 * Used for the custom Enum class so that  x = new Enum(); creates x.name = "x" automatically.  
		 * This faciliates debugging and use of that class.
		 *
		 * <span class="hide">Any hidden comments go here.</span>
		 * 
		 * @return String
		*/
	    public static function InitEnumConstants(inType :*) :void
	    {
	        var type :XML = describeType(inType);
	        for each (var constant :XML in type.constant) {
	            inType[constant.@name].name = constant.@name;
	        }
	    }
		
		
		//PRIVATE	

		
	}
}