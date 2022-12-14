import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/cubit/home/home_states.dart';

import '../setting_screen/setting_screen.dart';

class HomePageLayOut extends StatelessWidget {
  const HomePageLayOut({Key? key}) : super(key: key);

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
            leading: IconButton(
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) => SettingScreen()));
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
              icon: const Icon(Icons.settings),
            ),
          ),
          bottomNavigationBar: DefaultTabController(
            length: cubit.bottomNavScreen.length,
            child: ConvexAppBar(
                height: 65,
                items: cubit.items,
                onTap: (index) => cubit.changeBottomNavIndex(index)),
          ),
          body: cubit.bottomNavScreen[cubit.currentIndex],
        );
      },
    );
  }
}
