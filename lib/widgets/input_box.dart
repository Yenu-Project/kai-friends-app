import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/color_chip.dart';
import 'package:kai_friends_app/widgets/main_button.dart';

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

class ChipInputBox extends StatelessWidget {
  const ChipInputBox({
    Key? key,
    required id,
    required labelText,
  })  : _labelText = labelText,
        _id = id,
        super(key: key);

  final String _labelText;
  final String _id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputLabel(name: _labelText),
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
            children: [
              ColorChip(),
              // TODO: add multiple ColorChip() to here,
              ActionChip(
                label: const Icon(Icons.add),
                onPressed: () => ShowDialog(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void ShowDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChipInputBoxDetailDialog(id: _id);
      },
    );
  }
}

class ChipInputBoxDetailDialog extends StatelessWidget {
  const ChipInputBoxDetailDialog({
    Key? key,
    required id,
  })  : _id = id,
        super(key: key);

  final String _id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        _id, // TODO: map id to appropriate title
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputBox(
            labelText: '수업명/과목번호',
            type: TextInputType.text,
            actionIcon: Icons.search,
            paddingAll: 0.0,
            action: () {
              print("hello world!");
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 6,
            children: [
              ColorChip(),
              ColorChip(),
              ColorChip(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainButton(name: '확인', f: () => {}),
              MainButton(name: '취소', f: () => {Navigator.pop(context)}),
            ],
          ),
        ],
      ),
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
  const InputBox({
    Key? key,
    required labelText,
    required type,
    actionIcon,
    action,
    paddingAll,
  })  : _labelText = labelText,
        _type = type,
        _actionIcon = actionIcon,
        _action = action,
        _paddingAll = paddingAll,
        super(key: key);
  final String _labelText;
  final TextInputType _type;
  final IconData? _actionIcon;
  final Function()? _action;
  final double? _paddingAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _paddingAll ?? 10, vertical: _paddingAll ?? 20),
      child: TextField(
        keyboardType: _type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: _labelText,
          suffixIcon: _actionIcon != null
              ? IconButton(onPressed: _action, icon: Icon(_actionIcon))
              : null,
        ),
      ),
    );
  }
}
