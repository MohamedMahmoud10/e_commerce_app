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
