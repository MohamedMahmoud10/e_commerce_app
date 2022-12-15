import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constant/strings.dart';
import 'package:shop_app/cubit/register_cubit/register_state.dart';
import 'package:shop_app/data/api_services/api_services.dart';
import 'package:shop_app/models/shop_app_models/login_model.dart';

import '../../constant/color.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  ApiServices apiServices = ApiServices();
  ShopAppLoginModel? shopAppRegisterModel;

  static RegisterCubit get(context) => BlocProvider.of(context);

  void createAccount(
      {required String name,
      required String email,
      required String password,
      required String phone}) {
    emit(RegisterLoadingState());
    apiServices
        .postData(
            url: registerEndPoint,
            data: {
              'name': name,
              'email': email,
              'password': password,
              'phone': phone
            },
            tokenUrl: token)
        .then((value) {
      shopAppRegisterModel = ShopAppLoginModel.fromJson(value.data);
      emit(RegisterSuccessState(shopAppRegisterModel!));
    }).catchError(
      (error) {
        emit(
          RegisterErrorState(
            error.toString(),
          ),
        );
        log('The Error Is $error');
      },
    );
  }

  //===================================================================
  //Password Visibility
  Icon suffixIcon = const Icon(
    Icons.remove_red_eye_outlined,
    color: AppColors.white,
  );
  bool obscureText = true;

  void changeVisibility() {
    obscureText = !obscureText;
    suffixIcon = obscureText
        ? const Icon(
            Icons.remove_red_eye_outlined,
            color: AppColors.white,
          )
        : const Icon(
            Icons.visibility_off_outlined,
            color: AppColors.white,
          );
    emit(ShowPassword());
  }

//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
}
