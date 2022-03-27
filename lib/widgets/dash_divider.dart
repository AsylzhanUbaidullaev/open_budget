import 'package:flutter/material.dart';

import '../shared/size_config.dart';

class DashDivider extends StatelessWidget {
  const DashDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        30,
        (index) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(2),
          ),
          child: SizedBox(
            width: getProportionateScreenWidth(10),
            height: 1,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
