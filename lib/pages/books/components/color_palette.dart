import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocapp/pages/books/providers/cover_style.dart';

import '../../../styles.dart';

class ColorPalette extends StatefulWidget {
  final void Function(Color) onChange;
  final Color selectedColor;

  const ColorPalette({
    Key? key,
    required this.onChange,
    required this.selectedColor,
  }) : super(key: key);

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  var colorSelection = 0;

  @override
  Widget build(BuildContext context) {
    final SizeH = MediaQuery.of(context).size.width / 100;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text("Color",
        //     style: TextStyle(
        //       color: Colors.black,
        //     )),
        // Padding(padding: EdgeInsets.symmetric(horizontal: SizeH * 2)),
        ColorCircle(
            color: HSLColor.fromColor(Colors.red)
                .withLightness(0.6)
                .withSaturation(0.75)
                .toColor(),
            colorIndex: 0),
        Padding(padding: EdgeInsets.symmetric(horizontal: SizeH * 2)),
        ColorCircle(
            color: HSLColor.fromColor(Colors.orange)
                .withLightness(0.65)
                .withSaturation(0.85)
                .toColor(),
            colorIndex: 1),
        Padding(padding: EdgeInsets.symmetric(horizontal: SizeH * 2)),
        ColorCircle(
            color: HSLColor.fromColor(Colors.green)
                .withLightness(0.55)
                .withSaturation(0.4)
                .toColor(),
            colorIndex: 2),
        Padding(padding: EdgeInsets.symmetric(horizontal: SizeH * 2)),
        ColorCircle(
            color: HSLColor.fromColor(Colors.teal)
                .withLightness(0.55)
                .withSaturation(0.5)
                .toColor(),
            colorIndex: 3),
        Padding(padding: EdgeInsets.symmetric(horizontal: SizeH * 2)),
        ColorCircle(
            color: HSLColor.fromColor(Colors.blue)
                .withLightness(0.65)
                .withSaturation(0.6)
                .toColor(),
            colorIndex: 4),
        Padding(padding: EdgeInsets.symmetric(horizontal: SizeH * 2)),
        ColorCircle(color: kPrimaryColor, colorIndex: 5),
        Padding(padding: EdgeInsets.symmetric(horizontal: SizeH * 2)),
        ColorCircle(
            color: HSLColor.fromColor(Colors.pink)
                .withLightness(0.7)
                .withSaturation(0.6)
                .toColor(),
            colorIndex: 6),
      ],
    );
  }
}

class ColorCircle extends StatelessWidget {
  final Color color;
  final int colorIndex;

  // final void Function(Color) onTap;

  const ColorCircle({
    Key? key,
    required this.color,
    required this.colorIndex,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // change color via provider
      onTap: () => context.read<CoverStyle>().changeColor(color, colorIndex),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  context.watch<CoverStyle>().selectedColorIndex != colorIndex
                      ? color
                      : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
