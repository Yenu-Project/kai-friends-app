import 'package:flutter/material.dart';
import '../../widgets/color_chip.dart';
import '../../widgets/top_app_bar.dart';
import '../../widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: const TopAppBar(
          title: '친구 목록',
          actions: [
            Text('정렬'),
            Text('필터'),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: const <Widget>[
              FriendListTile(),
              FriendListTile(),
              FriendListTile(),
              FriendListTile(),
              FriendListTile(),
              FriendListTile(),
              FriendListTile(),
              FriendListTile(),
              FriendListTile(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

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
