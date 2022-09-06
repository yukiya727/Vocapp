import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../styles.dart';
import '../../widgets/others/main_navi_bar.dart';
import 'components/library_view.dart';
import '../../../globals.dart' as globals;

// a homepage with a navigator bar and a body
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _controller = PageController(
    initialPage: 0,
  );

  final List<Map> books = [
    {
      "Name": "Book 1",
      "Type": "language",
      "LanguageType": "ES",
      "Words": "100",
      "Learned": "20",
      "LastViewed": "2022-01-01",
      "Created": "2021-01-01",
      "isFavorite": false,
    },
    {
      "Name": "Book 2",
      "Type": "language",
      "LanguageType": "SV",
      "Words": "100",
      "Learned": "20",
      "LastViewed": "2022-01-01",
      "Created": "2021-01-01",
      "isFavorite": true,
    },
    {
      "Name": "Book 3",
      "Type": "language",
      "LanguageType": "ZH",
      "Words": "100",
      "Learned": "20",
      "LastViewed": "2022-01-01",
      "Created": "2021-01-01",
      "isFavorite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: kScaffoldBackground, //top status bar
        systemNavigationBarColor: kPrimaryColor, //bottom bar
      ),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: globals.library_edit_mode == 1
              ? MyNaviBar(
                  controller: _controller,
                )
              : null,
          body: PageView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                LibraryView(books: books),
                Container(
                  color: Colors.redAccent,
                ),
                Container(
                  color: Colors.green,
                ),
              ]),
        ),
      ),
    );
  }
}
