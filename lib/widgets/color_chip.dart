import 'package:flutter/material.dart';

class ColorChip extends StatelessWidget {
  final String text;

  const ColorChip({Key? key, this.text = 'chip'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 12.0,

        ),
      ),
    );
  }
}
