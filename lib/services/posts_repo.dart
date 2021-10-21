import 'package:api_app/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PostsService {
  static Future getData() async {
    print('leen');
    List collection;
    List<PostModel> _posts;
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      collection = convert.json.decode(response.body);
      _posts = collection
          .map<PostModel>((json) => PostModel.fromJson(json))
          .toList();
      return _posts;
    }
  }
}


//  Future<List<PostModel>> getData() async {
  

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