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
package
{

	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.demos.as3withcocktails.AS3WithCocktailsDocumentClass;
	import com.rmc.demos.as3withcocktails.lesson1.AccessModifierExample;
	import com.rmc.demos.as3withcocktails.lesson1.Beer;
	import com.rmc.demos.as3withcocktails.lesson1.MembersSample;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	[SWF(width="800", height="600", framerate="30")]
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>Lesson1_AS3LanguageBasics</code> class.</p>
	 * 
	 */
	public class Lesson1_AS3LanguageBasics extends AS3WithCocktailsDocumentClass
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function Lesson1_AS3LanguageBasics()
		{
			
			/////////////////////////////////////
			//	DEBUGGING
			/////////////////////////////////////
			//	trace() - Output any text or data as the project is running. Helps to find and fix problems.
			trace ("I am a trace statement");
			
			
			/////////////////////////////////////
			//	STOP CODE FROM EXECUTING
			/////////////////////////////////////
			return;
			
			
			
			
			
			
			
			
			/////////////////////////////////////
			//	VARIABLES
			/////////////////////////////////////
			// 	PRIMITIVES (BASIC, COMMON DATA TYPES). PARTIAL LIST SHOWN
			
			// 	DECLARE AND SET
			var myString 	: String 	= "hi there 30!";						//LETTERS AS TEXT, NUMBERS AS TEXT, PUNCTUATION AS TEXT
			var myNumber 	: Number 	= 10.01;								//ANY NUMBER
			var myInt 		: int 		= -10;									//WHOLE NUMBER
			var myUint 		: uint 		= 10;									//WHOLE, POSITIVE NUMBER
			var myArray		: Array		= new Array (10,20,30,"sam"); 			//A LIST OF VALUES, EACH VALUE CAN BE OF ANY TYPE
			var myVector    : Vector.<uint> = new Vector.<uint> ();				//A LIST OF VALUES, EACH *MUST* BE ONE TYPE
			myVector.push (10)
			myVector.push (20)
				
			// 	SET VALUE TO A NEW VALUE
			myInt = 45;
			
			// 	GET VALUE
			trace ("Variable: " + myVector);
			
			
			
			
			
			
			
			
			/////////////////////////////////////
			//	VARIABLES
			/////////////////////////////////////
			// 	NON-PRIMITIVES (BUILT-IN). PARTIAL LIST SHOWN
			
			//	SPRITE - SHOW NON-ANIMATED GRAPHICS
			var mySprite : Sprite = new Sprite();
			mySprite.graphics.beginFill(0x000000);
			mySprite.graphics.drawCircle(500,550,30);	//X, Y, RADIUS
			mySprite.graphics.endFill();
			addChild(mySprite);							//AD THE OBJECT TO THE DISPLAY LIST (REQUIRED *ONLY* OF VISUAL OBJECTS)
			
			//	TEXTFIELD - SHOW TEXT
			var myTextField : TextField = new TextField ();
			myTextField.htmlText = "Hello, this is TEXT!";
			myTextField.x = 550;
			myTextField.y = 550;
			addChild(myTextField);						//AD THE OBJECT TO THE DISPLAY LIST (REQUIRED *ONLY* OF VISUAL OBJECTS)
			
			//	STAGE - AUTOMATICALLY CREATED UPON PUBLISH, 
			//			ITS THE PARENT OF ALL GRAPHICS. 
			//			ITS THE WHOLE FLASH 'SCREEN'. THERE ARE MANY PROPERTIES TO GET AND SET
			stage.scaleMode		= StageScaleMode.EXACT_FIT;	//SCALE THE APP TO A 'NORMAL' 100%
			stage.align		 	= StageAlign.TOP_LEFT; 		//ALIGN THE ARTWORK TO THE UPPER,LEFT OF THE WINDOW ('NORMAL')
			
			
			
			/////////////////////////////////////
			//	VARIABLES
			/////////////////////////////////////
			// 	CUSTOM (DEVELOPER CREATED)
			
			
			//	A VERY 'GENERIC', FLEXIBLE, QUICK-TO-CREATE OBJECT, REQUIRES **NO EXTERNAL CLASS FILE**
			var myObject : Object = new Object(); //create new object with no data inside
			//	SET NEW PROPERTY
			myObject.newSimpleProperty = "here!";
			//	GET PROPERTY VALUE
			trace ("myObject.newSimpleProperty" + myObject.newSimpleProperty);
			
			
			
			// 	CREATE OBJECT, REQUIRES ITS OWN EXTERNAL CLASS FILE
			var myBeer : Beer = new Beer ();
			// 	GET VALUE
			trace ("1. myBeer.calories : " + myBeer.calories);
			//	SET VALUE
			myBeer.calories = 250;
			// 	GET VALUE
			trace ("2. myBeer.calories : " + myBeer.calories);
			
			
			

			
			/////////////////////////////////////
			//	MEMBERS
			/////////////////////////////////////
			//	CREATE OBJECT
			var myMembersSample : MembersSample = new MembersSample ();
			//	ACCESS PUBLIC PROPERTY
			trace ("myMembersSample.sampleProperty = " + myMembersSample.sampleProperty);
			//	ACCESS PUBLIC METHOD
			myMembersSample.sampleMethod("arggggg");

			
			
			
			/////////////////////////////////////
			//	ACCESS MODIFIERS
			/////////////////////////////////////
			//	CREATE OBJECT
			//		INSPECT THE OBJECT SOURCE-CODE TO SEE MORE...
			var myAME : AccessModifierExample = new AccessModifierExample ();
			trace ("myAME.samplePublicProperty = 	" + myAME.samplePublicProperty);
			trace ("myAME.SAMPLE_STATIC_PROPERTY = 	" + myAME.SAMPLE_STATIC_PROPERTY);
			trace ("myAME.sampleSetAndGet_str = 	" + myAME.sampleSetAndGet_str);
			
			
			
			/////////////////////////////////////
			//	FUNCTIONS
			/////////////////////////////////////
			//	DECLARE
			var myFunction : Function = function (aArgument1_number : Number, aArgument2_string : String = "default value here") : void
			{
				
				//ARGUMENTS CAN BE REQUIRED OR OPTIONAL...
				
				//DO SOMETHING
				trace ("myFunction() called with " + aArgument1_number + " and " + aArgument2_string);
				
				//RETURN SOMETHING, OR NOTHING
				//return null;
			}
			
			//	CALL
			myFunction(100);
			myFunction(100,"sam");
			
			
			
			
			/////////////////////////////////////
			//	STATEMENTS
			//	--LOOPS
			//			LOOPS ALLOW US TO REPEAT CODE
			/////////////////////////////////////
			
			//WITHOUT LOOPS
			
			//FOR-I LOOP, good to repeat a specific amount of times
			for (var i: uint = 0; i < 10; i++) {
				trace ("i: " + i);
			}
			
			//FOR-IN LOOP, good to work with property names and property values within arrays
			var test_array : Array = new Array (10,20,"test");
			for (var myForInObject : Object in test_array) {
				trace ("myForInObject: " + myForInObject + " value = " + test_array[myForInObject]);
			}
			
			//FOR-EACH LOOP, good to work with objects within arrays
			for each (var myForEachObject : Object in test_array) {
				trace ("myForEachObject: " + myForEachObject);
			}
			
			//WHILE LOOP, good for repeating code a certain number of times (0 or more times)
			var t_uint : uint = 0;
			while (t_uint ++ < 2) {
				trace ("while : " + t_uint);
			}
			
			//WHILE LOOP, good for repeating code a certain number of times (1 or more times)
			var t2_uint : uint = 0;
			do {
				trace ("do : " + t2_uint);
				
			}while (t2_uint ++ < 3);
			

			
			/////////////////////////////////////
			//	STATEMENTS
			//	--IF
			//			TO CHECK DATA AND *MAYBE* DO SOMETHING
			/////////////////////////////////////
			var isReady : Boolean = true; //false?
			if (isReady) {
				trace ("I am ready");
			}
			
			if (isReady) {
				trace ("I am ready");
			} else if (10 < 20) {
				trace ("Ten is less than 20");
			}
			
			if (isReady) {
				trace ("I am ready");
			} else {
				trace ("I am not ready");
			}

			
			/////////////////////////////////////
			//	STATEMENTS
			//	--Switch
			//			TO CHECK DATA, DO SOMETHING SPECIFIC DEPENDING ON THE VALUE. ITS VERY SIMILAR TO AN 'IF'
			/////////////////////////////////////
			
			var bartenderName : String = "Samuel"; //or "Robert" or "whatever"
			//
			switch (bartenderName) {
				case "Samuel":
					trace ("What a great name!");
					trace ("Really Nice.");
					break;
				case "Robert":
					trace ("I'd like a new drink, Rob!");
					break;
				default:
					trace ("Your name is not Samuel or Robert");
					break;
			}
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		
		// PRIVATE
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		
		
	}
}

