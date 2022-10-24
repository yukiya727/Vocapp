import 'package:flutter/material.dart';

import '../../../widgets/buttons/floating_button.dart';

class IconSelection extends StatefulWidget {
  final IconData? icon;
  final ValueChanged<IconData>? onIconChanged;

  const IconSelection({Key? key, this.icon, this.onIconChanged})
      : super(key: key);

  @override
  _IconSelectionState createState() => _IconSelectionState();
}

class _IconSelectionState extends State<IconSelection> {
  IconData? _icon;

  @override
  void initState() {
    super.initState();
    _icon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    double SizeH = MediaQuery.of(context).size.width / 100;

    return Row(
      children: [
        Text("Icon",
            style: TextStyle(
              color: Colors.black,
            )),
        Padding(padding: EdgeInsets.symmetric(horizontal: SizeH * 2)),
        Expanded(
          child: FloatingButton(
            bgColor: Colors.black.withOpacity(0.5),
            buttonIcon: Icons.rocket_launch,
            iconSizeX: 0.5,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
