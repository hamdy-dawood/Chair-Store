import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key}) : super(key: key);

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: _folded ? 50 : 250,
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
                child: !_folded
                    ? TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10.0),
                      hintText: 'Search',
                      hintStyle:
                      TextStyle(color: Colors.grey, fontSize: 20.0),
                      border: InputBorder.none),
                )
                    : null,
              )),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Container(
                      height: 40.0,
                      width: 40.0,
                      child: _folded
                          ? Image.asset("images/icons/search-.png",)
                          : Image.asset("images/icons/close.png")),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
