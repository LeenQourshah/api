import 'package:api_app/models/post_model.dart';
import 'package:api_app/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

class homeScreen extends StatelessWidget {
  homeScreen({Key? key}) : super(key: key);
  late List<PostModel> model;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),

                  child: Post(
                      name: 'Leen Qourshah',
                      time: '4h',
                      share: '3',
                      postTitle: model[index].body,
                      like: ' 3',
                      comments: ' 6'),
                  //ExpansionTile(
                  //   title: Text(model[index].title),
                  //   children: [Text(model[index].body)],
                  // ),
                );
              },
              itemCount: model.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  // Future<List<PostModel>> getData() async {
  //   print('leen');
  //   Uri url = Uri.https('jsonplaceholder.typicode.com', '/posts');
  //   http.Response res = await http.get(url);
  //   print(res.body);
  //   List<dynamic> body = cnv.jsonDecode(res.body);
  //   model = body.map((dynamic item) => PostModel.fromJson(item)).toList();
  //   return model;
  // }

  Future<List<PostModel>> getData() async {
    print('leen');

    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final result = cnv.jsonDecode(response.body);
      model = result.map((dynamic item) => PostModel.fromJson(item)).toList();

      return model;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print('ERROR');
    }
    return [];
  }
}