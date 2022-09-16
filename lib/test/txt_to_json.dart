import 'dart:io';
import 'package:path/path.dart' as path;

void main() {
  final lang = "Spanish";
  final file = File(path.join(Directory.current.path, 'lib', 'data', 'Duolingo',
      lang, '$lang.txt'));
  var lines = file.readAsLinesSync();

  var chapter_i = 1;
  var chapters = <Map>[];
  var chapter_words = [];
  var write = false;

  for (var line in lines) {
    if (line.isNotEmpty) {
      if (isNumeric(line[0])) {
        write = true;
        line = line.replaceAll(" ", "");
        line = line.replaceAll(".", ",");

        final words = line.split(",");

        // print(words);
        for (var word in words) {
          if (word != "") {
            if (!isNumeric(word)) {
              chapter_words.add(word);
            }
          }
        }
      } else if (write) {
        write = false;
        if (chapter_words != []) {
          chapters.add({
            "Chapter": chapter_i,
            "Words": chapter_words,
          });
        }
        chapter_i++;
        chapter_words = [];
      }
    }
  }

  // print(chapters);

  // write to json
  final jsonFile = File(path.join(Directory.current.path, 'lib', 'data',
      'Duolingo', lang, '$lang.json'));
  jsonFile.writeAsStringSync(chapters.toString());
}

bool isNumeric(String string) {
  // Null or empty string is not a number
  if (string.length == 0) {
    return false;
  }
  final number = num.tryParse(string);

  if (number == null) {
    return false;
  }

  return true;
}
