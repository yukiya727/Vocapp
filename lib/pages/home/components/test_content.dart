import '../../../data/book.dart';
import '../../../styles.dart';

final List<Book> books = [
  Book(
    name: "Book 1",
    type: "language",
    language_type: "ES",
    tag: "test",
    isFavorite: false,
    id: 1,
    word_count: 100,
    learned_count: 0,
    last_viewed: DateTime.now(),
    created_time: DateTime.now(),
    logs: [],
    starred_words: [],
    chapters: {},
  ),
  Book(
    name: "Book 2",
    type: "language",
    language_type: "JP",
    tag: "test",
    isFavorite: true,
    id: 2,
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
  )
];

List stats = [
  {
    'title': 'Words Added',
    'value': 100,
    'color': kPrimaryColor2,
  },
  {
    'title': 'Words Studied',
    'value': 100,
    'color': kPrimaryColor2,
  },
  {
    'title': 'Words Added',
    'value': 100,
    'color': kPrimaryColor2,
  },
  {
    'title': 'Words Studied',
    'value': 100,
    'color': kPrimaryColor2,
  },
  {
    'title': 'Words Studied',
    'value': 100,
    'color': kPrimaryColor2,
  },
  {
    'title': 'Words Studied',
    'value': 100,
    'color': kPrimaryColor2,
  },
  {
    'title': 'Words Studied',
    'value': 100,
    'color': kPrimaryColor2,
  },
];

Map user_stats = {
  'name': 'Bear',
  'reg_date': '12/12/2020',
  'last_logged_in': "9/7/2022",
  'studied_days_total': 10,
  'studied_words_total': 1000,
  'words_added': 100,
  'log': [
    {
      'date': '12/12/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/13/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/14/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/15/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/16/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/17/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/18/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/19/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/20/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/21/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/22/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/23/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/24/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/25/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/26/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/27/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/28/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '12/29/2020',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '9/4/2022',
      'words_added': 100,
      'words_studied': 100,
    },
    {
      'date': '9/5/2022',
      'words_added': 100,
      'words_studied': 100,
    },
  ]
};
