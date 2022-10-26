import 'dart:convert';

import 'package:dio/dio.dart';

import '../../constants/constant.dart';


class DioHelper{
  static late Dio dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: BASEURL,
        ),
    );
  }

  static Future<Response?> getData({
    required String endpoint,
    Map<String,dynamic>? query,
    required String token
    })async{
    // dio.options.headers={'Content-Type': 'application/json'};
      try{
        Response response=await dio.get(endpoint,queryParameters: query);
        print(response);
        return response;
      }catch(e){
        print(e);
      }
    }
  
  static Future<Response?> postData({
    required String endpoint,
    required Map<String,dynamic> body,
    String? token
    })async{
      var jsonbody=jsonEncode(body);
      dio.options.headers={'Content-Type': 'application/json'};
      try{
        Response response=await dio.post(endpoint,data: jsonbody);
        print(response.data["accessToken"]);
        return response;
      }catch(e){
        print(e);
      }
    }
  

}