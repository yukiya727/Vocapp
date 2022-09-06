import 'package:flutter/material.dart';

import '../../styles.dart';

class SmallTextButton extends StatelessWidget {
  const SmallTextButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        splashColor: kSecondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonText,
            style: kBodyText3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
