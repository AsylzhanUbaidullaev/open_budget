import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/pages/projects_archive/provider/projects_archive_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../shared/theme.dart';

class ProjectsArchiveFilterProvider extends BaseBloc {
  String year = '2022';
  String district = 'nauryzbay'.tr();
  String category = 'all'.tr();
  int currentSvgIndex = 0;
  SfRangeValues priceValues = const SfRangeValues(0, 11340000000);

  List<String> years = [
    '2020',
    '2021',
    '2022',
  ];
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

  List<String> svgs = [
    AppSvgImages.all_categories,
    AppSvgImages.tractor,
    AppSvgImages.area,
    AppSvgImages.lamp,
    AppSvgImages.dush,
    AppSvgImages.forest,
    AppSvgImages.road,
    AppSvgImages.trash,
    AppSvgImages.bordur,
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

  List<int> svgsWidth = [35, 50, 45, 30, 40, 42, 41, 25, 30];
  List<int> svgsHeights = [35, 30, 23, 40, 40, 39, 41, 40, 40];

  init(BuildContext context, ProjectsArchiveProvider projectsArchiveProvider) {
    setLoading(true);
    SizeConfig().init(context);
     year = projectsArchiveProvider.year;
    district = projectsArchiveProvider.district;
    category = projectsArchiveProvider.category;
    priceValues = projectsArchiveProvider.priceValues;
    setLoading(false);
  }

  setYear(Object? value) {
    year = value.toString();
    notifyListeners();
  }

  setDistrict(Object? value) {
    district = value.toString();
    notifyListeners();
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

  setPrice(SfRangeValues value) {
    priceValues = value;
    notifyListeners();
  }

  setFilters(ProjectsArchiveProvider model) {

        model.setFilter(
            yearFilter: year,
            districtFilter: district,
            categoryFilter: category,
            priceValuesFilter: priceValues);
    notifyListeners();
  }
}
