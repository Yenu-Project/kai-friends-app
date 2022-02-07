import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String _name;

  const InputLabel({
    required name,
    Key? key,
  })  : _name = name,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        _name,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}