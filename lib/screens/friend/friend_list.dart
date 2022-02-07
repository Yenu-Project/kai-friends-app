import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../widgets/color_chip.dart';
import '../../widgets/top_app_bar.dart';
import '../../widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp(
    friends: [
      Friend(
          'name1', 'introduction1', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend(
          'name2', 'introduction2', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend(
          'name3', 'introduction3', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend(
          'name4', 'introduction4', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend(
          'name5', 'introduction5', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend(
          'name6', 'introduction6', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend(
          'name7', 'introduction7', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend(
          'name8', 'introduction8', ['prefer', 'prefer', 'prefer', 'prefer']),
    ],
  ));
}

class Friend {
  String name;
  String introduction;
  List<String> preferences;

  Friend(this.name, this.introduction, this.preferences);
}

class MyApp extends StatefulWidget {
  final List<Friend> friends;

  const MyApp({
    Key? key,
    required this.friends,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String dropdownValue = '정렬';
  List<String> sortingType = ['정렬', '추가순', '학과순', '학번순'];
  List<Friend> friends = [];

  @override
  Widget build(BuildContext context) {
    friends = widget.friends;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: TopAppBar(
          title: '친구 목록',
          actions: [
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              underline: const SizedBox(),
              items: sortingType
                  .map((value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
            TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
                label: const Text('필터')),
          ],
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: widget.friends.length,
            itemBuilder: (context, index) {
              return FriendListTile(
                key: Key(friends[index].name),
                friend: friends[index],
                onPressedDeletion: () {
                  setState(() {
                    friends.removeAt(index);
                  });
                },
                onPressedMove: () {},
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class FriendListTile extends StatelessWidget {
  final Friend friend;
  final Function onPressedDeletion;
  final Function onPressedMove;

  const FriendListTile({
    Key? key,
    required this.friend,
    required this.onPressedDeletion,
    required this.onPressedMove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      startActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            onPressedDeletion();
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) => onPressedDeletion(),
            backgroundColor: const Color(0xFFFF6C60),
            foregroundColor: Colors.white,
            label: '친구 삭제',
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onPressedMove(),
            backgroundColor: const Color(0xFFF8D347),
            foregroundColor: Colors.white,
            label: '채팅방 이동',
          ),
        ],
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(
                radius: 20.0,
              ),
              title: Text(friend.name),
              subtitle: Text(friend.introduction),
              trailing: const Icon(
                Icons.question_answer_rounded,
              ),
            ),
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: friend.preferences
                  .map((e) => ColorChip(
                        text: e,
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              height: 0.0,
              thickness: 1.0,
              indent: 68.0,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
            )
          ],
        ),
      ),
    );
  }
}
