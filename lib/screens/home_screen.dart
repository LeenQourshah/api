import 'package:api_app/models/post_model.dart';
import 'package:api_app/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late List<PostModel> model;
  // @override
  // void initState() {
  //   getProduct();
  //   super.initState();
  // }

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

  Future<List<PostModel>> getData() async {
    print('leen');

    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final result = cnv.jsonDecode(response.body);
      model =
          result.data.map((dynamic item) => PostModel.fromJson(item)).toList();

      return model;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print('ERROR');
    }
    return [];
  }
}

// Future<void> getProduct() async {
//   print('Product');

//   final response =
//       await http.get(Uri.parse('https://fakestoreapi.com/products'));
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.

//     final result = cnv.jsonDecode(response.body);
//     //  product = result.map((dynamic item) => PostModel.fromJson(item)).toList();
//     print(result);
//     print('response is : ${response.body}');

//     // return model;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     print('ERROR');
//   }
// }
