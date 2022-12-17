import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constant/strings.dart';
import 'package:shop_app/cubit/search_cubit/search_states.dart';
import 'package:shop_app/data/api_services/api_services.dart';
import 'package:shop_app/models/shop_app_models/searc_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  ApiServices apiServices = ApiServices();
  late SearchModel searchModel;
  static SearchCubit get(context) => BlocProvider.of(context);
  void searchAllProduct({required String text}) {
    emit(SearchLoadingState());
    apiServices
        .postData(
            url: searchProfileEndPoint, data: {'text': text}, tokenUrl: token)
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      log('The Error Is $error');
      emit(
        SearchErrorStates(
          error.toString(),
        ),
      );
    });
  }
}
