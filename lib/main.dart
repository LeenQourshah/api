// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:api_app/screens/comments_screen.dart';
import 'package:api_app/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/comment': (context) => const comment(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(child: Text('Connect')),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Post(
              //pics: sup,
              name: "Leen Qourshah",
              time: "4h",
              postTitle: "Eid Mubarak Everyone!",
              like: "27",
              comments: "9",
              share: "2",
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Post(
              name: "Sara Khaleel",
              time: "5h",
              postTitle: "Eid Mubarak Everyone!",
              like: "30",
              comments: "10",
              share: "1",
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Post(
              name: "Sawsan Hakouz",
              time: "9h",
              postTitle: "Eid Mubarak Everyone!",
              like: "27",
              comments: "20",
              share: "3",
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Post(
              name: "Jude Qourshah",
              time: "4h",
              postTitle: "Enjoy your Eid! happy Eid!",
              like: "27",
              comments: "9",
              share: "2",
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        iconSize: 27,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.white),
              title: Text(""),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              title: Text(""),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_vert_outlined, color: Colors.white),
              title: Text(""),
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
