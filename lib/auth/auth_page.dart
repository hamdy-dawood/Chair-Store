import 'package:flutter/material.dart';
import '../modules/Account/LoginScreen/login_screen.dart';
import '../modules/Account/SignupScreen/signup_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  void toggleScreen() {
    setState(() {
      isLogin = !isLogin;
    });
  }
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(
          showSignUpPage: toggleScreen,
        )
      : SignupScreen(
          showLoginPage: toggleScreen,
        );
}
