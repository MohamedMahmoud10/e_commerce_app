// import 'package:shop_app/data/api_services/api_services.dart';
// import 'package:shop_app/models/shop_app_models/home_page_model.dart';
//
// class Repository {
//   ApiServices apiServices;
//
//   Repository(this.apiServices);
//
//   Future<HomePageModel> getData({
//     required String url,
//     String? token,
//     String lang = 'ar',
//     Map<String, dynamic>? query,
//   }) async {
//     var data = await apiServices.getData(url: url, token: token);
//     var mappingData = data.map((data) => HomePageModel.fromJson(data)).toList();
//     return mappingData;
//   }
// }
