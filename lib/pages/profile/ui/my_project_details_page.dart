import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/profile/provider/my_project_details_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/widgets/default_button.dart';
import 'package:open_budget/widgets/default_text.dart';

class MyProjectDetailsPage extends StatelessWidget {
  const MyProjectDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<MyProjectDetailsProvider>(
      onReady: (p0) => p0.init(context),
      model: MyProjectDetailsProvider(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  CupertinoIcons.back,
                  color: AppColors.whiteColor,
                ),
              ),
              title: DefaultText(
                text: 'Мой проект',
                fontSize: 32,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
              ),
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
            ),
            bottomSheet: Padding(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(20),
                horizontal: getProportionateScreenWidth(40),
              ),
              child: DefaultButton(
                text: 'Сақтау',
                press: () {},
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(40),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        AppPngImages.workout,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    _buildControllers('Тақырып', model.nameController),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    _buildControllers('Сипаттама', model.descController),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    DefaultText(
                      text: 'Санатты таңдаңыз',
                      fontSize: 24,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    _buildDropDownButton(model, true),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    DefaultText(
                      text: 'Ауданды таңдаңыз',
                      fontSize: 24,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    _buildDropDownButton(model, false),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    _buildControllers('Адресс', model.adressController),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(20),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.primaryColor,
                        ),
                        color: AppColors.whiteColor,
                      ),
                      alignment: Alignment.center,
                      child: DefaultText(
                        text: 'Файлды тіркеу',
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildDropDownButton(
      MyProjectDetailsProvider model, bool isCategory) {
    return Container(
      width: getProportionateScreenWidth(450),
      height: getProportionateScreenHeight(80),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
      ),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        // isDense: !isCategory ? true : false,
        isExpanded: true,
        value: isCategory ? model.category : model.district,
        items: isCategory
            ? model.categories
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
                .toList()
            : model.districts
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
        onChanged: (value) =>
            isCategory ? model.setCategory(value) : model.setDistrict(value),
        underline: const SizedBox(),
        elevation: 0,
      ),
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
