import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/providers/user_provider.dart';
import 'package:crud_flutter/widgets/field_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    User user = User(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    String title = 'Screen of register';
    int? index;

    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;

      nameController.text = userProvider.userSelected!.name;
      emailController.text = userProvider.userSelected!.email;
      passwordController.text = userProvider.userSelected!.password;

      setState(() {
        title = 'Update register';
      });
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
                  isForm: true,
                  isEmail: false,
                ),
                FieldForm(
                  label: 'E-mail',
                  isPassword: false,
                  controller: emailController,
                  isForm: true,
                  isEmail: true,
                ),
                FieldForm(
                  label: 'Password',
                  isPassword: true,
                  controller: passwordController,
                  isForm: true,
                  isEmail: false,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (userProvider.indexUser != null) {
                      userProvider.users[index!] = user;
                    }
                    userProvider.addUser(user);
                    Navigator.pushNamed(context, '/list');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  ),
                  child: Text(
                    'Save',
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
