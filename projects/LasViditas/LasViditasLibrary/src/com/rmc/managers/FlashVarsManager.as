//Marks the right margin of code *******************************************************************
package com.rmc.managers
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import com.rmc.utils.Environment;
	import flash.display.Stage;
				 
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * This assist in setting/getting vars from the app parameters
	 * which is filled via flashvars when deployed
	 * 
	 * <p><u>REVISIONS</u>:<br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Description</th></tr>
	 * <tr><td>07/17/2009</td><td>samr - Samuel Asher Rivello - info@RivelloMultimediaConsulting.com</td><td>Class created.</td></tr>
	 * <tr><td>MM/DD/YYYY</td><td>AUTHOR</td><td>DESCRIPTION.</td></tr>
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
	public class FlashVarsManager
	{		
		
		//--------------------------------------
		//  Properties
		//--------------------------------------
		//PUBLIC GETTER/SETTERS
		/**
		 * The variable scope to inspect for the flashvars
		*/
		private var _target : Object = null;	
		public function get flashVars () : Object { return _target; }
		
		//PUBLIC CONST
				
		/**
		 * Expected Flashvar variable name.
		 * 
		 * @default property_id 
		*/
		//NOT NEEDED public static const PROPERTY_ID : String = "property_id";
		
		//PRIVATE
		
		//PRIVATE STATIC
		/**
		 * Singleton enforcing instance for <code>FlashVarsManager</code>.
		*/
		private static var _instance : FlashVarsManager;

		
		//--------------------------------------
		//  Constructor
		//--------------------------------------
		/**
		 * <span class="hide">Any hidden comments go here.</span>
		*/
		public function FlashVarsManager (aEnforcer : SingletonEnforcer) {				
			if( aEnforcer == null ){
				throw new Error("Illegal call to FlashVarsManager constructor; use FlashVarsManager.getInstance() instead");
			}
			
		}
		
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//PUBLIC	
		
		//todo, the 'stage' reference is needed to get at the url.  Is there another way
		//having to keep the stage reference is a wonky work around.  KLUGE
		/**
		 * Singleton Enforcing
		 *
		 * <span class="hide">Any hidden comments go here.</span>
		 * 
		 * @return FlashVarsManager
		*/
		public static function getInstance(aStage : Stage = null) : FlashVarsManager {
			if(_instance == null){
				_instance = new FlashVarsManager ( new SingletonEnforcer());
				
				//TO DETERMINE the 'url' we must have a reference to stage.  This can be passed in or grabbed from 
				//another class that must have the value set.  One or the other
				if (aStage) {
					Environment.stage = aStage;
				}
				
				if (Environment.stage) {
					_instance.initApplicationParams(Environment.stage.loaderInfo.parameters);
				} else {
					throw new Error ("FlashVarsManager. Must set Environment.stage (" + Environment.stage + ") before calling getInstance().");
				}			
			}
			return _instance;
		}
		
		/**
		 * This links manager to the flashVars available.  Must be called on ApplicationComplete (or similarly 'late' timing) to be available.
		 *
		 * <span class="hide">Any hidden comments go here.</span>
		 * 
		 * @return void
		*/
		public function initApplicationParams(aParameters : Object) : void 
		{
			_target = aParameters;
		}
		

		
		/**
		 * Used to add in defaults expected in flashVars in the deployed/integrated application
		 *
		 * <span class="hide">Any hidden comments go here.</span>
		 *
		 * @param aVariableName_str Case-sensitive string matching the name expected from flashVars via HTML embed.
		 * @param aDefaultValue Default value to be used when flashVar is not available (i.e. desktop authoring enviorment)
		 * 
		 * @return Matches the default value
		*/
		public function addFlashVarDefault (aVariableName_str : String, aDefaultValue : Object, aForceSettingOfValue_boolean : Boolean = false) : * 
		{
			
			//race ("FlashVarsManager.addFlashVarDefault ("+aVariableName_str+","+aDefaultValue+")");
			
			//IF ITS NOT PASSED IN, USE THE DEFAULT
			if (_target[aVariableName_str] == null || aForceSettingOfValue_boolean == true) {
				_target[aVariableName_str] = aDefaultValue;
			} 
			return aDefaultValue;
		}
		
		/**
		 * Used to access flashvars
		 *
		 * <span class="hide">Any hidden comments go here.</span>
		 *
		 * @param aVariableName_str Case-sensitive string matching the name expected from flashVars via HTML embed.
		 * 
		 * @return Matches the default value
		*/
		public function getFlashVar (aVariableName_str : String) : * 
		{
			return _target[aVariableName_str];
		}
		

		/**
		 * Used to add in defaults from the URL of the swf itself.  Flashvars are preferred for embed, but when one app loads another it may
		 * pass vars on the end of the query string.  This saves the effort of parsing the URL manually and passing in via addFlashVarDefault();
		 *
		 * <span class="hide">Any hidden comments go here.</span>
		 *
		 * @param aURL_str The URL to be checked.  Can't use 'this.url' from in here because that may give the wrong context right?  -samr 02/04/08
		 * 
		*/
		public function forceFlashVarDefaultsFromURL (aURL_str : String ) : void 
		{
			
			//READ IN THE PET TO BE LOADED			
			var tokens_array: Array = aURL_str.split("?");
			if (tokens_array.length > 1) {
				var passedParameters_array : Array = (tokens_array[1] as String).split("?");
				var nameValues_array : Array;
				
				//TODO - SWFLoader.source cannot contain '&' so I used '|' for now.  a better way?  samr 02/04/08
				nameValues_array = (tokens_array[1] as String).split("&");
				if (nameValues_array.length < 2) {
					nameValues_array = (tokens_array[1] as String).split("|");
				}
				for (var pair:String in nameValues_array) {
					var nameValue_array : Array = (nameValues_array[pair] as String).split("=");
					var name : String = nameValue_array[0]
					var value : String = nameValue_array[1]
					addFlashVarDefault	(name, value,true);
				}
			} 
		}
		
		//PRIVATE	
		
		//--------------------------------------
		//  Events
		//--------------------------------------		
		//EventDispatchers
		
		//EventHandlers

		
	}
}

// the following class enforces the singleton pattern of TranslationManager
class SingletonEnforcer {}
