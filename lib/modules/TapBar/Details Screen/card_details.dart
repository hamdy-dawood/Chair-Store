import 'package:chair_store/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../animation/animation.dart';


class CardDetails extends StatelessWidget {
  final details;
  CardDetails({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF5EFF1),
      appBar: detailsAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            FadeAnimation(
              delay: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0),
                child: Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      details.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FadeAnimation(
              delay: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeAnimation(
                      delay: 1.5,
                      child: Text(
                        details.name,
                        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    LikeButton(
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            FadeAnimation(
              delay: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "\$ ${ details.price}",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            FadeAnimation(
              delay: 2.5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "This fashionable design will allow you to decorate any room at home .",
                  style: TextStyle(fontSize: 15.0,color: Colors.grey,),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            FadeAnimation(
                delay: 3,
                child: CartButton()),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
