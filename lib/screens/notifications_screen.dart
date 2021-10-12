import 'package:api_app/services/theme_provider.dart';
import 'package:api_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

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
                  themeProvider.changeDarkMode(value);
                },
              ),
            ),
          ),
          ListTile(
            title: Text('Change Language'),
            trailing: FittedBox(
              //  color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Text('Change Theme'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () async {
                        await context.setLocale(Locale('en'));
                      },
                      child: Text(
                        "English",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () async {
                        await context.setLocale(Locale('ar'));
                      },
                      child: Text(
                        "العربية",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 2),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(LocaleKeys.Notification1.tr()),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(LocaleKeys.Notification2.tr()),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(LocaleKeys.Notification3.tr()),
          ),
        ],
      ),
    );
  }
}
