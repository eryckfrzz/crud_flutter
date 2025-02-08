// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class FieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  bool isForm = true;
  bool isEmail = true;

  FieldForm(
      {super.key,
      required this.isForm,
      required this.label,
      required this.isPassword,
      required this.controller,
      required this.isEmail});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.blue),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabled: isForm,
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Digite pelo menos 5 caracteres';
        } else if (value.contains('@') && isEmail) {
          return 'Digite o -email corretamente';
        }
        return null;
      },
    );
  }
}
