import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:support/core/data_provider/local/cache_helper.dart';
import 'package:support/core/data_provider/remote/dio_helper.dart';

import '../core/constants/constant.dart';
class ControlProvider extends ChangeNotifier
{

  String? token;
  ControlProvider()
  {

    getAuth();
  }

  void getAuth() async{
    await DioHelper.init();
    await CacheHelper.init();
    token=CacheHelper.getData(ACCESSTOKEN);
    if(token=="")
      {token=null;}//_auth.currentUser?.uid??null;
    notifyListeners();
  }


}