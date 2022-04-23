import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/home/ui/vote_page.dart';
import 'package:open_budget/pages/index/provider/index_provider.dart';
import 'package:open_budget/pages/map/ui/map.dart';
import 'package:open_budget/pages/materials/ui/project_materials_page.dart';
import 'package:open_budget/pages/profile/ui/profile_page.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
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
                    const Spacer(),
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
                        text: 'projectSubmission'.tr(),
                        fontSize: 32,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const VotePage(),
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
                          text: 'voteOnTheProject'.tr(),
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
          // bottomSheet: model.navIndex == 3
          //     ? Container(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: getProportionateScreenWidth(40),
          //           vertical: getProportionateScreenHeight(40),
          //         ),
          //         decoration: BoxDecoration(
          //           color: AppColors.primaryColor,
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             Expanded(
          //               child: InkWell(
          //                 onTap: () => showModalBottomSheet(
          //                   context: context,
          //                   backgroundColor:
          //                       AppColors.whatsAppColor.withOpacity(0),
                            // builder: (_) => Categories(model: model),
          //                 ),
          //                 child: Container(
          //                   color: AppColors.whatsAppColor.withOpacity(0),
          //                   child: SvgPicture.asset(
          //                     AppSvgImages.all_categories,
          //                     width: getProportionateScreenWidth(60),
          //                     height: getProportionateScreenHeight(60),
          //                     color: AppColors.whiteColor,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             SizedBox(
          //               height: getProportionateScreenHeight(60),
          //               child: const VerticalDivider(
          //                 color: AppColors.whiteColor,
          //               ),
          //             ),
          //             Expanded(
          //               flex: 2,
          //               child: GestureDetector(
          //                 onTap: () => log('Summa ot'),
          //                 child: Container(
          //                   color: AppColors.whiteColor.withOpacity(0),
          //                   child: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       DefaultText(
          //                         text: 'amountFrom'.tr(),
          //                         color: AppColors.whiteColor,
          //                       ),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(10),
          //                       ),
          //                       DefaultText(
          //                         text: '0',
          //                         color: AppColors.whiteColor,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               flex: 2,
          //               child: GestureDetector(
          //                 onTap: () => log('Summa do'),
          //                 child: Container(
          //                   color: AppColors.whatsAppColor.withOpacity(0),
          //                   child: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       DefaultText(
          //                         text: 'amountUpTo'.tr(),
          //                         color: AppColors.whiteColor,
          //                       ),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(10),
          //                       ),
          //                       DefaultText(
          //                         text: '113400000',
          //                         color: AppColors.whiteColor,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             )
          //           ],
          //         ),
          //       )
          //     : null,
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
    const MapPage(),
    const ProfilePage(),
  ];
}
