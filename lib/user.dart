import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List user;
  Future SetUser() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(url);
    // debugPrint(response.body);
    setState(() {
      user = json.decode(response.body);
    });
  }
  @override
  void initState(){
    super.initState();
    SetUser();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User information"),
      ),
      body: ListView.builder(
        itemCount: user == null ? 0 : user.length,
        itemBuilder: (BuildContext context, int i){
            return Card(
              child: Text("${user[i]["name"]}"),
            );
        }
      ),
    );
  }
}