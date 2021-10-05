import 'package:flutter/material.dart';

class HeaderButtonSection extends StatelessWidget {
  final Widget buttonOne;
  final Widget buttonTwo;
  final Widget buttonThree;
  HeaderButtonSection(
      {required this.buttonOne,
      required this.buttonTwo,
      required this.buttonThree});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Colors.amber,
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonOne,
          VerticalDivider(
            thickness: 2,
            color: Colors.grey[300],
          ),
          buttonTwo,
          VerticalDivider(
            thickness: 2,
            color: Colors.grey[300],
          ),
          buttonThree,
        ],
      ),
    );
  }
}
