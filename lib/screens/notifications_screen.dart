// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:api_app/providers/theme_provider.dart';
import 'package:api_app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:circle_list/circle_list.dart';

class notificationsScreen extends StatefulWidget {
  const notificationsScreen({Key? key}) : super(key: key);

  @override
  State<notificationsScreen> createState() => _notificationsScreenState();
}

class _notificationsScreenState extends State<notificationsScreen> {
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  Future takeImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 750) {
            return ListView(
              children: [
                Column(
                  children: [
                    CircleList(
                      innerRadius: 60,
                      outerRadius: 90,
                      origin: Offset(0, 0),
                      children: List.generate(20, (index) {
                        return Icon(
                          Icons.circle,
                          color: index % 2 == 0
                              ? Colors.grey
                              : Colors.deepPurple[300],
                          size: 10,
                        );
                      }),
                      centerWidget: ClipRRect(
                          // borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: userProfilePicture()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Leen Qourshah',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),

                //  userProfilePicture(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.camera_alt_rounded),
                      onPressed: () {
                        takeImage();
                      },
                    ),
                    Text('Take a picture from your camera'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.photo),
                      onPressed: () {
                        pickImage();
                      },
                    ),
                    Text('Take a picture from your camera'),
                  ],
                ),
                // ],
                // ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(LocaleKeys.theme.tr()),
                    trailing: Switch(
                      value: themeProvider.getDarkMode(),
                      onChanged: (value) {
                        themeProvider.changeDarkMode(value);
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: Text(LocaleKeys.language.tr()),
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
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: prefer_const_constructors
                userProfileBuilder(),

                Column(
                  children: [
                    ListView(
                      children: [
                        changeTheme(themeProvider),
                        ListTile(
                          title: Text(LocaleKeys.language.tr()),
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
                                      style:
                                          TextStyle(color: Colors.deepPurple),
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
                                      style:
                                          TextStyle(color: Colors.deepPurple),
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
                    )
                  ],
                )
              ],
            );
          }
        }),
      ),
    );
  }

  Padding changeTheme(DynamicTheme themeProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(LocaleKeys.theme.tr()),
        trailing: Switch(
          value: themeProvider.getDarkMode(),
          onChanged: (value) {
            themeProvider.changeDarkMode(value);
          },
        ),
      ),
    );
  }

  Column userProfilePicture() {
    return Column(children: [
      image != null
          ? ClipOval(
              child: Image.file(image!,
                  width: 120, height: 120, fit: BoxFit.cover),
            )
          : userProfileBuilder(),
    ]);
  }

  Column userProfileBuilder() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.white,
          ),
          radius: 60,
        ),
      ],
      // );
    );
  }
}



// CircleAvatar(
//             backgroundColor: Colors.deepPurple,
//             child: Icon(
//               Icons.person,
//               size: 80,
//               color: Colors.white,
//             ),
//             radius: 80,
//           ),


//  CircleList(
//           innerRadius: 70,
//           outerRadius: 90,
//           origin: Offset(0, 0),
//           children: List.generate(20, (index) {
//             return Icon(
//               Icons.circle,
//               color: index % 2 == 0 ? Colors.grey : Colors.deepPurple[300],
//               size: 10,
//             );
//           }),
//           centerWidget: ClipRRect(
//               // borderRadius: BorderRadius.all(Radius.circular(70)),
//               child: CircleAvatar(
//             backgroundColor: Colors.deepPurple,
//             child: Icon(
//               Icons.person,
//               size: 60,
//               color: Colors.white,
//             ),
//             radius: 60,
//           )),
//         ),