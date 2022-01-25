import 'package:flutter/material.dart';

class ColorChip extends StatelessWidget {
  const ColorChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Chip(
      label: Text(
        'chip',
        style: TextStyle(
          fontSize: 12.0,
        ),
      ),
    );
  }
}
