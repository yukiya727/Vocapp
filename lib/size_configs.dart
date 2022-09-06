import 'package:flutter/material.dart';

// for responsive design
class SizeConfig {
  static MediaQueryData? queryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? screenRatio;
  static double? blockSizeHorizontal;
  static double? blockSizeV;

  void init(BuildContext context) {
    queryData = MediaQuery.of(context);
    screenWidth = queryData!.size.width;
    screenHeight = queryData!.size.height;
    screenRatio = queryData!.devicePixelRatio;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeV = screenHeight! / 100;
  }
}
