import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constant/color.dart';

import '../../../../models/shop_app_models/category_model.dart';

class CategoriesCircleImage extends StatelessWidget {
  final HomeData data;

  const CategoriesCircleImage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.darkHeaderClr,
      elevation: 5,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Wrap(
          runAlignment: WrapAlignment.spaceEvenly,
          direction: Axis.vertical,
          children: [
            CachedNetworkImage(
              imageUrl: data.image!,
              fit: BoxFit.cover,
            ),
            Center(
                child: Text(
              data.name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ))
          ],
        ),
      ),
    );
    // Column(
    //   children: [
    //     Container(
    //       margin: const EdgeInsets.symmetric(horizontal: 25),
    //       width: 80,
    //       height: 80,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(50),
    //         border: Border.all(color: AppColors.purple),
    //       ),
    //       child: ClipRRect(
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(50.0),
    //         ),
    //         child: CachedNetworkImage(
    //           imageUrl: data.image!,
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //     Text(
    //       data.name!,
    //       style: const TextStyle(
    //         fontSize: 15,
    //       ),
    //       softWrap: false,
    //       overflow: TextOverflow.ellipsis,
    //       maxLines: 1,
    //     ),
    //   ],
    // );
  }
}
