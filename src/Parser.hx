package;

import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;

using StringTools;

class Parser {
	static var fc:String;
	static var lines:Array<String>;
	static var lc:Int;

	static var cv = {
		op: "",
		c: ""
	};

	static var tmp1:String;
	static var tmp2:Array<String>;
	static var tmp3:Array<String>;

	public static function parse(fp:String) {
		if (!FileSystem.exists(fp)) {
			return;
		} else {
			fc = File.getContent(fp);

			trace("Splitting lines");
			lines = fc.split("\n");
			lc = lines.length;

			for (i => v in lines) {
				trace("Scanning line " + i);
				if (v.charAt(0) == "/") {
					var t = v;
					t.substring(2);
					for (p in 0...t.length) {
						if (t.charAt(p) != "\"") {
							tmp1 = tmp1 + p;
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
				} else if (v.charAt(0) == ".") {
					var t = v.substring(6);
					for (p in 0...t.length) {
						if (t.charAt(p) != "\"") {
							tmp1 = tmp1 + p;
						} else {
							tmp3[i] = tmp1;
							tmp1 = "";
							break;
						}
					}
					FileUtil.append("-lib " + tmp3[i]);
				} else if (v.charAt(0) == "-") {
					var t = v.substring(1);
					cv.c = t;
				}
				FileUtil.append("-" + cv.c + " " + cv.op);
				FileUtil.save();
			}
		}
	}
}
