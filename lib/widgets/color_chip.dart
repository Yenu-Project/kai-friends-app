import 'package:flutter/material.dart';

class ColorChip extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const ColorChip({
    Key? key,
    this.text = 'chip',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Text label = Text(
      text,
      style: const TextStyle(
        fontSize: 12.0,
      ),
    );

    return onPressed != null
        ? ActionChip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: label,
            onPressed: onPressed!,
          )
        : Chip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: label,
          );
  }
}

