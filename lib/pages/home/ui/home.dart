import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_budget/shared/size_config.dart';
import 'package:open_budget/shared/theme.dart';
import 'package:open_budget/widgets/default_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(40),
        vertical: getProportionateScreenHeight(40),
      ),
      child: SingleChildScrollView(
        physics: isReadMore
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(180),
                  child: DefaultText(
                    text: 'projectsSubmitted'.tr(),
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(180),
                  child: DefaultText(
                    text: 'votingFriendlyProjects'.tr(),
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(180),
                  child: DefaultText(
                    text: 'projectsSubmittedForImplementation'.tr(),
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(180),
                  child: DefaultText(
                    text: '934',
                    fontSize: 48,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(180),
                  child: DefaultText(
                    text: '207',
                    fontSize: 48,
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(180),
                  child: DefaultText(
                    text: '47',
                    fontSize: 48,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(60),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => DefaultText(
                  text: '14.03.2022',
                  fontSize: 24,
                  color: index != 4
                      ? AppColors.systemLightGrayColor
                      : AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            SizedBox(
              height: getProportionateScreenHeight(32),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: double.maxFinite,
                      height: getProportionateScreenHeight(20),
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => Container(
                        width: getProportionateScreenWidth(30),
                        height: getProportionateScreenHeight(40),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(188),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(
                  flex: 2,
                ),
                Image.asset(
                  AppPngImages.event_1,
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenHeight(100),
                ),
                const Spacer(),
                Image.asset(
                  AppPngImages.event_2,
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenHeight(100),
                ),
                const Spacer(),
                Image.asset(
                  AppPngImages.event_3,
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenHeight(100),
                ),
                const Spacer(),
                Image.asset(
                  AppPngImages.event_4,
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenHeight(100),
                ),
                const Spacer(),
                Image.asset(
                  AppPngImages.event_5,
                  width: getProportionateScreenWidth(100),
                  height: getProportionateScreenHeight(100),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Text(
              '2021 жылдың 21 қазанынан 09 қарашасына дейін! жылды қоса алғанда, «Қатысу бюджеті» қалалық жобасы аясында Алматы қаласын абаттандыру бойынша тұрғындардың ұсыныстарына дауыс беру өткізіледі. 2021 жылғы 21 қазаннан 09 қарашаға дейін қоса алғанда «Бюджетке қатысу» қалалық жобасы шеңберінде Алматыны абаттандыру бойынша тұрғындардың ұсыныстары үшін дауыс беру өтеді. \nОнлайн-дауыс беру үшін қажет: \n1) budget.open-almaty.kz порталындағы «дауыс беру» бөліміне өту; \n2) ұнаған жобалық ұсыныстан 3-тен артық емес таңдау; \n3) дауыс беруді растаудың неғұрлым ыңғайлы тәсілін – ЭЦҚ немесе ЖСН (SMS-код) көмегімен айқындау қажет. \n\nҚағаз түрінде дауыс беру үшін қажет: \n1) кез келген аудан әкімдігіне (сағат 09:00-ден 18:00-ге дейін, үзіліс сағат 13:00-ден 14:00-ге дейін) немесе Open Almaty фронт-офисіне бару, өзіңізбен бірге жеке басыңызды куәландыратын құжатыңыз болу керек; \n2) жергілікті жерде берілген қағаз нысанды толтыру; \n3) толтырылған нысанды дауыс жинау жәшігіне тастау керек. \n«Бюджетке қатысу» жобасы қалалық бюджеттен Алматының 8 ауданының әрқайсысына 800 млн теңгеден бөлуді көздейді (жобаның жалпы сомасы 6,4 млрд теңге).',
              maxLines: isReadMore ? null : 5,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            InkWell(
              onTap: () => setState(() {
                isReadMore = !isReadMore;
              }),
              child: Align(
                alignment: Alignment.topRight,
                child: DefaultText(
                  text: isReadMore ? 'readLess'.tr() : 'readMore'.tr(),
                  color: AppColors.primaryColor,
                  fontSize: 32,
                  maxLines: isReadMore ? null : 5,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(180),
            ),
          ],
        ),
      ),
    );
  }
}
