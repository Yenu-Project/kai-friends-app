import 'package:flutter/material.dart';
import '../../widgets/color_chip.dart';
import '../../widgets/top_app_bar.dart';
import '../../widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp(
    friends: [
      Friend('name', 'introduction', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend('name', 'introduction', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend('name', 'introduction', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend('name', 'introduction', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend('name', 'introduction', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend('name', 'introduction', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend('name', 'introduction', ['prefer', 'prefer', 'prefer', 'prefer']),
      Friend('name', 'introduction', ['prefer', 'prefer', 'prefer', 'prefer']),
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

  @override
  Widget build(BuildContext context) {
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
          child: ListView.separated(
              itemCount: widget.friends.length,
              itemBuilder: (context, index) {
                return FriendListTile(friend: widget.friends[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 68.0,
                );
              }),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class FriendListTile extends StatelessWidget {
  final Friend friend;

  const FriendListTile({
    Key? key,
    required this.friend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
        ],
      ),
    );
  }
}
