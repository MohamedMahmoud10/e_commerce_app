import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/cubit/home/home_states.dart';

import '../../widgets/home/build_carousel_slider.dart';
import '../../widgets/home/categories.dart';
import '../../widgets/home/products_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return Scaffold(
          body: cubit.homePageModel != null && cubit.categoryModel != null
              ? SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildCarouselSlider(
                            homePageModel: cubit.homePageModel!),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Categories(
                            categoryModel: cubit.categoryModel!,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Best Selling',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ProductsView(
                          homePageModel: cubit.homePageModel!,
                        )
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
