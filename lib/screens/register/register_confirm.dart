import 'package:flutter/material.dart';
import 'package:kai_friends_app/assets/constants.dart';
import 'package:kai_friends_app/main.dart';
import 'package:kai_friends_app/models/sample/sample_users.dart';
import 'package:kai_friends_app/models/user.dart';
import 'package:kai_friends_app/screens/main/user_profile_view.dart';
import 'package:kai_friends_app/widgets/main_button.dart';

class RegisterConfirm extends StatelessWidget {
  Map<String, dynamic> myInfo;
  Map<String, Set<String>> friendInfo;

  RegisterConfirm({Key? key, required this.myInfo, required this.friendInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              UserProfileView(
                userProfile: UserProfile(
                  profileImage: 'images/profile_picture.png',
                  // TODO: receive profile image from register_myinfo
                  major: majorList[myInfo["major"]],
                  year: myInfo["enterYear"],
                  selfIntroduction: myInfo["intro"],
                  //TODO
                  mentorPreference: [
                    ...(friendInfo["mentor"]!.map((String x) => "멘토: " + x)),
                    ...(friendInfo["mentee"]!.map((String x) => "멘티: " + x))
                  ],
                  majorPreference: friendInfo["major"]!.toList(),
                  classPreference: friendInfo["class"]!.toList(),
                  interestPreference: friendInfo["interest"]!.toList(),
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconMainButton(
                    name: '수정',
                    f: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.navigate_before,
                  ),
                  IconMainButton(
                    name: '완료',
                    f: () {
                      print(myInfo);
                      print(friendInfo);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KaiFriendsApp()),
                          (Route<dynamic> route) => false);
                    },
                    icon: Icons.navigate_next,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
