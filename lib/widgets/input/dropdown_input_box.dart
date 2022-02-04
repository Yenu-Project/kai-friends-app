import 'package:flutter/material.dart';

class DropdownInputBox extends StatelessWidget {
  final String selected;
  final List<String> list;
  final String labelText;

  const DropdownInputBox({
    Key? key,
    required this.selected,
    required this.list,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: DropdownButtonFormField(
          value: selected,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
          items: list.map(
            (value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            },
          ).toList(),
          onChanged: (value) {}),
    );
  }
}
