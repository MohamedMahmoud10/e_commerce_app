import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constant/color.dart';
import 'package:shop_app/cubit/home/home_states.dart';
import 'package:shop_app/presntion_layer/widgets/grid_view.dart';

import '../../../cubit/home/home_cubit.dart';
import '../../widgets/category/categroy_screen_view.dart';

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
                      ? const Icon(Icons.list)
                      : const Icon(Icons.grid_view),
                  onPressed: () {
                    cubit.changeGategoryView();
                  })
            ],
          ),
          body: cubit.categoryModel == null
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: ViewGrid(
                  crossAxisCount: cubit.isGridView ? 1 : 2,
                  childAspectRatio: cubit.isGridView ? 2 : 1,
                  itemCount: cubit.categoryModel!.data!.data!.length,
                  itemBuilder: (context, index) => CategoryScreenView(
                    homeData: cubit.categoryModel!.data!.data![index],
                  ),
                )),
        );
      },
    );
  }
}
