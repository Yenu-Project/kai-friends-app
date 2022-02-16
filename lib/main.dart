import 'package:flutter/material.dart';
import 'package:kai_friends_app/screens/main/friend_recommendation.dart';

void main() {
  runApp(KaiFriendsApp());
}

class KaiFriendsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kai Friends",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final accentColor = const Color(0xFFE73700);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    UserRecommendationScreen(),
    Text('받은 신청', style: optionStyle), // TODO: replace with widget
    Text('친구 목록', style: optionStyle), // TODO: replace with widget
    Text('설정', style: optionStyle), // TODO: replace with widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: accentColor,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
