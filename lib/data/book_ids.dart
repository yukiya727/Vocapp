class BookIds {
  final List<String>? ids;

  BookIds({
    this.ids,
  });

  Map<String, dynamic> toMap() {
    return {
      'ids': ids,
    };
  }

  factory BookIds.readJson(Map<String, dynamic> json) => BookIds(
        ids: json['ids'] == null ? null : List<String>.from(json['ids']),
      );

  factory BookIds.fromJson(Map<String, dynamic> json) => BookIds.readJson(json);

  String idGenerator(DateTime time, String user_id) {
    final String time_str = time.millisecondsSinceEpoch.toString();
    return user_id + "." + time_str;
  }
}