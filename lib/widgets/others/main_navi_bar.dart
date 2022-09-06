import 'package:flutter/material.dart';
import 'package:vocapp/styles.dart';
import 'package:vocapp/size_configs.dart';
import '../../globals.dart' as globals;

class MyNaviBar extends StatefulWidget {
  const MyNaviBar({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final PageController controller;

  @override
  _MyNaviBarState createState() => _MyNaviBarState();
}

class _MyNaviBarState extends State<MyNaviBar> {
  @override
  Widget build(BuildContext context) {
    double sizeV = SizeConfig.blockSizeV! * 8;
    return Container(
      height: sizeV,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.75),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            iconSize: SizeConfig.blockSizeV! * 3.5,
            icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (child, anim) => FadeTransition(
                      opacity: anim,
                      child: child,
                    ),
                child: globals.home_page_view == 1
                    ? Icon(
                        Icons.book,
                        key: const ValueKey('icon1'),
                        color: kButtonTextColor,
                      )
                    : Icon(
                        Icons.book_outlined,
                        key: const ValueKey('icon2'),
                        color: kButtonTextColor,
                      )),
            onPressed: () {
              setState(() {
                globals.home_page_view = 1;
                widget.controller.jumpToPage(0);
              });
            },
          ),
          IconButton(
            iconSize: SizeConfig.blockSizeV! * 3.5,
            icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (child, anim) => FadeTransition(
                      opacity: anim,
                      child: child,
                    ),
                child: globals.home_page_view == 2
                    ? Icon(
                        Icons.area_chart_rounded,
                        key: const ValueKey('icon1'),
                        color: kButtonTextColor,
                      )
                    : Icon(
                        Icons.area_chart_outlined,
                        key: const ValueKey('icon2'),
                        color: kButtonTextColor,
                      )),
            onPressed: () {

              setState(() {
                globals.home_page_view = 2;
                widget.controller.jumpToPage(1);
              });
            },
          ),
          IconButton(
            iconSize: SizeConfig.blockSizeV! * 3.5,
            icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (child, anim) => FadeTransition(
                      opacity: anim,
                      child: child,
                    ),
                child: globals.home_page_view == 3
                    ? Icon(
                        Icons.person,
                        key: const ValueKey('icon1'),
                        color: kButtonTextColor,
                      )
                    : Icon(
                        Icons.person_outline,
                        key: const ValueKey('icon2'),
                        color: kButtonTextColor,
                      )),
            onPressed: () {
              setState(() {
                globals.home_page_view = 3;
                widget.controller.jumpToPage(2);
              });
            },
          ),
        ],
      ),
    );
  }
}
