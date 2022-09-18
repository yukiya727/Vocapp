import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocapp/styles.dart';

import '../../data/book.dart';
import '../../size_configs.dart';
import '../../styles.dart';
import '../../validators.dart';
import '../../widgets/buttons/floating_button.dart';
import '../../widgets/fields/my_text_form_field.dart';
import '../home/components/horizontal_scroll_page.dart';

class ChapterPage extends StatefulWidget {
  final Map book;

  ChapterPage({Key? key, required this.book}) : super(key: key);

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> with SingleTickerProviderStateMixin{
  final _nameKey = GlobalKey<FormState>();
  var adding_mode = false;
  late AnimationController _controller;
  late Animation _colorAnimation;

  List<FocusNode> _nameFocusNodes = [
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();

    _nameFocusNodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    _colorAnimation = ColorTween(
      begin: kScaffoldBackground,
      end: kPrimaryColor,
    ).animate(_controller);
  }

  void onSubmit() {
    if (_nameKey.currentState!.validate()) {
      _nameKey.currentState!.save();
      // Navigator.push(context, '/home');
    }
  }

  void onAddition() {
    setState(() {
      adding_mode == true ? adding_mode = false : adding_mode = true;
      if (adding_mode == true) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SizeV = SizeConfig.blockSizeV!;
    final SizeH = SizeConfig.blockSizeHorizontal!;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: kScaffoldBackground, //top status bar
        systemNavigationBarColor: _colorAnimation.value, //bottom bar
      ),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeH * 5, top: SizeV * 2),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: kPrimaryColor,
                          size: SizeH * 8,
                        ),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 3 / 4,
                          children: [
                            for (var chapterKey in widget.book['chapters'].keys)
                              Card(
                                margin: const EdgeInsets.all(6.0),
                                elevation: 4.0,
                                borderOnForeground: false,
                                color: kSecondaryColor3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            // widget.book['chapters'][chapterKey]['name'],
                                            chapterKey,
                                            style: kBodyText3),
                                        Text(
                                            widget.book['chapters'][chapterKey]
                                                        ['Words']
                                                    .toString() +
                                                " words",
                                            style: kBodyText4),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ]),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: SizeV * 10,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.15),
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
              // !adding_mode ?
              Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingButton(
                              bgColor: kPrimaryColor,
                              buttonIcon: Icons.add,
                              onPressed: () {
                                onAddition();
                              },
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: SizeH * 10)),
                            FloatingButton(
                              bgColor: kPrimaryColor,
                              buttonIcon: Icons.menu_book_rounded,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0.0, SizeV * 26 * (1 - _controller.value)),
                            child: child,
                          );
                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.only(top: SizeH * 5),
                            height: SizeV * 25,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset:
                                  Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: SizeH * 3),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeH * 9)),
                                      Text(
                                        "Name",
                                        style: kBodyText3.copyWith(
                                            color: kScaffoldBackground),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeH * 5)),
                                      Expanded(
                                        child: Form(
                                          key: _nameKey,
                                          child: MyTextFormField(
                                            hint: 'Chapter Name',
                                            fillColor: kPrimaryColor2,
                                            icon: Icons.text_format,
                                            textColor: kScaffoldBackground,
                                            inputType: TextInputType.text,
                                            inputAction: TextInputAction.next,
                                            focusNode: _nameFocusNodes[0],
                                            validator: nameValidator,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: SizeV * 1)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                          EdgeInsets.only(left: SizeH * 10)),
                                      Text(
                                        "Style",
                                        style: kBodyText3.copyWith(
                                            color: kScaffoldBackground),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeH * 5)),
                                      Expanded(
                                        child: FloatingButton(
                                          bgColor:
                                          kSecondaryColor3.withOpacity(0.7),
                                          buttonIcon: Icons.rocket_launch,
                                          iconSizeX: 0.75,
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: SizeV * 1)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: FloatingButton(
                                          bgColor: kPrimaryColor,
                                          buttonIcon: Icons.add,
                                          widthX: 2,
                                          onPressed: () {},
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeH * 2)),
                                      FloatingButton(
                                        bgColor: kPrimaryColor,
                                        buttonIcon: Icons.cancel,
                                        onPressed: () {
                                          onAddition();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),],
                  )
                  // : Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Container(
                  //       padding: EdgeInsets.only(top: SizeH * 5),
                  //       height: SizeV * 25,
                  //       decoration: BoxDecoration(
                  //         color: kPrimaryColor,
                  //         borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(30.0),
                  //           topRight: Radius.circular(30.0),
                  //         ),
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.black.withOpacity(0.2),
                  //             spreadRadius: 2,
                  //             blurRadius: 5,
                  //             offset:
                  //                 Offset(0, 3), // changes position of shadow
                  //           ),
                  //         ],
                  //       ),
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: SizeH * 3),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 Padding(
                  //                     padding:
                  //                         EdgeInsets.only(left: SizeH * 9)),
                  //                 Text(
                  //                   "Name",
                  //                   style: kBodyText3.copyWith(
                  //                       color: kScaffoldBackground),
                  //                 ),
                  //                 Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                         horizontal: SizeH * 5)),
                  //                 Expanded(
                  //                   child: Form(
                  //                     key: _nameKey,
                  //                     child: MyTextFormField(
                  //                       hint: 'Chapter Name',
                  //                       fillColor: kPrimaryColor2,
                  //                       icon: Icons.text_format,
                  //                       textColor: kScaffoldBackground,
                  //                       inputType: TextInputType.text,
                  //                       inputAction: TextInputAction.next,
                  //                       focusNode: _nameFocusNodes[0],
                  //                       validator: nameValidator,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Padding(padding: EdgeInsets.only(top: SizeV * 1)),
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 Padding(
                  //                     padding:
                  //                         EdgeInsets.only(left: SizeH * 10)),
                  //                 Text(
                  //                   "Style",
                  //                   style: kBodyText3.copyWith(
                  //                       color: kScaffoldBackground),
                  //                 ),
                  //                 Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                         horizontal: SizeH * 5)),
                  //                 Expanded(
                  //                   child: FloatingButton(
                  //                     bgColor:
                  //                         kSecondaryColor3.withOpacity(0.7),
                  //                     buttonIcon: Icons.rocket_launch,
                  //                     iconSizeX: 0.75,
                  //                     onPressed: () {},
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Padding(padding: EdgeInsets.only(top: SizeV * 1)),
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Expanded(
                  //                   child: FloatingButton(
                  //                     bgColor: kPrimaryColor,
                  //                     buttonIcon: Icons.add,
                  //                     widthX: 2,
                  //                     onPressed: () {},
                  //                   ),
                  //                 ),
                  //                 Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                         horizontal: SizeH * 2)),
                  //                 FloatingButton(
                  //                   bgColor: kPrimaryColor,
                  //                   buttonIcon: Icons.cancel,
                  //                   onPressed: () {
                  //                     onAddition();
                  //                   },
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
            ],
          ),
        ),
      ),
    );
  }
}
