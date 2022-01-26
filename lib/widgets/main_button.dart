import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String _name;
  final void Function() _f;

  //TODO: 색깔 변수화 - 우선 primary color 안따라가게 색 지정

  const MainButton({required name, required f, Key? key}) : _name = name, _f = f, super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _f,
      child: Text(_name),
      style: ElevatedButton.styleFrom(primary: const Color(0xFFFF6C60)),
    );
  }
}

class MainButtonIcon extends StatelessWidget {
  final String _name;
  final void Function() _f;
  final IconData _icon;

  const MainButtonIcon({required name, required icon, required f, Key? key})
      : _name = name,
        _icon = icon,
        _f = f,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton.icon(
      onPressed: _f,
      icon: Icon(_icon),
      label: Text(_name),
      style: ElevatedButton.styleFrom(primary: const Color(0xFFFF6C60)),
    );
  }
}