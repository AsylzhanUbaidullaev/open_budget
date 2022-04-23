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
            ? const LoadinView()
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
                          horizontal: getProportionateScreenWidth(45),
                        ),
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
                                  child: _buildChanges(AppSvgImages.ic_camera),
                                ),
                                UIHelper.horizontalSpace(
                                  getProportionateScreenWidth(42),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: _buildChanges(AppSvgImages.ic_change),
                                ),
                                UIHelper.horizontalSpace(
                                  getProportionateScreenWidth(42),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: _buildChanges(AppSvgImages.ic_trash),
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
                                _buildTextField(model.nameController),
                                UIHelper.verticalSpace(40),
                                const Text(
                                  'Email',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                UIHelper.verticalSpace(
                                  getProportionateScreenHeight(30),
                                ),
                                _buildTextField(model.emailController),
                                UIHelper.verticalSpace(40),
                                const Text(
                                  'Номер',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                UIHelper.verticalSpace(
                                  getProportionateScreenHeight(30),
                                ),
                                _buildTextField(model.phoneController),
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

  TextField _buildTextField(TextEditingController controller) {
    return TextField(
      cursorColor: AppColors.systemBlackColor,
      controller: controller,
      onSubmitted: (value) {
        // model.changeName(value);
      },
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF8F8F8)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF8F8F8)),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: const Color(0xffEEEEEE),
        filled: true,
      ),
    );
  }

  Container _buildChanges(String svg) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
        horizontal: getProportionateScreenWidth(20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            spreadRadius: 2,
            blurRadius: 4,
            color: AppColors.systemBlackColor.withOpacity(0.2),
          ),
        ],
      ),
      child: SvgPicture.asset(
        svg,
        height: getProportionateScreenHeight(58),
        width: getProportionateScreenWidth(58),
      ),
    );
  }
}
