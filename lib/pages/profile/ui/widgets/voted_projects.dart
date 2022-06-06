import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_budget/pages/profile/provider/projects_provider.dart';
import 'package:open_budget/pages/profile/ui/voted_project_details_page.dart';

import '../../../../shared/size_config.dart';
import '../../../../shared/theme.dart';
import '../../../../shared/ui_helper.dart';
import '../../../../widgets/dash_divider.dart';
import '../../../../widgets/default_text.dart';

class VotedProjects extends StatelessWidget {
  final ProjectsProvider? provider;
  const VotedProjects({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              AppSvgImages.bottom_design,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30),
              vertical: getProportionateScreenHeight(20),
            ),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(40),
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: provider!.pics.length,
              separatorBuilder: (_, index) => SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              itemBuilder: (_, index) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                ),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 1,
                        color: AppColors.systemBlackColor.withOpacity(0.25),
                      )
                    ]),
                child: Column(
                  children: [
                    Image.asset(
                      // AppPngImages.workout,
                      provider!.pics[index],
                      width: getProportionateScreenWidth(640),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: DefaultText(
                                  text: 'Composition of the expert commission.',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SvgPicture.asset(
                                AppSvgImages.notes_ic,
                                width: getProportionateScreenWidth(30),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          DefaultText(
                            text: 'votes'.tr() + ': 0',
                            fontSize: 32,
                            color: AppColors.systemLightGrayColor,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          const DashDivider(),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const VotedProjectDetailsPage(),
                                ),
                              ),
                              child: Text(
                                'more'.tr(),
                                style: const TextStyle(
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
