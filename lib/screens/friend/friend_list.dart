import 'package:flutter/material.dart';
import './friend_listtile.dart';

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
        appBar: AppBar(
          title: const Text('친구 목록'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          actions: const [
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
      ),
    );
  }
}
