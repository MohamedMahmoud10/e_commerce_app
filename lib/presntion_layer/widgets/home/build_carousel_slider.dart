import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/shop_app_models/home_page_model.dart';
import 'carousel_slider.dart';

class BuildCarouselSlider extends StatelessWidget {
  final HomePageModel homePageModel;

  const BuildCarouselSlider({Key? key, required this.homePageModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mappingItems = homePageModel.data!.banners
        .map((data) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 23),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                child: CachedNetworkImage(
                  imageUrl: data.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ))
        .toList();
    return ImageCarouselSlider(
      items: mappingItems,
    );
  }
}
