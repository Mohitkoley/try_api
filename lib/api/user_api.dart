import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:try_api/model/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> getUsersLocally(BuildContext context) async {
    final AssetBundle bundle = DefaultAssetBundle.of(context);
    final data = await bundle.loadString("users.json");
    final body = json.decode(data);
    return body.map<User>(User.fromJson(json)).toList();
  }

  static Future<List<User>> getUsers() async {
    final url = "https://mohitkoley.github.io/userjson/users.json";
    final client = http.Client();
    final response = await client.get(Uri.parse(url));
    final body = json.decode(response.body);
    return body.map<User>(User.fromJson).toList();
  }
}
