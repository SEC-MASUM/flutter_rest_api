import 'dart:convert';
import 'package:rest_api/model/user/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final jsonBody = jsonDecode(body);
    final results = jsonBody['results'] as List<dynamic>;
    final users = results.map((user) {
      return User.fromMap(user);
    }).toList();
    return users;
  }
}
