import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String name;
  final void Function() f;

  // TODO: 아이콘 파라미터 추가하기: 나중에 MainButton만 가지고 텍스트 or 아이콘 버튼 둘 다 만들 수 있게
  const MainButton(this.name, this.f, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: f,
      child: Text(
        name
      ),
      //TODO: 색깔 변수화
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFFF6C60)
      ),
    );
  }
}