import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/providers/user_provider.dart';
import 'package:crud_flutter/widgets/field_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    String title = 'View user';
    int? index;

    final userProvider = context.watch<UserProvider>();
    User user = User(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;

      nameController.text = userProvider.userSelected!.name;
      emailController.text = userProvider.userSelected!.email;
      passwordController.text = userProvider.userSelected!.password;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FieldForm(
                  label: 'Name',
                  isPassword: false,
                  controller: nameController,
                  isForm: false,
                  isEmail: false,
                ),
                FieldForm(
                  label: 'E-mail',
                  isPassword: false,
                  controller: emailController,
                  isForm: false,
                  isEmail: true,
                ),
                FieldForm(
                  label: 'Password',
                  isPassword: true,
                  controller: passwordController,
                  isForm: false,
                  isEmail: false,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    userProvider.removeUser(index!);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                  child: Text(
                    'Exclude',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
