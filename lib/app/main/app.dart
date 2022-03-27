import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:open_budget/app/main/app_model.dart';
import 'package:open_budget/app/main/navigator_state.dart';
import 'package:open_budget/app/main/no_internet_screen.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/shared/theme.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;

  MyApp({required this.model});

  @override
  Widget build(BuildContext context) {
    return BaseProvider<MyAppModel>(
      model: model,
      builder: (context, model, child) {
        return StreamBuilder<Object>(
          stream: model.connectionStatusController.stream,
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Open Budget',
              navigatorKey: GlobalVariable.navState,
              theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: AppColors.primaryColor.withOpacity(0),
                ),
                // backgroundColor: Colors.white,
                fontFamily: 'Manrope',
              ),
              home: snapshot.data == ConnectivityResult.none ||
                      snapshot.data == null
                  ? const NoInternetScreen()
                  : model.getHomeScreen(),
            );
          },
        );
      },
    );
  }
}
