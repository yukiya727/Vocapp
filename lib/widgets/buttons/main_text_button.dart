import 'package:flutter/material.dart';

import '../../styles.dart';
import '../../size_configs.dart';

class MainTextButton extends StatelessWidget {
  MainTextButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;
  final blockSizeH = SizeConfig.blockSizeHorizontal;
  final blockSizeV = SizeConfig.blockSizeHorizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: blockSizeV!,
          horizontal: blockSizeH!
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: kButtonText,
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: bgColor)),
        ),
          backgroundColor: MaterialStateProperty.all(bgColor),),
      ),
    );
  }
}
