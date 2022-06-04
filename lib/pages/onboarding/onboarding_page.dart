import 'package:flutter/material.dart';
import 'package:sharehouse_app/pages/onboarding/components/onboarding_contents.dart';
import 'package:sharehouse_app/size_configs.dart';
import '../../styles.dart';
import '../../widgets/buttons/main_text_button.dart';
// import '../authentication/sign_up_page.dart';
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
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
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
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    double sizeH = SizeConfig.blockSizeHorizontal!;

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
                    height: sizeV * 10,
                  ),
                  Container(
                    height: sizeV * 50,
                    child: Image.asset(
                      onBoardingContents[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    // height: sizeV * 5,
                  ),
                  Text(
                    onBoardingContents[index].title,
                    style: kTitle,
                    textAlign: TextAlign.center,
                  ),
                  Padding(padding: EdgeInsets.only(top: sizeV * 5)),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: sizeH * 5),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: kBodyText1,
                          children: [
                            TextSpan(text: 'WE CAN '),
                            TextSpan(
                                text: 'HELP YOU ',
                                style: kBodyText2
                            ),
                            TextSpan(text: 'TO HAVE A BETTER '),
                            TextSpan(text: 'LIFE IN YOUR '),
                            TextSpan(
                              text: 'SHAREHOUSE ',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
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
                horizontal: sizeH * 5,
                vertical: sizeV * 5),
            child: Column(
              children: [
                currentPage == onBoardingContents.length - 1
                    ? MainTextButton(
                      buttonName: 'Get Started',
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => SignUpPage(),
                        //     ));
                      },
                      bgColor: kPrimaryColor,
                    )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnBoardNavBtn(
                            name: 'Skip',
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => SignUpPage()));
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
