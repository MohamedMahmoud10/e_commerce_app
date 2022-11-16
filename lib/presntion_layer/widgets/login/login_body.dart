// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/constant/color.dart';
import 'package:shop_app/cubit/login_cubit/log_in_cubit.dart';
import 'package:shop_app/cubit/login_cubit/log_in_state.dart';
import 'package:shop_app/network/local/cahce_helper.dart';
import 'package:shop_app/presntion_layer/screens/home_page_layout/home_page_layout.dart';
import 'package:shop_app/presntion_layer/widgets/login/already_have_account.dart';
import 'package:shop_app/presntion_layer/widgets/login/back_ground.dart';
import 'package:shop_app/presntion_layer/widgets/login/email_form_field.dart';
import 'package:shop_app/presntion_layer/widgets/login/paswword_field.dart';

import '../../screens/signup.dart';
import 'custom_button.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.shopAppLoginModel.status!) {
            CacheHelper.saveData(
                    key: 'token', value: state.shopAppLoginModel.data!.token)
                .then((value) {
              log('userToken===========>$value');
              if (value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePageLayOut()),
                    (route) => false);
              }
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.shopAppLoginModel.message.toString(),
              ),
              backgroundColor: AppColors.purple,
              elevation: 10,
              behavior: SnackBarBehavior.floating,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.shopAppLoginModel.message.toString(),
              ),
              backgroundColor: Colors.red,
              elevation: 10,
              behavior: SnackBarBehavior.floating,
            ));
          }
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Background(
          child: Form(
            key: fromKey,
            child: ListView(children: [
              AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      Column(
                        children: [
                          Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Hey,Enter your details to get sign in \n to your account ',
                            style: Theme.of(context).textTheme.bodyMedium!,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          EmailFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (String value) {},
                            emailController: emailController,
                            hitText: 'example@example.com',
                            label: 'Email Address',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: AppColors.white,
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Email';
                              }
                              return null;
                            },
                          ),
                          PasswordFormField(
                            obscureText: cubit.obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (String value) {},
                            emailController: passwordController,
                            hitText: 'Enter your password',
                            label: 'Password',
                            prefixIcon: const Icon(
                              Icons.password,
                              color: AppColors.white,
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Too Short Password';
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeVisibility();
                              },
                              icon: cubit.suffixIcon,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          (state is! LoginLoadingState)
                              ? CustomButton(
                                  firstColor: Colors.red[100]!,
                                  secondColor: AppColors.purple,
                                  text: 'Login',
                                  onTap: () {
                                    if (fromKey.currentState!.validate()) {
                                      cubit.loginUser(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                          AlreadyHaveAccount(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
