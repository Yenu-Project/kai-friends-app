import 'package:flutter/material.dart';

class DropdownInputBox extends StatelessWidget {
  final int selected;
  final List<String> list;
  final String labelText;
  final Function(int?) stateSetter;

  const DropdownInputBox({
    Key? key,
    required this.selected,
    required this.list,
    required this.labelText,
    required this.stateSetter,
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
          items: [for (int i = 0; i < list.length; i++) i].map(
            (value) {
              return DropdownMenuItem(
                child: Text(list[value]),
                value: value,
              );
            },
          ).toList(),
          onChanged: stateSetter),
    );
  }
}
