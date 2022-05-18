import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/data/database.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ProjectsArchiveProvider extends BaseBloc {
  AppDatabase? database;
  List<String>? files;
  List<bool>? isReadMore;
  String year = '2022';
  String district = 'nauryzbay'.tr();
  String category = 'all'.tr();
  SfRangeValues priceValues = const SfRangeValues(0, 11340000000);
  bool isAllCategory = true;

  init(BuildContext context) {
    setLoading(true);
    database = Provider.of<AppDatabase>(context);
    SizeConfig().init(context);
    setLoading(false);
  }

  initIsReadMore(List<Project> projects) {
    isReadMore = List.generate(projects.length, (index) => false);
  }

  takeFiles(String _files) {
    files = _files.split(',');
    files!.removeWhere((element) => element == _files.split(',').last);
    // notifyListeners();
  }

  setIsReadMore(int index) {
    isReadMore![index] = !isReadMore![index];
    notifyListeners();
  }

  setIsAllCategory(bool value) {
    isAllCategory = value;
    notifyListeners();
  }

  setFilter(
      {required String yearFilter,
      required String districtFilter,
      required String categoryFilter,
      required SfRangeValues priceValuesFilter}) {
    categoryFilter == 'all'.tr()
        ? setIsAllCategory(true)
        : setIsAllCategory(false);
    year = yearFilter;
    district = districtFilter;
    category = categoryFilter;
    priceValues = priceValuesFilter;
    notifyListeners();
  }
}
