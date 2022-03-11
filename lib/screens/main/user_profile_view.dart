import 'package:flutter/material.dart';
import 'package:kai_friends_app/screens/main/user.dart';
import 'package:kai_friends_app/widgets/color_chip.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: 70.0,
        foregroundImage: Image.asset(userProfile.profileImage).image,
        backgroundColor: Colors.blue,
      ),
      const SizedBox(
        height: 20.0,
      ),
      ProfileText(
        text: '${userProfile.major} \'${userProfile.year}',
      ),
      const SizedBox(
        height: 10.0,
      ),
      ProfileText(
        text: userProfile.selfIntroduction,
      ),
      const SizedBox(
        height: 20.0,
      ),
      FriendPreferences(
        userProfile: userProfile,
      ),
    ]);
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key? key,
    this.text = 'text',
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.grey[700],
      ),
    );
  }
}

class FriendPreferences extends StatelessWidget {
  FriendPreferences({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: <Widget>[
          Text(
            '이런 친구를 찾아요:',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 10),
          FriendPreference(
            category: '멘토링',
            preference: userProfile.mentorPreference,
          ),
          const SizedBox(height: 5),
          FriendPreference(
            category: '과친구',
            preference: userProfile.majorPreference,
          ),
          const SizedBox(height: 5),
          FriendPreference(
            category: '수업친구',
            preference: userProfile.classPreference,
          ),
          const SizedBox(height: 5),
          FriendPreference(
            category: '관심분야',
            preference: userProfile.interestPreference,
          ),
        ],
      ),
    );
  }
}

class FriendPreference extends StatelessWidget {
  const FriendPreference({
    Key? key,
    required this.category,
    required this.preference,
  }) : super(key: key);

  final String category;
  final List<String> preference;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 60.0,
          child: Text(
            category,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[700],
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Container(
          width: 200,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.0,
            runSpacing: 4.0,
            children: <Widget>[for (String p in preference) ColorChip(text: p)],
          ),
        ),
      ],
    );
  }
}
