import 'package:chair_store/modules/AnimatedSearch/animated_search.dart';
import 'package:chair_store/modules/Drawer/drawer.dart';
import 'package:chair_store/modules/TapBar/ArmChair/armChair_screen.dart';
import 'package:chair_store/modules/TapBar/Sofa/sofa_screen.dart';
import 'package:chair_store/modules/TapBar/Wood%20Frame/wood_frame_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 30.0,
          backgroundColor: Color(0xFFF5EFF1),
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Container(
                  height: 30.0,
                  width: 30.0,
                  child: Image.asset(
                    "images/icons/list.png",
                    fit: BoxFit.fill,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
          actions: <Widget>[
            AnimatedSearchBar(),
            IconButton(
              icon: Container(
                  height: 25.0,
                  width: 25.0,
                  child: Image.asset("images/icons/bell.png",color: Colors.black,)),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Color(0xFFFC6B68),
            labelStyle: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                text: "ArmChair",
              ),
              Tab(
                text: "Sofa",
              ),
              Tab(
                text: "Wood Frame",
              ),
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(children: [
          ArmChair_screen(),
          Sofa_screen(),
          Wood_screen(),
        ]),
      ),
    );
  }
}
