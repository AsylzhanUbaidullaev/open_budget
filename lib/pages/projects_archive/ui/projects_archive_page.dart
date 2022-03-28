import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/widgets/default_button.dart';

import '../../../shared/size_config.dart';
import '../../../shared/theme.dart';
import '../../../widgets/default_text.dart';

class ProjectsArchivePage extends StatefulWidget {
  const ProjectsArchivePage({Key? key}) : super(key: key);

  @override
  State<ProjectsArchivePage> createState() => _ProjectsArchivePageState();
}

class _ProjectsArchivePageState extends State<ProjectsArchivePage> {
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

  TextEditingController searchController = TextEditingController();

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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30),
                  // vertical: getProportionateScreenHeight(20),
                ),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppSvgImages.search_ic,
                      width: getProportionateScreenWidth(40),
                      height: getProportionateScreenHeight(50),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(30),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        cursorColor: AppColors.systemBlackColor,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Author\'s name',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
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
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 6 + 1,
            separatorBuilder: (_, index) => SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            itemBuilder: (_, index) {
              if (index == 6) {
                return SizedBox(
                  height: getProportionateScreenWidth(30),
                );
              }
              return Container(
                padding: EdgeInsets.only(
                  bottom: getProportionateScreenHeight(30),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(40),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 1,
                        color: AppColors.systemBlackColor.withOpacity(0.25),
                      )
                    ]),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppSvgImages.default_image,
                      width: getProportionateScreenWidth(640),
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
                        _buildText('Number of offline votes: 0', 36),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        _buildText('Votes: 0', 36),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        _buildText('Status: Completed', 36),
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                      ],
                    ),
                    index == 1 || index == 2
                        ? _buildFile(
                            AppSvgImages.power_point_ic,
                            'Kurilsukaya corner. Chokina.pptx',
                            isPowerPoint: true,
                          )
                        : const SizedBox(),
                    index != 1 || index != 2 || index != 3
                        ? SizedBox(
                            height: getProportionateScreenHeight(20),
                          )
                        : SizedBox(),
                    index == 2 || index == 3
                        ? _buildFile(
                            AppSvgImages.word_ic, 'Bauman Grove project.docx')
                        : SizedBox(),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    _buildFile(AppSvgImages.excel_ic,
                        'Defect. act Kuril coal. Chokina.xlsx'),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: getProportionateScreenWidth(250),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                          vertical: getProportionateScreenHeight(30),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: AppColors.systemLightGrayColor,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1.5),
                                blurRadius: 1,
                                color: AppColors.shadowColor,
                              )
                            ]),
                        child: DefaultText(
                          text: 'Read more',
                          fontSize: 32,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
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
