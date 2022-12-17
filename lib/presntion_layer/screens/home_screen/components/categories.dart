import 'package:flutter/material.dart';
import 'package:shop_app/presntion_layer/screens/home_screen/components/categories_image_container.dart';

import '../../../../models/shop_app_models/category_model.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.categoryModel,
  });

  final CategoriesModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.14,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryModel.data!.data!.length,
        itemBuilder: (context, index) => CategoriesCircleImage(
          data: categoryModel.data!.data![index],
        ),
      ),
    );
  }
}
