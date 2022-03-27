import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/shared/size_config.dart';

class IndexProvider extends BaseBloc {
  int navIndex = 0;
  String currentTitle = 'Participation budget';

  List<String> titles = [
    'Participation budget',
    'About the project',
    'Project materials',
    'Archive of materials',
    'Profile',
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
