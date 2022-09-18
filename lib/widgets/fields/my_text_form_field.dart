import 'package:flutter/material.dart';
import '../../styles.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.hint,
    this.icon = Icons.text_fields,
    this.noBorder = false,
    required this.fillColor,
    this.textColor,
    required this.inputType,
    required this.inputAction,
    required this.focusNode,
    required this.validator,
  }) : super(key: key);

  final String hint;
  final IconData? icon;
  final bool noBorder;
  final Color fillColor;
  final Color? textColor;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FocusNode focusNode;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        style: focusNode.hasFocus
            ? kBodyText3.copyWith(color: textColor ?? kPrimaryColor)
            : kInputHintStyle,
        cursorColor: kSecondaryColor3,
        keyboardType: inputType,
        textInputAction: inputAction,
        focusNode: focusNode,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          border: kInputBorder,
          enabledBorder: kInputBorder,
          hintText: hint,
          hintStyle: kInputHintStyle.copyWith(color: textColor?.withOpacity(0.5) ?? kTextColor),
          contentPadding: EdgeInsets.all(0),
          // since we removed container remove content padding 0 to enable default padding for the field
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              // height: 60,
              // this container height is causing the error
              decoration: BoxDecoration(
                border: noBorder == true ? Border(
                  right: BorderSide(
                    width: 2,
                    color: kScaffoldBackground,
                  ),
                ) : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: icon != null ? Icon(
                  icon,
                  color: focusNode.hasFocus
                      ? kPrimaryColor
                      : kPrimaryColor.withOpacity(0.5),
                ) : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
