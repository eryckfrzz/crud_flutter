import 'package:crud_flutter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  
  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'List users',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              userProvider.indexUser == null;
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (BuildContext context, userProvider, child) {
          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: Text(userProvider.users[index].name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        userProvider.userSelected = userProvider.users[index];
                        userProvider.indexUser = index;
                        Navigator.pushNamed(context, '/');
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        userProvider.userSelected = userProvider.users[index];
                        userProvider.indexUser = index;
                        Navigator.popAndPushNamed(context, '/view');
                      },
                      icon: Icon(
                        Icons.visibility,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        userProvider.userSelected = userProvider.users[index];
                        userProvider.indexUser = index;
                        Navigator.pushNamed(context, '/');

                        userProvider.removeUser(index);
                      },
                      icon: Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
