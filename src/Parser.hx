package;

import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;

class Parser {
	static var fc:String;
	static var lines:Array<String>;
	static var lc:Int;

	public static function parse(fp:String) {
		if (!FileSystem.exists(fp)) {
			return;
		} else {
			fc = File.getContent(fp);

			lines = fc.split("\n");
			lc = lines.length;
		}
	}
}
