import 'package:flutter/material.dart';
import 'package:kai_friends_app/widgets/main_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Image.asset('images/login_logo.png'),
                ),
                MainButton(name: '카이스트 통합인증으로 로그인 / 가입', f: (){}),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
