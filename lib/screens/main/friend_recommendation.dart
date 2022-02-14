import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kai_friends_app/screens/main/sample_users.dart';
import 'package:kai_friends_app/screens/main/user.dart';
import 'package:kai_friends_app/screens/main/user_profile_view.dart';
import 'package:kai_friends_app/widgets/bottom_nav_bar.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          actions: const [
            Text('필터'),
          ],
        ),
        body: UserRecommendationView(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class UserRecommendationView extends StatefulWidget {
  Queue<UserProfile> userProfiles =
      Queue<UserProfile>.from(sampleUserProfiles); // TODO: fetch with API

  @override
  _UserRecommendationViewState createState() => _UserRecommendationViewState();
}

class _UserRecommendationViewState extends State<UserRecommendationView> {
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    userProfile = widget.userProfiles.first;
  }

  void changeUserProfile() {
    if (widget.userProfiles.length == 1) {
      print('End of user list');
      return;
    }

    widget.userProfiles.removeFirst();
    setState(() {
      userProfile = widget.userProfiles.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          UserProfileView(userProfile: userProfile),
          const SizedBox(height: 30.0),
          FriendDecisionButtons(callback: changeUserProfile),
        ],
      ),
    );
  }
}

class FriendDecisionButtons extends StatelessWidget {
  FriendDecisionButtons({required this.callback});

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
