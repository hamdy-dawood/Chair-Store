import 'package:chair_store/modules/TapBar/ArmChair/armchair_list.dart';
import 'package:chair_store/modules/TapBar/Details%20Screen/card_details.dart';
import 'package:chair_store/modules/TapBar/Sofa/sofa_card.dart';
import 'package:chair_store/modules/TapBar/Sofa/sofa_list.dart';
import 'package:flutter/material.dart';

class Sofa_screen extends StatelessWidget {
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
                  itemCount: armchairs.length,
                  itemBuilder: (context, index) => SofaCard(
                    ItemIndex: index,
                    sofa: sofas[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardDetails(
                            details: sofas[index],
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
