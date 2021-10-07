import 'package:flutter/material.dart';

class notificationsScreen extends StatelessWidget {
  const notificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
          ),
        ],
      ),
    );
  }
}
