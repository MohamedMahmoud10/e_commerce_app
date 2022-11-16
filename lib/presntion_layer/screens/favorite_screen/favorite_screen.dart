import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/home/home_states.dart';

import '../../../cubit/home/home_cubit.dart';
import '../../widgets/favorites/favorites_products_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return Scaffold(
          body: cubit.favoritesModel != null
              ? GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 5,
                  ),
                  itemCount: cubit.favoritesModel!.data!.data!.length,
                  itemBuilder: (context, index) => FavoritesProductsView(
                      data: cubit.favoritesModel!.data!.data![index]),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
