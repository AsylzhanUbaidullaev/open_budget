import 'package:flutter/material.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/pages/login/ui/login.dart';

class RegistrationProvider extends BaseBloc {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  bool isButtonEnabled = true;
  String? phoneError;

  toLogin(context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
        (route) => false);
  }

  checkPhoneNumber(String value) {
    // if (value.length == 12) {
    //   isButtonEnabled = true;
    //   notifyListeners();
    // } else {
    //   isButtonEnabled = false;
    //   notifyListeners();
    // }
  }
}
