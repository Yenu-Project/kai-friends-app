import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text(
          "회원가입",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'close_icon',
            onPressed: () => {},
            color: Colors.black,
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(
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
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: const Text(
                    "성별",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  children: [
                    // TODO: setstate
                    Radio(
                      value: Gender.man,
                      groupValue: _gender,
                      onChanged: (gender) => {},
                    ),
                    const Text('남성'),
                    Radio(
                      value: Gender.woman,
                      groupValue: _gender,
                      onChanged: (gender) => {},
                    ),
                    const Text('여성'),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '나이',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '학번',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: DropdownButtonFormField(
                      value: _degreeSelected,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '과정',
                      ),
                      items: _degree.map(
                        (value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        },
                      ).toList(),
                      onChanged: (value) {}),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: DropdownButtonFormField(
                      value: _majorSelected,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '전공',
                      ),
                      items: _major.map(
                        (value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        },
                      ).toList(),
                      onChanged: (value) {}),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: DropdownButtonFormField(
                      value: _dormSelected,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '기숙사',
                      ),
                      items: _dorm.map(
                        (value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        },
                      ).toList(),
                      onChanged: (value) {}),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '앙뇽',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '한 줄 자기소개',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.navigate_next),
                  label: const Text("다음"),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
