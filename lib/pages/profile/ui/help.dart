import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/base/base_provider.dart';
import 'package:open_budget/pages/profile/provider/help_provider.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/widgets/custom_app_bar.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HelpProvider>(
      model: HelpProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'help'.tr(),
            isWithBackButton: true,
          ),
          body: Stack(
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
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
