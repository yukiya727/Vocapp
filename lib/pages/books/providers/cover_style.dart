import 'package:flutter/material.dart';
import 'package:vocapp/styles.dart';

class CoverStyle with ChangeNotifier {
  late Color selectedColor = HSLColor.fromColor(Colors.blue)
      .withLightness(0.65)
      .withSaturation(0.6)
      .toColor();
  late int selectedColorIndex = 4;

  Color get color => selectedColor;

  void changeColor(color, index) {
    selectedColor = color;
    selectedColorIndex = index;
    notifyListeners();
  }
}
