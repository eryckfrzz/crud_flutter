import 'package:crud_flutter/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  User? userSelected;
  int? indexUser;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void removeUser(int index) {
    _users.removeAt(indexUser = index);
    notifyListeners();
  }
}
