import 'package:flutter/material.dart';

import '../../../models/shop_app_models/home_page_model.dart';
import 'product_card.dart';

class ProductsView extends StatelessWidget {
  final HomePageModel homePageModel;

  const ProductsView({
    super.key,
    required this.homePageModel,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.49,
      ),
      itemCount: homePageModel.data!.products.length,
      itemBuilder: (context, index) =>
          ProductCard(data: homePageModel.data!.products[index]),
    );
  }
}
