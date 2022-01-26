import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget with PreferredSizeWidget {
  final String _title;
  final List<Widget> _actions;

  const TopAppBar({
    Key? key,
    required title,
    required actions,
  })  : _title = title,
        _actions = actions,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        _title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      actions: _actions,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}