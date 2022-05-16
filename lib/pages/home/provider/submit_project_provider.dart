import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:open_budget/base/base_bloc.dart';

class SubmitProjectProvider extends BaseBloc {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String district = 'nauryzbay'.tr();
  String category = 'all'.tr();

  List<String> districts = [
    'nauryzbay'.tr(),
    'alatau'.tr(),
    'zhetysu'.tr(),
    'almaly'.tr(),
    'bostandyk'.tr(),
    'medeu'.tr(),
    'auezov'.tr(),
    'turksib'.tr(),
  ];

  setDistrict(Object? value) {
    district = value.toString();
    notifyListeners();
  }

  List<String> categories = [
    'all'.tr(),
    'sidewalkArrangement'.tr(),
    'installation'.tr(),
    'creation'.tr(),
    'installationTwo'.tr(),
    'landscaping'.tr(),
    'construction'.tr(),
    'disposal'.tr(),
    'repair'.tr(),
  ];

  setCategory(Object? value) {
    category = value.toString();
    notifyListeners();
  }
}
