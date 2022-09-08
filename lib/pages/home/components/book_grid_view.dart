import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../size_configs.dart';
import '../../../styles.dart';
import 'hero_transition_tween.dart';

class EditBookLIstView extends StatefulWidget {
  const EditBookLIstView({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<Map> books;

  @override
  _EditBookLIstViewState createState() => _EditBookLIstViewState();
}

class _EditBookLIstViewState extends State<EditBookLIstView> {
  var _controller = PageController(
    viewportFraction: 1,
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SizeV = SizeConfig.blockSizeV!;
    final SizeH = SizeConfig.blockSizeHorizontal!;

    return
      AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: kScaffoldBackground, //top status bar
          systemNavigationBarColor: kPrimaryColor,
        ),
        child: GridView.count(
          // physics: const PageScrollPhysics(),
          // controller: _controller,
          crossAxisCount: 3,
          childAspectRatio: 3 / 4,
          padding: const EdgeInsets.all(8.0),
          children: <Hero>[
            for (int index = 0; index < widget.books.length; index++)
              Hero(
                tag: index,
                createRectTween: (Rect? begin, Rect? end) {
                  // return MaterialRectCenterArcTween(begin: begin, end: end);
                  return CustomRectTween(a: begin!, b: end!);
                },
                child: Card(
                  margin: const EdgeInsets.all(6.0),
                  elevation: 4.0,
                  borderOnForeground: false,
                  color: kSecondaryColor3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.books[index]['Name'],
                        style: kBodyText4,
                      ),
                      Text(
                        widget.books[index]['LanguageType'],
                        style: kBodyText4,
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      );
  }
}