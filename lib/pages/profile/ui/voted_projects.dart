import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/profile/provider/voted_projects_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/shared/ui_helper.dart';
import 'package:open_budget/widgets/custom_app_bar.dart';
import 'package:open_budget/widgets/dash_divider.dart';
import 'package:open_budget/widgets/default_text.dart';

class VotedProjects extends StatelessWidget {
  const VotedProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<VotedProjectsProvider>(
      model: VotedProjectsProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'votedProjects'.tr(),
            isWithBackButton: true,
          ),
          body: Stack(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpace(
                        getProportionateScreenHeight(25),
                      ),
                      Text(
                        'projectsWithYourVotes'.tr() + ': 4',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      UIHelper.verticalSpace(
                        getProportionateScreenHeight(25),
                      ),
                      Text(
                        'availableVotes'.tr() + ': 0',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      UIHelper.verticalSpace(
                        getProportionateScreenHeight(45),
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 4,
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
                                    offset: Offset(0, 4),
                                    blurRadius: 1,
                                    color: AppColors.systemBlackColor
                                        .withOpacity(0.25),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppPngImages.workout,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: DefaultText(
                                              text:
                                                  'Composition of the expert commission.',
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            AppSvgImages.notes_ic,
                                            width:
                                                getProportionateScreenWidth(30),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      DefaultText(
                                        text: 'votes'.tr() + ': 0',
                                        fontSize: 32,
                                        color: AppColors.systemLightGrayColor,
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      const DashDivider(),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'more'.tr(),
                                              style: const TextStyle(
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
