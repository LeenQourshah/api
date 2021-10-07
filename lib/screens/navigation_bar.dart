// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class navigationBar extends StatefulWidget {
  // navigationBar (Key key) : super(key: key);
  @override
  _navigationBarState createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _options = <Widget>[
    Text('Home Screen',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Screen',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Settings Screen',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('BottomNavigationBar Example'),
          backgroundColor: Colors.teal),
      body: Center(
        child: _options.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.teal),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.cyan),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.lightBlue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          iconSize: 40,
          onTap: _onItemTap,
          elevation: 5),
    );
  }
}
