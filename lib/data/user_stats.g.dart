part of 'user_stats.dart';

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return UserStats(
    user_name: json['user_name'] as String,
    reg_date: DateTime.parse(json['reg_date'] as String),
    last_logged_in: DateTime.parse(json['last_logged_in'] as String),
    studied_days_total: json['studied_days_total'] as int,
    studied_words_total: json['studied_words_total'] as int,
    words_added_total: json['words_added_total'] as int,
    logs: (json['logs'] as List<dynamic>?)
        ?.map((e) => e as Map<String, dynamic>)
        .toList(),
  );
}

Map<String, dynamic> _$UserStatsToJson(UserStats instance) => <String, dynamic>{
      'user_name': instance.user_name,
      'reg_date': instance.reg_date.toIso8601String(),
      'last_logged_in': instance.last_logged_in.toIso8601String(),
      'studied_days_total': instance.studied_days_total,
      'studied_words_total': instance.studied_words_total,
      'words_added_total': instance.words_added_total,
      'logs': instance.logs,
    };
