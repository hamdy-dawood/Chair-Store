import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'modules/SplachScreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(ChairStore());
}

  // Instagram : @hamdy_khalid_
  // Git hub : hamdy-dawood

final navigatorKey = GlobalKey<NavigatorState>();

class ChairStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Spalsh_Screen(),
    );
  }
}