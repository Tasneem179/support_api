

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:support/screens/Login.dart';
import 'package:support/screens/home_screen.dart';


import '../core/constants/constant.dart';
import '../core/data_provider/local/cache_helper.dart';
import '../core/data_provider/remote/dio_helper.dart';

class AuthProvider extends ChangeNotifier
{
  String ? token;
  getAuth(String username, String password)async
  {
    try{
        DioHelper.init();
        CacheHelper.init();
      await DioHelper.postData(endpoint: SIGNIN, body: {
        "username": username,
        "password": password
      }).then((value) {
         CacheHelper.putData(ACCESSTOKEN, value?.data['token']);
      });
        token= (CacheHelper.getData(ACCESSTOKEN) ?? null);
        if (token != null) {
         Get.offAll(()=>HomeScreen());
        }


    }
    catch(e)
    {
      print (e);
    }
  }

  SignOut()
  {
     CacheHelper.putData(ACCESSTOKEN, "");

    Get.to(LoginScreen());
    notifyListeners();
  //  Get.offAll(LoginScreen());
  }



}