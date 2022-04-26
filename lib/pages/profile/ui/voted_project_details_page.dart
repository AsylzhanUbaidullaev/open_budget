import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/profile/provider/voted_project_details_provider.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/widgets/default_text.dart';

import '../../../shared/size_config.dart';

class VotedProjectDetailsPage extends StatelessWidget {
  const VotedProjectDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<VotedProjectDetailsProvider>(
      onReady: (p0) => p0.init(context),
      model: VotedProjectDetailsProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                CupertinoIcons.back,
                color: AppColors.whiteColor,
              ),
            ),
            title: DefaultText(
              text: 'Проголосованный проект',
              fontSize: 32,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
            ),
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
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
                  padding: EdgeInsets.only(
                    bottom: getProportionateScreenHeight(30),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(40),
                    vertical: getProportionateScreenHeight(50),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 1,
                        color: AppColors.systemBlackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppPngImages.workout,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText(
                            'Design and construction of an access road',
                            32,
                            isBold: true,
                            isGrey: false,
                          ),
                          SizedBox(
                            height: getProportionateScreenWidth(10),
                          ),
                          _buildText(
                            'Construction and repair of sidewalks, ramps, ditches',
                            28,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(30),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppSvgImages.person_dark_ic,
                                  width: getProportionateScreenWidth(25),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(20),
                                ),
                                Expanded(
                                  child: DefaultText(
                                    text: 'Kanakhin Adil Beketaevich',
                                    color: AppColors.systemLightGrayColor,
                                    fontSize: 28,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          _buildText(
                            'Laying the road and arranging the Kerenkulak river in flumes to prevent clogging of the further channel',
                            28,
                            isGrey: false,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          _buildText('55 000 000 ₸', 36),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(30),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppSvgImages.location_ic,
                                  width: getProportionateScreenWidth(25),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(20),
                                ),
                                Expanded(
                                  child: DefaultText(
                                    text:
                                        'Bostandyk district, microdistrict Ermensai, below lane 7, st. Projected b/n',
                                    color: AppColors.systemLightGrayColor,
                                    fontSize: 28,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20),
                          ),
                          _buildText('numberOfOfflineVotes'.tr() + ': 0', 36),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          _buildText('votes'.tr() + ': 0', 36),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          _buildText(
                              'status'.tr() + ': ' + 'completed'.tr(), 36),
                          SizedBox(
                            height: getProportionateScreenHeight(40),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            _buildFile(
                              AppSvgImages.power_point_ic,
                              'Kurilsukaya corner. Chokina.pptx',
                              isPowerPoint: true,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            _buildFile(AppSvgImages.word_ic,
                                'Bauman Grove project.docx'),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            _buildFile(AppSvgImages.excel_ic,
                                'Defect. act Kuril coal. Chokina.xlsx'),
                          ],
                        ),
                      ),
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

  _buildText(String text, int size, {bool isBold = false, bool isGrey = true}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
      ),
      child: DefaultText(
        text: text,
        fontWeight: isBold ? FontWeight.bold : null,
        color: isGrey ? AppColors.systemLightGrayColor : null,
        fontSize: size.toDouble(),
        textAlign: TextAlign.start,
      ),
    );
  }

  _buildFile(String icon, String text, {bool isPowerPoint = false}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
        vertical: getProportionateScreenHeight(30),
      ),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 1,
              color: AppColors.shadowColor,
            )
          ]),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: getProportionateScreenWidth(isPowerPoint ? 45 : 55),
            height: getProportionateScreenHeight(isPowerPoint ? 40 : 50),
          ),
          SizedBox(
            width: getProportionateScreenWidth(40),
          ),
          DefaultText(text: text),
        ],
      ),
    );
  }
}
