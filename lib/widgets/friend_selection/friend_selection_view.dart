import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kai_friends_app/models/sample/sample_users.dart';
import 'package:kai_friends_app/models/user.dart';
import 'package:kai_friends_app/widgets/friend_selection/user_profile_view.dart';

class FriendSelectionView extends StatefulWidget {
  String getUserProfilesUrl;

  FriendSelectionView({
    Key? key,
    required this.getUserProfilesUrl,
  }) : super(key: key);

  //TODO: 여기로 공통되는거 분리하고, 2개 screen에서 얘로 대체하기

  @override
  _FriendSelectionViewState createState() => _FriendSelectionViewState();
}

class _FriendSelectionViewState extends State<FriendSelectionView> {
  late Queue<UserProfile> userProfiles;
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    // TODO: fetch userProfiles with API (widget.getUserProfilesUrl)
    userProfiles = Queue<UserProfile>.from(sampleUserProfiles);
    userProfile = userProfiles.first;
  }

  void changeUserProfile() {
    if (userProfiles.length == 1) {
      print('End of user list'); // TODO: fix end condition when using API
      return;
    }

    userProfiles.removeFirst();
    setState(() {
      userProfile = userProfiles.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            UserProfileView(userProfile: userProfile),
            const SizedBox(height: 30.0),
            FriendDecisionButtons(callback: changeUserProfile),
          ],
        ),
      ),
    );
  }
}

class FriendDecisionButtons extends StatelessWidget {
  const FriendDecisionButtons({required this.callback});

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          iconSize: 50,
          icon: const Icon(
            Icons.clear,
            color: Color(0xFFE73700),
          ),
          tooltip: '아니요',
          onPressed: () {
            callback();
          },
        ),
        IconButton(
          iconSize: 50,
          icon: const Icon(
            Icons.autorenew,
            color: Color(0xFFE73700),
          ),
          tooltip: '패스할래요',
          onPressed: () {
            callback();
          },
        ),
        IconButton(
          iconSize: 50,
          icon: const Icon(
            Icons.favorite,
            color: Color(0xFFE73700),
          ),
          tooltip: '좋아요',
          onPressed: () {
            callback();
          },
        ),
      ],
    );
  }
}
