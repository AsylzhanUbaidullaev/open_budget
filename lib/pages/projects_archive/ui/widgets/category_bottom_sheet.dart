import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/pages/index/provider/index_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({Key? key, required this.model}) : super(key: key);
  final IndexProvider model;

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  List<String> svgs = [
    AppSvgImages.all_categories,
    AppSvgImages.tractor,
    AppSvgImages.area,
    AppSvgImages.lamp,
    AppSvgImages.dush,
    AppSvgImages.forest,
    AppSvgImages.road,
    AppSvgImages.trash,
    AppSvgImages.bordur,
  ];

  List<String> texts = [
    'all'.tr(),
    'sidewalkArrangement'.tr(),
    'installation'.tr(),
    'creation'.tr(),
    'installationTwo'.tr(),
    'landscaping'.tr(),
    'construction'.tr(),
    'disposal'.tr(),
    'repair'.tr(),
  ];

  List<int> svgsWidth = [60, 75, 70, 55, 65, 67, 66, 50, 65];
  List<int> svgsHeights = [60, 55, 48, 65, 65, 64, 66, 65, 65];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(50),
        vertical: getProportionateScreenHeight(50),
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: svgs.length,
              separatorBuilder: (_, index) => SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              itemBuilder: (_, index) => SvgPicture.asset(
                svgs[index],
                width: getProportionateScreenWidth(svgsWidth[index].toDouble()),
                height:
                    getProportionateScreenHeight(svgsHeights[index].toDouble()),
                color: const Color(0xff8F9BA7),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Expanded(
            flex: 3,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: svgs.length,
              separatorBuilder: (_, index) => SizedBox(
                height: getProportionateScreenHeight(43),
              ),
              itemBuilder: (_, index) => Container(
                child: Text(
                  texts[index],
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
