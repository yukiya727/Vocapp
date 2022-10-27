import 'package:flutter/material.dart';

import '../../styles.dart';
import '../../size_configs.dart';

class MainIconTextButton extends StatelessWidget {
  MainIconTextButton({
    Key? key,
    required this.buttonName,
    required this.buttonTextColor,
    required this.buttonIconPath,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);
  final String buttonName;
  final String buttonIconPath;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color buttonTextColor;
  final blockSizeH = SizeConfig.blockSizeH;
  final blockSizeV = SizeConfig.blockSizeH;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: blockSizeV, horizontal: blockSizeH),
      child: TextButton.icon(
        onPressed: onPressed,
        label: Text(
          buttonName,
          style: TextStyle(
              color: buttonTextColor,
              fontSize: 6 * 3,
              fontWeight: FontWeight.normal),
        ),
        icon: Image.asset(
          buttonIconPath,
          height: 20,
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: bgColor)),
          ),
          backgroundColor: MaterialStateProperty.all(bgColor),
        ),
      ),
    );
  }
}
