import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/login_cubit/log_in_state.dart';

import '../../../cubit/login_cubit/log_in_cubit.dart';
import '../../../network/local/cahce_helper.dart';
import '../../widgets/login/custom_button.dart';
import '../../widgets/login/email_form_field.dart';
import '../login.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is GetProfileSuccessState) {
          // nameController.text = state.shopAppLoginModel.data!.name!;
          // emailController.text = state.shopAppLoginModel.data!.email!;
          // phoneController.text = state.shopAppLoginModel.data!.phone!;
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context).userData;
        if (cubit != null) {
          nameController.text = cubit.data!.name!;
          emailController.text = cubit.data!.email!;
          phoneController.text = cubit.data!.phone!;
          return Scaffold(
              appBar: AppBar(),
              body: cubit.data != null
                  ? SingleChildScrollView(
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
                            },
                            text: 'LogOut',
                            firstColor: Colors.black,
                            secondColor: Colors.blue,
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
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
