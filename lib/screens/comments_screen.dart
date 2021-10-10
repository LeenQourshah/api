import 'package:api_app/models/comments_model.dart';
import 'package:api_app/models/post_model.dart';
import 'package:api_app/services/networking.dart';
import 'package:dio/dio.dart';
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
        body: FutureBuilder<List<commentModel>>(
            future: getComment(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      var comment =
                          (snapshot.data as List<commentModel>)[index];
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.person,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    comment.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.public,
                                    color: Colors.grey[700],
                                    size: 15,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: (snapshot.data as List<commentModel>).length);
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
              return Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.deepPurple),
              );
            }));
  }

  Future<List<commentModel>> getComment() async {
    Response comment =
        await Dio().get('https://jsonplaceholder.typicode.com/comments');

    // print('Comment Info: ${comment.data}');
    if (comment.statusCode == 200) {
      var getCommentsData = comment.data as List;
      var listComments =
          getCommentsData.map((i) => commentModel.fromJson(i)).toList();
      return listComments;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
