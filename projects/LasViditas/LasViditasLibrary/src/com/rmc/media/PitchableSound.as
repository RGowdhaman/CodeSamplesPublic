package com.rmc.media
{
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.SoundTransform;
	import flash.accessibility.AccessibilityImplementation;
	import flash.events.Event;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundLoaderContext;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	/**
	 * SoundPitch extends Sound by pitching capabilities.
	 * 
	 * To change the pitch of sound use the <code>pitch</code> property.
	 * You can do this anytime you want. If you want to have the change
	 * having a more contemporary impact on playback, you can also set
	 * the <code>bufferLength</code> property to a lower value.
	 * 
	 * 
	 * ------------------------
	 * NOTEs:
	 * 		Backward looping doesn't work really well.
	 * 
	 * 
	 * http://krisrok.de
	 * 
	 * @author kris
	 * @version 0.95
	 */
	public class PitchableSound extends Sound
	{
		private const MIN_PITCH:Number = 0.01;
		private const MAX_PITCH:Number = 10;
		
		
		private var _tmpSound:Sound;
		private var _tmpPos:int = 0;
		
		private var _bufferLength:int = 1024 * 4;
		private var _pitchBufferLength:int = _bufferLength;
		
		private var _ba:ByteArray;
		private var _samplesRead:int;
		private var _samplesMax:int;
		private var _bufferFill:int;
		
		
		private var _pitch:Number = 1.0;
		private var _userPitch:Number = _pitch;
		private var _count:Number = 0;
		private var _reversed:Boolean = false;

		private var _loops:Number;
		private var _tmpPos2:int = 0;
		

		/**
		 * Creates a new SoundPitch object. Should work like the Sound object you already know from AS3.
		 * 
		 * @param	urlRequest_or_SoundObject	You can pass a URLRequest causing to start the loading process. OR you can pass an existing Sound object to use!
		 * @param	context						I dont really know what that is. But maybe you do.					
		 */
		public function PitchableSound(urlRequest_or_SoundObject:Object = null, context:SoundLoaderContext = null) 
		{
			super(null, context);
			
			if (urlRequest_or_SoundObject is URLRequest)
			{
				load(URLRequest(urlRequest_or_SoundObject), context);
			}
			else
				if (urlRequest_or_SoundObject is Sound)
				{
					_tmpSound = Sound(urlRequest_or_SoundObject);
					initPlayback();
				}
		}
		
		/**
		 * Stops the playback and removes all internal event listeners. Use it!
		 */
		override public function close():void 
		{
			if (isBuffering)
				super.close();
			
			removeEventListener(SampleDataEvent.SAMPLE_DATA, onSamples);

			_tmpSound.removeEventListener(Event.COMPLETE, onTmpSoundComplete);
			_tmpSound.removeEventListener(Event.ID3, onTmpSoundID3);
			_tmpSound.removeEventListener(IOErrorEvent.IO_ERROR, onTmpSoundIOError);
			_tmpSound.removeEventListener(Event.OPEN, onTmpSoundOpen);
			_tmpSound.removeEventListener(ProgressEvent.PROGRESS, onTmpSoundProgress);
		}
		
		/**
		 * Stops the playback and removes all internal event listeners. Use it!
		 */
		public function stop():void
		{
			close();
		}
		
		/**
		 * Works just like the original <code>Sound.play()</code> function - EXCEPT loops when playing backwards, especially with very short sounds. Will be fixed! Maybe!
		 * 
		 * @param	startTime		The initial position in milliseconds at which playback should start. 
		 * @param	loops			Defines the number of times a sound loops before the sound channel stops playback. 
		 * @param	sndTransform	The initial SoundTransform object assigned to the sound channel. 
		 * @return					A SoundChannel object, which you use to control the sound.
		 */
		override public function play(startTime:Number = 0, loops:int = 0, sndTransform:flash.media.SoundTransform = null):flash.media.SoundChannel 
		{			
			addEventListener(SampleDataEvent.SAMPLE_DATA, onSamplesFake);
			
			_tmpPos2 = _tmpPos = startTime * 44.1;
			_loops = loops;
			
			var result:SoundChannel =  super.play(0, 0, sndTransform);
			
			removeEventListener(SampleDataEvent.SAMPLE_DATA, onSamplesFake);
			
			addEventListener(SampleDataEvent.SAMPLE_DATA, onSamples);
			
			return result;
		}
		
		/**
		 * Works just like the original <code>Sound.load()</code>: Initiates loading of an external MP3 file from the specified URL. 
		 * @param	stream
		 * @param	context
		 */
		override public function load(stream:flash.net.URLRequest, context:flash.media.SoundLoaderContext = null):void 
		{
			_tmpSound = new Sound(stream, context);
			
			_tmpSound.addEventListener(Event.COMPLETE, onTmpSoundComplete);
			_tmpSound.addEventListener(Event.ID3, onTmpSoundID3);
			_tmpSound.addEventListener(IOErrorEvent.IO_ERROR, onTmpSoundIOError);
			_tmpSound.addEventListener(Event.OPEN, onTmpSoundOpen);
			_tmpSound.addEventListener(ProgressEvent.PROGRESS, onTmpSoundProgress);
		}
		
		private function onTmpSoundComplete(e:Event):void 
		{
			initPlayback();
		}
		
		private function initPlayback():void
		{
			_ba = new ByteArray();
			
			_samplesMax = _tmpSound.length * 44.1;
			dispatchEvent(new Event(Event.COMPLETE, true, true));
			
		}
		
		private function onSamplesFake(e:*):void
		{
			//race("sample fake");
			for ( var c:int=0; c<8192; c++ ) {
				e.data.writeFloat(0);
				e.data.writeFloat(0);
			}
		}
		
		private function onSamples(e:*):void 
		{
			_ba = new ByteArray();
			//_ba.position = 0;
			_bufferFill = 0;
			_samplesRead = 0;
			
			var pitch:Number = _pitch;
			
			if (pitch > MIN_PITCH)
			{
				
				if(!_reversed)
					while (_bufferFill < _pitchBufferLength)
					{
						_bufferFill += (_samplesRead = _tmpSound.extract(_ba, _pitchBufferLength - _bufferFill, _tmpPos));
						
						if (_bufferFill == _pitchBufferLength)
						{
							_tmpPos += _samplesRead;
						}
						else
						{
							_tmpPos = 0;
							if (--_loops < 1)
							{
								for (var j:int = 0; j < (_pitchBufferLength - _bufferFill)*2; j++)
									_ba.writeFloat(0);
								
								_bufferFill = _pitchBufferLength;
								
								soundComplete();
							}
						}
						//_tmpPos = (_bufferFill == _pitchBufferLength ? _tmpPos + _samplesRead : 0);
					}
				else
				{
					_tmpPos = (_tmpPos2 - (_pitchBufferLength + 2) + _samplesMax) % _samplesMax;
					_tmpPos2 = _tmpPos;
					while (_bufferFill < _pitchBufferLength)
					{
						_bufferFill += (_samplesRead = _tmpSound.extract(_ba, _pitchBufferLength - _bufferFill, _tmpPos));
						
						
						if (_bufferFill == _pitchBufferLength)
						{
							_tmpPos += _samplesRead;
						}
						else
						{
							_tmpPos = 0;
							//if (--_loops < 1)
							//{
								//for (j = 0; j < (_pitchBufferLength - _bufferFill)*2; j++)
									//_ba.writeFloat(0);
								//
								//_bufferFill = _pitchBufferLength;
								//
								//soundComplete();
							//}
						}
						//_tmpPos = (_bufferFill == _pitchBufferLength ? _tmpPos + _samplesRead : 0);
					}
					
					//trace("0:",_tmpPos, tmpPos2);
				}

				
				var i:int, o:int;
				if (!_reversed)
				{
					for (i = 0; i < _bufferLength - 1; i++)
					{
						_count = i * pitch;
						_ba.position = Math.floor(_count)*8;
						
						try{
							e.data.writeFloat(_ba.readFloat());
							e.data.writeFloat(_ba.readFloat());
						}catch (err:Error) {
							break;
						}
					}
				}
				else
				{
					for (i = _bufferLength; i > 0 ; i--)
					{
						
						_count = i * pitch;
						_ba.position = Math.min(Math.floor(_count)*8, _ba.length-8);
							
						try{
							e.data.writeFloat(_ba.readFloat());
							e.data.writeFloat(_ba.readFloat());
						}catch (err:Error) {
							trace(err + "; i=" + i + ", floor(count)*8=" + Math.floor(_count) * 8 + ", pitchBufferLength=" + _pitchBufferLength + ", bufferLength=" + _bufferLength /8 + ", ba.len=" + _ba.length + ", pitch=" + _pitch);

							break;
						}
					}
				}
			}
			else
			{
				for (i = 0; i < _bufferLength; i++)
				{
					e.data.writeFloat(0);
					e.data.writeFloat(0);
				}
			}
		}
		
		private function soundComplete():void
		{
			removeEventListener(SampleDataEvent.SAMPLE_DATA, onSamples);
			
			dispatchEvent(new Event(Event.SOUND_COMPLETE, true, true));
		}
		
		private function onTmpSoundID3(e:Event):void 
		{
			var ne:Event = e.clone();
			dispatchEvent(ne);
		}
		
		private function onTmpSoundIOError(e:IOErrorEvent):void 
		{
			var ne:Event = e.clone();
			dispatchEvent(ne);
		}
		
		private function onTmpSoundOpen(e:Event):void 
		{
			var ne:Event = e.clone();
			dispatchEvent(ne);
		}
		
		private function onTmpSoundProgress(e:ProgressEvent):void 
		{
			var ne:Event = e.clone();
			dispatchEvent(ne);
		}
		
		/**
		 * The pitch factor. A pitch of 2 plays the sound at double speed, whereas -0.5 plays it backwards at half speed. 
		 */
		public function get pitch():Number { return _userPitch; }
		
		/**
		 * The pitch factor. A pitch of 2 plays the sound at double speed, whereas -0.5 plays it backwards at half speed. 
		 */
		public function set pitch(value:Number):void 
		{
			if (value < 0)
				_reversed = true;
			else
				_reversed = false;
				
			_userPitch = Math.round(value * 1000) / 1000;
			//_userPitch = value;
			_pitch = Math.min(Math.max(MIN_PITCH, Math.abs(_userPitch)), MAX_PITCH);
			_pitchBufferLength = _bufferLength * _pitch;
		}
		
		/**
		 * The size of the sound buffer. Use values between 2 and 8, higher and lower values will get clamped.
		 */
		public function get bufferLength():int { return _bufferLength/1024; }
		
		/**
		 * The size of the sound buffer. Use values between 2 and 8, higher and lower values will get clamped.
		 */
		public function set bufferLength(value:int):void 
		{
			_bufferLength = Math.round(Math.max(2, Math.min(value, 8))) * 1024;
			_pitchBufferLength = _bufferLength * _pitch;
		}
		
	}
	
}