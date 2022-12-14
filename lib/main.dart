// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constant/strings.dart';
import 'package:shop_app/constant/theme.dart';
import 'package:shop_app/cubit/bloc_observer.dart';
import 'package:shop_app/cubit/home/home_cubit.dart';
import 'package:shop_app/cubit/login_cubit/log_in_cubit.dart';
import 'package:shop_app/cubit/register_cubit/register_cubit.dart';
import 'package:shop_app/presntion_layer/screens/home_page_layout/home_page_layout.dart';
import 'package:shop_app/presntion_layer/screens/login.dart';
import 'package:shop_app/presntion_layer/screens/onboarding.dart';

import 'network/local/cahce_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.inIt();
  Bloc.observer = MyBlocObserver();
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  log('llllllllllllllllll${onBoarding.toString()}');
  token = CacheHelper.getData(key: 'token');
  log('llllllllllllllllll${token.toString()}');

  if (onBoarding != null) {
    if (token != null) {
      widget = const HomePageLayOut();
    } else {
      widget = const LogIn();
    }
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(MyApp(widget, token));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final Widget startWidget;
  String? token;

  MyApp(this.startWidget, this.token, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => RegisterCubit()),
        BlocProvider(
            create: (BuildContext context) => LoginCubit()..getProfileData()),
        BlocProvider(
            create: (BuildContext context) => HomePageCubit()
              ..getData()
              ..getCategoryData()
              ..getAllFavoritesProducts()
              ..getAllCarItems()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          home: startWidget),
    );
  }
}
