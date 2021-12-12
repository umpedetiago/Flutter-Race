import 'package:flutter/material.dart';
import 'package:meuapp/shared/utils/app_state.dart';

class LoginContrller extends ChangeNotifier {
  var state = AppState.empty();
  final formkey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
    print("email: $_email | password: $_password");
  }

  bool validate() {
    final form = formkey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  void login() {
    if (validate()) {
      print("pode chamar o backeend");
    }
  }
}
