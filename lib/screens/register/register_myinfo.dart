import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/input/chip_input_box.dart';
import 'package:kai_friends_app/widgets/input/dropdown_input_box.dart';
import 'package:kai_friends_app/widgets/input/input_box.dart';
import 'package:kai_friends_app/widgets/input/input_label.dart';
import 'package:kai_friends_app/widgets/main_button.dart';
import 'package:kai_friends_app/widgets/top_app_bar.dart';
import 'package:kai_friends_app/assets/constants.dart';

enum Gender { man, woman }

class RegisterMyInfoPage extends StatelessWidget {
  final Gender _gender = Gender.man;
  get _degreeSelected => '학사과정';
  get _majorSelected => '물리학과';
  get _dormSelected => '사랑관';

  RegisterMyInfoPage({Key? key}) : super(key: key);

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
                const SizedBox(height: 30),
                const AvatarPreview(),
                const InputLabel(name: '성별'),
                GenderSelectBox(gender: _gender),
                Row(
                  children: const [
                    Expanded(
                      child: InputBox(
                        labelText: '나이',
                        type: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: InputBox(
                        labelText: '학번',
                        type: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                DropdownInputBox(
                  selected: _degreeSelected,
                  list: degreeList,
                  labelText: '학위',
                ),
                DropdownInputBox(
                  selected: _majorSelected,
                  list: majorList,
                  labelText: '전공',
                ),
                DropdownInputBox(
                  selected: _dormSelected,
                  list: dormList,
                  labelText: '기숙사',
                ),
                const ChipInputBox(
                  id: 'org',
                  labelText: '동아리 / 단체',
                ),
                const ChipInputBox(
                  id: 'class',
                  labelText: '수업',
                ),
                const InputBox(
                  labelText: '한 줄 자기소개',
                  type: TextInputType.text,
                ),
                const SizedBox(height: 20),
                IconMainButton(
                  name: '다음',
                  icon: Icons.navigate_next,
                  f: () => {},
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

class AvatarPreview extends StatelessWidget {
  const AvatarPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.grey,
          ),
        ),
        FloatingActionButton.small(
          onPressed: () => {},
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class GenderSelectBox extends StatelessWidget {
  final Gender gender;

  const GenderSelectBox({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TODO: setstate
        Radio(
          value: Gender.man,
          groupValue: gender,
          onChanged: (gender) => {},
        ),
        const Text('남성'),
        Radio(
          value: Gender.woman,
          groupValue: gender,
          onChanged: (gender) => {},
        ),
        const Text('여성'),
      ],
    );
  }
}
