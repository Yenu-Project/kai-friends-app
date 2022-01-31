import 'package:flutter/material.dart';

class ChipInputBox extends StatelessWidget {
  const ChipInputBox({
    Key? key,
    required labelText,
  })  : _labelText = labelText,
        super(key: key);

  final String _labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            _labelText,
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 20),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 1,
            ),
          ),
          child: Wrap(
            spacing: 6,
            children: const [
              // ColorChip(),
              Chip(
                label: Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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

class InputBox extends StatelessWidget {
  const InputBox({Key? key, required labelText, required type})
      : _labelText = labelText,
        _type = type,
        super(key: key);
  final String _labelText;
  final TextInputType _type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: TextField(
        keyboardType: _type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: _labelText,
        ),
      ),
    );
  }
}