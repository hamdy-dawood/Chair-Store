import 'package:flutter/material.dart';
import 'wood_list.dart';

class WoodCard extends StatelessWidget {
  const WoodCard({
    Key? key,
    required this.wood,
    required this.ItemIndex,
    required this.press,
  }) : super(key: key);

  final int ItemIndex;
  final Wood wood;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 18.0),
      child: InkWell(
        onTap: press,
        child: Container(
          height: 150,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: 160.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.white),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    wood.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 40,
                  right: 40,
                  child: Text(
                    "${wood.name}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 50.0,
                    width: 100.0,
                    child: Center(child: Text("\$${wood.price}")),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.grey.shade100,
                              Color(0xFFFDC992),
                            ])),
                  ))
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
