import 'dart:io';
import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true,
        queryParameters:  {"api_key": '', "language": "en-us"}

      ),
    );
  }


  static Future<Response?> getData ({
    required String url,
    Map<String,dynamic>? query,
    String lang = 'en',
    String? token,
  }) async{
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };
   return await dio.get(url, queryParameters: query);
}

 static Future<Response?> postData({
   required String url,
   required Map<String,dynamic> data,
   Map<String,dynamic>? query,
   String lang = 'en',
   String? token,
 }) async{
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
      };
    return dio.post(
    url,
    queryParameters: query,
    data: data,
    );
}

  static Future<Response?> putData({
    required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
    String lang = 'en',
    String? token,
  }) async{
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> uploadAvatar({
    required String url,
    Map<String, dynamic>? query,
    required File file,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':'en',
      'Authorization':token,
    };
    String fileName = file.path.split('/').last;
    var formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    return await dio.post(
      url,
      queryParameters: query,
      data: formData,
    );
  }
}
