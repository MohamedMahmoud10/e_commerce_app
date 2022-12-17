import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../cubit/home/home_cubit.dart';

class FavoritesProductsView extends StatelessWidget {
  const FavoritesProductsView({
    super.key,
    required this.data,
  });

  final data;

  @override
  Widget build(BuildContext context) {
    var cubit = HomePageCubit.get(context);
    return Card(
      elevation: 50,
      child: Row(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: data.product!.image!,
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
                  data.product!.name!,
                  maxLines: 1,
                ),
                Text(data.product!.price.toString()),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              log(data.product!.id.toString());
              cubit.postFavoriteProduct(data.product!.id!);
            },
            icon: CircleAvatar(
              backgroundColor: cubit.favorites[data.product!.id]!
                  ? Colors.blue
                  : Colors.grey,
              radius: 20,
              child: const Icon(Icons.favorite_border),
            ),
          )
        ],
      ),
    );
  }
}
