import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constant/color.dart';
import 'package:shop_app/constant/strings.dart';
import 'package:shop_app/cubit/login_cubit/log_in_state.dart';
import 'package:shop_app/data/api_services/api_services.dart';
import 'package:shop_app/models/shop_app_models/home_page_model.dart';
import 'package:shop_app/models/shop_app_models/login_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  ApiServices apiServices = ApiServices();
  ShopAppLoginModel? shopAppLoginModel;
  HomePageModel? homePageModel;

  static LoginCubit get(context) => BlocProvider.of(context);

  void loginUser({required String email, required String password}) {
    emit(LoginLoadingState());
    try {
      apiServices.postData(
          url: loginEndPoint,
          data: {'email': email, 'password': password}).then((value) {
        shopAppLoginModel = ShopAppLoginModel.fromJson(value.data);
        emit(LoginSuccessState(shopAppLoginModel!));
      });
    } catch (e) {
      log(e.toString());
      emit(LoginErrorState(e.toString()));
    }
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
  ShopAppLoginModel? userData;

  void getProfileData() {
    emit(GetProfileLoadingState());
    apiServices.getData(url: profileEndPoint, tokenUrl: token).then((value) {
      userData = ShopAppLoginModel.fromJson(value.data);
      log(userData!.data!.phone.toString());
      log(userData!.data!.email.toString());
      log(userData!.data!.name.toString());
      emit(GetProfileSuccessState(userData!));
    }).catchError((error) {
      emit(GetProfileErrorState(error.toString()));
    });
  }
}
