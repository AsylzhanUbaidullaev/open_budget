import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/profile/provider/profile_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/shared/ui_helper.dart';
import 'package:open_budget/widgets/default_button.dart';
import 'package:open_budget/widgets/loading_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init;
    return BaseProvider<ProfileProvider>(
      model: ProfileProvider(),
      builder: (context, model, child) {
        return Scaffold(
          body: model.isLoading
              ? const LoadinView()
              : Stack(
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
                          horizontal: getProportionateScreenWidth(25),
                        ),
                        child: Column(
                          children: [
                            UIHelper.verticalSpace(
                                getProportionateScreenHeight(85)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // CircleAvatar(),
                                SvgPicture.asset(AppSvgImages.ic_user),
                                UIHelper.horizontalSpace(
                                    getProportionateScreenWidth(30)),
                                Column(
                                  children: [
                                    const Text(
                                      'Asylzhan Ubaidullaev',
                                      // getIt.get<ProfileProvider>().name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    UIHelper.verticalSpace(
                                        getProportionateScreenHeight(12)),
                                    const Text(
                                      '+7 747 633 8071',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.darkGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(
                                getProportionateScreenHeight(90)),
                            DefaultButton(
                              text: 'change'.tr(),
                              press: () {
                                model.toChangeProfile(context);
                              },
                              width: getProportionateScreenWidth(450),
                            ),
                            UIHelper.verticalSpace(
                              getProportionateScreenHeight(100),
                            ),
                            ListTile(
                              onTap: () => model.toHelpPage(context),
                              leading: SvgPicture.asset(
                                AppSvgImages.help_ic,
                                width: getProportionateScreenWidth(45),
                                height: getProportionateScreenHeight(45),
                              ),
                              title: Text(
                                'help'.tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            ListTile(
                              onTap: () => model.toVotedProjects(context),
                              leading: SvgPicture.asset(
                                AppSvgImages.ic_check,
                                width: getProportionateScreenWidth(45),
                                height: getProportionateScreenHeight(45),
                              ),
                              title: Text(
                                'votedProjects'.tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              leading: SvgPicture.asset(
                                AppSvgImages.ic_logout,
                                width: getProportionateScreenWidth(45),
                                height: getProportionateScreenHeight(45),
                              ),
                              title: Text(
                                'logout'.tr(),
                                style: const TextStyle(fontSize: 18),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.primaryColor,
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

  ListTile _buildListTile(String svg, String text, Function ontap) {
    return ListTile(
      onTap: () => ontap(),
      leading: SvgPicture.asset(
        svg,
        width: getProportionateScreenWidth(45),
        height: getProportionateScreenHeight(45),
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.primaryColor,
      ),
    );
  }
}
