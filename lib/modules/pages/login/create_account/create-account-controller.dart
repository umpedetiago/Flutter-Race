import 'package:flutter/material.dart';

class CreateAccountContrller {
  final formkey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _name = "";

  void onChange({String? email, String? password, String? name}) {
    _email = email ?? _email;
    _password = password ?? _password;
    _name = name ?? _name;
    print("email: $_email | password: $_password |name: $_name");
  }

  bool validate() {
    final form = formkey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void create() {
    if (validate()) {
      print("pode chamar o backeend");
    }
  }
}
