import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../cubit/home/home_cubit.dart';
import '../../../models/shop_app_models/get_favorites_model.dart';

class FavoritesProductsView extends StatelessWidget {
  const FavoritesProductsView({
    super.key,
    required this.data,
  });

  final FavoritesData data;

  @override
  Widget build(BuildContext context) {
    var cubit = HomePageCubit.get(context);
    return Card(
      elevation: 50,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: data.product!.image!,
          ),
          Row(
            children: [
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
          )
        ],
      ),
    );
  }
}
