import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constant/color.dart';

import '../../../cubit/home/home_cubit.dart';
import '../../../models/shop_app_models/home_page_model.dart';
import '../../screens/product_details_screen/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.data,
  });

  final Products data;

  @override
  Widget build(BuildContext context) {
    var cubit = HomePageCubit.get(context);
    double percent = (data.oldPrice - data.price) / data.oldPrice * 100;
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              percent != 0
                  ? Container(
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.bleu),
                      child: Text(
                        ' ${percent.toStringAsFixed(0)} %',
                        style: const TextStyle(fontSize: 15),
                      ),
                    )
                  : Container(),
              IconButton(
                onPressed: () {
                  log('FavoriteItemIdIs=${data.id.toString()}');
                  cubit.postFavoriteProduct(data.id!);
                },
                icon: cubit.favorites[data.id]!
                    ? const Icon(
                        Icons.favorite,
                        color: AppColors.pink,
                      )
                    : const Icon(
                        Icons.favorite_border_sharp,
                      ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                  ProductDetailsScreen.routeNameDetail,
                  arguments: data.id!);
              // log('data.id');
            },
            child: CachedNetworkImage(
              imageUrl: data.image!,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.21,
            ),
          ),
          Expanded(
            child: Text(
              data.name!,
              style: const TextStyle(fontSize: 18),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ ${data.price.toString()}'),
              IconButton(
                  onPressed: () {
                    cubit.postAllCartItems(data.id!);
                    log('CartIdIs=${data.id!.toString()}');
                  },
                  icon: cubit.cart[data.id]!
                      ? const Icon(
                          Icons.shopping_cart,
                          color: Colors.red,
                        )
                      : const Icon(Icons.shopping_cart_outlined))
            ],
          )
        ],
      ),
    );
  }
}
