import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:open_budget/base/base_bloc.dart';
import 'package:open_budget/shared/size_config.dart';

class CustomDrawerProvider extends BaseBloc {
  Size? size;
  List<String> langs = [
    'KZ',
    'RU',
    'EN',
  ];

  Locale? _locale;
  String langGroupValue = "";

  init(context) {
    setLoading(true);
    size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    setLoading(false);
  }

  setInitCurrentLang(context) {
    switch (EasyLocalization.of(context)!.currentLocale!.languageCode) {
      case "kk":
        setGroupedLangValue(langs[0]);
        log(langGroupValue);
        break;
      case "ru":
        setGroupedLangValue(langs[1]);
        break;
      case "en":
        setGroupedLangValue(langs[2]);
        break;
    }
  }

  setGroupedLangValue(String value) {
    langGroupValue = value;
    notifyListeners();
  }

  void changeLangByIndex(BuildContext context, int index) {
    setGroupedLangValue(langs[index]);

    switch (index) {
      case 0:
        //kz
        setLocale(context, const Locale('kk'));

        break;

      case 1:
        // ru
        setLocale(context, const Locale('ru'));
        break;

      case 2:
        //en
        setLocale(context, const Locale('en'));
        break;
    }
    EasyLocalization.of(context)!.supportedLocales.forEach((element) async {
      if (_locale != null && element.languageCode == _locale!.languageCode) {
        await EasyLocalization.of(context)!.setLocale(element);
      }
    });
  }

  setLocale(BuildContext context, Locale newLocale) {
    log("new locale is ${newLocale.languageCode}");
    _locale = newLocale;
    notifyListeners();
  }
}
