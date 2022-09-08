class UserStats {
  final String user_name;
  final DateTime reg_date;
  final DateTime last_logged_in;
  final int studied_days_total;
  final int studied_words_total;
  final int words_added_total;
  final List<Map> logs;

  UserStats({
    required this.user_name,
    required this.reg_date,
    required this.last_logged_in,
    required this.studied_days_total,
    required this.studied_words_total,
    required this.words_added_total,
    required this.logs,
  });

  // factory UserStats.fromJson(Map<String, dynamic> json) {
  //   return UserStats(
  //     followers: json['followers'],
  //     following: json['following'],
  //     posts: json['posts'],
  //   );
  // }
}