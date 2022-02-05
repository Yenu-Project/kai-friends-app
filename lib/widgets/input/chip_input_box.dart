import 'package:flutter/material.dart';
import '../color_chip.dart';
import '../main_button.dart';
import 'input_box.dart';
import 'input_label.dart';

class ChipInputBox extends StatelessWidget {
  final String labelText;
  final String id;

  const ChipInputBox({
    Key? key,
    required this.id,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputLabel(name: labelText),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 20),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
        return ChipInputBoxDetailDialog(id: id);
      },
    );
  }
}

class ChipInputBoxDetailDialog extends StatelessWidget {
  final String id;

  const ChipInputBoxDetailDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        id, // TODO: map id to appropriate title
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputBox(
            controller: TextEditingController(), //TODO: add controller variable
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
