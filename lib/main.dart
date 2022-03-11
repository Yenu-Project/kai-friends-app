import 'package:flutter/material.dart';
import 'package:kai_friends_app/screens/login/login.dart';
import 'package:kai_friends_app/screens/main/friend_recommendation.dart';
import 'package:kai_friends_app/screens/friend/friend_list.dart';

void main() {
  runApp(KaiFriendsApp());
}

class KaiFriendsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Kai Friends",
      home: HomePageWrapper(),
    );
  }
}

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _checkLogin(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            default:
              return snapshot.data == true
                  ? const HomePage()
                  : const LoginPage();
          }
        });
  }

  Future<bool> _checkLogin() async {
    // TODO: check session exists
    // true: go to homepage, false: go to login page
    await Future.delayed(const Duration(milliseconds: 2000));
    return false;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
    FriendListScreen(),
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
