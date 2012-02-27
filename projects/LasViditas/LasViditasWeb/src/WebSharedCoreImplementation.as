//Marks the right margin of code *******************************************************************
package
{
	//--------------------------------------
	//  Imports
	//--------------------------------------
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	
	import mx.core.FlexGlobals;
	
	
	//--------------------------------------
	//  Class
	//--------------------------------------
	/**
	 * The <code>WebSharedCoreImplementation<code> contains web-specific (meaning not air-specific) functionality.
	 * 
	 * <p><u>REVISIONS</u> : <br>
	 * <table width="500" cellpadding="0">
	 * <tr><th>Date</th><th>Author</th><th>Email</th><th>Description</th></tr>
	 * <tr><td>[Oct 13, 2009]</td><td>[srivello]</td><td>presentations@RivelloMultimediaConsulting.com</td><td>Class created.</td></tr>
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
	public class WebSharedCoreImplementation implements ISharedCore 
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
		/**
		 */
		public function WebSharedCoreImplementation ()
		{

			
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//PUBLIC	
		/**
		 * Toggle from sized to fullscreen version of the application
		 * 
		 * @return void
		 */
		public function toggleFullScreen (aStage : Stage) : void 
		{
			if(FlexGlobals.topLevelApplication.stage.displayState  == StageDisplayState.FULL_SCREEN) {
				FlexGlobals.topLevelApplication.stage.displayState  = StageDisplayState.NORMAL
			} else {
				FlexGlobals.topLevelApplication.stage.displayState  = StageDisplayState.FULL_SCREEN
			}
		}
		
		
		//PRIVATE	
		
		
		//--------------------------------------
		//  Events
		//--------------------------------------		
		
		
	}
}