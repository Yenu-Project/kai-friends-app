import 'package:flutter/material.dart';
import '../../widgets/color_chip.dart';

class FriendListTile extends StatelessWidget {
  const FriendListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: CircleAvatar(
              radius: 20.0,
            ),
            title: Text('name'),
            subtitle: Text('자기소개'),
            trailing: Icon(
              Icons.question_answer_rounded,
            ),
          ),
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: const <Widget>[
              ColorChip(),
              ColorChip(),
              ColorChip(),
              ColorChip(),
            ],
          ),
        ],
      ),
    );
  }
}

