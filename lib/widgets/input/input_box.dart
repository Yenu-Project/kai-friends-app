import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    Key? key,
    required labelText,
    required type,
    actionIcon,
    action,
    paddingAll,
  })  : _labelText = labelText,
        _type = type,
        _actionIcon = actionIcon,
        _action = action,
        _paddingAll = paddingAll,
        super(key: key);
  final String _labelText;
  final TextInputType _type;
  final IconData? _actionIcon;
  final Function()? _action;
  final double? _paddingAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _paddingAll ?? 10, vertical: _paddingAll ?? 20),
      child: TextField(
        keyboardType: _type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: _labelText,
          suffixIcon: _actionIcon != null
              ? IconButton(onPressed: _action, icon: Icon(_actionIcon))
              : null,
        ),
      ),
    );
  }
}
