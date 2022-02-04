import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String name;

  const InputLabel({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
