package;

import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;

using StringTools;

class Parser {
	static var fc:String;
	static var lines:Array<String>;
	static var lc:Int;

	static var cv = {};

	static var tmp1:StringBuf;

	public static function parse(fp:String) {
		if (!FileSystem.exists(fp)) {
			return;
		} else {
			fc = File.getContent(fp);

			lines = fc.split("\n");
			lc = lines.length;

			for (i => v in lines) {
				if (v.charAt(0) == "/") {
					var t = v;
					t.substring(2);
					for (p in 0...t.length) {
						if (t.charAt(p) != "\"") {
							tmp1.addChar(p);
						} else {
							break;
						}
					}
				}
			}
		}
	}
}
