import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/login/provider/registration_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/shared/ui_helper.dart';
import 'package:open_budget/shared/utils.dart';
import 'package:open_budget/widgets/custom_container.dart';
import 'package:open_budget/widgets/default_button.dart';

import '../../index/ui/index_page.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: BaseProvider<RegistrationProvider>(
          model: RegistrationProvider(),
          builder: (context, model, child) {
            return model.isLoading
                ? const CircularProgressIndicator()
                : SafeArea(
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
                        Positioned(
                          child: Column(
                            children: [
                              UIHelper.verticalSpace(20),
                              TextButton(
                                onPressed: () {
                                  model.toLogin(context);
                                },
                                child: const Text(
                                  'Войти',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(
                                getProportionateScreenHeight(290),
                              ),
                              Text(
                                // AppLocalizations.of(context)!.translate('welcome')!,
                                'Регистрация',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: getProportionateScreenWidth(48),
                                    color: AppColors.systemBlackColor),
                              ),
                              // UIHelper.verticalSpace(10),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 40),
                              //   child: Text(
                              //     // AppLocalizations.of(context)!
                              //     //     .translate('enter_phone_number')!,
                              //     'Введите ваш ФИО и номер телефона для регистрации.',
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //       fontSize: getProportionateScreenWidth(28),
                              //       color: AppColors.systemDarkGrayColor,
                              //     ),
                              //   ),
                              // ),
                              UIHelper.verticalSpace(40),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(40),
                                ),
                                child: CustomContainer(
                                  child: TextField(
                                    controller: model.surnameController,
                                    onChanged: (String value) {
                                      // model.checkPassword(value);
                                    },
                                    inputFormatters: [
                                      MaskTextInputFormatter(
                                          mask: '(###) ###-##-##',
                                          filter: {"#": RegExp(r'[0-9]')}),
                                    ],
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: false,
                                    cursorColor: AppColors.systemBlackColor,
                                    decoration: const InputDecoration(
                                      hintText: 'Фамилия',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(20),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(40),
                                ),
                                child: CustomContainer(
                                  child: TextField(
                                    controller: model.nameController,
                                    onChanged: (String value) {
                                      // model.checkPassword(value);
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: false,
                                    cursorColor: AppColors.systemBlackColor,
                                    decoration: const InputDecoration(
                                      hintText: 'Имя',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(20),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(40),
                                ),
                                child: CustomContainer(
                                  child: TextField(
                                    controller: model.emailController,
                                    onChanged: (String value) {
                                      // model.checkPassword(value);
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: false,
                                    cursorColor: AppColors.systemBlackColor,
                                    decoration: const InputDecoration(
                                      hintText: 'Почта',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(20),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(40),
                                ),
                                child: CustomContainer(
                                  child: TextField(
                                    controller: model.phoneController,
                                    onSubmitted: (String value) {
                                      model.checkPhoneNumber(value);
                                    },
                                    keyboardType: TextInputType.number,
                                    cursorColor: AppColors.systemBlackColor,
                                    inputFormatters: [
                                      MaskTextInputFormatter(
                                        mask: "(###) ### ##-##",
                                        type: MaskAutoCompletionType.lazy,
                                        filter: {'#': RegExp(r'[0-9]')},
                                      ),
                                    ],
                                    decoration: const InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(top: 12),
                                        child: Text(
                                          '+7  ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColors.systemBlackColor,
                                            fontFamily: 'Inter',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      hintText: 'XXX XXX XXXX',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              model.phoneError != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        model.phoneError!,
                                        style: const TextStyle(
                                            color: AppColors.systemRedColor),
                                      ),
                                    )
                                  : const SizedBox(),
                              UIHelper.verticalSpace(20),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(40),
                                ),
                                child: CustomContainer(
                                  child: TextField(
                                    controller: model.passwordController,
                                    onChanged: (String value) {
                                      // model.checkPassword(value);
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    cursorColor: AppColors.systemBlackColor,
                                    decoration: const InputDecoration(
                                      hintText: 'Пароль',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(40)),
                                child: DefaultButton(
                                  width: double.infinity,
                                  color: model.isButtonEnabled
                                      ? null
                                      : AppColors.inactiveColor,
                                  text: 'Дальше',
                                  press: model.isButtonEnabled
                                      ? () {
                                          // model.toVerification(context);
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => IndexPage()),
                                              (route) => false);
                                        }
                                      : () {
                                          // showCustomToast(
                                          //     // AppLocalizations.of(context)!.translate("phone_number_empty_or_format")!,
                                          //     'Телефон номер заполнен не правильно');
                                        },
                                ),
                              ),
                              UIHelper.verticalSpace(80),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
