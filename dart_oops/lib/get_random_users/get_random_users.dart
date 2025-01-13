import 'package:dart_oops/api_services/api_services.dart';
import 'package:dart_oops/models/user_model.dart';
import 'package:flutter/material.dart';

class GetRandomUsers extends StatefulWidget {
  const GetRandomUsers({super.key});

  @override
  State<GetRandomUsers> createState() => _GetRandomUsersState();
}

class _GetRandomUsersState extends State<GetRandomUsers> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    fetchUsersApicall();
  }

  Future<void> fetchUsersApicall() async {
    final usersData = await UserApi.getRandomUserApiCall();
    setState(() {
      users = usersData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest Api Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final usersData = users[index];
          final email = usersData.email;
          return ListTile(
            leading: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(usersData.picture.thumbnail),
              ),
            ),
            title: Text(
              usersData.fullName,
              style: TextStyle(
                color: usersData.gender == 'male' ? Colors.blue : Colors.amber,
              ),
            ),
            subtitle: Text(usersData.location.city),
          );
        },
      ),
    );
  }
}
