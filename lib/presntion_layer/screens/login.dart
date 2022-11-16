import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constant/color.dart';
import 'package:shop_app/cubit/login_cubit/log_in_cubit.dart';
import 'package:shop_app/presntion_layer/widgets/login/login_body.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.darkGreyClr,
        body: SafeArea(child: LoginBody()),
      ),
    );
  }
}
