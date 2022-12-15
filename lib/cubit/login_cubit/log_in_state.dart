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

//====================================================================
class GetProfileLoadingState extends LoginStates {}

class GetProfileSuccessState extends LoginStates {
  ShopAppLoginModel shopAppLoginModel;
  GetProfileSuccessState(this.shopAppLoginModel);
}

class GetProfileErrorState extends LoginStates {
  final String error;
  GetProfileErrorState(this.error);
}

//========================================================================================
class UpdateProfileLoadingState extends LoginStates {}

class UpdateProfileSuccessState extends LoginStates {}

class UpdateProfileErrorState extends LoginStates {
  final String error;

  UpdateProfileErrorState(this.error);
}
