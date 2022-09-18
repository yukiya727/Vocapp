import 'package:flutter/material.dart';

import '../../styles.dart';
import '../../size_configs.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({
    Key? key,
    this.buttonName,
    this.buttonTextColor,
    this.isFloating = false,
    this.widthX = 1.0,
    this.iconSizeX = 1.0,
    required this.onPressed,
    required this.bgColor,
    required this.buttonIcon,
  }) : super(key: key);
  final String? buttonName;
  final Color? buttonTextColor;
  final bool isFloating;
  final double widthX;
  final double iconSizeX;
  final VoidCallback onPressed;
  final Color bgColor;
  final IconData buttonIcon;
  final blockSizeH = SizeConfig.blockSizeHorizontal;
  final blockSizeV = SizeConfig.blockSizeHorizontal;
  final screenWidth = SizeConfig.screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: blockSizeV!, horizontal: blockSizeH!),
      child: Container(
        height: blockSizeV! * 11,
        width: blockSizeH! * 25 * widthX,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: onPressed,
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: blockSizeH! * 10 * widthX),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    buttonIcon,
                    size: blockSizeH! * 8 * iconSizeX,
                    color: Colors.white,
                  ),
                  if (buttonName != null)
                    Text(
                      buttonName!,
                      style: TextStyle(
                        color: buttonTextColor ?? Colors.white,
                        fontSize: blockSizeH! * 5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
