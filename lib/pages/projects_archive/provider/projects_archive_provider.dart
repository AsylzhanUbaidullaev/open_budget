import 'package:flutter/cupertino.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/data/database.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:provider/provider.dart';

class ProjectsArchiveProvider extends BaseBloc {
  AppDatabase? database;
  List<String>? files;
  List<bool>? isReadMore;

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
}
