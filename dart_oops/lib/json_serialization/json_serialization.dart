import 'dart:convert';

import 'package:dart_oops/json_serialization/user_model.dart';
import 'package:flutter/material.dart';

class JsonSerialization extends StatefulWidget {
  const JsonSerialization({super.key, required this.title});

  final String title;

  @override
  State<JsonSerialization> createState() => _JsonSerializationState();
}

class _JsonSerializationState extends State<JsonSerialization> {
  //Object
  UserModel userModelObject = new UserModel(
      id: '123', fullName: 'Maroof', email: 'maroof123@gmail.com');
  //Map
  String userModelJson =
      '{"id":"123","fullName":"Maroof","email":"maroof123@gmail.com"}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> userMap =
                      userModelObject.toMap(); // Object converted into Map
                  var json = jsonEncode(userMap); // Map converted into json
                  print(json);
                },
                child: Text('Serialize'),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  var decodedJson = jsonDecode(userModelJson); // Json decode
                  Map<String, dynamic> userMap =
                      decodedJson; // Json converted into Map
                  UserModel newUser =
                      UserModel.fromMap(userMap); // Map converted into Object
                  print(newUser);
                },
                child: Text('De-Serialize'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
