import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const TopAppBar({
    Key? key,
    required this.title,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      actions: actions,
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
