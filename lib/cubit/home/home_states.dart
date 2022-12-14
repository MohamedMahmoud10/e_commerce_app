abstract class HomePageStates {}

class HomePageInitial extends HomePageStates {}

class HomePageLoadindg extends HomePageStates {}

class HomePageSuccess extends HomePageStates {}

class HomePageError extends HomePageStates {
  final String error;

  HomePageError(this.error);
}

//======================================================================================================================
class CategoryLoadindg extends HomePageStates {}

class CategorySuccess extends HomePageStates {}

class CategoryError extends HomePageStates {
  final String error;

  CategoryError(this.error);
}

//==================================================================================================================
class FavoritesLoadindg extends HomePageStates {}

class FavoritesSuccess extends HomePageStates {}

class FavoritesError extends HomePageStates {
  final String error;

  FavoritesError(this.error);
}

//======================================================================================
class CartsLoadindg extends HomePageStates {}

class CartsSuccess extends HomePageStates {}

class CartsError extends HomePageStates {
  final String error;

  CartsError(this.error);
}

//======================================================================================
class GetCartsLoadindg extends HomePageStates {}

class GetCartsSuccess extends HomePageStates {}

class GetCartsError extends HomePageStates {
  final String error;

  GetCartsError(this.error);
}

//======================================================================================

class GetFavoritesLoadindg extends HomePageStates {}

class GetFavoritesSuccess extends HomePageStates {}

class GetFavoritesError extends HomePageStates {
  final String error;

  GetFavoritesError(this.error);
}

//======================================================================================
class BottomNavBarSuccess extends HomePageStates {}

class BottomNavBarError extends HomePageStates {
  final String error;

  BottomNavBarError(this.error);
}

//=========================================================================================================
class ChangeCategoryViewSuccess extends HomePageStates {}

class ChangeCategoryViewFail extends HomePageStates {
  final String error;

  ChangeCategoryViewFail(this.error);
}

//============================================================================================================
class UpdateProfileLoadingState extends HomePageStates {}

class UpdateProfileSuccessState extends HomePageStates {}

class UpdateProfileErrorState extends HomePageStates {
  final String error;

  UpdateProfileErrorState(this.error);
}
