import 'package:flutter/material.dart';

import '../../../../constant/color.dart';
import '../../../../data/data_source/static/onboarding.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'MAGIC',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: AppColors.orangeClr,
            letterSpacing: 4,
            shadows: [
              Shadow(
                offset: const Offset(2.0, 2.0),
                //position of shadow
                blurRadius: 7.0,
                //blur intensity of shadow
                color: Colors.black
                    .withOpacity(0.9), //color of shadow with opacity
              ),
            ],
          ),
        ),
        Text(
          onBoardingList[index].title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
            child: Image.asset(
          onBoardingList[index].imageUrl,
          fit: BoxFit.cover,
        )),
        const SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            onBoardingList[index].body,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
