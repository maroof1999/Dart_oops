import 'dart:convert';

import 'package:dart_oops/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> getRandomUserApiCall() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromJson(e);
    }).toList();
    return users;
  }
}
