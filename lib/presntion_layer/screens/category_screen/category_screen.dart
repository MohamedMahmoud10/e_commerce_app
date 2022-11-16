import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constant/color.dart';

import '../../../cubit/home/home_cubit.dart';
import '../../../models/shop_app_models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomePageCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Categroies',
          style: TextStyle(fontSize: 30, color: AppColors.purple),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.grid_view_rounded), onPressed: () {})
        ],
      ),
      body: SafeArea(
          child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 3),
        itemBuilder: (context, index) => CategoryScreenView(
          homeData: cubit.categoryModel!.data!.data![index],
        ),
        itemCount: cubit.categoryModel!.data!.data!.length,
      )),
    );
  }
}

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
