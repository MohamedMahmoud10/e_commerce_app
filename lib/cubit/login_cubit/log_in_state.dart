import '../../models/shop_app_models/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  ShopAppLoginModel shopAppLoginModel;
  LoginSuccessState(this.shopAppLoginModel);
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

//=========================================================================================
class ShowPassword extends LoginStates {}
