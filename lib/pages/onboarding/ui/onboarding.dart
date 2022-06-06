import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/onboarding/provider/onboarding_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/shared/ui_helper.dart';
import 'package:open_budget/widgets/default_button.dart';

import '../../../widgets/custom_text_button.dart';

class Onboarding extends StatelessWidget {
  List<Map<String, String?>> splashes = [
    {
      'title': 'Будь инициативным',
      'text': 'Предлагай свои проекты',
      'image': AppSvgImages.onboarding_1
    },
    {
      'title': 'Голосуй',
      'text': 'Выбирай самые лучшие проекты',
      'image': AppSvgImages.onboarding_2
    },
    {
      'title': 'Участвуй',
      'text': 'Улучшай свой город',
      'image': AppSvgImages.onboarding_3
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BaseProvider<OnboardingProvider>(
        model: OnboardingProvider(),
        builder: (context, model, child) {
          return SafeArea(
            child: Stack(
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
                        ))),
                Positioned(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(38),
                            right: getProportionateScreenWidth(30),
                            top: getProportionateScreenHeight(10),
                            bottom: getProportionateScreenHeight(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            model.getPageNumber == 0
                                ? const SizedBox()
                                : InkWell(
                                    onTap: () {
                                      model.previousPage();
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.arrow_back_ios,
                                          color: AppColors.primaryColor,
                                        ),
                                        Text(
                                          // AppLocalizations.of(context)!
                                          //     .translate('back')!,
                                          'Назад',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            model.getPageNumber == 2
                                ? const SizedBox(
                                    height: 48,
                                  )
                                : CustomTextButton(
                                    text:
                                        // AppLocalizations.of(context)!.translate('skip'),
                                        'Пропустить',
                                    onPress: () {
                                      model.toLogin(context);
                                    },
                                  ),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpace(getProportionateScreenHeight(130)),
                      Flexible(
                        child: PageView.builder(
                          controller: model.pageController,
                          onPageChanged: (value) {
                            model.setPageNumber(value);
                          },
                          itemCount: splashes.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(37),
                                right: getProportionateScreenWidth(38),
                                top: getProportionateScreenHeight(118),
                              ),
                              child: _buildSplashContent(
                                image: splashes[index]['image'],
                                text: splashes[index]['text'],
                                title: splashes[index]['title'],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSelections(model, splashes),
                            DefaultButton(
                              text: model.getPageNumber == 2 ? 'Start' : 'Next',
                              press: model.getPageNumber == 2
                                  ? () {
                                      model.toLogin(context);
                                    }
                                  : () {
                                      model.nextPage();
                                    },
                              width: 120,
                            ),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpace(50)
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildSplashContent(
      {required String? title, required String? text, required String? image}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            image!,
            height: getProportionateScreenHeight(400),
            width: getProportionateScreenWidth(600),
          ),
        ),
        UIHelper.verticalSpace(50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: getProportionateScreenWidth(40),
                  color: AppColors.systemBlackColor),
            ),
            UIHelper.verticalSpace(10),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: getProportionateScreenWidth(30),
                  color: AppColors.systemDarkGrayColor),
            ),
          ],
        ),
      ],
    );
  }

  _buildSelections(OnboardingProvider model, List splashes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        splashes.length,
        (index) => Container(
          margin: EdgeInsets.only(right: 10),
          height: 4,
          width: model.getPageNumber == index ? 24 : 10,
          decoration: BoxDecoration(
              color: model.getPageNumber == index
                  ? AppColors.primaryColor
                  : AppColors.systemDarkGrayColor,
              borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }
}
