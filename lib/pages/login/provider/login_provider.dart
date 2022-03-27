import 'package:flutter/material.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/pages/login/ui/registration.dart';

class LoginProvider extends BaseBloc {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;
  // Result<LoginResponseModel, NetworkError>? loginData;
  // AuthService _authService = AuthService();
  String? phoneError;

  toRegistration(context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Registration()),
        (route) => false);
  }

  checkPhoneNumber(String value) {
    if (value.length == 12) {
      isButtonEnabled = true;
      notifyListeners();
    } else {
      isButtonEnabled = false;
      notifyListeners();
    }
  }

  // checkAuth(String phone, String password) {
  //   if (phone.length == 12 && password.length > 4) {
  //     isButtonEnabled = true;
  //     notifyListeners();
  //   } else {
  //     isButtonEnabled = false;
  //     notifyListeners();
  //   }
  // }

  // checkPassword(String pass) {
  //   if(pass.length > 4) {

  //   }
  // }
}
