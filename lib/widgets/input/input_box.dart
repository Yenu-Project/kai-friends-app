import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String labelText;
  final TextInputType type;
  final IconData? actionIcon;
  final Function()? action;
  final double? paddingAll;

  const InputBox({
    Key? key,
    required this.labelText,
    required this.type,
    this.actionIcon,
    this.action,
    this.paddingAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingAll ?? 10, vertical: paddingAll ?? 20),
      child: TextField(
        keyboardType: type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          suffixIcon: actionIcon != null
              ? IconButton(onPressed: action, icon: Icon(actionIcon))
              : null,
        ),
      ),
    );
  }
}
