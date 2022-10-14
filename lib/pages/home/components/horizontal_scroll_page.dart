import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vocapp/pages/books/chapter_page.dart';
import 'package:vocapp/test/test.dart';
import '../../../size_configs.dart';
import '../../../styles.dart';
import '../methods/hero_transition_tween.dart';

class BookLIstView extends StatefulWidget {
  BookLIstView({
    required this.books,
  });

  final List<Book> books;

  @override
  State<BookLIstView> createState() => _BookLIstViewState();
}

class _BookLIstViewState extends State<BookLIstView> {
  var _controller = PageController(
    viewportFraction: 0.8,
    initialPage: 1,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SizeV = SizeConfig.blockSizeV!;
    final SizeH = SizeConfig.blockSizeH!;
    return PageView(
      controller: _controller,
      children: <Hero>[
        for (int index = 0; index < widget.books.length; index++)
          Hero(
            tag: index,
            createRectTween: (Rect? begin, Rect? end) {
              //return MaterialRectCenterArcTween(begin: begin, end: end);
              return CustomRectTween(a: begin!, b: end!);
            },
            child:
            // index == 0
            //     ? Padding(
            //         padding: EdgeInsets.all(SizeH * 5)
            //             .copyWith(bottom: SizeV * 15),
            //         child: GestureDetector(
            //           onTap: () {
            //             print('add new book');
            //           },
            //           child: Container(
            //             padding: EdgeInsets.all(20),
            //             decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: kPrimaryColor,
            //             ),
            //             child: Icon(
            //               Icons.add,
            //               size: SizeV * 10,
            //               color: kScaffoldBackground,
            //             ),
            //           ),
            //         ),
            //       )
            //     :
              Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChapterPage(
                                book: widget.books[index],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.all(20.0),
                          elevation: 5.0,
                          borderOnForeground: false,
                          color: kSecondaryColor3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          child: AspectRatio(
                            aspectRatio: 3 / 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.books[index].name,
                                  style: kBodyText2,
                                ),
                                Text(
                                  widget.books[index].language_type,
                                  style: kBodyText4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: SizeV * 3,
                            color: kSecondaryColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new LinearPercentIndicator(
                              width: SizeH * 30,
                              animation: true,
                              lineHeight: SizeV * 1.5,
                              animationDuration: 2500,
                              percent: 0.2,
                              barRadius: const Radius.circular(16),
                              progressColor: kSecondaryColor3,
                            ),
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            size: SizeV * 3,
                            color: kSecondaryColor3,
                          ),
                        ],
                      ),
                      Text(
                        '20/100  words',
                        style: kBodyText3,
                      ),
                    ],
                  ),
          )
      ],
    );
  }
}
