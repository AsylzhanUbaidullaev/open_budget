import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/data/database.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/widgets/dash_divider.dart';
import 'package:open_budget/widgets/default_text.dart';
import 'package:provider/provider.dart';

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  String year = '2019';
  String district = 'nauryzbay'.tr();
  List<String> years = [
    '2019',
    '2020',
    '2021',
  ];
  List<String> districts = [
    'nauryzbay'.tr(),
    'alatau'.tr(),
    'zhetysu'.tr(),
    'almaly'.tr(),
    'bostandyk'.tr(),
    'medeu'.tr(),
    'auezov'.tr(),
    'turksib'.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('voteOnTheProject'.tr()),
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
                        text: 'selectYear'.tr(),
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
                        child: DropdownButton(
                          value: year,
                          items: years
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              year = value.toString();
                            });
                          },
                          underline: const SizedBox(),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'district'.tr(),
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
                        child: DropdownButton(
                          value: district,
                          items: districts
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              district = value.toString();
                            });
                          },
                          underline: const SizedBox(),
                          elevation: 0,
                          isExpanded: true,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
        ],
      ),
    );
  }
}
