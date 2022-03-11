package;

import sys.io.File;

class Main {
	public static var args = Sys.args();
	public static var dir = Sys.command("cd");

	public static function main() {
		trace("Haxemake version 0.0.0.2");
		trace("Generating HXML");
		FileUtil.generate(args[0]);
		trace("Parsing HXMK");
		Parser.parse(args[0]);
		trace("Done!");
	}
}
