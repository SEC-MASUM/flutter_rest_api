import 'dart:convert';
import 'package:rest_api/model/user.dart';
import 'package:rest_api/model/user_name.dart';
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
      final name = UserName(
        title: user["name"]["title"],
        first: user["name"]["first"],
        last: user["name"]["last"],
      );
      return User(
          cell: user["cell"],
          email: user["email"],
          gender: user["gender"],
          phone: user["phone"],
          nat: user["nat"],
          name: name);
    }).toList();

    return users;
  }
}
