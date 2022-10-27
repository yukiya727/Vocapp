import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocapp/pages/home/components/stats_view.dart';
import '../../size_configs.dart';
import '../../styles.dart';
import '../../widgets/others/main_navi_bar.dart';
import 'components/library_view.dart';
import 'components/test_content.dart' as contents;
import '../../../globals.dart' as globals;

// a homepage with a navigator bar and a body
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _controller = PageController(
    initialPage: 0,
  );

  // for testing
  final books = contents.books;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context: context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: kScaffoldBackground, //top status bar
        systemNavigationBarColor: kPrimaryColor, //bottom bar
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
        Brightness.dark,
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
              StatsView(books: books),
              Container(
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
