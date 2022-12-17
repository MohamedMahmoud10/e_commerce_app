import 'package:flutter/material.dart';
import 'package:shop_app/constant/color.dart';

import 'components/login_body.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreyClr,
      body: SafeArea(child: LoginBody()),
    );
  }
}
