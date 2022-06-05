import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharehouse_app/pages/onboarding/components/onboarding_contents.dart';
import 'package:sharehouse_app/pages/onboarding/components/page_counter.dart';

class PageIndicator extends StatefulWidget {
  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: index ? Colors.green : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        onBoardingContents.length,
        (index) => dotIndicator(index == Provider.of<PageCounter>(context).currentPage),
        // (index) => dotIndicator(index),
      ),
    );
  }
}
