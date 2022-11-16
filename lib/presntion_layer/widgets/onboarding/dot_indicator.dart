import 'package:flutter/material.dart';

import '../../../constant/color.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.pageIndex,
    required this.index,
  }) : super(key: key);

  final int pageIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
      margin: const EdgeInsets.only(left: 20),
      height: 7,
      width: index == pageIndex ? 25 : 7,
      decoration: BoxDecoration(
        color: AppColors.orangeClr,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
