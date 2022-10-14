import 'package:flutter/material.dart';
import 'package:vocapp/test/test.dart';

import '../../../size_configs.dart';
import '../../../styles.dart';
import '../../../widgets/buttons/small_text_button.dart';
import '../../../globals.dart' as globals;
import 'horizontal_scroll_page.dart';
import 'library_edit_view.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Book> books;

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SizeV = SizeConfig.blockSizeV!;
    final SizeH = SizeConfig.blockSizeH!;

    return Scaffold(
      // backgroundColor: kScaffoldBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: SizeV * 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Good morning',
                      textAlign: TextAlign.right,
                      style: kBodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmallTextButton(
                    buttonText: 'add',
                    onPressed: () {
                      setState(
                            () {
                          // globals.library_edit_mode = 1;
                          // Navigator.of(context).popUntil((route) => route.isFirst);
                          // Navigator.of(context).push(
                          //   _createRoute(
                          //     LibraryEditView(books: widget.books),
                          //   ),
                            // '/home',
                          // );
                        },
                      );
                    },
                  ),
                    SmallTextButton(
                      buttonText: 'edit',
                      onPressed: () {
                        setState(
                          () {
                            globals.library_edit_mode = 1;
                            // Navigator.of(context).popUntil((route) => route.isFirst);
                            Navigator.of(context).push(
                              _createRoute(
                                LibraryEditView(books: widget.books),
                              ),
                              // '/home',
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: BookLIstView(
              books: widget.books,
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        destination,
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCirc,
            reverseCurve: Curves.easeOutCirc.flipped),
        child: child,
      );
    },
  );
}
