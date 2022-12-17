import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constant/strings.dart';
import 'package:shop_app/cubit/login_cubit/log_in_state.dart';

import '../../../cubit/login_cubit/log_in_cubit.dart';
import '../../../network/local/cahce_helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/email_form_field.dart';
import '../log_in_screen/login.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context).userData;
        if (cubit != null) {
          nameController.text = cubit.data!.name!;
          emailController.text = cubit.data!.email!;
          phoneController.text = cubit.data!.phone!;
          return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    EmailFormField(
                      hitText: 'Name',
                      label: 'UserName',
                      prefixIcon: const Icon(Icons.person),
                      emailController: nameController,
                      onChanged: (String value) {},
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'YouMustEnterField';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EmailFormField(
                      hitText: 'Email',
                      label: 'UserEmail',
                      prefixIcon: const Icon(Icons.alternate_email),
                      emailController: emailController,
                      onChanged: (String value) {},
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'YouMustEnterField';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (String value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EmailFormField(
                      hitText: 'Phone',
                      label: 'UserPhone',
                      prefixIcon: const Icon(Icons.phone),
                      emailController: phoneController,
                      onChanged: (String value) {},
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'YouMustEnterField';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      onFieldSubmitted: (String value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onTap: () {
                        CacheHelper.removeData(key: 'token');
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LogIn()),
                            (route) => false);
                        log('the token is removed Success $token');
                      },
                      text: 'LogOut',
                      firstColor: Colors.black,
                      secondColor: Colors.blue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () {
                        BlocProvider.of<LoginCubit>(context).updateProfileInfo(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );
                      },
                      text: 'Update Profile',
                      firstColor: const Color(0xFF0F75BD),
                      secondColor: const Color(0xFFA826C7),
                    )
                  ],
                ),
              ));
        } else {
          return const Scaffold(
            body: Center(child: Text('Waiting until Data Loading')),
          );
        }
      },
    );
  }
}
