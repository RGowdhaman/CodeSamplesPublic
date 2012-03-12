package com.rmc.utils
{
	import flash.utils.describeType;
	
	public class CStringUtils
	{
	    public static function InitEnumConstants(inType :*) :void
	    {
	        var type :XML = describeType(inType);
	        for each (var constant :XML in type.constant) {
	            inType[constant.@name].Text = constant.@name;
	        }
	    }
	}
}