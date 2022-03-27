import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/widgets/dash_divider.dart';
import 'package:open_budget/widgets/default_text.dart';

class VotePage extends StatelessWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Vote on the project'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'Select a year',
                        fontSize: 32,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                          vertical: getProportionateScreenHeight(20),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                              text: '2020',
                              fontSize: 36,
                            ),
                            SvgPicture.asset(
                              AppSvgImages.arrow_down,
                              width: getProportionateScreenWidth(20),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(80),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'District',
                        fontSize: 32,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                          vertical: getProportionateScreenHeight(20),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: getProportionateScreenWidth(280),
                              child: DefaultText(
                                textAlign: TextAlign.start,
                                text: 'Наурызбай ауданы',
                                fontSize: 32,
                              ),
                            ),
                            SvgPicture.asset(
                              AppSvgImages.arrow_down,
                              width: getProportionateScreenWidth(20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(80),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 7,
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
                          color: AppColors.systemBlackColor.withOpacity(0.25),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  width: getProportionateScreenWidth(30),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            DefaultText(
                              text: 'Голосов: 0',
                              fontSize: 32,
                              color: AppColors.systemLightGrayColor,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            const DashDivider(),
                            SizedBox(
                              height: getProportionateScreenHeight(40),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppSvgImages.download_ic,
                                      width: getProportionateScreenWidth(24),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(20),
                                    ),
                                    DefaultText(
                                      text: 'Download',
                                      fontSize: 28,
                                      isUnderline: true,
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: getProportionateScreenWidth(200),
                                  padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(30),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: DefaultText(
                                    text: 'Vote',
                                    fontSize: 32,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(40),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
