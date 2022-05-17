import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_budget/data/database.dart';
import 'package:open_budget/service_locator.dart';
import 'package:provider/provider.dart';

import 'app/main/app.dart';
import 'app/main/app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Set device orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final model = MyAppModel();
  await model.init();
  // setUp();
  // runApp(MyApp(model: model));

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'EN'),
        Locale('ru', 'RU'),
        Locale('kk', 'KK'),
      ],
      // TODO: change the path of the translation files
      path: 'assets/lang', 
      fallbackLocale: const Locale('en', 'EN'),
      child: Provider<AppDatabase>(
        create: (_) => AppDatabase(),
        child: MyApp(
          model: model,
        ),
      ),
    ),
  );
}
