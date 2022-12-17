import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/cubit/home/home_states.dart';

import 'components/cart_product_view.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        if (state is! GetCartsLoadindg) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return cubit.getCartModels!.data.cartItems.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                body: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cubit.getCartModels!.data.cartItems.length,
                  itemBuilder: (context, index) => CartProductsView(
                      data: cubit.getCartModels!.data.cartItems[index]),
                ),
              );
      },
    );
  }
}
