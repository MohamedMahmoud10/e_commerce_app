import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/data/data_source/static/onboarding.dart';
import 'package:shop_app/network/local/cahce_helper.dart';

import '../../../constant/color.dart';
import '../../widgets/custom_button.dart';
import '../log_in_screen/login.dart';
import 'components/dot_indicator.dart';
import 'components/page_view_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreyClr,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (int index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: onBoardingList.length,
                itemBuilder: (context, index) => PageViewContent(
                  index: index,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (index) => DotIndicator(index: index, pageIndex: pageIndex),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onTap: () {
                CacheHelper.saveData(key: 'onBoarding', value: true)
                    .then((value) {
                  log(value.toString());
                  if (value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LogIn()),
                        (route) => false);
                  }
                });
              },
              text: 'Get Started',
              firstColor: Colors.red[100]!,
              secondColor: AppColors.orangeClr,
            )
          ],
        ),
      ),
    );
  }
}
