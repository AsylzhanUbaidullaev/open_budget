import 'package:flutter/cupertino.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/shared/size_config.dart';

class ProjectsArchiveProvider extends BaseBloc {
  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setLoading(false);
  }
}
