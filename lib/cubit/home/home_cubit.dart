import 'dart:developer';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/home/home_states.dart';
import 'package:shop_app/data/api_services/api_services.dart';
import 'package:shop_app/models/shop_app_models/get_cart_models.dart';
import 'package:shop_app/models/shop_app_models/home_page_model.dart';
import 'package:shop_app/models/shop_app_models/post_cart_models.dart';
import 'package:shop_app/models/shop_app_models/post_favorites_model.dart';
import 'package:shop_app/presntion_layer/screens/category_screen/category_screen.dart';
import 'package:shop_app/presntion_layer/screens/home_screen/home_screen.dart';

import '../../constant/strings.dart';
import '../../models/shop_app_models/category_model.dart';
import '../../models/shop_app_models/get_favorites_model.dart';
import '../../presntion_layer/screens/cart_screen/cart_screen.dart';
import '../../presntion_layer/screens/favorite_screen/favorite_screen.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(HomePageInitial());
  HomePageModel? homePageModel;
  ApiServices apiServices = ApiServices();

  static HomePageCubit get(context) => BlocProvider.of(context);
  Map<int, bool> favorites = {};
  Map<int, bool> cart = {};

//Get Home Page Banner
  void getData() {
    emit(HomePageLoadindg());
    try {
      apiServices.getData(url: homeEndPoint, tokenUrl: token).then((value) {
        homePageModel = HomePageModel.fromJson(value.data);
        for (var element in homePageModel!.data!.products) {
          favorites.addAll({element.id!: element.inFavorites!});
          for (var element in homePageModel!.data!.products) {
            cart.addAll({element.id!: element.inCart!});
          }
          log(favorites.toString());
        }
        emit(HomePageSuccess());
      });
    } catch (e) {
      emit(HomePageError(e.toString()));
      log(e.toString());
    }
  }

//==================================================================================================================
  CategoriesModel? categoryModel;

//Get Category Data
  void getCategoryData() {
    emit(CategoryLoadindg());
    try {
      apiServices.getData(url: categoryEndPoint).then((value) {
        categoryModel = CategoriesModel.fromJson(value.data);
        log(value.data.toString());
        emit(CategorySuccess());
      });
    } catch (e) {
      log(e.toString());
      emit(CategoryError(e.toString()));
    }
  }

//==================================================================================================================
  PostFavoritesModel? getFavoritesModel;

//Post Favorite Product To Data Base
  void postFavoriteProduct(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(FavoritesLoadindg());
    apiServices
        .postData(
      url: favoritesEndPoint,
      data: {
        'product_id': productId,
      },
      tokenUrl: token,
    )
        .then((value) {
      getFavoritesModel = PostFavoritesModel.fromJson(value.data);
      log(value.data.toString());
      if (!getFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getAllFavoritesProducts();
      }
      emit(FavoritesSuccess());
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(FavoritesError(error));
    });
  }

//===========================================================================
  GetFavoritesModel? favoritesModel;

//Get Favorite Product To Favorite Screen
  void getAllFavoritesProducts() {
    emit(GetFavoritesLoadindg());
    apiServices.getData(url: favoritesEndPoint, tokenUrl: token).then((value) {
      favoritesModel = GetFavoritesModel.fromJson(value.data);
      emit(GetFavoritesSuccess());
      log(value.data.toString());
    }).catchError((error) {
      emit(GetFavoritesError(error));
    });
  }

//==============================================================
  //PostAllCartItemsFromUiToDataBase
  PostCartModels? postCartModels;

  void postAllCartItems(int productId) {
    cart[productId] = !cart[productId]!;
    emit(CartsLoadindg());
    apiServices
        .postData(
            url: cartEndPoint, data: {'product_id': productId}, tokenUrl: token)
        .then((value) {
      postCartModels = PostCartModels.fromJson(value.data);
      emit(CartsSuccess());
      if (!postCartModels!.status!) {
        cart[productId] = !cart[productId]!;
      } else {
        getAllCarItems();
      }
      emit(CartsSuccess());
    }).catchError((error) {
      cart[productId] = !cart[productId]!;
      emit(CategoryError(error.toString()));
    });
  }

//==============================================================
  //GetAllCartItemsFromUiToDataBase
  GetCartModels? getCartModels;

  void getAllCarItems() {
    emit(GetCartsLoadindg());
    apiServices.getData(url: cartEndPoint, tokenUrl: token).then((value) {
      getCartModels = GetCartModels.fromJson(value.data);
      emit(GetCartsSuccess());
    }).catchError((error) {
      emit(GetCartsError(error.toString()));
    });
  }

//==============================================================
  //Toggle Bottom Nav Bar Screens
  int currentIndex = 0;
  List<Widget> bottomNavScreen = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const CartScreen(),
  ];
  List<TabItem> items = [
    const TabItem(icon: Icon(Icons.home), title: 'Home'),
    const TabItem(icon: Icon(Icons.category_outlined), title: 'Category'),
    const TabItem(icon: Icon(Icons.favorite_border), title: 'Favorite'),
    const TabItem(icon: Icon(Icons.shopping_cart), title: 'Cart'),
  ];

//Function That Toggle Between Screens On Bottom Nav Bar
  void changeBottomNavIndex(int index) {
    try {
      currentIndex = index;
      emit(BottomNavBarSuccess());
    } catch (e) {
      emit(BottomNavBarError(e.toString()));
      log(e.toString());
    }
  }

  //=========================================================================================
//Cart Logic

  //=========================================================================================
//Change Category View
  bool isGridView = true;

  void changeGategoryView() {
    try {
      isGridView = !isGridView;
      emit(ChangeCategoryViewSuccess());
    } catch (e) {
      emit(ChangeCategoryViewFail(e.toString()));
    }
  }
}
