import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/profile/provider/change_profile_provider.dart';
import 'package:open_budget/service_locator.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/shared/ui_helper.dart';
import 'package:open_budget/widgets/custom_app_bar.dart';
import 'package:open_budget/widgets/default_button.dart';
import 'package:open_budget/widgets/loading_view.dart';
import 'package:open_budget/pages/profile/provider/profile_provider.dart';

class ChangeProfile extends StatelessWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ChangeProfileProvider>(
      model: ChangeProfileProvider(),
      builder: (context, model, child) {
        return model.isLoading
            ? LoadinView()
            : Scaffold(
                appBar: CustomAppBar(
                  title: 'changeProfile'.tr(),
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(45)),
                        child: Column(
                          children: [
                            UIHelper.verticalSpace(
                              getProportionateScreenHeight(54),
                            ),
                            SvgPicture.asset(AppSvgImages.ic_user),
                            UIHelper.verticalSpace(
                              getProportionateScreenHeight(50),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenHeight(15),
                                        horizontal:
                                            getProportionateScreenWidth(15)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: AppColors.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          // offset: Offset(0, -4),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          color: AppColors.systemBlackColor
                                              .withOpacity(0.2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppSvgImages.ic_camera,
                                        height:
                                            getProportionateScreenHeight(68),
                                        width: getProportionateScreenWidth(68),
                                      ),
                                    ),
                                  ),
                                ),
                                UIHelper.horizontalSpace(
                                  getProportionateScreenWidth(42),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenHeight(15),
                                        horizontal:
                                            getProportionateScreenWidth(15)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: AppColors.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          // offset: Offset(0, -4),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          color: AppColors.systemBlackColor
                                              .withOpacity(0.2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppSvgImages.ic_change,
                                        height:
                                            getProportionateScreenHeight(68),
                                        width: getProportionateScreenWidth(68),
                                      ),
                                    ),
                                  ),
                                ),
                                UIHelper.horizontalSpace(
                                  getProportionateScreenWidth(42),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            getProportionateScreenHeight(20),
                                        horizontal:
                                            getProportionateScreenWidth(20)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: AppColors.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          // offset: Offset(0, -4),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          color: AppColors.systemBlackColor
                                              .withOpacity(0.2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppSvgImages.ic_trash,
                                        height:
                                            getProportionateScreenHeight(58),
                                        width: getProportionateScreenWidth(58),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(
                              getProportionateScreenHeight(90),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'name'.tr(),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                UIHelper.verticalSpace(
                                  getProportionateScreenHeight(30),
                                ),
                                TextField(
                                  cursorColor: AppColors.systemBlackColor,
                                  controller: model.nameController,
                                  onSubmitted: (value) {
                                    // model.changeName(value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xffF8F8F8)),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    fillColor: const Color(0xffEEEEEE),
                                    filled: true,
                                  ),
                                ),
                                UIHelper.verticalSpace(
                                  getProportionateScreenHeight(90),
                                ),
                                DefaultButton(
                                  text: 'save'.tr(),
                                  press: () {
                                    // model.changeName(name);
                                  },
                                ),
                              ],
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
}
