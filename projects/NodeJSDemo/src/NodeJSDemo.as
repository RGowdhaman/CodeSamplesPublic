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
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.XMLSocket;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	
	
	// --------------------------------------
	// Metadata
	// --------------------------------------
	
	
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>NodeJSDemo</code> class is ...</p>
	 * 
	 */
	public class NodeJSDemo extends Sprite
	{
		
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		/**
		 * The core object which connects client to 
		 * 	server for real-time communication
		 */		
		private var _xmlSocket:XMLSocket;
		
		/**
		 * The sole UI element to show some test output
		 */		
		private var _textField:TextField;
		
		// PUBLIC CONST
		
		// PRIVATE
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
		public function NodeJSDemo()
		{
			// SUPER
			super();
			
			// EVENTS
			addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			// VARIABLES
			
			// PROPERTIES
			_textField = new TextField ();
			_textField.width = 300;
			_textField.height = 300;
			_textField.multiline = true;
			_textField.htmlText = "";
			addChild(_textField);
			
			// METHODS
			
		}
		
		
		// --------------------------------------
		// Methods
		// --------------------------------------
		// PUBLIC
		/**
		 * Handles the Event: <code>Event.CHANGE</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onAddedToStage(aEvent : Event):void
		{
			//	CREATE THE SOCKET AND CONNECT - I'M NOT SURE WHAT PARAMETERS ARE VALID HERE
			//		BUT IT MUST MATCH THE SETTINGS WITHIN THE 'HelloWorldNodeJS.js' FILE YOU ARE USING
			_xmlSocket = new XMLSocket("127.0.0.1", 9001);
			
			// EVENTS
			stage.removeEventListener(MouseEvent.CLICK, 		_onAddedToStage);
			// 
			_xmlSocket.addEventListener(Event.CONNECT, 			_onConnected);
			_xmlSocket.addEventListener(IOErrorEvent.IO_ERROR, 	_onIOError);
			
			
		}
		
		
		// PRIVATE
		
		// --------------------------------------
		// Event Handlers
		// --------------------------------------
		/**
		 * Handles the Event: <code>Event.CHANGE</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onConnected(aEvent : Event):void
		{
			//	TRACE
			trace("onConnect() aEvent: " + aEvent);
			
			//	EVENTS
			_xmlSocket.removeEventListener(Event.CONNECT, 			_onConnected);
			_xmlSocket.removeEventListener(IOErrorEvent.IO_ERROR, 	_onIOError);
			//
			_xmlSocket.addEventListener(DataEvent.DATA, 			_onDataReceived);
			_xmlSocket.addEventListener(Event.CLOSE, 				_onSocketClose);		
			//
			stage.addEventListener(KeyboardEvent.KEY_UP, 			_onKeyUp);
			
		}
		
		/**
		 * Handles the Event: <code>Event.CHANGE</code>.
		 * 
		 * @param aEvent <code>Event</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onSocketClose(aEvent : Event):void
		{
			//	TRACE
			trace("_onSocketClose aEvent : " + aEvent);
			
			//	EVENTS
			stage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			_xmlSocket.removeEventListener(Event.CLOSE, _onSocketClose);
			_xmlSocket.removeEventListener(DataEvent.DATA, _onDataReceived);
		}
		
		
		/**
		 * Handles the Event: <code>KeyboardEvent.KEY_UP</code>.
		 * 
		 * @param aEvent <code>KeyboardEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onKeyUp(evt:KeyboardEvent):void
		{
			//	HANDLE KEYS
			if (evt.keyCode == Keyboard.ESCAPE) {
				//1. SEND 'KILL THE SERVER' TO THE SERVER
				_xmlSocket.send("exit");
			}
			else {
				//2. SEND ANY NON-ESCAPE KEY'S CODE ('38' FOR EXAMPLE) TO SERVER
				//		THIS IS A SILLY EXAMPLE OF SENDING A NUMBER TO THE SERVER
				//		JUST SO THE SERVER CAN SEND IT BACK. SIMPLE.
				_xmlSocket.send(evt.keyCode);
			}
		}
		
		/**
		 * Handles the Event: <code>DataEvent.DATA</code>.
		 * 
		 * @param aEvent <code>DataEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onDataReceived(aEvent : DataEvent):void
		{
			try {
				
				//	Show the server data in text
				_textField.htmlText += ("From Server: " + aEvent.data + "\n");

				//scroll down to show latest line
				_textField.scrollV = _textField.maxScrollV; 
				
			} catch (error : Error) {
				//	TRACE
				trace("_onDataReceived error:  " + error);
			}
		}
		
		/**
		 * Handles the Event: <code>IOErrorEvent.IO_ERROR</code>.
		 * 
		 * @param aEvent <code>IOErrorEvent</code> The incoming aEvent payload.
		 *  
		 * @return void
		 * 
		 */
		private function _onIOError(aEvent : IOErrorEvent):void
		{
			//	TRACE
			trace("_onIOError aEvent: " + aEvent);
			
			//	EVENTS
			_xmlSocket.removeEventListener(Event.CONNECT, _onConnected);
			_xmlSocket.removeEventListener(IOErrorEvent.IO_ERROR, _onIOError);
			stage.addEventListener(MouseEvent.CLICK, _onAddedToStage);
		}
		
		
		
	}
}

