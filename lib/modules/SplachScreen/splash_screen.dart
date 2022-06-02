import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../auth/main_page.dart';
import '../../animation/animation.dart';

class Spalsh_Screen extends StatefulWidget {
  const Spalsh_Screen({Key? key}) : super(key: key);

  @override
  State<Spalsh_Screen> createState() => _Spalsh_ScreenState();
}

class _Spalsh_ScreenState extends State<Spalsh_Screen> {
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 4000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 350,
              width: 250,
              child: Column(
                children: [
                  Image.asset("images/logo.jpg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Chair Store',
                          style: GoogleFonts.pacifico(
                            color: Color(0XFFFAA304),
                            fontSize: 35,
                          )),
                    ],
                  ),
                ],
              )),
          const SizedBox(
            height: 200,
          ),
          LoadingAnimationWidget.inkDrop(
              color: Color(0xFFFC6B68), size: 50),
        ],
      ),
    ));
  }
}
