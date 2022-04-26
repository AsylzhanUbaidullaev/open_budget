import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/profile/provider/projects_provider.dart';
import 'package:open_budget/pages/profile/ui/widgets/my_projects.dart';
import 'package:open_budget/pages/profile/ui/widgets/voted_projects.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/shared/ui_helper.dart';
import 'package:open_budget/widgets/custom_app_bar.dart';
import 'package:open_budget/widgets/dash_divider.dart';
import 'package:open_budget/widgets/default_text.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ProjectsProvider>(
      model: ProjectsProvider(),
      builder: (context, model, child) {
        return DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  CupertinoIcons.back,
                  color: AppColors.whiteColor,
                ),
              ),
              title: DefaultText(
                text: 'Projects',
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
                fontSize: 32,
              ),
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
              bottom: TabBar(
                indicatorColor: AppColors.whiteColor,
                tabs: [
                  Tab(
                    icon: DefaultText(
                      text: 'Проголосованные проекты',
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                    ),
                  ),
                  Tab(
                    icon: DefaultText(
                      text: 'Мои проекты',
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                VotedProjects(),
                MyProjects(),
              ],
            ),
          ),
        );
      },
    );
  }
}
