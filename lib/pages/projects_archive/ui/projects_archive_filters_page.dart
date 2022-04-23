import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/projects_archive/provider/projects_archive_filter_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/widgets/default_button.dart';
import 'package:open_budget/widgets/default_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../shared/theme.dart';

class ProjectsArchiveFiltersPage extends StatelessWidget {
  const ProjectsArchiveFiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ProjectsArchiveFilterProvider>(
      onReady: (p0) => p0.init(context),
      model: ProjectsArchiveFilterProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                CupertinoIcons.chevron_back,
                color: AppColors.whiteColor,
              ),
            ),
            backgroundColor: AppColors.primaryColor,
            title: const Text('Жобалар мұрағаты'),
            centerTitle: true,
          ),
          bottomSheet: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(40),
              vertical: getProportionateScreenHeight(20),
            ),
            child: DefaultButton(
              text: 'Іздеу',
              press: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        DefaultText(
                          text: 'Жылды таңдаңыз',
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(90),
                        ),
                        DefaultText(
                          text: 'Аудан',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(30),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.greyColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: DropdownButton(
                                  value: model.year,
                                  items: model.years
                                      .map(
                                        (e) => DropdownMenuItem(
                                          child: Text(e),
                                          value: e,
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) => model.setYear(value),
                                  underline: const SizedBox(),
                                  elevation: 0,
                                ),
                              ),
                            ],
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
                              value: model.district,
                              items: model.districts
                                  .map(
                                    (e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) => model.setDistrict(value),
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
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                DefaultText(text: 'Санатты таңдаңыз'),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton(
                          // isDense: true,
                          isExpanded: true,
                          value: model.category,
                          items: model.categories
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          e,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  value: e,
                                ),
                              )
                              .toList(),
                          onChanged: (value) => model.setCategory(value),
                          underline: const SizedBox(),
                          elevation: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    SvgPicture.asset(
                      model.svgs[model.currentSvgIndex],
                      color: AppColors.primaryColor,
                      width: model.svgsWidth[model.currentSvgIndex].toDouble(),
                      height:
                          model.svgsHeights[model.currentSvgIndex].toDouble(),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                SfRangeSlider(
                  min: 0,
                  max: 11340000000,
                  inactiveColor: AppColors.greyColor,
                  activeColor: AppColors.primaryColor,
                  values: model.priceValues,
                  onChanged: (newValues) => model.setPrice(newValues),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(text: 'Сумма от:'),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(36),
                              horizontal: getProportionateScreenWidth(26),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.systemBlackColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DefaultText(
                              text: model.priceValues.start.toInt().toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(text: 'Сумма до:'),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(36),
                              horizontal: getProportionateScreenWidth(26),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.systemBlackColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DefaultText(
                              text: model.priceValues.end.toInt().toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
