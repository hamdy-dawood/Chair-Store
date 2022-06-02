import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// AppBar For Details Screen
AppBar detailsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor:  Color(0xFFF5EFF1),
    elevation: 0,
    leadingWidth: 30.0,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Container(
            height: 30.0,
            width: 30.0,
            child: Image.asset("images/icons/left.png",color: Color(0xFFFC6B68),)),
      ),
    ),
    title: Text(
      "Back".toUpperCase(),
      style: TextStyle(color: Color(0xFFFC6B68),),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("images/icons/cart_with_item.svg"),
        onPressed: () {},
      ),
    ],
  );
}

// CartButton For Details Screen
Widget CartButton() =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 20.0),),
            SizedBox(width: 20,),
            SvgPicture.asset("images/icons/shopping-bag.svg"),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFFFC6B68),
            boxShadow: [BoxShadow(
              color: Color(0xFFFC6B68),
              blurRadius: 10,
              offset: Offset(0,5),
            )]
        ),
      ),
    );




