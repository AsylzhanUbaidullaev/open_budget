import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_budget/pages/home/provider/submit_project_provider.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/widgets/default_text.dart';

class ImageSourceBottomSheet extends StatelessWidget {
  const ImageSourceBottomSheet({Key? key, required this.model})
      : super(key: key);
  final SubmitProjectProvider model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: getProportionateScreenWidth(80),
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(
              model.pickImage(ImageSource.camera),
            ),
            child: Container(
              color: AppColors.whatsAppColor.withOpacity(0),
              width: double.maxFinite,
              child: DefaultText(
                text: 'Camera',
                fontSize: 48,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          const Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(
              model.pickImage(ImageSource.gallery),
            ),
            child: Container(
              color: AppColors.whatsAppColor.withOpacity(0),
              width: double.maxFinite,
              child: DefaultText(
                text: 'Gallery',
                fontSize: 48,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
        ],
      ),
    );
  }
}
