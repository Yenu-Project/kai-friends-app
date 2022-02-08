import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String name;
  final void Function() f;

  //TODO: 색깔 변수화 - 우선 primary color 안따라가게 색 지정

  const MainButton({
    required this.name,
    required this.f,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: f,
        child: Text(name),
        style: ElevatedButton.styleFrom(primary: const Color(0xFFFF6C60)),
      ),
    );
  }
}

class IconMainButton extends StatelessWidget {
  final String name;
  final void Function() f;
  final IconData icon;

  const IconMainButton({
    required this.name,
    required this.icon,
    required this.f,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: f,
        icon: Icon(icon),
        label: Text(name),
        style: ElevatedButton.styleFrom(primary: const Color(0xFFFF6C60)),
      ),
    );
  }
}
