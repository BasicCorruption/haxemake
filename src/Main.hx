package;

import sys.io.File;

class Main {
	public static var args = Sys.args();
	public static var dir = Sys.command("cd");

	public static function main() {
		FileUtil.generate(args[0]);
		Parser.parse(args[0]);
	}
}
