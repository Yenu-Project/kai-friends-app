import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/input/chip_input_box.dart';
import 'package:kai_friends_app/widgets/main_button.dart';
import 'package:kai_friends_app/widgets/top_app_bar.dart';

class RegisterFriendInfoPage extends StatefulWidget {
  const RegisterFriendInfoPage({Key? key}) : super(key: key);

  @override
  State<RegisterFriendInfoPage> createState() => _RegisterFriendInfoPageState();
}

class _RegisterFriendInfoPageState extends State<RegisterFriendInfoPage> {
  Set<String> friendMajorSelected = {};
  Set<String> friendClassSelected = {};
  Set<String> friendInterestSelected = {};
  Set<String> friendMentorSelected = {};
  Set<String> friendMenteeSelected = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        title: '회원가입',
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
                  title: '만나고 싶은 친구 정보를 알려주세요!',
                  size: 18.0,
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: '학과 친구를 원해요!',
                  width: double.infinity,
                ),
                ChipInputBox(
                  id: 'friend_major',
                  labelText: '친구의 과정 / 학과',
                  stateSetter: (Set<String> val){
                    friendMajorSelected = val;
                  },
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: '수업 친구를 원해요!',
                  width: double.infinity,
                ),
                ChipInputBox(
                  id: 'friend_class',
                  labelText: '친구의 수업',
                  stateSetter: (Set<String> val){
                    friendClassSelected = val;
                  },
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: '관심 분야를 같이할 친구를 원해요!',
                  width: double.infinity,
                ),
                ChipInputBox(
                  id: 'friend_interest',
                  labelText: '친구의 관심분야',
                  stateSetter: (Set<String> val){
                    friendInterestSelected = val;
                  },
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: '멘토링을 원해요!',
                  width: double.infinity,
                ),
                ChipInputBox(
                  id: 'friend_mentor',
                  labelText: '분야',
                  stateSetter: (Set<String> val){
                    friendMentorSelected = val;
                  },
                ),
                const Divider(height: 10),
                const MyTitle(
                  title: '멘토링을 해주고 싶어요!',
                  width: double.infinity,
                ),
                ChipInputBox(
                  id: 'friend_mentee',
                  labelText: '분야',
                  stateSetter: (Set<String> val){
                    friendMenteeSelected = val;
                  },
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
                      f: () {
                        print({
                          "major": friendMajorSelected,
                          "class": friendClassSelected,
                          "interest": friendInterestSelected,
                          "mentor": friendMentorSelected,
                          "mentee": friendMenteeSelected,
                        });
                      },
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
  final String title;
  final double? width;
  final double? size;

  const MyTitle({
    Key? key,
    required this.title,
    this.size,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: size ?? 16.0,
        ),
      ),
    );
  }
}
