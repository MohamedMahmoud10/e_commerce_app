import 'package:dio/dio.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      // connectTimeout: 2 * 1000,
      // receiveTimeout: 2 * 1000,
    );
    dio = Dio(baseOptions);
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: print,
      ),
    );
  }

  Future<dynamic> getData({
    required String url,
    String? tokenUrl,
    String lang = 'en',
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': tokenUrl,
      'Content-Type': 'application/json'
    };
    dio.options.headers = {'lang': lang, 'Authorization': tokenUrl};
    return await dio.get(url);
  }

  Future postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? tokenUrl}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': tokenUrl,
      'Content-Type': 'application/json'
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  //========================================================================================
  Future updateData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? tokenUrl}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': tokenUrl,
      'Content-Type': 'application/json'
    };
    return await dio.put(url, queryParameters: query, data: data);
  }
  //=====================================================================================================================
}
