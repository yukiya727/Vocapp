import 'package:path_provider/path_provider.dart';

import '../data/user_stats.dart';
import '../data/book.dart';
import 'package:flutter/material.dart';
import 'package:local_value/local_value.dart';

export '../data/user_stats.dart';
export '../data/book.dart';

final bookStorage = LocalValue<Book>(
  fromJson: Book.fromJson,
  toJson: (currentBook) => currentBook.toJson(),
);

void writeBook(Book book) async {
  print(book.id);
  await bookStorage.write(book.id.toString(), book);
}

void deleteBook(Book book) async {
  await bookStorage.delete(book.id.toString());
}

Future<bool> checkBookExists(Book book) async {
  final bookExists = await bookStorage.read(book.id.toString());
  return bookExists != null;
}

Future<bool> checkChapterExists(Book book, String chapterName) async {
  final bookExists = await bookStorage.read(book.id.toString());
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
    return;
  }
  writeBook(book);
}

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

// -------------------- testing part --------------------

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
  await counterStorage.write(counter2.id.toString(), counter2);

  // Read the user
  final counter3 = await counterStorage.read("2");

  // Print the user
  print(counter3?.name);
  print("#################################################\n");

  // book data manipulation




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

  await bookStorage.write("1", book1);
  await bookStorage.write(book2.id.toString(), book2);

  print(book1.id.toString());
  var tempBook1 = await bookStorage.read("1");
  print(tempBook1?.name);


  var tempBook = await bookStorage.read(book1.id.toString());
  print(tempBook?.id.toString());
  tempBook = await bookStorage.read(book2.id.toString());
  print(tempBook?.id.toString());

  var bookExists = await checkBookExists(book2);

  // clear all data
  await bookStorage.delete(book1.id.toString());
  await bookStorage.delete(book2.id.toString());
  bookExists = await checkBookExists(book1);
  print(bookExists);
  if (!bookExists) {
    print("Book 1 does not exist!");
  }


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
