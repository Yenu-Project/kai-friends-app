import 'package:flutter/material.dart';
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
//              FriendDecisionButtons(),
            ],
          ),
        ),
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
//            mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CircleAvatar(
          radius: 100.0,
          backgroundColor: Colors.blue,
        ),
        SizedBox(
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
        SizedBox(
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
          SizedBox(height: 10),
          FriendPreference(
            category: '멘토링',
          ),
          SizedBox(height: 5),
          FriendPreference(
            category: '과친구',
          ),
          SizedBox(height: 5),
          FriendPreference(
            category: '수업친구',
          ),
          SizedBox(height: 5),
          FriendPreference(
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
        SizedBox(
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
