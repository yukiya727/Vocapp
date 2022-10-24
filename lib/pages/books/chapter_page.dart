import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vocapp/pages/books/providers/cover_style.dart';
import 'package:vocapp/styles.dart';

import '../../test/test.dart';
import '../../size_configs.dart';
import '../../styles.dart';
import '../../validators.dart';
import '../../widgets/buttons/floating_button.dart';
import '../../widgets/fields/my_text_form_field.dart';
import 'components/color_palette.dart';
import 'components/message_box.dart';

class ChapterPage extends StatefulWidget {
  final Book book;

  ChapterPage({Key? key, required this.book}) : super(key: key);

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage>
    with TickerProviderStateMixin {
  final _nameKey = GlobalKey<FormState>();
  final _styleButtonKey = GlobalKey();
  final _styleMenuKey = GlobalKey();
  final _menuBarKey = GlobalKey();
  final SizeV = SizeConfig.blockSizeV!;
  final SizeH = SizeConfig.blockSizeH!;
  final screenHeight = SizeConfig.screenHeight!;
  final chapterNameController = TextEditingController();
  var adding_mode = false;
  var edit_style = false;
  var styleColor = Colors.white;
  late AnimationController _controller;
  late AnimationController _styleController;
  late Animation _colorAnimation;

  List<FocusNode> _nameFocusNodes = [
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();

    createBookIfNull();

    _nameFocusNodes.forEach((element) {
      element.addListener(() {});
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 150,
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          adding_mode = true;
        });
      } else {
        setState(() {
          adding_mode = false;
        });
      }
    });
    _colorAnimation = ColorTween(
      begin: kScaffoldBackground,
      // begin: kPrimaryColor,
      end: kPrimaryColor,
      // end: kScaffoldBackground,
    ).animate(_controller);

    _styleController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 150,
      ),
    );
    _styleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        edit_style = true;
      } else {
        edit_style = false;
      }
    });
  }

  void onSubmit() {
    if (_nameKey.currentState!.validate()) {
      _nameKey.currentState!.save();
      // Navigator.push(context, '/home');
    }
  }

  void onEdit() {
    setState(() {
      adding_mode ? _controller.reverse() : _controller.forward();
    });
  }

  void onEditStyle() {
    setState(() {
      edit_style ? _styleController.reverse() : _styleController.forward();
    });
  }

  void onCancelStyle() {
    setState(() {
      if (edit_style) {
        _styleController.reverse();
      }
      // edit_style ? _styleController.reverse() : _styleController.forward();
    });
  }

  void onStyleColorChange(Color color) {
    setState(() {
      styleColor = color;
    });
  }

  Future<void> onCreate() async {
    final chapterName = await chapterNameController.text;
    if (chapterName == "") {
      // context.showSnackBar(content: Text("You can't make chapter without name"),
      //     actionText: Text("Undo"), action: () {});
      print("Error: chapter name is null / empty.");
      return;
    }

    var chapterCreated = false; // necessary?
    if (_nameKey.currentState!.validate()) {
      _nameKey.currentState!.save();
      chapterCreated = await addChapter(true);
    }
    if (chapterCreated) {
      setState(() {
        FocusManager.instance.primaryFocus?.unfocus();
        adding_mode ? _controller.reverse() : _controller.forward();
      });
    }
  }

  List getStyleButtonInfo() {
    if (_styleButtonKey.currentContext != null) {
      final RenderBox renderBox =
          _styleButtonKey.currentContext?.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      return [position.dx, position.dy];
    } else {
      return [SizeH, 0.0];
    }
  }

  List getMenuBarSize() {
    if (_styleButtonKey.currentContext != null) {
      final RenderBox renderBox =
          _menuBarKey.currentContext?.findRenderObject() as RenderBox;
      final size = renderBox.size;
      return [size.width, size.height];
    } else {
      return [0.0, 0.0];
    }
  }

  List getStyleMenuSize() {
    if (_styleButtonKey.currentContext != null) {
      final RenderBox renderBox =
          _styleMenuKey.currentContext?.findRenderObject() as RenderBox;
      final size = renderBox.size;
      return [size.width, size.height];
    } else {
      return [0.0, 0.0];
    }
  }

  Future<bool> addChapter(bool? addBookIfNull) async {
    // set default value to addBookIfNull
    if (addBookIfNull == null) {
      addBookIfNull = false;
    }

    final bookExists = await checkBookExists(widget.book);
    if (!bookExists && addBookIfNull) {
      print("Error: Book doesn't exist, creating new book in database");
      writeBook(widget.book);
    } else if (!bookExists && !addBookIfNull) {
      print("Error: Book doesn't exist, please create a new book first");
      return false;
    }

    final chapterExists =
        await checkChapterExists(widget.book, chapterNameController.text);
    if (chapterExists) {
      print("Error: Chapter already exists");
      return false;
    }

    widget.book.chapters[chapterNameController.text] = {
      'name': chapterNameController.text,
      'style': {
        'color': styleColor.value,
      },
      'words': [],
      "LastViewed": DateTime.now().toIso8601String(),
      "Created": DateTime.now().toIso8601String(),
    };
    writeChapter(widget.book, widget.book.chapters[chapterNameController.text]);
    return true;
  }

  Future<void> createBookIfNull() async {
    final bookExists = await checkBookExists(widget.book);
    if (!bookExists) {
      print("Error: Book doesn't exist, creating new book in database");
      writeBook(widget.book);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _styleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: kScaffoldBackground, //top status bar
        systemNavigationBarColor: _colorAnimation.value, //bottom bar
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    key: _menuBarKey,
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeH * 5, top: SizeV * 2),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: kPrimaryColor,
                          size: SizeH * 8,
                        ),
                        onPressed: () {
                          dispose();
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
                            for (var chapterKey in widget.book.chapters.keys)
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
                                            widget
                                                    .book
                                                    .chapters[chapterKey]
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
                            onEdit();
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
                  // adding option menu
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset:
                            Offset(0.0, SizeV * 26 * (1 - _controller.value)),
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
                                        controller: chapterNameController,
                                        hint: 'Chapter Name',
                                        fillColor: kPrimaryColor2,
                                        icon: Icons.text_format,
                                        textColor: kScaffoldBackground,
                                        inputType: TextInputType.text,
                                        inputAction: TextInputAction.next,
                                        focusNode: _nameFocusNodes[0],
                                        validator: (value) =>
                                            chapterNameValidator(
                                                    widget.book, value)
                                                ? null
                                                : "Chapter name illegal.",
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
                                    key: _styleButtonKey,
                                    child: FloatingButton(
                                      bgColor: context
                                          .watch<CoverStyle>()
                                          .selectedColor,
                                      buttonIcon: Icons.palette,
                                      iconSizeX: 0.75,
                                      shadowColor: context
                                          .watch<CoverStyle>()
                                          .selectedColor,
                                      onPressed: () {
                                        setState(() {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        });
                                        onEditStyle();
                                        // print(chapterNameController.text);
                                      },
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
                                      onPressed: () {
                                        onCreate();
                                      },
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: SizeH * 2)),
                                  FloatingButton(
                                    bgColor: kPrimaryColor,
                                    buttonIcon: Icons.cancel,
                                    onPressed: () {
                                      onEdit();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      // Navigator.pushReplacementNamed(context, '/chapterManager');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (edit_style)
                    GestureDetector(
                      onTap: () {
                        onCancelStyle();
                      },
                    ),
                  Positioned(
                    // top: 0,
                    top: getStyleButtonInfo()[1] -
                        getMenuBarSize()[1] -
                        getStyleMenuSize()[1] -
                        SizeV * 1.5,
                    // left: 0,
                    left: getStyleButtonInfo()[0] - SizeH - 45,
                    child: IgnorePointer(
                      ignoring: !edit_style,
                      child: AnimatedBuilder(
                        key: _styleMenuKey,
                        animation: _styleController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _styleController.value,
                            child: child,
                          );
                        },
                        child: Column(
                          children: [
                            // Padding(padding: EdgeInsets.only(top: SizeV * 40.5)),
                            Container(
                              height: SizeV * 8,
                              width: SizeH * 85,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: CustomPaint(
                                  painter: customStyleArrow(),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        bottom: 20,
                                        top: 20),
                                    child: Column(
                                      children: [
                                        // Expanded(
                                        //   child:
                                        //   IconSelection(),
                                        // ),
                                        // Padding(
                                        //     padding: EdgeInsets.only(top: SizeV * 1)),
                                        Expanded(
                                            child: ColorPalette(
                                          onChange: onStyleColorChange,
                                          selectedColor: styleColor,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
