import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Rest API Call"),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          // final color = user.gender == "male" ? Colors.blue : Colors.pink;
          return ListTile(
            title: Text(user.name.first),
            subtitle: Text(user.phone),
            // tileColor: color,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),
    );
  }

  void fetchUsers() async {
    print("FetchUsers Called");
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final jsonBody = jsonDecode(body);
    final results = jsonBody['results'] as List<dynamic>;
    final transformed = results.map((user) {
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
    setState(() {
      users = transformed;
    });
    print("fetchUsers completed");
  }
}
