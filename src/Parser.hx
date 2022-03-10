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
	static var tmp2:Array<StringBuf>;

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
							tmp2[i] = tmp1;
							tmp1 = "";
							break;
						}
					}
					var l = t.substring(tmp2[i].length + 1);
					switch (l) {
						case "cp":
							FileUtil.append("--class-path " + tmp2[i]);
						case "m":
							FileUtil.append("--main " + tmp2[i]);
						case "op":
							cv.op = tmp2[i];
					}
				}
			}
		}
	}
}
