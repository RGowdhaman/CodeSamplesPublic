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
package com.rmc.projects.nativeadscontainer.managers
{
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.hdi.nativeExtensions.NativeAds;
	import com.rmc.projects.errors.SingletonIllegalConstructionError;
	
	import flash.display.Sprite;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>NativeAdsManager</code> class is designed to hold ONE and only ONE magic phrase.</p>
	 * 
	 */
	public class NativeAdsManager extends Sprite
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 *  The AdMob ID #
		 */		
		private var _unitID : String;
		public function get unitID () 					: String 	{ return _unitID; }
		//public function set unitID (aValue : String) 	: void 		{ _unitID = aValue; }
		
		// PUBLIC STATIC GETTER/SETTERS
		/**
		 *  The AdMob ID #
		 */		
		public static function get unitID () 					: String 	{ return NativeAdsManager.getInstance().unitID; }
		
		// PUBLIC CONST
		
		// PRIVATE
		
		// PRIVATE STATIC
		/**
		 * Instance of the singleton class.
		 * 
		 * @private
		 * 
		 */
		protected static var _Instance : NativeAdsManager;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 * TWO STYLES of Setup. #2 Takes more time to setup, but is nicer to users. I show #2 in this file.
		 * 
		 * 1) Make a 'public' api. Users must call CustomSingleton.getInstance().foo() to access foo()
		 * 2) Make a 'static public' api that wraps a private api. Users can call CustomSingleton.foo() directly.
		 * 
		 */
		public function NativeAdsManager(singletonEnforcer : SingletonEnforcer) 
		{
			
			if ( _Instance ) {
				
				//	THROW ERROR
				throw new SingletonIllegalConstructionError();
				
			} else {
				
				// ONE-TIME-ONLY CODE...
				
				// EVENTS
				
				// VARIABLES
				
				// PROPERTIES
				_unitID = null;
				
				// METHODS
				
			}
		}
		
		//--------------------------------------
		//  Methods
		//--------------------------------------		
		//	PUBLIC STATIC
		/**
		 * Get an instance of the singleton class.
		 * 
		 * @return The <code>NativeAdsManager</code> instance
		 *
		 */
		private static function getInstance() : NativeAdsManager  
		{
			if (!_Instance) {
				_Instance = new NativeAdsManager( new SingletonEnforcer ()); 	
			}
			return _Instance;
		}
		
		//	PUBLIC
		
		
		//	PUBLIC STATIC
		/**
		 * Initialize the API - 1 time only per app session. 
		 * 
		 * The <code>NativeAdsContainer</code> does this for you when <code>unitID</code> is set in the MXML.
		 *   
		 * @param aUnitID_str String
		 * 
		 * @return void
		 * 
		 */		
		public static function initialize (aUnitID_str: String):void
		{
			NativeAdsManager.getInstance().initialize(aUnitID_str);
		}
		
		/**
		 * Initialize the API - 1 time only per app session. 
		 * 
		 * The <code>NativeAdsContainer</code> does this for you when <code>unitID</code> is set in the MXML.
		 *   
		 * @param aUnitID_num
		 * 
		 * @return void
		 * 
		 */		
		public static function moveCurrentAdTo (aX_num : Number, aY_num : Number, aWidth_num : Number, aHeight_num : Number):void
		{
			NativeAdsManager.getInstance().moveCurrentAdTo (aX_num, aY_num, aWidth_num, aHeight_num)
		}
		
		// PRIVATE
		/**
		 * Initialize the API - 1 time only per app session. 
		 * 
		 * The <code>NativeAdsContainer</code> does this for you when <code>unitID</code> is set in the MXML.
		 *   
		 * @param aUnitID_str String
		 * 
		 * @return void
		 * 
		 */		
		private function initialize (aUnitID_str : String):void
		{
			//NOT SURE WHAT DETERMINES 'isSupported'???
			if (NativeAds.isSupported) {
				
				//STORE FOR LATER INTERNAL NEEDS
				_unitID = aUnitID_str;
				
				//SET THE ID - REQUIRED ONLY ONE TIME PER APP SESSION
				NativeAds.setUnitId(_unitID);
				
				//NOT SURE WHAT THIS DOES???
				NativeAds.setAdMode(true);//put the ads in real mode
				
			} else {
				throw new Error ("NativeAds Are Not Supported By This Project.");
			}
		}
		
		/**
		 * Initialize the API - 1 time only per app session. 
		 * 
		 * The <code>NativeAdsContainer</code> does this for you when <code>unitID</code> is set in the MXML.
		 *   
		 * @param aUnitID_num
		 * 
		 * @return void
		 * 
		 */		
		private function moveCurrentAdTo (aX_num : Number, aY_num : Number, aWidth_num : Number, aHeight_num : Number):void
		{
			//SETUP
			NativeAds.deactivateAd();
			NativeAds.setUnitId(_unitID);
			NativeAds.initAd(aX_num, aY_num, aWidth_num, aHeight_num);
			NativeAds.showAd(aX_num, aY_num, aWidth_num, aHeight_num);
			NativeAds.restoreAd()
			
		}
		
		
		
		
		
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
		
	}
}

//--------------------------------------
//  Singleton Enforcer: Prevents 
//	Instantiation of The Class 
//	Above From Anywhere Outside 
//	This Document
//--------------------------------------
internal class SingletonEnforcer {}