import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/input/chip_input_box.dart';
import 'package:kai_friends_app/widgets/input/dropdown_input_box.dart';
import 'package:kai_friends_app/widgets/input/input_box.dart';
import 'package:kai_friends_app/widgets/input/input_label.dart';
import 'package:kai_friends_app/widgets/main_button.dart';
import 'package:kai_friends_app/widgets/top_app_bar.dart';
import 'package:kai_friends_app/assets/constants.dart';

enum Gender { man, woman }

class RegisterMyInfoPage extends StatefulWidget {
  const RegisterMyInfoPage({Key? key}) : super(key: key);

  @override
  State<RegisterMyInfoPage> createState() => _RegisterMyInfoPageState();
}

class _RegisterMyInfoPageState extends State<RegisterMyInfoPage> {
  Gender genderSelected = Gender.man;
  int degreeSelected = 0;
  int majorSelected = 0;
  int dormSelected = 0;

  // input box: use TextEditingController, not updating variable in real time
  final ageController = TextEditingController();
  final enterYearController = TextEditingController();
  final introController = TextEditingController();

  void genderSetter(val) {
    setState(() {
      genderSelected = val as Gender;
    });
  }

  void degreeSetter(val) {
    degreeSelected = val as int;
  }

  void majorSetter(val) {
    majorSelected = val as int;
  }

  void dormSetter(val) {
    dormSelected = val as int;
  }

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
                GenderSelectBox(
                  gender: genderSelected,
                  stateSetter: genderSetter,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputBox(
                        controller: ageController,
                        labelText: '나이',
                        type: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: InputBox(
                        controller: enterYearController,
                        labelText: '학번',
                        type: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                DropdownInputBox(
                  selected: degreeSelected,
                  list: degreeList,
                  labelText: '학위',
                  stateSetter: degreeSetter,
                ),
                DropdownInputBox(
                  selected: majorSelected,
                  list: majorList,
                  labelText: '전공',
                  stateSetter: majorSetter,
                ),
                DropdownInputBox(
                  selected: dormSelected,
                  list: dormList,
                  labelText: '기숙사',
                  stateSetter: dormSetter,
                ),
                const ChipInputBox(
                  id: 'org',
                  labelText: '동아리 / 단체',
                ),
                const ChipInputBox(
                  id: 'class',
                  labelText: '수업',
                ),
                InputBox(
                  controller: introController,
                  labelText: '한 줄 자기소개',
                  type: TextInputType.text,
                ),
                const SizedBox(height: 20),
                IconMainButton(
                  name: '다음',
                  icon: Icons.navigate_next,
                  f: () {
                    //TODO: test form serializing
                    print({
                      "gender": genderSelected,
                      "age": ageController.text,
                      "enterYear": enterYearController.text,
                      "degree": degreeSelected,
                      "major": majorSelected,
                      "dorm": dormSelected,
                      "intro": introController.text,
                    });
                  },
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
  final void Function(Gender?) stateSetter;

  const GenderSelectBox(
      {Key? key, required this.gender, required this.stateSetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: Gender.man,
          groupValue: gender,
          onChanged: stateSetter,
        ),
        const Text('남성'),
        Radio(
          value: Gender.woman,
          groupValue: gender,
          onChanged: stateSetter,
        ),
        const Text('여성'),
      ],
    );
  }
}
