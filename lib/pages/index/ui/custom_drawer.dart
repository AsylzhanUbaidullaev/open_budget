import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/index/provider/custom_drawer_provider.dart';
import 'package:open_budget/pages/index/provider/index_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/widgets/default_text.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key, required this.model}) : super(key: key);
  final IndexProvider model;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return BaseProvider<CustomDrawerProvider>(
        onReady: (p0) => p0.init(context),
        model: CustomDrawerProvider(),
        builder: (context, model, child) {
          return Drawer(
            backgroundColor: AppColors.whiteColor,
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
                ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(100),
                      ),
                      child: SvgPicture.asset(
                        AppSvgImages.logo,
                        width: getProportionateScreenWidth(200),
                        height: getProportionateScreenHeight(150),
                      ),
                    ),
                    _buildListTile(context, 0, 'mainPage'),
                    _buildListTile(context, 1, 'aboutProject'),
                    _buildListTile(context, 2, 'projectMaterials'),
                    _buildListTile(context, 3, 'archieveOfMaterials'),
                    // ListTile(
                    //   tileColor: widget.model.navIndex == 4
                    //       ? AppColors.primaryColor
                    //       : null,
                    //   leading: SvgPicture.asset(
                    //     AppSvgImages.archive_ic,
                    //     color: widget.model.navIndex == 4
                    //         ? AppColors.whiteColor
                    //         : AppColors.systemBlackColor,
                    //     width: getProportionateScreenWidth(50),
                    //     height: getProportionateScreenHeight(50),
                    //   ),
                    //   title: Row(
                    //     children: [
                    //       DefaultText(
                    //         text: 'projectMap'.tr(),
                    //         fontSize: 36,
                    //       ),
                    //       const Spacer(),
                    //     ],
                    //   ),
                    //   onTap: () => Navigator.of(context)
                    //       .pop(widget.model.setNavIndex(4)),
                    // ),
                    _buildListTile(context, 5, 'profile'),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            model.changeLangByIndex(context, 0);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(30),
                              vertical: getProportionateScreenHeight(30),
                            ),
                            decoration: BoxDecoration(
                              color: model.langGroupValue == "KK"
                                  ? AppColors.primaryColor
                                  : null,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DefaultText(
                              text: 'KZ',
                              fontSize: 36,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.changeLangByIndex(context, 1);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(30),
                              vertical: getProportionateScreenHeight(30),
                            ),
                            decoration: BoxDecoration(
                              color: model.langGroupValue == "RU"
                                  ? AppColors.primaryColor
                                  : null,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 2),
                              // color: AppColors.primaryColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DefaultText(
                              text: 'RU',
                              fontSize: 36,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.changeLangByIndex(context, 2);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(30),
                              vertical: getProportionateScreenHeight(30),
                            ),
                            decoration: BoxDecoration(
                              color: model.langGroupValue == "EN"
                                  ? AppColors.primaryColor
                                  : null,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DefaultText(
                              text: 'EN',
                              fontSize: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  ListTile _buildListTile(BuildContext context, int index, String text) {
    return ListTile(
      tileColor: widget.model.navIndex == index ? AppColors.primaryColor : null,
      leading: SvgPicture.asset(
        AppSvgImages.person_ic,
        color: widget.model.navIndex == index
            ? AppColors.whiteColor
            : AppColors.systemBlackColor,
        width: getProportionateScreenWidth(50),
        height: getProportionateScreenHeight(50),
      ),
      title: Row(
        children: [
          Flexible(
            child: DefaultText(
              textAlign: TextAlign.left,
              color:
                  widget.model.navIndex == index ? AppColors.whiteColor : null,
              text: text.tr(),
              fontSize: 36,
            ),
          ),
        ],
      ),
      onTap: () => Navigator.of(context).pop(
        widget.model.setNavIndex(index),
      ),
    );
  }
}
