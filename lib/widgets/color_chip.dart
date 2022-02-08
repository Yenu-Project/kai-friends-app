import 'package:flutter/material.dart';

class ColorChip extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Function(String)? onDeleted;

  const ColorChip({
    Key? key,
    this.text = 'chip',
    this.onPressed,
    this.onDeleted,
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
            deleteIcon: onDeleted != null
                ? const Icon(
                    Icons.close,
                    size: 18.0,
                  )
                : null,
            onDeleted: onDeleted != null
                ? () => onDeleted!(text ?? 'chip')
                : null, // TODO(fix): This code is buggy: chips must be in a set (no duplicates)
          );
  }
}
