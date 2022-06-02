import 'package:chair_store/modules/TapBar/Wood%20Frame/wood_frame_card.dart';
import 'package:chair_store/modules/TapBar/Wood%20Frame/wood_list.dart';
import 'package:flutter/material.dart';
import '../Details Screen/card_details.dart';

class Wood_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EFF1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
                // height: MediaQuery.of(context).size.height,
                height: 700,
                child: ListView.builder(
                  itemCount: woods.length,
                  itemBuilder: (context, index) => WoodCard(
                    ItemIndex: index,
                    wood: woods[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardDetails(
                            details: woods[index],
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
