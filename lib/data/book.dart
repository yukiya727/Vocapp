class Book {
  final String name;
  final String? author;
  final String type;
  final String language_type;
  final String tag;
  final bool isFavorite;
  late int id;
  final int word_count;
  final int learned_count;
  final DateTime last_viewed;
  final DateTime created_time;
  final List<Map> logs;
  final List<String> starred_words;
  final Map chapters;

  Book({
    required this.name,
    this.author,
    required this.type,
    required this.language_type,
    required this.tag,
    required this.isFavorite,
    required this.id,
    required this.word_count,
    required this.learned_count,
    required this.last_viewed,
    required this.created_time,
    required this.logs,
    required this.starred_words,
    required this.chapters,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'author': author,
      'type': type,
      'language_type': language_type,
      'tag': tag,
      'isFavorite': isFavorite,
      'word_count': word_count,
      'learned_count': learned_count,
      'last_viewed': last_viewed.toIso8601String(),
      'created_time': created_time.toIso8601String(),
      'logs': logs,
      'starred_words': starred_words,
      'chapters': chapters,
    };
  }

  factory Book.readJson(Map<String, dynamic> json) => Book(
        name: json['name'] as String,
        author: json['author'] == null ? null : json['author'] as String,
        type: json['type'] as String,
        language_type: json['language_type'] as String,
        tag: json['tag'] as String,
        isFavorite: json['isFavorite'] as bool,
        id: json['id'] as int,
        word_count: json['word_count'] as int,
        learned_count: json['learned_count'] as int,
        last_viewed: DateTime.parse(json["last_viewed"]),
        created_time: DateTime.parse(json["created_time"]),
        logs: json['logs'] == null
            ? []
            : List<Map>.from(json['logs'].map((x) => Map.from(x))),
        starred_words: json['starred_words'] == null
            ? []
            : List<String>.from(json['starred_words'].map((x) => x)),
        chapters: json['chapters'] as Map,
      );

  Map<String, dynamic> toJson() => toMap();

  factory Book.fromJson(Map<String, dynamic> json) => Book.readJson(json);

  int createId() {
    int id = DateTime.now().millisecondsSinceEpoch;
    return id;
  }

  Book createEmptyBook(
      name, type, language_type, tag, word_count, learned_count) {
    // Create a new book
    Book book = Book(
      name: name,
      type: type,
      language_type: language_type,
      tag: tag,
      isFavorite: false,
      id: createId(),
      word_count: word_count,
      learned_count: learned_count,
      last_viewed: DateTime.now(),
      created_time: DateTime.now(),
      logs: [],
      starred_words: [],
      chapters: {},
    );
    return book;
  }
}
