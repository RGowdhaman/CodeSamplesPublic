package 
{
	public class AssetManager
	{
		
		// --------------------------------------
		//  Two Ways To Embed
		//
		//	1) As Individual MovieClips
		// --------------------------------------
		
		/**
		 * EMBED: 	One MovieClip From The Library Linked As 'BoyAndDogRunning'
		 */		
		[Embed(source = '../assets_compiletime/fla/DynamicTextureAtlasGenerator_Assets_v1.swf', symbol = "BoyAndDogRunning")] 
		public static var BoyAndDogRunning:Class;
		

		// --------------------------------------
		//  Two Ways To Embed
		//
		//	2) As One MovieClip containing MovieClips
		// --------------------------------------
		
		/**
		 * EMBED: 	One MovieClip From The Library Linked As 'SpriteSheet' 
		 * 
		 * 			With a named instance of 'myCircleInstance' &
		 * 			With a named instance of 'myAmoebaInstance'
		 */		
		[Embed(source = '../assets_compiletime/fla/DynamicTextureAtlasGenerator_Assets_v1.swf', symbol = "SpriteSheet")] 
		public static var SpriteSheet:Class;

		

	}
}
