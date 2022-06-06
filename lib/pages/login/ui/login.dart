import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/login/provider/login_provider.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/shared/ui_helper.dart';
import 'package:open_budget/widgets/custom_container.dart';

import '../../../shared/size_config.dart';
import '../../../shared/utils.dart';
import '../../../widgets/default_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        body: BaseProvider<LoginProvider>(
          onReady: (p0) => p0.init(context),
          model: LoginProvider(),
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
                                  model.toRegistration(context);
                                },
                                child: const Text(
                                  'Зарегистрироваться',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(
                                getProportionateScreenHeight(590),
                              ),
                              Text(
                                // AppLocalizations.of(context)!.translate('welcome')!,
                                'Добро пожаловать!',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: getProportionateScreenWidth(48),
                                    color: AppColors.systemBlackColor),
                              ),
                              UIHelper.verticalSpace(10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  // AppLocalizations.of(context)!
                                  //     .translate('enter_phone_number')!,
                                  'Введите ваш номер телефона для входа.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(28),
                                    color: AppColors.systemDarkGrayColor,
                                  ),
                                ),
                              ),
                              UIHelper.verticalSpace(70),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(40),
                                ),
                                child: CustomContainer(
                                  child: TextField(
                                    controller: model.phoneController,
                                    onSubmitted: (vale) {
                                      // model.checkPhoneNumber();
                                    },
                                    keyboardType: TextInputType.number,
                                    cursorColor: AppColors.systemBlackColor,
                                    inputFormatters: [model.phoneMasked],
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
                                          model.toRegistration(context);
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
