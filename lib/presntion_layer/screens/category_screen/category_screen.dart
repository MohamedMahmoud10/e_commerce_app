import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constant/color.dart';
import 'package:shop_app/cubit/home/home_states.dart';

import '../../../cubit/home/home_cubit.dart';
import '../../../models/shop_app_models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
                  icon: cubit.isGridView
                      ? const Icon(Icons.grid_view_rounded)
                      : const Icon(Icons.list),
                  onPressed: () {
                    cubit.changeGategoryView();
                  })
            ],
          ),
          body: cubit.categoryModel == null
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cubit.isGridView ? 1 : 2,
                        childAspectRatio: cubit.isGridView ? 2 : 1),
                    itemBuilder: (context, index) => CategoryScreenView(
                      homeData: cubit.categoryModel!.data!.data![index],
                    ),
                    itemCount: cubit.categoryModel!.data!.data!.length,
                  ),
                ),
        );
      },
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
