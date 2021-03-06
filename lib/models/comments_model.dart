import 'package:flutter/material.dart';

class commentModel {
  late int postId;
  late int id;
  late String name;
  late String email;

  late String body;

  commentModel(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  commentModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];

    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;

    data['body'] = body;
    return data;
  }
}
