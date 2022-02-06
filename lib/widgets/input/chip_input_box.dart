import 'package:flutter/material.dart';
import 'package:kai_friends_app/assets/constants.dart';
import '../color_chip.dart';
import '../filter_color_chip.dart';
import '../main_button.dart';
import 'input_box.dart';
import 'input_label.dart';

class ChipInputBox extends StatefulWidget {
  final String labelText;
  final String id;

  const ChipInputBox({
    Key? key,
    required this.id,
    required this.labelText,
  }) : super(key: key);

  @override
  State<ChipInputBox> createState() => _ChipInputBoxState();
}

class _ChipInputBoxState extends State<ChipInputBox> {
  Set<String> chips = {};

  void chipSetter(Set<String> newSet) {
    setState(() {
      // chips.addAll(newSet);
      chips = newSet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputLabel(name: widget.labelText),
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
            runSpacing: 6,
            children: [
              for (String i in chips) ColorChip(text: i),
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
        return ChipInputBoxDetailDialog(
          id: widget.id,
          stateSetter: chipSetter,
          initialStored: chips,
        );
      },
    );
  }
}

class ChipInputBoxDetailDialog extends StatefulWidget {
  final String id;
  final Function(Set<String>) stateSetter;
  final Set<String>? initialStored;

  const ChipInputBoxDetailDialog({
    Key? key,
    required this.id,
    required this.stateSetter,
    this.initialStored,
  }) : super(key: key);

  @override
  State<ChipInputBoxDetailDialog> createState() =>
      _ChipInputBoxDetailDialogState();
}

class _ChipInputBoxDetailDialogState extends State<ChipInputBoxDetailDialog> {
  List<String> chips = [];
  Set<String> stored = {};
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    stored = widget.initialStored ?? {};
    return AlertDialog(
      title: Text(
        widget.id, // TODO: map id to appropriate title
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputBox(
              controller: controller,
              labelText: '수업명/과목번호',
              type: TextInputType.text,
              actionIcon: Icons.search,
              paddingAll: 0.0,
              action: () {
                setState(() {
                  chips = testSearchList
                      .where((f) => f.startsWith(controller.text))
                      .toList(); // TODO: backend communicate
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (String i in chips)
                  FilterColorChip(
                    key: Key(i),
                    text: i,
                    initValue: stored.contains(i),
                    onSelected: (String s, bool v) {
                      if (v) {
                        stored.add(s);
                      } else {
                        stored.remove(s);
                      }
                    },
                  )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                    name: '확인',
                    f: () {
                      widget.stateSetter(stored);
                      Navigator.pop(context);
                    }),
                MainButton(
                    name: '취소',
                    f: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
