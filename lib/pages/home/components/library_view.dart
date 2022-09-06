import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../../widgets/buttons/small_text_button.dart';
import '../../../globals.dart' as globals;
import 'book_grid_view.dart';
import 'horizontal_scroll_list.dart';

class LibraryView extends StatefulWidget {
  LibraryView({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Map> books;

  @override
  _LibraryViewState createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: Column(
        children: [
          Expanded(
            flex: globals.library_edit_mode == 1 ? 2 : 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  globals.library_edit_mode == 1
                      ? Row(
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
                        )
                      : SizedBox(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: globals.library_edit_mode == 1
                        ? SmallTextButton(
                            buttonText: 'edit',
                            onPressed: () {
                              setState(
                                () {
                                  globals.library_edit_mode = 0;
                                  Navigator.of(context).pushReplacement(
                                    _createRoute(
                                      LibraryView(
                                        books: widget.books,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        : SmallTextButton(
                            buttonText: 'done',
                            onPressed: () {
                              setState(
                                () {
                                  globals.library_edit_mode = 1;
                                  Navigator.of(context).pushReplacement(
                                    _createRoute(
                                      LibraryView(
                                        books: widget.books,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: globals.library_edit_mode == 1 ? 6 : 8,
            child: globals.library_edit_mode == 1
                ? BookLIstView(
                    books: widget.books,
                  )
                : EditBookLIstView(
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
    transitionDuration: const Duration(milliseconds: 1200),
    reverseTransitionDuration: const Duration(milliseconds: 1200),
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
