package;

import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;

class FileUtil {
  public static var dir:String;
  public static var hxml:String;
  public static var content:String;
  
  public static function generate(path:String) {
    dir = Path.directory(path);
    hxml = Path.join([dir, "build.hxml"]);
    switch (FileSystem.exists(hxml)) {
      case true:
        File.saveContent(hxml, "");
      case false:
        File.saveContent(hxml, "");
    }
  }
  public static function append(text:String) {}
}
