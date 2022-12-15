import '../../models/shop_app_models/login_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  ShopAppLoginModel shopAppRegisterModel;
  RegisterSuccessState(this.shopAppRegisterModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

//=========================================================================================
class ShowPassword extends RegisterStates {}

//====================================================================
