import 'package:flutter/material.dart';

class comment extends StatefulWidget {
  const comment({Key? key}) : super(key: key);

  @override
  _commentState createState() => _commentState();
}

class _commentState extends State<comment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(),
    );
  }
}
