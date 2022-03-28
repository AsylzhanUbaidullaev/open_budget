import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/widgets/dash_divider.dart';

import '../../../shared/size_config.dart';
import '../../../shared/theme.dart';
import '../../../widgets/default_text.dart';

class ProjectMaterialsPage extends StatefulWidget {
  const ProjectMaterialsPage({Key? key}) : super(key: key);

  @override
  State<ProjectMaterialsPage> createState() => _ProjectMaterialsPageState();
}

class _ProjectMaterialsPageState extends State<ProjectMaterialsPage> {
  String year = '2019';
  String district = 'Nauryzbay district';
  List<String> years = [
    '2019',
    '2020',
    '2021',
  ];
  List<String> districts = [
    'Nauryzbay district',
    'Alatau district',
    'Zhetysu district',
    'Almaly district',
    'Bostandyk district',
    'Medeu district',
    'Auezov district',
    'Turksib district',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: getProportionateScreenHeight(30),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30),
            ),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 6 + 1,
                separatorBuilder: (_, index) => SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                itemBuilder: (_, index) {
                  if (index == 6) {
                    return SizedBox(
                      height: getProportionateScreenHeight(30),
                    );
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30),
                      vertical: getProportionateScreenHeight(30),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 1,
                            color: AppColors.systemBlackColor.withOpacity(0.25),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              AppSvgImages.notes_ic,
                              width: getProportionateScreenWidth(30),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(30),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(
                                    text:
                                        'Эксперттік комиссия құрамы. Состав экспертной комиссии',
                                    textAlign: TextAlign.start,
                                    fontSize: 28,
                                  ),
                                  DefaultText(
                                    text: '09.10.2019',
                                    color: AppColors.systemLightGrayColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        const DashDivider(),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        Row(
                          children: [
                            const Spacer(),
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
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
