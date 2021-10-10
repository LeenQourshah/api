// import 'dart:html';

// import 'package:api_app/models/comments_model.dart';
// import 'package:dio/dio.dart';

// class DioClient {
//   final Dio _dio = Dio();

//   final _baseUrl = 'https://jsonplaceholder.typicode.com/comments';

//   Future<List<commentModel>> getComment() async {
//     Response comment = await _dio.get(_baseUrl);

//     // print('Comment Info: ${comment.data}');
//     if (comment.statusCode == 200) {
//       var getCommentsData = comment.data as List;
//       var listComments =
//           getCommentsData.map((i) => commentModel.fromJson(i)).toList();
//       return listComments;
//     } else {
//       throw Exception('Failed to load users');
//     }
    
//   }

  
// }
