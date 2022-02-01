import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/input_box.dart';
import 'package:kai_friends_app/widgets/main_button.dart';
import 'package:kai_friends_app/widgets/top_app_bar.dart';

class RegisterFriendInfoPage extends StatelessWidget {
  const RegisterFriendInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        title: "회원가입",
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'close_icon',
            onPressed: () => {},
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const MyTitle(
                  title: "만나고 싶은 친구 정보를 알려주세요!",
                  size: 18.0,
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: "학과 친구를 원해요!",
                  width: double.infinity,
                ),
                const ChipInputBox(
                  id: "friend_major",
                  labelText: "친구의 과정 / 학과",
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: "수업 친구를 원해요!",
                  width: double.infinity,
                ),
                const ChipInputBox(
                  id: "friend_class",
                  labelText: "친구의 수업",
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: "관심 분야를 같이할 친구를 원해요!",
                  width: double.infinity,
                ),
                const ChipInputBox(
                  id: "friend_interest",
                  labelText: "친구의 관심분야",
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: "멘토링을 원해요!",
                  width: double.infinity,
                ),
                const ChipInputBox(
                  id: "friend_mentor",
                  labelText: "분야",
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: "멘토링을 해주고 싶어요!",
                  width: double.infinity,
                ),
                const ChipInputBox(
                  id: "friend_mentee",
                  labelText: "분야",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconMainButton(
                      name: '수정',
                      f: () => {},
                      icon: Icons.navigate_before,
                    ),
                    IconMainButton(
                      name: '미리보기',
                      f: () => {},
                      icon: Icons.navigate_next,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTitle extends StatelessWidget {
  const MyTitle({
    Key? key,
    required title,
    size,
    width,
  })  : _title = title,
        _width = width,
        _size = size,
        super(key: key);

  final String _title;
  final double? _width;
  final double? _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      padding: const EdgeInsets.all(10.0),
      child: Text(
        _title,
        style: TextStyle(
          fontSize: _size ?? 16.0,
        ),
      ),
    );
  }
}
