import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharehouse_app/pages/onboarding/components/page_counter.dart';
import 'package:sharehouse_app/pages/onboarding/components/page_indicator.dart';

import '../../../styles.dart';
import '../../../widgets/buttons/main_text_button.dart';
import 'onboard_nav_btn.dart';
import '../../authentication/sign_up_page.dart';
import 'onboarding_contents.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    int _currentPage = Provider.of<PageCounter>(context).currentPage;

    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _currentPage == onBoardingContents.length - 1
                ? Expanded(
                    child: MainTextButton(
                      buttonName: 'Get Started',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      bgColor: kPrimaryColor,
                    ),
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
                                  builder: (context) => SignUpPage()));
                          Provider.of<PageCounter>(context, listen: false)
                              .page_count = onBoardingContents.length; // skip
                        },
                      ),
                      PageIndicator(),
                      OnBoardNavBtn(
                        name: 'Next',
                        onPressed: () {
                          Provider.of<PageCounter>(context, listen: false)
                              .nextPage();
                        },
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
