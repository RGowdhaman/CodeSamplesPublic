//Marks the right margin of code *******************************************************************
package view
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.rmc.data.types.Enum;
	import com.rmc.utils.CStringUtils;
	
	//--------------------------------------
	//  Special Instructions
	//--------------------------------------
	/**
	 * Subclasses of <code>Enum<code> automatically get injected with a 'name' property within each Enum property below matching its 
	 * reference name to assist debugging through Flex Builder's 'Variables' Panel - samr
	 * It is solely to help debugging.  Set a breakpoint and introspect an instance of this class to see.
	 * 
	 * REQUIRED: In every subclass, not in superclass.
	 */	
	{CStringUtils.InitEnumConstants(FoodState);} 
	
	 
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * This is the typical format of a simple multiline comment
	 * such as for a <code>FoodState<code> class.
	 * 
	 * <p><u>REVISIONS</u> : <br> 
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Email</th><th>Description</th></tr>
	 * <tr><td>[Oct 20, 2009]</td><td>[srivello]</td><td>presentations@RivelloMultimediaConsulting.com</td><td>Class created.</td></tr>
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
	public class FoodState extends Enum
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		
		//PUBLIC CONST
		public static const UNTARGETED 		: FoodState = new FoodState ();  	//WHENEVER NOTHING IS EATING/TARGETING IT
		public static const TARGETED 		: FoodState = new FoodState ();  	//WHENEVER SOMETHING IS TARGETING IT
		public static const BEING_EATEN 	: FoodState = new FoodState ();  	//WHENEVER SOMETHING IS EATING IT
		public static const EATEN 			: FoodState = new FoodState ();  	//WHENEVER ITS EATEN AND DESTROYED (VERY SHORT STATE DURATION)
		
		
	}
}