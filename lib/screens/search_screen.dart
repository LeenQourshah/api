// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Serach',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 1.0),
                )),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  ListTile(
                      title: Text(
                    'data',
                    style: TextStyle(fontSize: 20),
                  )),
                  ListTile(
                      title: Text(
                    'data',
                    style: TextStyle(fontSize: 20),
                  )),
                  ListTile(
                      title: Text(
                    'data',
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
