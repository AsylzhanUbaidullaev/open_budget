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
          // Expanded(
          //   child: StreamBuilder<List<Project>>(
          //       stream: database.watchAllProjects(),
          //       builder: (context, AsyncSnapshot<List<Project>> snapshot) {
          //         final projects = snapshot.data ?? [];
          //         return ListView.separated(
          //           padding: EdgeInsets.only(
          //             bottom: getProportionateScreenHeight(50),
          //             top: getProportionateScreenHeight(50),
          //           ),
          //           shrinkWrap: true,
          //           physics: const BouncingScrollPhysics(),
          //           itemCount: projects.length,
          //           separatorBuilder: (_, index) => SizedBox(
          //             height: getProportionateScreenHeight(40),
          //           ),
          //           itemBuilder: (_, index) {
          //             return Container(
          //               padding: EdgeInsets.only(
          //                 bottom: getProportionateScreenHeight(30),
          //               ),
          //               margin: EdgeInsets.symmetric(
          //                 horizontal: getProportionateScreenWidth(40),
          //               ),
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(15),
          //                   color: AppColors.whiteColor,
          //                   boxShadow: [
          //                     BoxShadow(
          //                       offset: const Offset(0, 4),
          //                       blurRadius: 1,
          //                       color: AppColors.systemBlackColor
          //                           .withOpacity(0.25),
          //                     )
          //                   ]),
          //               child: Column(
          //                 children: [
          //                   projects[index].image == ''
          //                       ? SvgPicture.asset(
          //                           AppSvgImages.default_image,
          //                           width: getProportionateScreenWidth(640),
          //                         )
          //                       : ClipRRect(
          //                           borderRadius: const BorderRadius.only(
          //                             topLeft: Radius.circular(15),
          //                             topRight: Radius.circular(15),
          //                           ),
          //                           child: Image.memory(
          //                             base64Decode(
          //                               projects[index].image,
          //                             ),
          //                             width: getProportionateScreenWidth(640),
          //                             height: getProportionateScreenHeight(300),
          //                             fit: BoxFit.cover,
          //                           ),
          //                         ),
          //                   SizedBox(
          //                     height: getProportionateScreenHeight(40),
          //                   ),
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       _buildText(
          //                         projects[index].title.toString(),
          //                         32,
          //                         isBold: true,
          //                         isGrey: false,
          //                       ),
          //                       SizedBox(
          //                         height: getProportionateScreenWidth(10),
          //                       ),
          //                       _buildText(
          //                         projects[index].description.toString(),
          //                         28,
          //                       ),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(10),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.symmetric(
          //                           horizontal: getProportionateScreenWidth(30),
          //                         ),
          //                         child: Row(
          //                           children: [
          //                             SvgPicture.asset(
          //                               AppSvgImages.person_dark_ic,
          //                               width: getProportionateScreenWidth(25),
          //                             ),
          //                             SizedBox(
          //                               width: getProportionateScreenWidth(20),
          //                             ),
          //                             Expanded(
          //                               child: DefaultText(
          //                                 text: projects[index]
          //                                     .uploaderName
          //                                     .toString(),
          //                                 color: AppColors.systemLightGrayColor,
          //                                 fontSize: 28,
          //                                 textAlign: TextAlign.start,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(10),
          //                       ),
          //                       _buildText(
          //                         projects[index]
          //                             .uploaderDescription
          //                             .toString(),
          //                         28,
          //                         isGrey: false,
          //                       ),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(10),
          //                       ),
          //                       _buildText(
          //                           projects[index].price.toString(), 36),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(10),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.symmetric(
          //                           horizontal: getProportionateScreenWidth(30),
          //                         ),
          //                         child: Row(
          //                           children: [
          //                             SvgPicture.asset(
          //                               AppSvgImages.location_ic,
          //                               width: getProportionateScreenWidth(25),
          //                             ),
          //                             SizedBox(
          //                               width: getProportionateScreenWidth(20),
          //                             ),
          //                             Expanded(
          //                               child: DefaultText(
          //                                 text: projects[index]
          //                                     .address
          //                                     .toString(),
          //                                 color: AppColors.systemLightGrayColor,
          //                                 fontSize: 28,
          //                                 textAlign: TextAlign.start,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(20),
          //                       ),
          //                       _buildText(
          //                           'numberOfOfflineVotes'.tr() + ': 0', 36),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(10),
          //                       ),
          //                       _buildText(
          //                           'votes'.tr() +
          //                               ': ' +
          //                               projects[index].votesCount.toString(),
          //                           36),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(10),
          //                       ),
          //                       _buildText(
          //                           'status'.tr() +
          //                               ': ' +
          //                               (projects[index].status
          //                                       ? 'completed'
          //                                       : 'in progress')
          //                                   .tr(),
          //                           36),
          //                       SizedBox(
          //                         height: getProportionateScreenHeight(40),
          //                       ),
          //                     ],
          //                   ),
          //                   ListView.separated(
          //                     shrinkWrap: true,
          //                     physics: const NeverScrollableScrollPhysics(),
          //                     padding: EdgeInsets.symmetric(
          //                       horizontal: getProportionateScreenWidth(20),
          //                     ),
          //                     itemCount: model.files!.length,
          //                     separatorBuilder: (_, sindex) => SizedBox(
          //                       height: getProportionateScreenHeight(15),
          //                     ),
          //                     itemBuilder: (_, findex) => Container(
          //                       padding: EdgeInsets.symmetric(
          //                         horizontal: getProportionateScreenWidth(50),
          //                         vertical: getProportionateScreenHeight(30),
          //                       ),
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(15),
          //                         color: AppColors.whiteColor,
          //                         boxShadow: const [
          //                           BoxShadow(
          //                             color: AppColors.greyColor,
          //                             offset: Offset(0, 4),
          //                             blurRadius: 1,
          //                           ),
          //                         ],
          //                       ),
          //                       child: Row(
          //                         children: [
          //                           SvgPicture.asset(
          //                             p.extension(model.files![findex]) ==
          //                                     '.pptx'
          //                                 ? AppSvgImages.power_point_ic
          //                                 : p.extension(model.files![findex]) ==
          //                                         '.doc'
          //                                     ? AppSvgImages.word_ic
          //                                     : AppSvgImages.excel_ic,
          //                             width: getProportionateScreenWidth(55),
          //                             height: getProportionateScreenHeight(50),
          //                           ),
          //                           SizedBox(
          //                             width: getProportionateScreenWidth(38),
          //                           ),
          //                           Expanded(
          //                             child: DefaultText(
          //                               textAlign: TextAlign.left,
          //                               text: p.basename(
          //                                 model.files![findex],
          //                               ),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: getProportionateScreenHeight(30),
          //                   ),
          //                 ],
          //               ),
          //             );
          //           },
          //         );
          //       }),
          //   // child: ListView.separated(
          //   //   padding: EdgeInsets.only(
          //   //     top: getProportionateScreenHeight(30),
          //   //     left: getProportionateScreenWidth(30),
          //   //     right: getProportionateScreenWidth(30),
          //   //     bottom: getProportionateScreenHeight(20),
          //   //   ),
          //   //   shrinkWrap: true,
          //   //   physics: const BouncingScrollPhysics(),
          //   //   itemCount: 7,
          //   //   separatorBuilder: (_, index) => SizedBox(
          //   //     height: getProportionateScreenHeight(30),
          //   //   ),
          //   //   itemBuilder: (_, index) => Container(
          //   //     margin: EdgeInsets.symmetric(
          //   //       horizontal: getProportionateScreenWidth(10),
          //   //     ),
          //   //     decoration: BoxDecoration(
          //   //         color: AppColors.whiteColor,
          //   //         borderRadius: BorderRadius.circular(15),
          //   //         boxShadow: [
          //   //           BoxShadow(
          //   //             offset: Offset(0, 4),
          //   //             blurRadius: 1,
          //   //             color: AppColors.systemBlackColor.withOpacity(0.25),
          //   //           )
          //   //         ]),
          //   //     child: Column(
          //   //       children: [
          //   //         Image.asset(
          //   //           AppPngImages.workout,
          //   //           width: getProportionateScreenWidth(640),
          //   //         ),
          //   //         SizedBox(
          //   //           height: getProportionateScreenHeight(20),
          //   //         ),
          //   //         Padding(
          //   //           padding: EdgeInsets.symmetric(
          //   //             horizontal: getProportionateScreenWidth(30),
          //   //           ),
          //   //           child: Column(
          //   //             crossAxisAlignment: CrossAxisAlignment.start,
          //   //             children: [
          //   //               Row(
          //   //                 children: [
          //   //                   Expanded(
          //   //                     child: DefaultText(
          //   //                       text: 'Composition of the expert commission.',
          //   //                       fontSize: 28,
          //   //                       fontWeight: FontWeight.bold,
          //   //                       textAlign: TextAlign.start,
          //   //                     ),
          //   //                   ),
          //   //                   SvgPicture.asset(
          //   //                     AppSvgImages.notes_ic,
          //   //                     width: getProportionateScreenWidth(30),
          //   //                   ),
          //   //                 ],
          //   //               ),
          //   //               SizedBox(
          //   //                 height: getProportionateScreenHeight(20),
          //   //               ),
          //   //               DefaultText(
          //   //                 text: 'votes'.tr() + ': 0',
          //   //                 fontSize: 32,
          //   //                 color: AppColors.systemLightGrayColor,
          //   //               ),
          //   //               SizedBox(
          //   //                 height: getProportionateScreenHeight(20),
          //   //               ),
          //   //               const DashDivider(),
          //   //               SizedBox(
          //   //                 height: getProportionateScreenHeight(40),
          //   //               ),
          //   //               Row(
          //   //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   //                 children: [
          //   //                   Row(
          //   //                     children: [
          //   //                       SvgPicture.asset(
          //   //                         AppSvgImages.download_ic,
          //   //                         width: getProportionateScreenWidth(24),
          //   //                       ),
          //   //                       SizedBox(
          //   //                         width: getProportionateScreenWidth(20),
          //   //                       ),
          //   //                       DefaultText(
          //   //                         text: 'download'.tr(),
          //   //                         fontSize: 28,
          //   //                         isUnderline: true,
          //   //                       ),
          //   //                     ],
          //   //                   ),
          //   //                   Container(
          //   //                     alignment: Alignment.center,
          //   //                     width: getProportionateScreenWidth(200),
          //   //                     padding: EdgeInsets.symmetric(
          //   //                       vertical: getProportionateScreenHeight(30),
          //   //                     ),
          //   //                     decoration: BoxDecoration(
          //   //                       color: AppColors.primaryColor,
          //   //                       borderRadius: BorderRadius.circular(15),
          //   //                     ),
          //   //                     child: DefaultText(
          //   //                       text: 'vote'.tr(),
          //   //                       fontSize: 32,
          //   //                       color: AppColors.whiteColor,
          //   //                     ),
          //   //                   ),
          //   //                 ],
          //   //               ),
          //   //               SizedBox(
          //   //                 height: getProportionateScreenHeight(40),
          //   //               ),
          //   //             ],
          //   //           ),
          //   //         ),
          //   //       ],
          //   //     ),
          //   //   ),
          //   // ),
          // )
        ],
      ),
    );
  }
}
