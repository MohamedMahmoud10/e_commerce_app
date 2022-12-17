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
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        if (cubit.favoritesModel != null) {
          return Scaffold(
            body: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: cubit.favoritesModel!.data!.data!.length,
              itemBuilder: (context, index) => FavoritesProductsView(
                  data: cubit.favoritesModel!.data!.data![index]),
            ),
          );
        } else {
          return const Center(
            child: Text('Data Loading '),
          );
        }
      },
    );
  }
}
