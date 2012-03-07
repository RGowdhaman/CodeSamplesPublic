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
package {
	
	// --------------------------------------
	// Imports
	// --------------------------------------
	import flash.utils.getTimer;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.SubTexture;
	import starling.textures.TextureAtlas;
	
	import textureAtlas.DynamicAtlas;
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>Game</code> class.</p>
	 * 
	 */
	public class Game extends Sprite{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PUBLIC CONST
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function Game(){
			
			// SUPER
			super();
			
			// Method 1 - Feels more like traditional Flash (good!)
			_doDynamicTextureAtlas__FromEmbeddedSWFSymbol();
			
			// Method 2 - Puts several 'MovieClips' of graphics into one atlas. This is good for GPU.
			_doDyanmicTextureAtlas__FromEmbeddedSWFSpriteSheet();
			
			
		}
		
		
		/**
		 * Dynamic Atlas From Source: An Embedded MovieClip Symbol From SWF
		 * 
		 * This is totally awesome. Now I can keep my graphics as vectors. 
		 * 
		 */	
		private function _doDynamicTextureAtlas__FromEmbeddedSWFSymbol () : void
		{
			
			try {
				
				// 1. Setup Properties
				var assets_vector_class:Vector.<Class> = new Vector.<Class> ();
				
				//
				assets_vector_class.push (AssetManager.BoyAndDogRunning); 	//WARNING - MUST HAVE 2+ 
																			//FRAMES TO AVOID ERRORS
				
				//
				var scaleFactor_num:Number 			= 1;		//DEFAULT
				var margin_uint:int					= 0;		//DEFAULT
				var preserveColor_boolean:Boolean 	= true;		//DEFAULT
				var checkBounds_boolean:Boolean 	= false;	//DEFAULT
				
				// 2. Create Atlas From VectorClass
				var myTextureAtlas : TextureAtlas = DynamicAtlas.fromClassVector (	
					assets_vector_class, 
					scaleFactor_num,
					margin_uint,
					preserveColor_boolean, 
					checkBounds_boolean);
				
				// 3. Create MovieClip From Atlas
				var TOTAL_TO_CREATE : uint = 1;		//OR JUST CREATE 1
				var myBoyAndDogRunning : MovieClip;
				for (var i_uint : uint = 0; i_uint < TOTAL_TO_CREATE; i_uint ++) {
					
					myBoyAndDogRunning = new MovieClip( myTextureAtlas.getTextures() , 60);
					myBoyAndDogRunning.x = Math.random()*400 + 50; myBoyAndDogRunning.y = 100;
					addChild(myBoyAndDogRunning);
					
					// 4. Juggler will 'step' the animation forward each 'ENTER_FRAME'
					Starling.juggler.add(myBoyAndDogRunning);
				}
				
				
				
			} catch (e:Error) {
				
				trace ("ERROR");
				trace (	"There was an error in the creation of the texture Atlas. ");
				trace (	"Please check if the dimensions of your clip exceeded the maximun ");
				trace (	"allowed texture size.");
				trace ("[[ " + e.message + " ]]");
				
			}
			
		}
		
		
		
		/**
		 * Dynamic Atlas From Source: An Embedded MovieClip From SWF Which CONTAINS MovieClips
		 * 
		 * The SpriteSheet is just a MovieClip in the SWF with some clips within it. 
		 * The clips within have instances names. We use those instance names for 'getTextures()'
		 * 
		 */	
		private function _doDyanmicTextureAtlas__FromEmbeddedSWFSpriteSheet () : void
		{
			
			
			try {
				
				// 1. Setup Properties
				var mySpriteSheet : *  = new AssetManager.SpriteSheet ();
				
				// 2. Create Atlas From a MovieClip Containing The MovieClips we really want
				var myTextureAtlas:TextureAtlas = DynamicAtlas.fromMovieClipContainer(mySpriteSheet, 1, 0, true, true);
				
				// 3a. Create MovieClip From Atlas
				var myCircle : MovieClip = new MovieClip(myTextureAtlas.getTextures("myCircleInstance"), 20);
				myCircle.x = 200; myCircle.y = 300;
				addChild(myCircle);
				
				// 3b. Create MovieClip From Atlas
				var myAmoeba : MovieClip = new MovieClip(myTextureAtlas.getTextures("myAmoebaInstance"), 2);
				myAmoeba.x = 350; myAmoeba.y = 300;
				addChild(myAmoeba);
				
				// 4. Juggler will 'step' the animation forward each 'ENTER_FRAME'
				Starling.juggler.add(myCircle);
				Starling.juggler.add(myAmoeba);
				
				
			} catch (e:Error) {
				
				trace ("ERROR");
				trace (	"There was an error in the creation of the texture Atlas. ");
				trace (	"Please check if the dimensions of your clip exceeded the maximun ");
				trace (	"allowed texture size.");
				trace ("[[ " + e.message + " ]]");
				
			}
			
		}

		
	}
}
