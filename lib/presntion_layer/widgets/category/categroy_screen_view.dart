import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constant/color.dart';
import '../../../models/shop_app_models/category_model.dart';

class CategoryScreenView extends StatelessWidget {
  final HomeData homeData;

  const CategoryScreenView({
    super.key,
    required this.homeData,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      filterQuality: FilterQuality.high,
      imageUrl: homeData.image!,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageProvider,
                filterQuality: FilterQuality.high,
                colorFilter: const ColorFilter.mode(
                    AppColors.darkHeaderClr, BlendMode.difference),
              ),
            ),
            child: Center(
              child: Text(
                homeData.name!,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
