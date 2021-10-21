import 'dart:async';

import 'package:api_app/bloC/posts_bloc.dart';
import 'package:api_app/models/post_model.dart';
import 'package:api_app/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as cnv;

class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late List<PostModel> model;
  late PostBloc postBloc;
  @override
  void initState() {
    postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(PostsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          if (state is PostIsNotSearched) {
            return buildLoading();
          } else if (state is PostIsLoading) {
            return buildLoading();
          } else if (state is PostIsLoaded) {
            return buildPostsList(state.posts);
          }
          return Text('Error');
        }),
      ),
    );
  }
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildPostsList(List<PostModel> postModel) {
  return Container(
    child: ListView.builder(
        itemCount: postModel.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Post(
                  name: 'Leen Qourshah',
                  time: '4h',
                  share: '3',
                  postTitle: postModel[index].body,
                  like: ' 3',
                  comments: ' 6'));
        }),
  );
}
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<PostModel>>(
//         future: getData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemBuilder: (BuildContext context, int index) {
//                 return Card(
//                   elevation: 5,
//                   margin: EdgeInsets.all(10),

//                   child: Post(
//                       name: 'Leen Qourshah',
//                       time: '4h',
//                       share: '3',
//                       postTitle: model[index].body,
//                       like: ' 3',
//                       comments: ' 6'),
//                   //ExpansionTile(
//                   //   title: Text(model[index].title),
//                   //   children: [Text(model[index].body)],
//                   // ),
//                 );
//               },
//               itemCount: model.length,
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         });
//   }

//   Future<List<PostModel>> getData() async {
//     print(await http
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/posts')));

//     print('leen');

//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       final result = cnv.json.decode(response.body);
//       model =
//           result.map<PostModel>((json) => PostModel.fromJson(json)).toList();

//       return model;
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       print('ERROR');
//     }
//     return [];
//   }
// }
