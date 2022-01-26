import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final accentColor = const Color(0xFFE73700);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: '친구 찾기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.send_rounded),
          label: '받은 신청',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt_rounded),
          label: '친구 목록',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '설정',
        ),
      ],
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[500],
      selectedItemColor: accentColor,
      showUnselectedLabels: true,
    );
  }
}
