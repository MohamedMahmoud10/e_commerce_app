import 'package:flutter/material.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static String routeNameDetail = '/d';
  @override
  Widget build(BuildContext context) {
    var cubit = HomePageCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
