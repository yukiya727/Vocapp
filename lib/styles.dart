import 'package:flutter/material.dart';
import './size_configs.dart';

const Color kPrimaryColor = Color(0xFF7664ff);
const Color kPrimaryColor2 = Color(0xff4c3fa7);
const Color kSecondaryColor = Color(0xffff7664);
const Color kSecondaryColor2 = Color(0xffffc364);
const Color kSecondaryColor3 = Color(0xff649fff);
const Color kTextColor = Color(0xff000000);
const Color kButtonTextColor = Color(0xffffffff);
const Color kScaffoldBackground = Color(0xffffffff);
const Color kTextFieldBackground = Color(0xfff4e9ff);

final kTitle = TextStyle(
  fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeV! * 5.5,
  color: kTextColor,
);

final kTitle2 = TextStyle(
  fontFamily: 'Klasik',
  fontSize: SizeConfig.blockSizeV! * 5,
  color: kTextColor,
);

final kBodyText1 = TextStyle(
  color: kTextColor,
  fontSize:  SizeConfig.blockSizeV! * 4,
  fontWeight: FontWeight.bold,
);

final kBodyText2 = TextStyle(
  color: kTextColor,
  fontSize: SizeConfig.blockSizeV! * 2.5,
  fontWeight: FontWeight.bold,
);

final kBodyText3 = TextStyle(
    color: kTextColor,
    fontSize: SizeConfig.blockSizeV! * 2,
    fontWeight: FontWeight.normal);

final kButtonText = TextStyle(
    color: kButtonTextColor,
    // fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
    fontSize: 6 * 3,
    fontWeight: FontWeight.normal);

final kBodyText4 = TextStyle(
    color: kButtonTextColor,
    // fontSize: SizeConfig.blockSizeHorizontal! * 3.8,
    fontSize: 6 * 2,
    fontWeight: FontWeight.normal);

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: BorderSide.none,
);

final kInputHintStyle = kBodyText3.copyWith(
  fontWeight: FontWeight.normal,
  color: kTextColor.withOpacity(0.5),
);
