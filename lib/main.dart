// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:api_app/screens/comments_screen.dart';
import 'package:api_app/screens/home_screen.dart';
import 'package:api_app/screens/notifications_screen.dart';
import 'package:api_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<DynamicTheme>(
      create: (_) => DynamicTheme(), child: MyApp()));
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
        '/search': (context) => const searchScreen(),
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
  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }
  //int _currentIndex = 0;

  // ignore: prefer_final_fields

  List<Widget> _items = [
    notificationsScreen(),
    homeScreen(),
    searchScreen(),
  ];
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);

    return MaterialApp(
      theme: themeProvider.getDarkMode() ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Center(child: Text('Connect')),
          ),
          //if data has not come yet, use the circular waiting span
          body: Center(
              child: IndexedStack(
                  index: selectedIndex,
                  children: _items) //_items.elementAt(_index),
              ),
          bottomNavigationBar: _showBottomNav()),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      onTap: _onTap,
      currentIndex: selectedIndex,
      backgroundColor: Colors.deepPurple,
      iconSize: 27,
      // ignore: prefer_const_literals_to_create_immutables
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
            icon: Icon(Icons.search_rounded, color: Colors.white),
            title: Text(""),
            backgroundColor: Colors.white),
      ],
    );
  }

  void _onTap(int index) {
    selectedIndex = index;
    setState(() {});
  }
}
