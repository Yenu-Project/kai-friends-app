import 'package:flutter/material.dart';
import '../color_chip.dart';
import '../main_button.dart';
import 'input_box.dart';
import 'input_label.dart';

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
                onPressed: () => showDetailDialog(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showDetailDialog(BuildContext context) async {
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
              print('hello world!');
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
