import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../cubit/home/home_cubit.dart';
import '../../../models/shop_app_models/searc_model.dart';

class SearchProductsView extends StatelessWidget {
  const SearchProductsView({
    super.key,
    required this.data,
  });

  final Product data;

  @override
  Widget build(BuildContext context) {
    var cubit = HomePageCubit.get(context);
    return Card(
      elevation: 50,
      child: Row(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: data.image!,
              height: 180,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  data.name!,
                  maxLines: 1,
                ),
                Text(data.price.toString()),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              log(data.id.toString());
              cubit.postFavoriteProduct(data.id!);
            },
            icon: CircleAvatar(
              backgroundColor:
                  cubit.favorites[data.id]! ? Colors.blue : Colors.grey,
              radius: 20,
              child: const Icon(Icons.favorite_border),
            ),
          )
        ],
      ),
    );
  }
}
