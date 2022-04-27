import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/home/provider/submit_project_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/shared/ui_helper.dart';
import 'package:open_budget/widgets/default_text.dart';
import 'package:open_budget/widgets/loading_view.dart';

class SubmitProject extends StatelessWidget {
  const SubmitProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<SubmitProjectProvider>(
      model: SubmitProjectProvider(),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadinView()
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.primaryColor,
                  title: Text('submit'),
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
                bottomSheet: InkWell(
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => const SubmitProject(),
                  //   ),
                  // ),
                  child: Container(
                    width: getProportionateScreenWidth(720),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30),
                      vertical: getProportionateScreenHeight(30),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25),
                      vertical: getProportionateScreenHeight(25),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DefaultText(
                      text: 'projectSubmission'.tr(),
                      fontSize: 32,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                    vertical: getProportionateScreenHeight(20),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(20),
                          ),
                          height: getProportionateScreenHeight(300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.greyColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppSvgImages.selection,
                                width: getProportionateScreenWidth(170),
                                height: getProportionateScreenHeight(150),
                              ),
                              UIHelper.verticalSpace(20),
                              DefaultText(
                                text: 'Фото орнату',
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkGreyColor,
                              ),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(20),
                        _buildControllers('title', model.titleController),
                        UIHelper.verticalSpace(40),
                        _buildControllers(
                            'description', model.descriptionController),
                        UIHelper.verticalSpace(40),
                        DefaultText(
                          text: 'category',
                          textAlign: TextAlign.start,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        UIHelper.verticalSpace(20),
                        Container(
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
                        UIHelper.verticalSpace(40),
                        DefaultText(
                          text: 'region',
                          textAlign: TextAlign.start,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        UIHelper.verticalSpace(20),
                        Container(
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
                        UIHelper.verticalSpace(40),
                        _buildControllers(
                            'Address', model.descriptionController),
                        UIHelper.verticalSpace(40),
                        Container(
                          width: getProportionateScreenWidth(720),
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                            vertical: getProportionateScreenHeight(20),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            border: Border.all(color: AppColors.primaryColor),
                          ),
                          child: DefaultText(
                            text: 'addFile',
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Column _buildControllers(String name, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: name,
          fontSize: 24,
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        TextField(
          controller: controller,
          cursorColor: AppColors.systemBlackColor,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(20),
              horizontal: getProportionateScreenWidth(25),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: AppColors.greyColor,
            filled: true,
          ),
        ),
      ],
    );
  }
}
