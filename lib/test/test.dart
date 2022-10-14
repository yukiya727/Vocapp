// import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../data/user_stats.dart';
import '../data/book.dart';
import 'package:flutter/material.dart';
import 'package:local_value/local_value.dart';

export '../data/user_stats.dart';
export '../data/book.dart';

class CounterObj {
  final int id;
  final String name;

  CounterObj(this.id, this.name);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  factory CounterObj.fromJson(Map<String, dynamic> json) => CounterObj(
        json['id'] as int,
        json['name'] as String,
      );
}

final bookStorage = LocalValue<Book>(
  fromJson: Book.fromJson,
  toJson: (currentBook) => currentBook.toJson(),
);

void writeBook(Book book) async {
  await bookStorage.write(book.id.toString(), book);
}

Future<bool> checkBookExists(Book book) async {
  final bookExists = await bookStorage.read(book.createId().toString());
  return bookExists != null;
}

Future<bool> checkChapterExists(Book book, String chapterName) async {
  final bookExists = await bookStorage.read(book.name);
  if (bookExists != null) {
    return bookExists.chapters.containsKey(chapterName);
  }
  print("Error: Book does not exist!");
  return false;
}

void writeChapter(Book book, Map chapter) async {
  book.chapters[chapter['name']] = chapter;
  // await bookStorage.write(book.name, book);
  bool bookExists = await checkBookExists(book);
  if (!bookExists) {
    print("Error: Book does not exist, please create book first before adding chapters.");
  }
  else {
    writeBook(book);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final counterStorage = LocalValue<CounterObj>(
    // id: 'counter',
    fromJson: CounterObj.fromJson,
    toJson: (currentUser) => currentUser.toJson(),
  );

  CounterObj counter1 = CounterObj(1, "John");
  CounterObj counter2 = CounterObj(2, "Helen");

  // Save the user
  await counterStorage.write("1", counter1);
  await counterStorage.write("2", counter2);

  // Read the user
  final counter3 = await counterStorage.read("2");

  // Print the user
  print(counter3?.name);
  print("#################################################\n");

  // book data manipulation



  // -------------------- testing part --------------------

  Book book1 = Book(
    name: "Book 1",
    type: "language",
    language_type: "ES",
    tag: "tag",
    isFavorite: true,
    id: 1,
    word_count: 100,
    learned_count: 50,
    last_viewed: DateTime.now(),
    created_time: DateTime.now(),
    logs: [
      {"date": DateTime.now().toIso8601String(), "words": 10},
      {"date": DateTime.now().toIso8601String(), "words": 20},
    ],
    starred_words: [],
    chapters: {},
  );

  Future.delayed(Duration(microseconds: 20));

  Book book2 = Book(
    name: "Book 2",
    author: "Author X",
    type: "language",
    language_type: "DE",
    tag: "tag",
    isFavorite: true,
    id: 2,
    word_count: 100,
    learned_count: 50,
    last_viewed: DateTime.now(),
    created_time: DateTime.now(),
    logs: [],
    starred_words: [],
    chapters: {},
  );

  await bookStorage.write("Book 1", book1);
  await bookStorage.write(book2.name, book2);

  var tempBook = await bookStorage.read(book1.name);
  print(tempBook?.name);
  tempBook = await bookStorage.read(book2.name);
  print(tempBook?.name);

  // clear all data
  await bookStorage.delete(book1.name);
  await bookStorage.delete(book2.name);
  tempBook = await bookStorage.read(book1.name);
  print(tempBook?.name);

  // UserStats user1 = UserStats(
  //   user_name: "John",
  //   reg_date: DateTime.now(),
  //   last_logged_in: DateTime.now(),
  //   studied_days_total: 0,
  //   studied_words_total: 0,
  //   words_added_total: 0,
  // );
  // final filename = "user_data";
  //
  // new File(
  //         '${(await getApplicationDocumentsDirectory()).path}/flutter/Vocapp/json/$filename.json')
  //     .create(recursive: true)
  //     .then((File file) {
  //   file.writeAsString(json.encode(user1.toJson()));
  //   file.writeAsString(json.encode(user1.toJson()));
  //   print('Path of New Dir: ' + file.path);
  // });
  //
  // new File(
  //         '${(await getApplicationDocumentsDirectory()).path}/flutter/Vocapp/json/$filename.json')
  //     .readAsString()
  //     .then((String contents) {
  //   print(contents);
  // });
  // UserStats user2 = UserStats.fromJson(json.decode(new File(
  //         '${(await getApplicationDocumentsDirectory()).path}/flutter/Vocapp/json/$filename.json')
  //     .readAsStringSync()));
  // print('User 2\'s name: ' + user2.user_name);
}
