// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop_app/constant/color.dart';
import 'package:shop_app/cubit/register_cubit/register_cubit.dart';
import 'package:shop_app/cubit/register_cubit/register_state.dart';
import 'package:shop_app/presntion_layer/widgets/login/custom_button.dart';
import 'package:shop_app/presntion_layer/widgets/signup/signup_back_ground.dart';

import '../../../constant/strings.dart';
import '../../../network/local/cahce_helper.dart';
import '../../screens/login.dart';
import '../login/already_have_account.dart';
import '../login/email_form_field.dart';
import '../login/paswword_field.dart';

class SignupBody extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  SignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.shopAppRegisterModel.status!) {
            CacheHelper.saveData(
                    key: 'token', value: state.shopAppRegisterModel.data!.token)
                .then((value) {
              log('userToken===========>$value');
              token = state.shopAppRegisterModel.data!.token;
            }).then((value) => {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogIn()),
                          (route) => false)
                    });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.shopAppRegisterModel.message.toString(),
              ),
              backgroundColor: AppColors.purple,
              elevation: 10,
              behavior: SnackBarBehavior.floating,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.shopAppRegisterModel.message.toString(),
              ),
              backgroundColor: Colors.red,
              elevation: 10,
              behavior: SnackBarBehavior.floating,
            ));
          }
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return SignupBackGround(
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
                          'Welcome To MAGIC',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Create your account ',
                          style: Theme.of(context).textTheme.bodyMedium!,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        EmailFormField(
                          emailController: nameController,
                          hitText: 'Your name',
                          keyboardType: TextInputType.name,
                          label: 'Name',
                          onChanged: (value) {},
                          prefixIcon: const Icon(
                            Icons.person,
                            color: AppColors.white,
                          ),
                          validator: (value) {
                            return null;
                          },
                          onFieldSubmitted: (String value) {},
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
                            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                          },
                          onFieldSubmitted: (String value) {},
                        ),
                        PasswordFormField(
                          obscureText: cubit.obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (String value) {},
                          emailController: passwordController,
                          hitText: 'Pick a strong password',
                          label: 'Password',
                          prefixIcon: const Icon(
                            Icons.password_outlined,
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
                        EmailFormField(
                          emailController: phoneController,
                          hitText: 'Your phone',
                          keyboardType: TextInputType.name,
                          label: 'phone',
                          onChanged: (value) {},
                          prefixIcon: const Icon(
                            Icons.person,
                            color: AppColors.white,
                          ),
                          validator: (value) {
                            return null;
                          },
                          onFieldSubmitted: (String value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        (state is! RegisterLoadingState)
                            ? CustomButton(
                                firstColor: Colors.red[100]!,
                                secondColor: AppColors.purple,
                                text: 'Create an account',
                                onTap: () {
                                  cubit.createAccount(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text);
                                })
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                        AlreadyHaveAccount(
                          login: false,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogIn()));
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
