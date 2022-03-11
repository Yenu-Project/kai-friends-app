import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kai_friends_app/models/sample/sample_users.dart';
import 'package:kai_friends_app/models/user.dart';
import '../../widgets/color_chip.dart';
import '../../widgets/top_app_bar.dart';

class FriendListScreen extends StatefulWidget {
  final List<UserProfile> friends = List<UserProfile>.from(sampleUserProfiles);

  FriendListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FriendListScreen> createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
  String dropdownValue = '정렬';
  List<String> sortingType = ['정렬', '추가순', '학과순', '학번순'];
  List<UserProfile> friends = [];

  @override
  void initState() {
    super.initState();
    friends = widget.friends;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              key: Key(friends[index].selfIntroduction),
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
    );
  }
}

class FriendListTile extends StatelessWidget {
  final UserProfile friend;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(
                radius: 20.0,
              ),
              title: Text('${friend.major} \'${friend.year}'),
              subtitle: Text(friend.selfIntroduction),
              trailing: const Icon(
                Icons.question_answer_rounded,
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 80.0,
                ),
                Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: friend.mainPreference
                      .map((e) => ColorChip(
                            text: e,
                          ))
                      .toList(),
                ),
              ],
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
