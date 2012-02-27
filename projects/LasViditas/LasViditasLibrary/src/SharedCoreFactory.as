//Marks the right margin of code *******************************************************************
package 
{
	import flash.system.ApplicationDomain;
	import flash.system.Security;

	//--------------------------------------
	//  Imports
	//--------------------------------------
	
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * This is the typical format of a simple multiline comment
	 * such as for a <code>TemplateClass<code> class.
	 * 
	 * <p><u>REVISIONS</u> : <br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Email</th><th>Description</th></tr>
	 * <tr><td>[MM/DD/YYYY]</td><td>[samr]</td><td>presentations@RivelloMultimediaConsulting.com</td><td>Class created.</td></tr>
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
	public class SharedCoreFactory
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		
		//PUBLIC CONST
		/**
		 * Error message when API calls member of incorrect environment
		 * 
		 * @default NOT_SUPPORTED_IN_WEB_MESSAGE 
		 */
		public static const NOT_SUPPORTED_IN_WEB_MESSAGE:String = "Not supported in web version.";
		
		
		//PRIVATE
		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * 
		*/
		public function SharedCoreFactory ()
		{
			//SUPER
			super (); 
			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//PUBLIC	
		/**
		 * Intelligently return the correct implementation for the runtime environment.
		 * 
		 * @return ISharedCore
		 */
		static public function getSharedCoreInstance() : ISharedCore
		{
			var general:ISharedCore;
			var cls:String = (isAir ? "AirSharedCoreImplementation" : "WebSharedCoreImplementation");
			var clsToCreate:Object = getClassToCreate(cls);
			general = new clsToCreate();			
			return  general;
		}
		
		/**
		 * Intelligently return the class for a classname
		 * 
		 * @param aClassName String name of the correct implementation class.
		 * 
		 * @return ISharedCore
		 */
		static private function getClassToCreate(className:String):Object
		{			
			var someClass:Object = null;
			someClass = ApplicationDomain.currentDomain.getDefinition(className);	
			return someClass;
		}
		
		/**
		 * Core checker of the current environment
		 * 
		 * @return Boolean If the current environment is Adobe AIR
		 */
		static public function get isAir():Boolean
		{			
			//	Since "application" is only defined in the AIR framework, trying
			//	to match for Security.APPLICATION will fail.  This is why I'm
			//	using the string, instead of the statically compiled constant.
			return Security.sandboxType.toString() == "application" ? true : false;
		}
		
		
		//PRIVATE	
		
		
		//--------------------------------------
		//  Events
		//--------------------------------------		
		
		
	}
}