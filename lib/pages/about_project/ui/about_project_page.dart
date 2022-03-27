import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/size_config.dart';
import '../../../shared/theme.dart';
import '../../../widgets/default_text.dart';

class AboutProjectPage extends StatefulWidget {
  AboutProjectPage({Key? key}) : super(key: key);

  @override
  State<AboutProjectPage> createState() => _AboutProjectPageState();
}

class _AboutProjectPageState extends State<AboutProjectPage> {
  List<String> questions = [
    'What is a Participation Budget?',
    'The principle of organization and conduct of the "participatory budget"',
    'Instructions',
    'Rules',
  ];

  List<String> answers = [
    'The Participation Budget project consists of 7 stages: The first stage is the acceptance of applications. Proposals are submitted by residents themselves through the budget.open-almaty.kz portal.',
    'To do this, you must fill out an application (indicate the name of the project proposal, its description, the address of the object), attach a sketch and estimate of the project proposal (they can be indicative). The second stage is evaluation by expert councils.',
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',
  ];

  List<bool> isAnswerVisible = List.generate(4, (index) => false);

  setAnswersVisibility(int index) {
    setState(() {
      isAnswerVisible[index] = !isAnswerVisible[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(40),
      ),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(60),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: questions.length,
              separatorBuilder: (_, index) => SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              itemBuilder: (_, index) => InkWell(
                onTap: () => setAnswersVisibility(index),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            questions[index],
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(36),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          isAnswerVisible[index]
                              ? AppSvgImages.minus_ic
                              : AppSvgImages.plus_ic,
                          width: getProportionateScreenWidth(
                              isAnswerVisible[index] ? 2 : 30),
                          height: getProportionateScreenHeight(
                              isAnswerVisible[index] ? 2 : 30),
                          color: const Color(0xff0E3C6C),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    isAnswerVisible[index]
                        ? Column(
                            children: [
                              Text(
                                answers[index],
                                style: TextStyle(
                                  fontSize: getProportionateScreenHeight(28),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              index != 0
                                  ? Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppSvgImages.download_ic,
                                          width:
                                              getProportionateScreenWidth(24),
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(20),
                                        ),
                                        DefaultText(
                                          text: 'Download',
                                          fontSize: 28,
                                          isUnderline: true,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          )
                        : const SizedBox(),
                    const Divider(
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
