import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/input/chip_input_box.dart';
import 'package:kai_friends_app/widgets/input/dropdown_input_box.dart';
import 'package:kai_friends_app/widgets/input/input_box.dart';
import 'package:kai_friends_app/widgets/input/input_label.dart';
import 'package:kai_friends_app/widgets/main_button.dart';
import 'package:kai_friends_app/widgets/top_app_bar.dart';

enum Gender { man, woman }

class RegisterMyInfoPage extends StatelessWidget {
  final Gender _gender = Gender.man;
  final _degree = ['학사과정', '석사과정', '박사과정', '교수'];
  final _major = [
    '물리학과',
    '수리과학과',
    '화학과',
    '생명과학과',
    '기계공학과',
    '항공우주공학과',
    '전기및전자공학부',
    '전산학부',
    '건설및환경공학과',
    '바이오및뇌공학과',
    '산업디자인학과',
    '산업및시스템공학과',
    '생명화학공학과',
    '신소재공학과',
    '원자력및양자공학과',
    '기술경영학부',
    '융합인재학부'
  ];
  final _dorm = [
    '세종관',
    '아름관',
    '나들관',
    '미르관',
    '사랑관',
    '신뢰관',
    '다솜관',
    '나눔관',
    '소망관',
    '지혜관',
    '희망관',
    '성실관',
    '갈릴레이관',
    '원내아파트',
    '문지관',
    '진리관',
    '여울관',
    '나래관',
    '화암관'
  ];

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
                  list: _degree,
                  labelText: '학위',
                ),
                DropdownInputBox(
                  selected: _majorSelected,
                  list: _major,
                  labelText: '전공',
                ),
                DropdownInputBox(
                  selected: _dormSelected,
                  list: _dorm,
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
