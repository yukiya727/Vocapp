import 'package:flutter/material.dart';
import 'package:vocapp/pages/onboarding/components/onboarding_contents.dart';
import 'package:vocapp/size_configs.dart';
import '../../styles.dart';
import '../../widgets/buttons/main_text_button.dart';
import '../../pages/authentication/login_page.dart';
import 'components/onboard_nav_btn.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor3,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    double sizeV = SizeConfig.blockSizeV;
    double sizeH = SizeConfig.blockSizeH;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onBoardingContents.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  Container(
                    height: sizeV * 40,
                    child: Image.asset(
                      onBoardingContents[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // SizedBox(
                  //   height: sizeV * 5,
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sizeH * 10),
                    child: Text(
                      onBoardingContents[index].title,
                      textAlign: TextAlign.center,
                      style: kTitle,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: sizeV * 5)),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: sizeH * 10),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: kBodyText1,
                          children: [
                            TextSpan(
                              text: onBoardingContents[index].description,
                              style: kBodyText2,
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: sizeV * 2,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizeH * 5, vertical: sizeV * 5),
            child: Column(
              children: [
                currentPage == onBoardingContents.length - 1
                    ? MainTextButton(
                        buttonName: 'Get Started',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        bgColor: kPrimaryColor,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnBoardNavBtn(
                            name: 'Skip',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          ),
                          Row(
                            children: List.generate(
                              onBoardingContents.length,
                              (index) => dotIndicator(index),
                            ),
                          ),
                          OnBoardNavBtn(
                            name: 'Next',
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                          )
                        ],
                      ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
