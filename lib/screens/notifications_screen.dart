// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:api_app/services/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class notificationsScreen extends StatefulWidget {
  const notificationsScreen({Key? key}) : super(key: key);

  @override
  State<notificationsScreen> createState() => _notificationsScreenState();
}

class _notificationsScreenState extends State<notificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Change Theme'),
              trailing: Switch(
                value: themeProvider.getDarkMode(),
                onChanged: (value) {
                  setState(() {
                    themeProvider.changeDarkMode(value);
                  });
                },
              ),
            ),
          ),
          Divider(thickness: 2),
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
