import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/data/database.dart';
import 'package:open_budget/pages/projects_archive/provider/projects_archive_provider.dart';
import 'package:open_budget/pages/projects_archive/ui/projects_archive_filters_page.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;

import '../../../shared/size_config.dart';
import '../../../shared/theme.dart';
import '../../../widgets/default_text.dart';

class ProjectsArchivePage extends StatelessWidget {
  ProjectsArchivePage({Key? key}) : super(key: key); // String year = '2019';
  // String district = 'nauryzbay'.tr();
  // List<String> years = [
  //   '2019',
  //   '2020',
  //   '2021',
  // ];
  // List<String> districts = [
  //   'nauryzbay'.tr(),
  //   'alatau'.tr(),
  //   'zhetysu'.tr(),
  //   'almaly'.tr(),
  //   'bostandyk'.tr(),
  //   'medeu'.tr(),
  //   'auezov'.tr(),
  //   'turksib'.tr(),
  // ];

  TextEditingController searchController = TextEditingController();

  // List<bool> isReadMore = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ProjectsArchiveProvider>(
      onReady: (p0) => p0.init(context),
      model: ProjectsArchiveProvider(),
      builder: (context, model, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            SearchBar(searchController: searchController),
            Expanded(
              child: StreamBuilder<List<Project>>(
                  stream: model.database!.watchAllProjects(),
                  builder: (context, AsyncSnapshot<List<Project>> snapshot) {
                    final projects = snapshot.data ?? [];
                    return ListView.separated(
                      padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(50),
                        top: getProportionateScreenHeight(50),
                      ),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: projects.length,
                      separatorBuilder: (_, index) => SizedBox(
                        height: getProportionateScreenHeight(40),
                      ),
                      itemBuilder: (_, index) {
                        model.takeFiles(projects[index].files ?? '');
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
                                  color: AppColors.systemBlackColor
                                      .withOpacity(0.25),
                                )
                              ]),
                          child: Column(
                            children: [
                              projects[index].image == ''
                                  ? SvgPicture.asset(
                                      AppSvgImages.default_image,
                                      width: getProportionateScreenWidth(640),
                                    )
                                  : ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: Image.memory(
                                        base64Decode(
                                          projects[index].image,
                                        ),
                                        width: getProportionateScreenWidth(640),
                                        height:
                                            getProportionateScreenHeight(300),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              SizedBox(
                                height: getProportionateScreenHeight(40),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildText(
                                    projects[index].title.toString(),
                                    32,
                                    isBold: true,
                                    isGrey: false,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenWidth(10),
                                  ),
                                  _buildText(
                                    projects[index].description.toString(),
                                    28,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(30),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppSvgImages.person_dark_ic,
                                          width:
                                              getProportionateScreenWidth(25),
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(20),
                                        ),
                                        Expanded(
                                          child: DefaultText(
                                            text: projects[index]
                                                .uploaderName
                                                .toString(),
                                            color:
                                                AppColors.systemLightGrayColor,
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
                                    projects[index]
                                        .uploaderDescription
                                        .toString(),
                                    28,
                                    isGrey: false,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  _buildText(
                                      projects[index].price.toString(), 36),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(30),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppSvgImages.location_ic,
                                          width:
                                              getProportionateScreenWidth(25),
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(20),
                                        ),
                                        Expanded(
                                          child: DefaultText(
                                            text: projects[index]
                                                .address
                                                .toString(),
                                            color:
                                                AppColors.systemLightGrayColor,
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
                                  _buildText(
                                      'numberOfOfflineVotes'.tr() + ': 0', 36),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  _buildText(
                                      'votes'.tr() +
                                          ': ' +
                                          projects[index].votesCount.toString(),
                                      36),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  _buildText(
                                      'status'.tr() +
                                          ': ' +
                                          (projects[index].status
                                                  ? 'completed'
                                                  : 'in progress')
                                              .tr(),
                                      36),
                                  SizedBox(
                                    height: getProportionateScreenHeight(40),
                                  ),
                                ],
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(20),
                                ),
                                itemCount: model.files!.length,
                                separatorBuilder: (_, sindex) => SizedBox(
                                  height: getProportionateScreenHeight(15),
                                ),
                                itemBuilder: (_, findex) => Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(50),
                                    vertical: getProportionateScreenHeight(30),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.whiteColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColors.greyColor,
                                        offset: Offset(0, 4),
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        p.extension(model.files![findex]) ==
                                                '.pptx'
                                            ? AppSvgImages.power_point_ic
                                            : p.extension(
                                                        model.files![findex]) ==
                                                    '.doc'
                                                ? AppSvgImages.word_ic
                                                : AppSvgImages.excel_ic,
                                        width: getProportionateScreenWidth(55),
                                        height:
                                            getProportionateScreenHeight(50),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(38),
                                      ),
                                      Expanded(
                                        child: DefaultText(
                                          textAlign: TextAlign.left,
                                          text: p.basename(
                                            model.files![findex],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(30),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        );
      },
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
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(40),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
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
                          autofocus: false,
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
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProjectsArchiveFiltersPage(),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenHeight(20),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SvgPicture.asset(
                    AppSvgImages.filters,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
