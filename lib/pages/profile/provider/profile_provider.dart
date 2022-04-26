import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:open_budget/pages/profile/ui/change_profile.dart';
import 'package:open_budget/pages/profile/ui/help.dart';
import 'package:open_budget/pages/profile/ui/projects_page.dart';
import 'package:open_budget/shared/theme.dart';

class ProfileProvider extends BaseBloc {
  String name = 'Arlan';

  changeName(String at) {
    name = at;
    notifyListeners();
  }

  toChangeProfile(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ChangeProfile()));
  }

  toHelpPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Help()));
  }

  toVotedProjects(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProjectsPage()));
  }

  List<SvgPicture> icons = [
    SvgPicture.asset(AppSvgImages.ic_help),
    SvgPicture.asset(AppSvgImages.ic_check),
    // SvgPicture.asset(AppSvgImages.ic_logout),
  ];

  List<Widget> toPages = const [
    Help(),
    ProjectsPage(),
  ];

  List<String> titles = [
    'Помощь',
    'Проголосованные проекты',
  ];
}
