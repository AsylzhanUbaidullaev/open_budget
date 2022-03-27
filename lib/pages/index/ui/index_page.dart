import 'package:flutter/material.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/home/ui/vote_page.dart';
import 'package:open_budget/pages/index/provider/index_provider.dart';
import 'package:open_budget/pages/materials/ui/project_materials_page.dart';
import 'package:open_budget/pages/profile/ui/profile_page.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/widgets/custom_app_bar.dart';
import 'package:open_budget/widgets/default_text.dart';

import '../../about_project/ui/about_project_page.dart';
import '../../home/ui/home.dart';
import '../../projects_archive/ui/projects_archive_page.dart';
import 'custom_drawer.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<IndexProvider>(
      model: IndexProvider(),
      onReady: (p0) => p0.init(context),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(model.currentTitle),
            centerTitle: true,
          ),
          drawer: CustomDrawer(
            model: model,
          ),
          floatingActionButton: model.navIndex == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
                        vertical: getProportionateScreenHeight(30),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DefaultText(
                        text: 'Project submission',
                        fontSize: 32,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VotePage(),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                          vertical: getProportionateScreenHeight(30),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DefaultText(
                          text: 'Vote on the project',
                          fontSize: 32,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: _body[model.navIndex],
        );
      },
    );
  }

  final List<Widget> _body = [
    const HomePage(),
    AboutProjectPage(),
    const ProjectMaterialsPage(),
    const ProjectsArchivePage(),
    const ProfilePage(),
  ];
}
