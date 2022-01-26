import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/bottom_nav_bar.dart';
import 'package:kai_friends_app/widgets/color_chip.dart';

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
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          actions: const [
            Text('필터'),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Profile(),
              SizedBox(
                height: 20.0,
              ),
              FriendPreferences(),
              SizedBox(
                height: 30.0,
              ),
              FriendDecisionButtons(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const CircleAvatar(
          radius: 70.0,
          backgroundColor: Colors.blue,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          '전산과 학사, \'19',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          '기계학습이랑 선대개 듣는 분 같이 들어요ㅎㅎ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}

class FriendPreferences extends StatelessWidget {
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
          const FriendPreference(
            category: '멘토링',
          ),
          const SizedBox(height: 5),
          const FriendPreference(
            category: '과친구',
          ),
          const SizedBox(height: 5),
          const FriendPreference(
            category: '수업친구',
          ),
          const SizedBox(height: 5),
          const FriendPreference(
            category: '관심분야',
          ),
        ],
      ),
    );
  }
}

class FriendPreference extends StatelessWidget {
  final String category;
  const FriendPreference({this.category = ''});

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
        Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8.0,
          runSpacing: 4.0,
          children: const <Widget>[
            ColorChip(),
            ColorChip(),
            ColorChip(),
            ColorChip(),
          ],
        )
      ],
    );
  }
}

class FriendDecisionButtons extends StatelessWidget {
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
          onPressed: () {},
        ),
        IconButton(
          iconSize: 50,
          icon: const Icon(
            Icons.autorenew,
            color: Color(0xFFE73700),
          ),
          tooltip: '패스할래요',
          onPressed: () {},
        ),
        IconButton(
          iconSize: 50,
          icon: const Icon(
            Icons.favorite,
            color: Color(0xFFE73700),
          ),
          tooltip: '좋아요',
          onPressed: () {},
        ),
      ],
    );
  }
}
