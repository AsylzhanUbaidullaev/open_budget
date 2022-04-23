import 'package:flutter/material.dart';
import 'package:open_budget/base/base_bloc.dart';

class ChangeProfileProvider extends BaseBloc {
  TextEditingController nameController = TextEditingController();

  init(String name) {
    nameController.text = name;
    notifyListeners();
  }

  // changeName(String at) {
  //   nameController.text = at;
  //   notifyListeners();
  // }
}
