import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              ListTile(
                tileColor:
                    widget.model.navIndex == 0 ? AppColors.primaryColor : null,
                leading: SvgPicture.asset(
                  AppSvgImages.home_ic,
                  color: widget.model.navIndex == 0
                      ? AppColors.whiteColor
                      : AppColors.systemBlackColor,
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                ),
                title: Row(
                  children: [
                    DefaultText(
                      text: 'Main page',
                      fontSize: 36,
                    ),
                    const Spacer(),
                  ],
                ),
                onTap: () =>
                    Navigator.of(context).pop(widget.model.setNavIndex(0)),
              ),
              ListTile(
                tileColor:
                    widget.model.navIndex == 1 ? AppColors.primaryColor : null,
                leading: SvgPicture.asset(
                  AppSvgImages.help_ic,
                  color: widget.model.navIndex == 1
                      ? AppColors.whiteColor
                      : AppColors.systemBlackColor,
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                ),
                title: Row(
                  children: [
                    DefaultText(
                      text: 'About the project',
                      fontSize: 36,
                    ),
                    const Spacer(),
                  ],
                ),
                onTap: () =>
                    Navigator.of(context).pop(widget.model.setNavIndex(1)),
              ),
              ListTile(
                tileColor:
                    widget.model.navIndex == 2 ? AppColors.primaryColor : null,
                leading: SvgPicture.asset(
                  AppSvgImages.notes_ic,
                  color: widget.model.navIndex == 2
                      ? AppColors.whiteColor
                      : AppColors.systemBlackColor,
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                ),
                title: Row(
                  children: [
                    DefaultText(
                      text: 'Project materials',
                      fontSize: 36,
                    ),
                    const Spacer(),
                  ],
                ),
                onTap: () =>
                    Navigator.of(context).pop(widget.model.setNavIndex(2)),
              ),
              ListTile(
                tileColor:
                    widget.model.navIndex == 3 ? AppColors.primaryColor : null,
                leading: SvgPicture.asset(
                  AppSvgImages.archive_ic,
                  color: widget.model.navIndex == 3
                      ? AppColors.whiteColor
                      : AppColors.systemBlackColor,
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                ),
                title: Row(
                  children: [
                    DefaultText(
                      text: 'Archive of materials',
                      fontSize: 36,
                    ),
                    const Spacer(),
                  ],
                ),
                onTap: () =>
                    Navigator.of(context).pop(widget.model.setNavIndex(3)),
              ),
              ListTile(
                tileColor:
                    widget.model.navIndex == 4 ? AppColors.primaryColor : null,
                leading: SvgPicture.asset(
                  AppSvgImages.person_ic,
                  color: widget.model.navIndex == 4
                      ? AppColors.whiteColor
                      : AppColors.systemBlackColor,
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                ),
                title: Row(
                  children: [
                    DefaultText(
                      text: 'Profile',
                      fontSize: 36,
                    ),
                    const Spacer(),
                  ],
                ),
                onTap: () =>
                    Navigator.of(context).pop(widget.model.setNavIndex(4)),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
                        vertical: getProportionateScreenHeight(30),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DefaultText(
                        text: 'KZ',
                        fontSize: 36,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
                        vertical: getProportionateScreenHeight(30),
                      ),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.primaryColor, width: 2),
                        // color: AppColors.primaryColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DefaultText(
                        text: 'RU',
                        fontSize: 36,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
                        vertical: getProportionateScreenHeight(30),
                      ),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DefaultText(
                        text: 'EN',
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
