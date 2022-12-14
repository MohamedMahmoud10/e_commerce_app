import 'package:flutter/material.dart';
import 'package:shop_app/presntion_layer/widgets/grid_view.dart';

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
    return ViewGrid(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.49,
      itemBuilder: (context, index) =>
          ProductCard(data: homePageModel.data!.products[index]),
      itemCount: homePageModel.data!.products.length,
    );
  }
}
