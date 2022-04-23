import 'package:easy_localization/easy_localization.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/shared/size_config.dart';

class IndexProvider extends BaseBloc {
  int navIndex = 0;
  String currentTitle = 'Participation budget';

  List<String> titles = [
    'participationBudget'.tr(),
    'aboutProject'.tr(),
    'projectMaterials'.tr(),
    'archiveOfMaterials'.tr(),
    'projectMap'.tr(),
    'profile'.tr(),
  ];

  init(context) {
    setLoading(true);
    SizeConfig().init(context);
    setLoading(false);
  }

  setNavIndex(int index) {
    currentTitle = titles[index];
    navIndex = index;
    notifyListeners();
  }
}
