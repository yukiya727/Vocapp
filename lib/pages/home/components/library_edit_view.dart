import 'package:flutter/material.dart';
import 'package:vocapp/test/test.dart';

import '../../../styles.dart';
import '../../../widgets/buttons/small_text_button.dart';
import '../../../globals.dart' as globals;
import 'book_grid_view.dart';
import 'library_view.dart';

class LibraryEditView extends StatefulWidget {
  const LibraryEditView({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Book> books;

  @override
  State<LibraryEditView> createState() => _LibraryEditViewState();
}

class _LibraryEditViewState extends State<LibraryEditView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackground,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: SmallTextButton(
                        buttonText: "done",
                        onPressed: () {
                          setState(
                            () {
                              globals.library_edit_mode == 0;
                              // Navigator.of(context).popUntil((route) => route.isFirst);
                              Navigator.of(context).pop(
                                  LibraryView(books: widget.books),

                                // '/home',
                              );
                            },
                          );
                        },
                      ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child:
            EditBookLIstView(
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
    reverseTransitionDuration: const Duration(milliseconds: 2000),
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

