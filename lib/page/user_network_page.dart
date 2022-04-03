import 'package:flutter/material.dart';
import 'package:try_api/api/user_api.dart';
import 'package:try_api/model/user.dart';
import 'package:try_api/page/user_page.dart';

class UserNetworkPage extends StatelessWidget {
  const UserNetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
          future: UserApi.getUsers(),
          builder: (context, snapshot) {
            final users = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text("Error"));
                } else {
                  return buildUsers(users!);
                }
            }
          }),
    );
  }

  Widget buildUsers(List<User> users) => ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => UserPage(user: user))),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.urlAvatar),
          ),
          title: Text(user.username),
          subtitle: Text(user.email),
        );
      });
}
