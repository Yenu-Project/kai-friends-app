import 'package:flutter/material.dart';

class DropdownInputBox extends StatelessWidget {
  const DropdownInputBox({
    Key? key,
    required selected,
    required List<String> list,
    required labelText,
  })  : _selected = selected,
        _list = list,
        _labelText = labelText,
        super(key: key);

  final String _selected;
  final List<String> _list;
  final String _labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: DropdownButtonFormField(
          value: _selected,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: _labelText,
          ),
          items: _list.map(
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
