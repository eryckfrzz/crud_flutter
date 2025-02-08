import 'package:crud_flutter/providers/user_provider.dart';
import 'package:crud_flutter/screens/home_page.dart';
import 'package:crud_flutter/screens/list_users.dart';
import 'package:crud_flutter/screens/users_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/list': (context) => ListUsers(),
          '/view': (context) => UsersView()
        },
      ),
    );
  }
}
