import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/shared/size_config.dart';

import '../../../shared/theme.dart';

class MyProjectDetailsProvider extends BaseBloc {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  String category = 'all'.tr();
  int currentSvgIndex = 0;
  String district = 'nauryzbay'.tr();

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

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setLoading(false);
  }

  setCategory(Object? value) {
    category = value.toString();
    for (int i = 0; i < categories.length; i++) {
      if (category == categories[i]) {
        currentSvgIndex = i;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  setDistrict(Object? value) {
    district = value.toString();
    notifyListeners();
  }
}
